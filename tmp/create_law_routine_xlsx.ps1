$ErrorActionPreference = 'Stop'
$rows = Import-Csv 'tmp\law-fall-2026-import.csv'
$headers = @('Day', 'In Time', 'Out Time', 'Subject Code', 'Teacher Code', 'Room Number', 'Remarks')
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$excel.DisplayAlerts = $false
try {
    $workbook = $excel.Workbooks.Add()
    while ($workbook.Worksheets.Count -gt 1) { $workbook.Worksheets.Item($workbook.Worksheets.Count).Delete() }
    $sheet = $workbook.Worksheets.Item(1)
    $sheet.Name = 'Routine Import'
    $data = [System.Collections.Generic.List[object[]]]::new()
    $data.Add([object[]]$headers)
    foreach ($row in $rows) { $data.Add([object[]]@($row.Day, $row.'In Time', $row.'Out Time', $row.'Subject Code', $row.'Teacher Code', $row.'Room Number', $row.Remarks)) }
    $matrix = New-Object 'object[,]' $data.Count, $headers.Count
    for ($r = 0; $r -lt $data.Count; $r++) { for ($c = 0; $c -lt $headers.Count; $c++) { $matrix[$r, $c] = $data[$r][$c] } }
    $range = $sheet.Range($sheet.Cells.Item(1, 1), $sheet.Cells.Item($data.Count, $headers.Count))
    $range.Value2 = $matrix
    $header = $sheet.Range('A1:G1')
    $header.Font.Bold = $true
    $header.Font.Color = 16777215
    $header.Interior.Color = 550248
    $header.HorizontalAlignment = -4108
    $range.Font.Name = 'Arial'
    $range.Font.Size = 10
    $range.Borders.LineStyle = 1
    $range.AutoFilter() | Out-Null
    $sheet.Columns.Item('A').ColumnWidth = 13
    $sheet.Columns.Item('B').ColumnWidth = 12
    $sheet.Columns.Item('C').ColumnWidth = 12
    $sheet.Columns.Item('D').ColumnWidth = 17
    $sheet.Columns.Item('E').ColumnWidth = 18
    $sheet.Columns.Item('F').ColumnWidth = 14
    $sheet.Columns.Item('G').ColumnWidth = 48
    $sheet.Range('A2:F' + $data.Count).HorizontalAlignment = -4108
    $sheet.Range('G2:G' + $data.Count).WrapText = $true
    $sheet.Activate() | Out-Null
    $sheet.Range('A2').Select() | Out-Null
    $excel.ActiveWindow.FreezePanes = $true

    $notes = $workbook.Worksheets.Add()
    $notes.Name = 'Review Notes'
    $noteData = [System.Collections.Generic.List[object[]]]::new()
    $noteData.Add([object[]]@('Law Fall-2026 routine extraction', '', ''))
    $noteData.Add([object[]]@('', '', ''))
    $noteData.Add([object[]]@('Item', 'Status', 'Action needed'))
    $noteData.Add([object[]]@('Class rows extracted', $rows.Count, 'Sunday to Thursday only.'))
    $noteData.Add([object[]]@('Unmapped teacher short forms', 'JF, MD, NAB, NAR, RIH, SBA, SBK', 'Map each to the correct employee code or ZKT user ID before upload.'))
    $noteData.Add([object[]]@('Levels and terms', 'Stored in Remarks', 'This workbook contains multiple levels/terms. Use the planned multi-level importer or split by batch before the current single-batch upload.'))
    $noteData.Add([object[]]@('Subject sections', 'Stored in Remarks', 'Section A/B is retained in Remarks because Law subject codes repeat by section.'))
    $noteMatrix = New-Object 'object[,]' $noteData.Count, 3
    for ($r = 0; $r -lt $noteData.Count; $r++) { for ($c = 0; $c -lt 3; $c++) { $noteMatrix[$r, $c] = $noteData[$r][$c] } }
    $notes.Range($notes.Cells.Item(1, 1), $notes.Cells.Item($noteData.Count, 3)).Value2 = $noteMatrix
    $notes.Range('A1:C1').Merge() | Out-Null
    $notes.Range('A1').Font.Bold = $true
    $notes.Range('A1').Font.Size = 14
    $notes.Range('A1').Font.Color = 16777215
    $notes.Range('A1').Interior.Color = 550248
    $notes.Range('A3:C3').Font.Bold = $true
    $notes.Range('A3:C3').Interior.Color = 15658734
    $notes.Range('A1:C7').Font.Name = 'Arial'
    $notes.Range('A1:C7').Borders.LineStyle = 1
    $notes.Columns.Item('A').ColumnWidth = 32
    $notes.Columns.Item('B').ColumnWidth = 38
    $notes.Columns.Item('C').ColumnWidth = 75
    $notes.Range('A4:C7').WrapText = $true
    $notes.Rows.Item(5).RowHeight = 34
    $notes.Rows.Item(6).RowHeight = 38
    $notes.Rows.Item(7).RowHeight = 38

    $output = (Resolve-Path 'outputs\law_fall_2026_routine').Path + '\law-fall-2026-routine.xlsx'
    $workbook.SaveAs($output, 51)
    $workbook.Close($true)
    Write-Output "Created $output"
}
finally {
    $excel.Quit()
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
}
