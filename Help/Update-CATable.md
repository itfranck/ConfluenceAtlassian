---
external help file: ConfluenceAtlassian-help.xml
Module Name: ConfluenceAtlassian
online version:
schema: 2.0.0
---

# Update-CATable

## SYNOPSIS
Update locally a table in a confluence document.

## SYNTAX

```
Update-CATable [[-Document] <CADocument>] [[-Title] <String>] [[-TitleTag] <String>] [[-NewContent] <Object>]
 [<CommonParameters>]
```

## DESCRIPTION
Update locally a table in a confluence document. This cmdlet does not publish the changes. For that, Set-CADocument must be used. The table format expected is a Title (surrounded by the title tag (h2 by default)) then optionally an information panel and the table itself. 

## EXAMPLES

### Example 1
```powershell
PS C:\> $Doc = Get-CADocument -Id 929823883  
# $Table = New-CATable ...
# $Table2 = New-CATable ...
Update-CATable -Document $Doc -Title 'List of manufacturers' -NewContent $Table
Update-CATable -Document $Doc -Title 'Order history' -NewContent $Table2
Set-CADocument -Document $Doc
```

Update 2 tables from the provided document with their replacement / updated table then publish the changes through Set-CADocument.

## PARAMETERS

### -Document
CaDocument object obtained from Get-CADocument. The -ContextOnly switch should be avoided when this cmdlet is used since the document body need to be fetched in order to update the tables.

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

### -NewContent
New content that will replace the original table.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
Title of the table to be replaced.

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
Tag surrounding the title (default is h2)

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
