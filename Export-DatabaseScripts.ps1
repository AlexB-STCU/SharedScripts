﻿<#
.Synopsis
Exports MS SQL database structures from the given server and database as files, into a consistent folder structure.
.Parameter Server
The name of the server (and instance) to connect to.
.Parameter Database
The name of the database to connect to on the server.
.Parameter CreateEmptyFolders
Creates folders even if no scripts will be exported to them.
.Component
Microsoft.SqlServer.ConnectionInfo
.Component
Microsoft.SqlServer.Smo
.Component
Microsoft.SqlServer.SqlEnum
.Example
Export-SqlScripts.ps1 "(localdb)\ProjectV12" AdventureWorks2014
(outputs SQL scripts to files)
#>

#requires -version 3
[CmdletBinding()] Param(
[Parameter(Position=0,Mandatory=$true)][string] $Server,
[Parameter(Position=1,Mandatory=$true)][string] $Database
)

try
{
    [Microsoft.SqlServer.Management.Smo.Server]|Out-Null
    [Microsoft.SqlServer.Management.Smo.ScriptingOptions]|Out-Null
    Write-Verbose "Types already loaded."
}
catch
{
    $sqlsdk = Get-ChildItem "${env:ProgramFiles(x86)}\Microsoft SQL Server\Microsoft.SqlServer.Smo.dll","$env:ProgramFiles\Microsoft SQL Server\Microsoft.SqlServer.Smo.dll" -Recurse |
        ForEach-Object FullName |
        Select-Object -Last 1 |
        Split-Path
    Write-Verbose "Found SQL SDK DLLs in $sqlsdk"
    Add-Type -Path "$sqlsdk\Microsoft.SqlServer.ConnectionInfo.dll"
    Add-Type -Path "$sqlsdk\Microsoft.SqlServer.Smo.dll"
    Add-Type -Path "$sqlsdk\Microsoft.SqlServer.SqlEnum.dll"
}

$srv = New-Object Microsoft.SqlServer.Management.Smo.Server($Server)
$db = $srv.Databases[$Database]
if(!$db) {return}
Write-Verbose "Connected to $srv.$db $($srv.Product) $($srv.Edition) $($srv.VersionString) $($srv.ProductLevel) (Windows $($srv.OSVersion))"
mkdir $Database -EA:SilentlyContinue |Out-Null ; pushd $Database

$opts = New-Object Microsoft.SqlServer.Management.Smo.ScriptingOptions
'ExtendedProperties,Permissions,DriAll,Indexes,Triggers'.Trim() -split '\W+' |% {$opts.$_ = $true}

$type = @{
    # Property           = # Folder
    Assemblies           = 'Assemblies'
    Triggers             = 'Database Triggers'
    Defaults             = 'Defaults'
    ExtendedProperties   = 'Extended Properties'
    UserDefinedFunctions = 'Functions'
    Rules                = 'Rules'
    AsymmetricKeys       = 'Security\Asymmetric Keys'
    Certificates         = 'Security\Certificates'
    Roles                = 'Security\Roles'
    Schemas              = 'Security\Schemas'
    SymmetricKeys        = 'Security\Symmetric Keys'
    Users                = 'Security\Users'
    Sequences            = 'Sequences'
    FullTextCatalogs     = 'Storage\Full Text Catalogs'
    FullTextStopLists    = 'Storage\Full Text Stop Lists'
    PartitionFunctions   = 'Storage\Partition Functions'
    PartitionSchemes     = 'Storage\Partition Schemes'
    StoredProcedures     = 'Stored Procedures'
    Synonyms             = 'Synonyms'
    Tables               = 'Tables'
    UserDefinedDataTypes = 'Types\User-defined Data Types'
    XmlSchemaCollections = 'Types\XML Schema Collections'
    Views                = 'Views'
}
$brkr = @{ # not something we currently use
    ServiceContracts      = 'Service Broker\Contracts'
    # ?                   = 'Service Broker\Event Notifications'
    MessageTypes          = 'Service Broker\Message Types'
    Queues                = 'Service Broker\Queues'
    RemoteServiceBindings = 'Service Broker\Remote Service Bindings'
    Routes                = 'Service Broker\Routes'
    Services              = 'Service Broker\Services'
}

function ConvertTo-FileName($Name) { $Name -replace '[<>\\/"|\t]+','_' }

'UserDefinedFunctions StoredProcedures Tables Views' -split ' ' |
    ? {$db.$_ |? IsSystemObject -eq $false} |
    % {
        mkdir $type.$_ -EA:SilentlyContinue |Out-Null ; pushd $type.$_
        $db.$_ |
            ? IsSystemObject -eq $false |
            % {
                Write-Verbose "Export $($_.GetType().Name) $_"
                $_.Script($opts) |Out-File "$(ConvertTo-FileName $_.Schema).$(ConvertTo-FileName $_.Name).sql"
            }
        popd
    }

#TODO: remove objects missing IsSystemObject (detect?)
@('Assemblies','Triggers','Defaults','ExtendedProperties','Rules','AsymmetricKeys','Certificates',
  'Schemas','SymmetricKeys','Sequences','PartitionFunctions',
  'PartitionSchemes','Synonyms','UserDefinedDataTypes','XmlSchemaCollections') |
    ? {$db.$_ |? IsSystemObject -eq $false} |
    % {
        "__ $_ __"
        mkdir $type.$_ -EA:SilentlyContinue |Out-Null ; pushd $type.$_
        $db.$_ |
            ? IsSystemObject -eq $false |
            % {
                Write-Verbose "Export $($_.GetType().Name) $_"
                $_.Script($opts) |Out-File "$(ConvertTo-FileName $_.Name).sql"
            }
        popd
    }


if($db.Users)
{
    mkdir $type.Users -EA:SilentlyContinue |Out-Null ; pushd $type.Users
    $db.Users |
        ? IsSystemObject -eq $false |
        % {
            Write-Verbose "Export $($_.GetType().Name) $_"
            $_.Script($opts) |Out-File "$(ConvertTo-FileName $_.Name).sql"
        }
    popd
}

if($db.Roles)
{
    mkdir $type.Roles -EA:SilentlyContinue |Out-Null ; pushd $type.Roles
    $db.Roles |
        ? IsFixedRole -eq $false |
        % {
            Write-Verbose "Export $($_.GetType().Name) $_"
            $_.Script($opts) |Out-File "$(ConvertTo-FileName $_.Name).sql"
        }
    popd
}

popd # Database
