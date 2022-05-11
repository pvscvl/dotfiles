function Get-RandomCharacters($length, $characters) {
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs=""
    return [String]$characters[$random]
}
 

$password = Get-RandomCharacters -length 1 -characters '!%#_'
$password += Get-RandomCharacters -length 1 -characters 'ABCDEFGHKLMNOPRSTUVWXYZ'
$password += Get-RandomCharacters -length 9 -characters 'abcdefghiklmnoprstuvwxyz'
$password += Get-RandomCharacters -length 1 -characters '1234567890'
 

Write-Host $password | Set-Clipboard
Write-Host $password
