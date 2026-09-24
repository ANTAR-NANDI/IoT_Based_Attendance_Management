<?php

require __DIR__ . '/../../vendor/autoload.php';

use Dompdf\Dompdf;
use Dompdf\Options;

$punches = [
    [1, '3:14:48 PM', 'Antar Nandi', '1'], [2, '3:17:00 PM', 'Antar Nandi', '1'],
    [3, '3:20:18 PM', 'Nurul Kaiser Munna', '2'], [4, '3:26:13 PM', 'Antar Nandi', '1'],
    [5, '3:29:16 PM', 'Antar Nandi', '1'], [6, '3:39:17 PM', 'Nurul Kaiser Munna', '2'],
    [7, '3:42:13 PM', 'Nurul Kaiser Munna', '2'], [8, '3:48:59 PM', 'Nurul Kaiser Munna', '2'],
    [9, '3:50:46 PM', 'Nurul Kaiser Munna', '2'], [10, '3:53:33 PM', 'Nurul Kaiser Munna', '2'],
    [11, '3:54:44 PM', 'Nurul Kaiser Munna', '2'], [12, '3:59:41 PM', 'Antar Nandi', '1'],
    [13, '4:01:12 PM', 'Nurul Kaiser Munna', '2'], [14, '4:04:03 PM', 'Nurul Kaiser Munna', '2'],
    [15, '4:06:08 PM', 'Nurul Kaiser Munna', '2'], [16, '4:07:18 PM', 'Antar Nandi', '1'],
    [17, '4:08:08 PM', 'Nurul Kaiser Munna', '2'],
];

$rows = '';
foreach ($punches as [$serial, $time, $employee, $zktId]) {
    $rows .= "<tr><td>{$serial}</td><td>{$time}</td><td>{$employee}</td><td>{$zktId}</td></tr>";
}

$html = <<<HTML
<!doctype html><html><head><meta charset="utf-8"><style>
@page { margin: 18mm; } body { font-family: DejaVu Sans, sans-serif; color: #172033; font-size: 11px; }
h1 { color: #173b63; font-size: 22px; margin: 0 0 8px; } p { margin: 3px 0; color: #475569; }
.box { background: #f1f5f9; border-left: 4px solid #173b63; padding: 10px 12px; margin: 16px 0; }
table { width: 100%; border-collapse: collapse; margin-top: 14px; } th { background: #173b63; color: white; text-align: left; font-weight: bold; } th, td { border: 1px solid #cbd5e1; padding: 9px; } tr:nth-child(even) { background: #f8fafc; } td:first-child, td:last-child { text-align: center; }
.footer { margin-top: 16px; font-size: 9px; color: #64748b; }
</style></head><body>
<h1>ZKT Attendance Punch List</h1>
<p>Date: <strong>24 September 2026</strong></p>
<div class="box"><strong>ZKT User ID 1:</strong> Antar Nandi &nbsp;&nbsp;&nbsp; <strong>ZKT User ID 2:</strong> Nurul Kaiser Munna</div>
<table><thead><tr><th>Serial</th><th>Punch Time</th><th>Employee</th><th>ZKT User ID</th></tr></thead><tbody>{$rows}</tbody></table>
<p class="footer">Punches are ordered chronologically from tblAttendanceLog. Prepared for printing.</p>
</body></html>
HTML;

$options = new Options();
$options->set('defaultFont', 'DejaVu Sans');
$pdf = new Dompdf($options);
$pdf->loadHtml($html);
$pdf->setPaper('A4', 'portrait');
$pdf->render();
file_put_contents(__DIR__ . '/../../output/pdf/zkt-punch-list-24-sep-2026.pdf', $pdf->output());
