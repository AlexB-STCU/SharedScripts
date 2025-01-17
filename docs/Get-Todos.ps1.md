---
external help file: -help.xml
Module Name:
online version:
schema: 2.0.0
---

# Get-Todos.ps1

## SYNOPSIS
Returns the TODOs for the current git repo, which can help document technical debt.

## SYNTAX

```
Get-Todos.ps1 [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```
Get-Todos.ps1 |Out-GridView -Title "$((Get-Item $(git rev-parse --show-toplevel)).Name) TODOs"
```

Shows TODOs in this repo.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
