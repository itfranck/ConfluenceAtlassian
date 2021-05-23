---
external help file: ConfluenceAtlassian-help.xml
Module Name: ConfluenceAtlassian
online version:
schema: 2.0.0
---

# Invoke-CAApi

## SYNOPSIS
Invoke-RestMethod wrapper to call confluence methods.

## SYNTAX

```
Invoke-CAApi [[-Method] <WebRequestMethod>] [[-Path] <String>] [[-ContentType] <String>]
 [[-Headers] <IDictionary>] [[-Body] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Invoke-RestMethod wrapper to call confluence methods using context to fill the gaps. 

## EXAMPLES

### Example 1
```powershell
PS C:\> Invoke-CAApi -Path '/content/9302950291' -Body @{
    'expand' = @('body.storage', 'version', 'space') -join ',' 
}
```

Invoke Confluence API with some method. Authorization and base url is passed down contextually

## PARAMETERS

### -Body
Specifies the body of the request.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContentType
Specifies the content type of the web request.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: application/x-www-form-urlencoded, application/json

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Headers
Specifies the headers of the web request. Enter a hash table or dictionary.

```yaml
Type: IDictionary
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Method
Specifies the method used for the web request.

```yaml
Type: WebRequestMethod
Parameter Sets: (All)
Aliases:
Accepted values: Default, Get, Head, Post, Put, Delete, Trace, Options, Merge, Patch

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Path to the resource of the web request.

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
