---
external help file: ConfluenceAtlassian-help.xml
Module Name: ConfluenceAtlassian
online version:
schema: 2.0.0
---

# Get-CADocument

## SYNOPSIS
Retrieve a page from the connected instance.

## SYNTAX

```
Get-CADocument [[-Id] <Int32>] [-ContextOnly] [<CommonParameters>]
```

## DESCRIPTION
Retrieve a page from the connected instance.
 Return relevant information (Id, title, version, body, raw object,url, space)

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-CADocument -Id 12345678 
```

Return the document that have the corresponding ID.


### Example 2
```powershell
PS C:\> Get-CADocument -Id 12345678 -ContextOnly
```

Return the document that have the corresponding ID. Body is not returned

## PARAMETERS

### -ContextOnly
Omit the body of the document.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
Id of the document.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
