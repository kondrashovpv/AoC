# 3. Part 1&2

function Find-LargestAndIndex {
    param(
        [string[]]$numbers
    )
    $largest = $numbers[0]
    foreach ($num in $numbers) {
        if ($num.Length -gt $largest.Length) {
            $largest = $num
        }
        elseif ($num.Length -eq $largest.Length -and $num -gt $largest) {
            $largest = $num
        }
    }
    $index = [array]::IndexOf($numbers, $largest)
    return @{
        Index = $index
        Value = $largest
    }
}


function getMaxVoltage {
  Param
    (
    [Parameter(Mandatory=$true, Position =0)]
    [string]$bank,
    [Parameter(Mandatory=$true, Position =1)]
    [int]$batteryCount
    )

    #[string]$bank = "234234234234278"    
    #[int]$batteryCount = 12
    [int[]]$batteries = (($bank -split '') -ne '')  
    $mylist = [System.Collections.ArrayList]$batteries
    #[string]$batteries  
    while ($batteries.Count -ne $batteryCount) {
        $minValue = [int](($batteries | Measure -Min).Minimum)    
        $minValueIndex = [Array]::IndexOf($batteries, $minValue)
        [string[]]$arrTmp = @()  
        for ($k = 0; $k -le $minValueIndex; $k++) {
                $mylistTemp = [System.Collections.ArrayList]$batteries
                $mylistTemp.RemoveAt($k) 
                [string]$strTmp = ([string]$mylistTemp).Replace(' ','')                         
                $arrTmp += [string]$strTmp                
        }
        $largest = Find-LargestAndIndex $arrTmp
        [int]$ind = [int]($largest.Index)
        #$ind
        $mylist.RemoveAt($ind)
        $batteries = [int[]]$mylist
        #[string]$batteries
    }

    [string]$res = ""
    foreach ($item in $batteries) {
        $res += ([string]$item)
    }
    #$res        
    return [long]$res
}


$txt = Get-Content .\advent.txt
[long]$res = 0
[int]$batteryCount = 12
foreach ($line in $txt) {                
    $res += [long](getMaxVoltage $line $batteryCount)
}
$res
