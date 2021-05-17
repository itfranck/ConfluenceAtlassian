function New-CaInfoPanel {
    [CmdletBinding()]
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