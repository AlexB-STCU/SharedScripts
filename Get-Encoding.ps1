<#
.Synopsis
	Returns the encoding for a given file, suitable for passing to encoding parameters.

.Parameter Path
	The path to a file.

.Inputs
	Any object with a Path or FullName property to use as the file path.

.Outputs
	System.Text.Encoding (for PowerShell Core),
	or System.String with the encoding name (for legacy Windows PowerShell).

.Link
	Test-FileTypeMagicNumber.ps1

.Example
	Get-Encoding.ps1 readme.md
#>

#Requires -Version 3
[CmdletBinding()][OutputType([Text.Encoding])] Param(
[Parameter(Position=0,Mandatory=$true,ValueFromPipelineByPropertyName=$true)][Alias('FullName')][string] $Path
)
if($PSVersionTable.PSEdition -eq 'Core')
{
	if(Test-FileTypeMagicNumber.ps1 utf8 $Path) {[Text.Encoding]::UTF8}
	elseif(Test-FileTypeMagicNumber.ps1 utf16 $Path) {[Text.Encoding]::Unicode}
	elseif(Test-FileTypeMagicNumber.ps1 utf16be $Path) {[Text.Encoding]::BigEndianUnicode}
	elseif(Test-FileTypeMagicNumber.ps1 utf32 $Path) {[Text.Encoding]::UTF32}
	elseif(Test-FileTypeMagicNumber.ps1 utf32be $Path) {[Text.Encoding]::GetEncoding('UTF-32BE')}
	elseif(Test-FileTypeMagicNumber.ps1 text $Path) {[Text.Encoding]::ASCII}
	else {[Text.Encoding]::Default}
}
else
{
	if(Test-FileTypeMagicNumber.ps1 utf8 $Path) {'utf8'}
	elseif(Test-FileTypeMagicNumber.ps1 utf16 $Path) {'unicode'}
	elseif(Test-FileTypeMagicNumber.ps1 utf16be $Path) {'bigendianunicode'}
	elseif(Test-FileTypeMagicNumber.ps1 utf32 $Path) {'utf32'}
	elseif(Test-FileTypeMagicNumber.ps1 utf32be $Path) {'utf32be'} # not supported
	elseif(Test-FileTypeMagicNumber.ps1 text $Path) {'ascii'}
	else {'default'}
}
