function Set-CAContext {
    [CmdletBinding(HelpUri = 'https://github.com/itfranck/ConfluenceAtlassian/blob/main/Help/Set-CAContext.md')]
    param (
        # Specifies the user account credentials to use when performing this task.
        [Parameter()]
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $InstanceName
    )
    

    $Script:CAContext = [CAContext]::New($InstanceName, $Credential)
    

    
}
