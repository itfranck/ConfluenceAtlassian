---
external help file: ConfluenceAtlassian-help.xml
Module Name: ConfluenceAtlassian
online version:
schema: 2.0.0
---

# Get-CAContext

## SYNOPSIS
Get context about the connected instance.

## SYNTAX

```
Get-CAContext [<CommonParameters>]
```

## DESCRIPTION
Get context about the connected instance. The context information is provided through Set-CaContext and is passed down to every requests to identify the URL to connect to and pass down necessary authorization headers.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-CAContext
```

Return the current context.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
