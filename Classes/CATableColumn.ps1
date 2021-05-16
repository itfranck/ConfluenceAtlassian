class CATableColumn {
    [String]$Name
    [String]$Text
    [Int]$Width

    CATableColumn([String]$Name) {
        $this.Name = $Name
        $this.Text = $Name
    }

    CATableColumn($Name, $Text) {
        $this.Name = $Name
        if ([String]::IsNullOrEmpty($Text)) {
            $this.Text = $Name
        } else {
            $this.Text = $Text
        }
    }

    CATableColumn($Name, $Text,$Width = 0) {
        $this.Name = $Name
        if ([String]::IsNullOrEmpty($Text)) {
            $this.Text = $Name
        }
        else {
            $this.Text = $Text
        }
        $this.Width = $Width
    }
}

