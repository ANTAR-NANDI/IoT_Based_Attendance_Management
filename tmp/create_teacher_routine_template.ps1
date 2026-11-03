$ErrorActionPreference = 'Stop'
$people = Get-Content -Raw 'tmp\seed-teachers.json' | ConvertFrom-Json
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$excel.DisplayAlerts = $false
try {
    $workbook = $excel.Workbooks.Add()
    while ($workbook.Worksheets.Count -gt 1) { $workbook.Worksheets.Item($workbook.Worksheets.Count).Delete() }
    $teachers = $workbook.Worksheets.Item(1)
    $teachers.Name = 'Teachers'
    $teacherData = [System.Collections.Generic.List[object[]]]::new()
    $teacherData.Add([object[]]@('Teacher Name', 'Short Name', 'Code'))
    foreach ($person in $people) { $teacherData.Add([object[]]@($person.name, $person.shortName, $person.code)) }
    $teacherMatrix = New-Object 'object[,]' $teacherData.Count, 3
    for ($r = 0; $r -lt $teacherData.Count; $r++) { for ($c = 0; $c -lt 3; $c++) { $teacherMatrix[$r, $c] = $teacherData[$r][$c] } }
    $teacherRange = $teachers.Range($teachers.Cells.Item(1, 1), $teachers.Cells.Item($teacherData.Count, 3))
    $teacherRange.Value2 = $teacherMatrix
    $teachers.Range('A1:C1').Font.Bold = $true
    $teachers.Range('A1:C1').Font.Color = 16777215
    $teachers.Range('A1:C1').Interior.Color = 550248
    $teachers.Range('A1:C1').HorizontalAlignment = -4108
    $teacherRange.Font.Name = 'Arial'
    $teacherRange.Font.Size = 10
    $teacherRange.Borders.LineStyle = 1
    $teacherRange.AutoFilter() | Out-Null
    $teachers.Columns.Item('A').ColumnWidth = 34
    $teachers.Columns.Item('B').ColumnWidth = 16
    $teachers.Columns.Item('C').ColumnWidth = 16
    $teachers.Range('A2:C' + $teacherData.Count).VerticalAlignment = -4108
    $teachers.Activate() | Out-Null
    $teachers.Range('A2').Select() | Out-Null
    $excel.ActiveWindow.FreezePanes = $true
    $workbook.Names.Add('TeacherNames', "=Teachers!`$A`$2:`$A`$$($teacherData.Count)") | Out-Null
    $workbook.Names.Add('TeacherShortNames', "=Teachers!`$B`$2:`$B`$$($teacherData.Count)") | Out-Null
    $workbook.Names.Add('TeacherCodes', "=Teachers!`$C`$2:`$C`$$($teacherData.Count)") | Out-Null

    $routine = $workbook.Worksheets.Add()
    $routine.Name = 'Routine Import'
    $headers = @('Day', 'In Time', 'Out Time', 'Subject Code', 'Teacher Name', 'Teacher Short Name', 'Teacher Code', 'Room Number', 'Level', 'Term', 'Remarks')
    $routineRange = $routine.Range($routine.Cells.Item(1, 1), $routine.Cells.Item(501, $headers.Count))
    for ($column = 0; $column -lt $headers.Count; $column++) { $routine.Cells.Item(1, $column + 1).Value2 = $headers[$column] }
    $routine.Range('A1:K1').Font.Bold = $true
    $routine.Range('A1:K1').Font.Color = 16777215
    $routine.Range('A1:K1').Interior.Color = 32896
    $routine.Range('A1:K1').HorizontalAlignment = -4108
    $routineRange.Font.Name = 'Arial'
    $routineRange.Font.Size = 10
    $routineRange.Borders.LineStyle = 1
    $routine.Range('E2:E501').Validation.Delete()
    $routine.Range('E2:E501').Validation.Add(3, 1, 1, '=TeacherNames')
    $routine.Range('E2:E501').Validation.InCellDropdown = $true
    $routine.Range('E2:E501').Validation.InputTitle = 'Teacher name'
    $routine.Range('E2:E501').Validation.InputMessage = 'Choose a teacher name, or use the short-name dropdown instead.'
    $routine.Range('F2:F501').Validation.Delete()
    $routine.Range('F2:F501').Validation.Add(3, 1, 1, '=TeacherShortNames')
    $routine.Range('F2:F501').Validation.InCellDropdown = $true
    $routine.Range('F2:F501').Validation.InputTitle = 'Teacher short name'
    $routine.Range('F2:F501').Validation.InputMessage = 'Choose a short name, or use the teacher-name dropdown instead.'
    $routine.Range('G2:G501').Formula = '=IFERROR(IF(E2<>"",VLOOKUP(E2,Teachers!$A$2:$C$64,3,FALSE),IF(F2<>"",VLOOKUP(F2,Teachers!$B$2:$C$64,2,FALSE),"")),"")'
    $routine.Range('A2:A501').Validation.Delete()
    $routine.Range('A2:A501').Validation.Add(3, 1, 1, 'Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday')
    $routine.Range('I2:I501').Validation.Delete()
    $routine.Range('I2:I501').Validation.Add(3, 1, 1, '1,2,3,4,5')
    $routine.Range('J2:J501').Validation.Delete()
    $routine.Range('J2:J501').Validation.Add(3, 1, 1, '1,2,3')
    $routine.Columns.Item('A').ColumnWidth = 14
    $routine.Columns.Item('B').ColumnWidth = 12
    $routine.Columns.Item('C').ColumnWidth = 12
    $routine.Columns.Item('D').ColumnWidth = 20
    $routine.Columns.Item('E').ColumnWidth = 30
    $routine.Columns.Item('F').ColumnWidth = 19
    $routine.Columns.Item('G').ColumnWidth = 18
    $routine.Columns.Item('H').ColumnWidth = 15
    $routine.Columns.Item('I').ColumnWidth = 10
    $routine.Columns.Item('J').ColumnWidth = 10
    $routine.Columns.Item('K').ColumnWidth = 42
    $routine.Range('A2:J501').HorizontalAlignment = -4108
    $routine.Activate() | Out-Null
    $routine.Range('A2').Select() | Out-Null
    $excel.ActiveWindow.FreezePanes = $true
    $output = (Resolve-Path 'outputs\teacher_routine_template').Path + '\routine-import-with-teacher-dropdown.xlsx'
    $workbook.SaveAs($output, 51)
    $workbook.Close($true)
    Write-Output "Created $output"
}
finally {
    $excel.Quit()
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
}
