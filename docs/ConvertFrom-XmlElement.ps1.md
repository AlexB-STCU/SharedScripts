---
external help file: -help.xml
Module Name:
online version:
schema: 2.0.0
---

# ConvertFrom-XmlElement.ps1

## SYNOPSIS
Converts named nodes of an element to properties of a PSObject, recursively.

## SYNTAX

### Document
```
ConvertFrom-XmlElement.ps1 [-Document] <XmlDocument> [-OnlyAttributes] [<CommonParameters>]
```

### Element
```
ConvertFrom-XmlElement.ps1 [-Element] <XmlElement> [-OnlyAttributes] [<CommonParameters>]
```

### SelectXmlInfo
```
ConvertFrom-XmlElement.ps1 [-SelectXmlInfo] <SelectXmlInfo> [-OnlyAttributes] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```
Select-Xml /configuration/appSettings/add web.config |ConvertFrom-XmlElement.ps1
```

key              value
---              -----
webPages:Enabled false

## PARAMETERS

### -Document
The XML document to convert to a PSObject.

```yaml
Type: XmlDocument
Parameter Sets: Document
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Element
The element to convert to a PSObject.

```yaml
Type: XmlElement
Parameter Sets: Element
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -SelectXmlInfo
Output from the Select-Xml cmdlet.

```yaml
Type: SelectXmlInfo
Parameter Sets: SelectXmlInfo
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -OnlyAttributes
Only include attributes, ignore other child nodes.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: Attributes, Atts

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.PowerShell.Commands.SelectXmlInfo output from Select-Xml.
## OUTPUTS

### System.Management.Automation.PSCustomObject object created from selected XML.
## NOTES

## RELATED LINKS

[Select-Xml]()

