<?php

$output = __DIR__ . '/../output/attendance-punch-list-26-sep-2026.png';
$font = 'C:\Windows\Fonts\arial.ttf';
$fontBold = 'C:\Windows\Fonts\arialbd.ttf';

$punches = [
    [1, '4:26:10 PM', 'Nuryl Kaiser Munna'], [2, '4:29:52 PM', 'Aparup Barua'],
    [3, '4:33:08 PM', 'Nuryl Kaiser Munna'], [4, '4:37:55 PM', 'Aparup Barua'],
    [5, '4:39:22 PM', 'Arindam Das'], [6, '4:42:11 PM', 'Khaleda Akhter'],
    [7, '4:43:18 PM', 'Khaleda Akhter'], [8, '4:46:56 PM', 'Antar Nandi'],
    [9, '4:47:50 PM', 'Khaleda Akhter'], [10, '4:52:33 PM', 'Arindam Das'],
    [11, '4:52:59 PM', 'Khaleda Akhter'], [12, '4:53:35 PM', 'Nuryl Kaiser Munna'],
    [13, '4:55:05 PM', 'Arindam Das'], [14, '4:56:25 PM', 'Antar Nandi'],
    [15, '4:58:08 PM', 'Antar Nandi'], [16, '4:59:40 PM', 'Arindam Das'],
    [17, '4:59:55 PM', 'Nuryl Kaiser Munna'], [18, '5:00:14 PM', 'Khaleda Akhter'],
    [19, '5:04:08 PM', 'Arindam Das'], [20, '5:07:45 PM', 'Khaleda Akhter'],
    [21, '5:08:45 PM', 'Antar Nandi'], [22, '5:10:29 PM', 'Antar Nandi'],
    [23, '5:13:27 PM', 'Arindam Das'], [24, '5:14:02 PM', 'Nuryl Kaiser Munna'],
    [25, '5:17:19 PM', 'Antar Nandi'], [26, '5:18:46 PM', 'Khaleda Akhter'],
    [27, '5:19:13 PM', 'Arindam Das'], [28, '5:22:03 PM', 'Nuryl Kaiser Munna'],
    [29, '5:22:14 PM', 'Antar Nandi'],
];

$width = 1200;
$height = 1680;
$image = imagecreatetruecolor($width, $height);
$white = imagecolorallocate($image, 255, 255, 255);
$navy = imagecolorallocate($image, 23, 59, 99);
$blue = imagecolorallocate($image, 37, 99, 235);
$slate = imagecolorallocate($image, 71, 85, 105);
$light = imagecolorallocate($image, 248, 250, 252);
$border = imagecolorallocate($image, 203, 213, 225);
$dark = imagecolorallocate($image, 23, 32, 51);
$imageText = imagecolorallocate($image, 255, 255, 255);

imagefill($image, 0, 0, $white);
imagefilledrectangle($image, 0, 0, $width, 180, $navy);
imagettftext($image, 38, 0, 65, 75, $imageText, $fontBold, 'ZKT Attendance Punch List');
imagettftext($image, 19, 0, 67, 120, $imageText, $font, '26 September 2026 - 29 biometric punches in chronological order');
imagefilledrectangle($image, 0, 180, $width, 188, $blue);

$left = 55;
$top = 235;
$right = 1145;
$rowHeight = 45;
$serialX = 85;
$timeX = 250;
$employeeX = 560;

imagefilledrectangle($image, $left, $top, $right, $top + 55, $navy);
imagettftext($image, 18, 0, $serialX, $top + 35, $imageText, $fontBold, 'Serial');
imagettftext($image, 18, 0, $timeX, $top + 35, $imageText, $fontBold, 'Punch time');
imagettftext($image, 18, 0, $employeeX, $top + 35, $imageText, $fontBold, 'Employee');

foreach ($punches as $index => [$serial, $time, $employee]) {
    $y = $top + 55 + ($index * $rowHeight);
    if ($index % 2 === 1) {
        imagefilledrectangle($image, $left, $y, $right, $y + $rowHeight, $light);
    }
    imageline($image, $left, $y, $right, $y, $border);
    imagettftext($image, 16, 0, $serialX, $y + 29, $dark, $font, (string) $serial);
    imagettftext($image, 16, 0, $timeX, $y + 29, $dark, $font, $time);
    imagettftext($image, 16, 0, $employeeX, $y + 29, $dark, $font, $employee);
}

$bottom = $top + 55 + (count($punches) * $rowHeight);
imageline($image, $left, $bottom, $right, $bottom, $border);
imageline($image, $left, $top, $left, $bottom, $border);
imageline($image, 210, $top, 210, $bottom, $border);
imageline($image, 500, $top, 500, $bottom, $border);
imageline($image, $right, $top, $right, $bottom, $border);
imagettftext($image, 14, 0, 65, 1615, $slate, $font, 'Prepared for attendance-report cross-checking');

imagepng($image, $output, 6);
imagedestroy($image);
