---
external help file: ConfluenceAtlassian-help.xml
Module Name: ConfluenceAtlassian
online version:
schema: 2.0.0
---

# New-CATableColumn

## SYNOPSIS
Create a table column definition.

## SYNTAX

```
New-CATableColumn [-Name] <String> [[-Text] <String>] [[-Width] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Create a table column definition. This is used to define which member of the passed down object will be used to build the table. New-CATable accept both strings and CaTableColumn object. This cmdled usefulness is when the object to be iterated need to have a different header text from the property name and / or additional options, such as custom width, need to be set.

## EXAMPLES

### Example 1
```powershell
PS C:\> $Table = New-CATable -Style Wide -Columns @(
    New-CATableColumn -Name 'Word1' #-Width 48
    New-CATableColumn -Name 'Word2' -Text 'Second word' -Width 100
    'word3',
    'word4'
   ) -Title 'List of manufacturers' -InfoMessage "This table was last generated $((Get-Date).ToLongDateString())" -Rows $ListOfObject -TitleTag h1
```

Create a column Word1 (since only the name is specified, it could have been defined as a string like word3 and word4) and a Word2 column that have a custom header text of "Second word" and a specific width of 100px.

## PARAMETERS

### -Name
Name of the property that will be iterated upon.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Text
Header text for the corresponding property to be displayed.

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

### -Width
Width of the column.

```yaml
Type: Int32
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
