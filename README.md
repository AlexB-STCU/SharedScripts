﻿Useful General-Purpose Scripts
==============================
This repo contains a collection of generally useful scripts (mostly Windows, mostly PowerShell).

PowerShell Scripts
------------------
- **Connect-Database.ps1**: Creates a SqlConnection from a connection string name, server name, or connection string, and opens it.
- **ConvertFrom-EscapedXml.ps1**: Parse escaped XML into XML and serialize it.
- **ConvertFrom-XmlElement.ps1**: Converts named nodes of an element to properties of a PSObject, recursively.
- **Copy-SchTasks.ps1**: Copy scheduled jobs from another computer to this one, using a GUI list to choose jobs.
- **Disconnect-Database.ps1**: Disposes a database connection, such as opened by Connect-Database.
- **Export-DatabaseObjectScript.ps1**: Exports MS SQL script for an object from the given server.
- **Export-DatabaseScripts.ps1**: Exports MS SQL database objects from the given server and database as files, into a consistent folder structure.
- **Export-Readme.ps1**: Generate README.md file for the scripts repo.
- **Export-TableMerge.ps1**: Exports table data as a T-SQL MERGE statement.
- **Find-Certificate.ps1**: Searches a certificate store for certificates.
- **Find-Lines.ps1**: Searches a specific subset of files for lines matching a pattern.
- **Find-NewestFile.ps1**: Finds the most recent file.
- **Find-ProjectPackages.ps1**: Find modules used in projects.
- **Format-ByteUnits.ps1**: Converts bytes to largest possible units, to improve readability.
- **Format-Xml.ps1**: Pretty-print XML.
- **Format-XmlElements.ps1**: Serializes complex content into XML elements.
- **Get-AspNetEvents.ps1**: Parses ASP.NET errors from the event log on the given server.
- **Get-CertificateExpiration.ps1**: Returns HTTPS certificate expiration and other cert info for a host.
- **Get-CertificatePath.ps1**: Gets the physical path on disk of a certificate.
- **Get-CertificatePermissions.ps1**: Returns the permissions of a certificate's private key file.
- **Get-CharacterDetails.ps1**: Returns filterable categorical information about a range of characters in the Unicode Basic Multilingual Plane.
- **Get-CommandPath.ps1**: Locates a command.
- **Get-EnumValues.ps1**: Returns the possible values of the specified enumeration.
- **Get-NetFrameworkVersions.ps1**: Determine which .NET Frameworks are installed on the requested system.
- **Get-SystemDetails.ps1**: Collects some useful system hardware and operating system details via WMI.
- **Grant-CertificateAccess.ps1**: Grants certificate file read access to an app pool or user.
- **Install-PsAd.ps1**: Installs the PowerShell ActiveDirectory module.
- **Install-SqlPs.ps1**: Installs SQLPS module and dependencies.
- **Invoke-DbCommand.ps1**: Queries a database and returns the results.
- **Invoke-Sql.ps1**: Runs a SQL script with verbose output and without changing the directory.
- **Invoke-SqlcmdScript.ps1**: Implements SQL script with verbose output.
- **New-DbProviderObject.ps1**: Create a common database object.
- **Optimize-Path.ps1**: Sorts, prunes, and normalizes both user and system Path entries.
- **Repair-DatabaseConstraintNames.ps1**: Finds database constraints with system-generated names and gives them deterministic names.
- **Select-XmlNodeValue.ps1**: Returns the node value in XML using a given XPath expression.
- **Send-SeqEvent.ps1**: Send an event to a Seq server.
- **Send-SeqScriptEvent.ps1**: Sends an event from a script to a Seq server, including script info.
- **Send-SqlReport.ps1**: Execute a SQL statement and email the results.
- **Show-CertificatePermissions.ps1**: Shows the permissions of a certificate's private key file.
- **Test-Interactive.ps1**: Determines whether both the user and process are interactive.
- **Test-NewerFile.ps1**: Returns true if the difference file is newer than the reference file.
- **Test-Xml.ps1**: Try parsing text as XML.
- **Use-Command.ps1**: Checks for the existence of the given command, and adds if missing and a source is defined.
- **Use-NamedMatches.ps1**: Creates local variables from named matches in $Matches.
- **Use-SeqServer.ps1**: Set the default Server and ApiKey for Send-SeqEvent.ps1

<!-- generated 07/17/2016 00:42:40 -->
