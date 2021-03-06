---
external help file: ConfluenceAtlassian-help.xml
Module Name: ConfluenceAtlassian
online version:
schema: 2.0.0
---

# Set-CADocument

## SYNOPSIS
Update confluence document with the new content.

## SYNTAX

### Document
```
Set-CADocument -Document <CADocument> [-Title <String>] [-Body <String>] [<CommonParameters>]
```

### DocumentId
```
Set-CADocument -DocumentId <Int32> [-Title <String>] [-Body <String>] [<CommonParameters>]
```

## DESCRIPTION
Update confluence document with the new content.

## EXAMPLES

### Example 1
```powershell
PS C:\> Set-CADocument -Document $Document -Body 'Hello world'
```

Set the body of the document to 'Hello world' and update the web document. The document must first be retrieved through Get-CADocument 

### Example 2
```powershell
PS C:\> Set-CADocument -DocumentId 1932948583 -Body 'Hello world'
```

Set the body of the document to 'Hello world' and update the web document. The document ID is used as a reference to the document to be updated thus it does not depend on Get-CADocument at all.

## PARAMETERS

### -Body
{{ Fill Body Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Document
{{ Fill Document Description }}

```yaml
Type: CADocument
Parameter Sets: Document
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DocumentId
{{ Fill DocumentId Description }}

```yaml
Type: Int32
Parameter Sets: DocumentId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
{{ Fill Title Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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
