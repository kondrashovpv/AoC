# 2. Part 1&2
function isRangeValid {
  Param
    (
    [Parameter(Mandatory=$true, Position =0)]
    [string]$range
    )
    [long[]]$ranges = ($line.split('-',[System.StringSplitOptions]::RemoveEmptyEntries))
    $start = $ranges[0]
    $end = $ranges[1]
    [long]$res = 0
    $part1 = "^(\d+)\1$"
    $part2 = "^(\d+)\1+$"
    for ($i = $start; $i -le $end; $i++) {
        $i_str = [string]$i
        if ($i_str -match $part2) {             
            $res += $i
        }
    }
    return $res      
}


$txt = Get-Content .\advent.txt
[string[]]$lines = ($txt.split(',',[System.StringSplitOptions]::RemoveEmptyEntries))    
[long]$res = 0
foreach ($line in $lines) {            
    $res += (isRangeValid $line)
}
$res
