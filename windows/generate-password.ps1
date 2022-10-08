#New-Item -ItemType "directory" -path .\Documents\WindowsPowerShell\Modules
#New-Item -ItemType "file" -path .\Documents\WindowsPowerShell\Modules\Microsoft.PowerShell_profile.ps1
#$Profile.CurrentUserCurrentHost
#Microsoft.PowerShell_profile.ps1
#.\Documents\WindowsPowerShell\Modules\Microsoft.PowerShell_profile.ps1


#4x4 : 1st group:4 Letters, first Letter always uppercase, following letters always lowercase. 2nd and 3rd group always lowercase letters, 4th group always digits
#generated Password is also copied to clipboard
function Generate-Password 
    {
    function Get-RandomCharacters($length, $characters) 
        {
        $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
        $private:ofs=""
        return [String]$characters[$random]
        }
  
    $pvscvlpasswordpt1 = Get-RandomCharacters -length 1 -characters 'ABCDEFGHKLMNPRQSTUVWXYZ'
    $pvscvlpasswordpt1 += Get-RandomCharacters -length 3 -characters 'abcdefghikmnoprstuvwxyz'
    $pvscvlpasswordpt2 = Get-RandomCharacters -length 4 -characters 'abcdefghikmnoprstuvwxyz'
    $pvscvlpasswordpt3 = Get-RandomCharacters -length 4 -characters 'abcdefghikmnoprstuvwxyz'
    $pvscvlpasswordpt4 = Get-RandomCharacters -length 4 -characters '1234567890'
        $pvscvlpassword = $pvscvlpasswordpt1
        $pvscvlpassword += "-"
        $pvscvlpassword += $pvscvlpasswordpt2
        $pvscvlpassword += "-"
        $pvscvlpassword += $pvscvlpasswordpt3
        $pvscvlpassword += "-"
        $pvscvlpassword += $pvscvlpasswordpt4
    
    echo -n $pvscvlpassword | Set-Clipboard
    Write-Host ""
    Write-Host ""
    #Write-Host "`t $pvscvlpassword"
    Write-Host "$pvscvlpassword"
    Write-Host ""
}


function Generate-shortPassword 
    {
    function Get-RandomCharacters($length, $characters) 
        {
        $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
        $private:ofs=""
        return [String]$characters[$random]
        }
  
    $pvscvlpasswordpt1 = Get-RandomCharacters -length 4 -characters 'ABCDEFGHKLMNPRQSTUVWXYZ'
    $pvscvlpasswordpt2 = Get-RandomCharacters -length 4 -characters 'abcdefghikmnoprstuvwxyz'
    $pvscvlpasswordpt3 = Get-RandomCharacters -length 4 -characters '1234567890'
        $pvscvlpassword = $pvscvlpasswordpt1
        $pvscvlpassword += "-"
        $pvscvlpassword += $pvscvlpasswordpt2
        $pvscvlpassword += "-"
        $pvscvlpassword += $pvscvlpasswordpt3
    
    echo -n $pvscvlpassword | Set-Clipboard
    Write-Host ""
    Write-Host ""
    #Write-Host "`t $pvscvlpassword"
    Write-Host "$pvscvlpassword"
    Write-Host ""
}




#12Characters-2Symbols, 3Uppercase Chars, 5 Lowercase Chars, 2 Digits
#generated password is also copied to clipboard
function Generate-Password12Chars
    {
    function Get-RandomCharacters($length, $characters) 
        {
        $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
        $private:ofs=""
        return [String]$characters[$random]
        }

        function Shuffle-String([string]$inputString)
        {     
        $characterArray = $inputString.ToCharArray()   
        $scrambledStringArray = $characterArray | Get-Random -Count $characterArray.Length     
        $outputString = -join $scrambledStringArray
        return $outputString 
        }

    $pvscvlpassword = Get-RandomCharacters -length 2 -characters '!%#_'
    $pvscvlpassword += Get-RandomCharacters -length 3 -characters 'ABCDEFGHKLMNPRSTUVWXYZ'
    $pvscvlpassword += Get-RandomCharacters -length 5 -characters 'abcdefghikmnoprstuvwxyz'
    $pvscvlpassword += Get-RandomCharacters -length 2 -characters '1234567890'
 
    $pvscvlpassword = Shuffle-String $pvscvlpassword
    echo -n $pvscvlpassword | Set-Clipboard
    Write-Host ""
    Write-Host ""

    Write-Host "$pvscvlpassword"
    #Write-Host "`t $pvscvlpassword"
    Write-Host ""
    } 
