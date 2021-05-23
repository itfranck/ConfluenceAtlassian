function New-CAInfoPanel {
    [CmdletBinding(HelpUri = 'https://github.com/itfranck/ConfluenceAtlassian/blob/main/Help/New-CAInfoPanel.md')]
    param (
        $Message
    )
    
    return @'
<ac:structured-macro ac:name="info" ac:schema-version="1">
    <ac:rich-text-body>
       <p>{0}</p>
    </ac:rich-text-body>
</ac:structured-macro>
'@ -f [System.Web.HttpUtility]::HtmlEncode($Message)
}