function New-CaInfoPanel {
    [CmdletBinding()]
    param (
        $Message
    )
    
    return @'
<ac:structured-macro ac:name="info" ac:schema-version="1" ac:macro-id="29567c00-855a-4b37-a878-dca8ee284f7e">
    <ac:rich-text-body>
       <p>{0}</p>
    </ac:rich-text-body>
</ac:structured-macro>
'@ -f [System.Web.HttpUtility]::HtmlEncode($Message)
}