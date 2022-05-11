function Get-RandomCharacters($length, $characters) {
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
    $private:ofs=""
    return [String]$characters[$random]
}

 function Shuffle-String([string]$inputString){     
    $characterArray = $inputString.ToCharArray()   
    $scrambledStringArray = $characterArray | Get-Random -Count $characterArray.Length     
    $outputString = -join $scrambledStringArray
    return $outputString 
}

$password = Get-RandomCharacters -length 2 -characters '!%#_'
$password += Get-RandomCharacters -length 3 -characters 'ABCDEFGHKLMNPRSTUVWXYZ'
$password += Get-RandomCharacters -length 4 -characters 'abcdefghikmnoprstuvwxyz'
$password += Get-RandomCharacters -length 2 -characters '1234567890'
 
$password = Shuffle-String $password
echo -n $password | Clip
Write-Host ""
Write-Host $password