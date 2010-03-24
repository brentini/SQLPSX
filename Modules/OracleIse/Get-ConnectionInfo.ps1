function Get-ConnectionInfo
{
param($bitmap)
 New-Grid -Columns 2 -Rows 6 -width 428 -height 200 {
      $script:Action = {
        $tns = $window | Get-ChildControl tns
#        $database = $window | Get-ChildControl Database
        $userName = $window | Get-ChildControl UserName
        $password = $window | Get-ChildControl Password

        $this.Parent.Parent.Tag = new-object PSObject |
            add-member NoteProperty tns $tns.Text -PassThru |
            add-member NoteProperty UserName $($userName.Text + '') -PassThru |
            add-member NoteProperty Password $($Password.Text + '') -PassThru
        $window.Close()
         
    }
    
    new-image -source $bitmap -ColumnSpan 2 -Width 400 -Height 40 -HorizontalAlignment Left
    
    New-Label -Row 1 "TNS name (required):" -VerticalContentAlignment 'Center' -FontWeight Bold
    New-TextBox -Row 1 -Column 1 -Name tns -Width 200 -Height 20 -HorizontalAlignment Left
    
    New-Label -Row 2 "  User name (required):" -VerticalContentAlignment 'Center'
    New-TextBox -Row 2 -Column 1 -Name UserName -Width 200 -Height 20  -HorizontalAlignment Left
    
    New-Label -Row 3 "  Password: (required)" -VerticalContentAlignment 'Center'
    New-TextBox -Row 3 -Column 1 -Name Password -Width 200 -Height 20  -HorizontalAlignment Left
    
    New-Separator -Row 4 -ColumnSpan 2
    
    New-StackPanel -Orientation horizontal -Row 5 -Column 1 -HorizontalAlignment Right {
        New-Button -Name Connect "Connect" -Row 5  -On_Click $action -Width 75 -Height 25
        New-Button -Name Cancel "Cancel" -Row 5 -Column 1 -On_Click {$window.Close()} -Width 75 -Height 25
    }
    
} -show
}
