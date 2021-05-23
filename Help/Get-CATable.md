---
external help file: ConfluenceAtlassian-help.xml
Module Name: ConfluenceAtlassian
online version:
schema: 2.0.0
---

# Get-CATable

## SYNOPSIS
Get a table from a document body.

## SYNTAX

```
Get-CATable [[-Document] <CADocument>] [[-Title] <String>] [[-TitleTag] <String>] [<CommonParameters>]
```

## DESCRIPTION
Get a table from a document body.

## EXAMPLES

### Example 1
```powershell
PS C:\> $Doc  = Get-CADocument -Id 1849330118
PS C:\> Get-CATable -Document $Doc -Title 'List of manufacturer by Country' -TitleTag h2
```

Get a table with a h2 title of "List of manufacturer by Country" from the document ($doc.Body). Table will only be fetched if it has the corresponding title, an optional info panel and the table itself.

## PARAMETERS

### -Document
[CADocument] object obtained through `Get-CADocument`

```yaml
Type: CADocument
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
Title of the table used to locate the table

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleTag
Title tag. h2 is used by default. This correspond to the tag that surround the title (p,h1-h6,etc...)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
