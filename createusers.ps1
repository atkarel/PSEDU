
# Import Active Directory Module
Import-Module ActiveDirectory

$password = Read-Host -AsSecureString -Prompt "Enter Temporary Password for New Users"

$csv = Import-Csv -Path C:\Users\akarel\Desktop\ADUsers.csv 

foreach ($user in $csv) {

    $UserInfo = @{
        SamAccountName = $user.SamAccountName
        Name = $user.Name
        DisplayName = $user.DisplayName
        GivenName = $user.GivenName
        Surname = $user.Surname
        Title = $user.Title
        Department = $user.Department
        Company = $user.Company
        EmailAddress = $user.EmailAddress
        AccountPassword = $password
        ChangePasswordAtLogon = $true
        Path = $user.Path
        Enabled = $true
    }
    New-ADUser @UserInfo
     $UserInfo
}
