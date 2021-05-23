---
external help file: ConfluenceAtlassian-help.xml
Module Name: ConfluenceAtlassian
online version:
schema: 2.0.0
---

# Set-CAContext

## SYNOPSIS
Set the context used for connectivity to your Confluence instance.

## SYNTAX

```
Set-CAContext [[-Credential] <PSCredential>] [[-InstanceName] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Set the context used for connectivity to your Confluence instance. Any request made afterward will use the provided context to locate the resources and authorize the operations.

## EXAMPLES

### Example 1
```powershell
PS C:\> $ConfluenceCreds = Get-Secret -Vault Default -Name 'Confluence' # PSCredential object
# Alternative without the secret management module
# $ConfluenceCreds = [PsCredential]::new('U', (ConvertTo-SecureString 'SomeSecret' -AsPlainText -Force))
Set-CAContext -Credential $ConfluenceCreds -InstanceName 'Contoso'
```

This example use the SecretManagement module to obtain a pscredential object containing the user confluence credential. This along with the instance name is used to create the context.

## PARAMETERS

### -Credential
Credentials to connect to confluence. Username should be the email address and password the token generated from atlassian (https://id.atlassian.com/manage-profile/security/api-tokens). This is not the user password.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InstanceName
Instance name of the workspace to connect to. This is the custom url part that represent your organization. (https://<InstanceName>.atlassian.net/wiki/rest/api)

```yaml
Type: Object
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
