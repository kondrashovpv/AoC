# 2025
# 1. Part 1 
$csv = Import-Csv .\adven01.csv
$a = $csv."A"
[int]$pass = 0
[int]$res = 50
foreach ($itemA in $a) {
    $direction = $itemA[0]
    [int]$clickNumber = $itemA.Substring(1, $itemA.Length-1)
    if ($direction -eq "L") {
        # go left - MINUS
        $res = $res - $clickNumber        
        while ($res -lt 0) {
            $res = $res + 100                        
        }        
    } elseif ($direction -eq "R") {
        # go right - PLUS
        $res = $res + $clickNumber
        while ($res -gt 99) {
            $res = $res - 100                        
        }         
    }
    if ($res -eq 0) {$pass++}
}
$pass


# 1. Part 2 

$csv = Import-Csv .\adven01.csv
$a = $csv."A"
[int]$pass1 = 0
[int]$pass = 0
[int]$res = 50
foreach ($itemA in $a) {
    $direction = $itemA[0]    
    [int]$clickNumber = $itemA.Substring(1, $itemA.Length-1)
    for ($i = 0; $i -lt $clickNumber; $i++) {
        if ($direction -eq "R") {
            $res++
            if ($res -eq 100) { $res = 0}
        } else {
            if ($res -eq 0) { $res = 100}
            $res--
        }
        if ($res -eq 0) { $pass++}        
    }
    if ($res -eq 0) { $pass1++}
}
$pass1
$pass
