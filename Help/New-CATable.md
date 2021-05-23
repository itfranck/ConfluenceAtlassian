---
external help file: ConfluenceAtlassian-help.xml
Module Name: ConfluenceAtlassian
online version:
schema: 2.0.0
---

# New-CATable

## SYNOPSIS
Create a confluence table from an object.

## SYNTAX

```
New-CATable [[-Title] <String>] [[-TitleTag] <String>] [[-InfoMessage] <String>] [[-Columns] <Object[]>]
 [[-Rows] <Object[]>] [-Numbered] [[-HeaderStyle] <String>] [[-Style] <String>] [<CommonParameters>]
```

## DESCRIPTION
Create a confluence table from an object.

## EXAMPLES

### Example 1
```powershell
PS C:\> $ListOfObject = @(
    [PSCustomObject]@{Word1 = 'test'; Word2 = 'test2'; word3 = '11'; word4 = '22'  }
    [PSCustomObject]@{Word1 = 'testA'; Word2 = 'test2A';word3 = '11';word4 = '22' }
)

$Table = New-CATable -Style Wide -Columns @(
    New-CATableColumn -Name 'Word1' #-Width 48
    New-CATableColumn -Name 'Word2' -Text 'Second word'
    'word3',
    'word4'
   ) -Title 'List of manufacturers' -InfoMessage "This table was last generated $((Get-Date).ToLongDateString())" -Rows $ListOfObject -TitleTag h1
```

Create a new confluence table using the wide style with "List of manufacturers" title surrounded by a H1 tag (default is h2) along with a info panel. $ListOfObject will be iterated upon and each members will be added to the table. New-CATableColumn can be used to specify a different text for the header and a custom width.

## PARAMETERS

### -Columns
List of columns to be included in the table. Strings or CATableColumn objects (See New-CATableColumn) can be included

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HeaderStyle
Define the header type. By default, only a Row header is used.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Row, Column, RowColumn

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InfoMessage
Optional info panel to be put in between the table title and the table itself. 

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

### -Numbered
If $true, a numbered table will be created. 

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

### -Rows
Object that will constitute the table. It should be a list of objects.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Style
Confluence table style.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Default, Wrapped, Wide

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Title
Title of the table.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TitleTag
Tag of the table. This can be set to any valid html value (eg:h1-h6;p). Default is h2

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
