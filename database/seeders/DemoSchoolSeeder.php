<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DemoSchoolSeeder extends Seeder
{
    /**
     * Creates repeatable demo data for the school attendance workflow.
     * It does not delete existing records and may safely be run more than once.
     */
    public function run(): void
    {
        $now = now();

        $departments = [
            ['DepartmentCode' => 'CSE', 'DepartmentName' => 'Computer Science and Engineering'],
            ['DepartmentCode' => 'EEE', 'DepartmentName' => 'Electrical and Electronic Engineering'],
            ['DepartmentCode' => 'BBA', 'DepartmentName' => 'Business Administration'],
            ['DepartmentCode' => 'ENG', 'DepartmentName' => 'English'],
        ];

        foreach ($departments as $department) {
            DB::table('tblDepartment')->updateOrInsert(
                ['DepartmentCode' => $department['DepartmentCode']],
                [...$department, 'Status' => 1, 'updated_at' => $now, 'created_at' => $now]
            );
        }

        foreach (['Professor', 'Associate Professor', 'Assistant Professor', 'Lecturer'] as $designationName) {
            DB::table('tblDesignation')->updateOrInsert(
                ['DesignationName' => $designationName],
                ['Status' => 1, 'updated_at' => $now, 'created_at' => $now]
            );
        }

        $departmentIds = DB::table('tblDepartment')->pluck('DepartmentID', 'DepartmentCode');
        $designationIds = DB::table('tblDesignation')->pluck('DesignationID', 'DesignationName');

        $teachers = [
            ['EmployeeID' => 'EMP-1001', 'TeacherName' => 'Md. Rahim Uddin', 'DepartmentCode' => 'CSE', 'DesignationName' => 'Assistant Professor', 'Mobile' => '01711000001', 'Email' => 'rahim.uddin@example.test', 'ZKUserID' => 1001],
            ['EmployeeID' => 'EMP-1002', 'TeacherName' => 'Farzana Akter', 'DepartmentCode' => 'CSE', 'DesignationName' => 'Lecturer', 'Mobile' => '01711000002', 'Email' => 'farzana.akter@example.test', 'ZKUserID' => 1002],
            ['EmployeeID' => 'EMP-1003', 'TeacherName' => 'Md. Hasan Ali', 'DepartmentCode' => 'EEE', 'DesignationName' => 'Assistant Professor', 'Mobile' => '01711000003', 'Email' => 'hasan.ali@example.test', 'ZKUserID' => 1003],
            ['EmployeeID' => 'EMP-1004', 'TeacherName' => 'Nusrat Jahan', 'DepartmentCode' => 'EEE', 'DesignationName' => 'Lecturer', 'Mobile' => '01711000004', 'Email' => 'nusrat.jahan@example.test', 'ZKUserID' => 1004],
            ['EmployeeID' => 'EMP-1005', 'TeacherName' => 'Md. Kamal Hossain', 'DepartmentCode' => 'BBA', 'DesignationName' => 'Associate Professor', 'Mobile' => '01711000005', 'Email' => 'kamal.hossain@example.test', 'ZKUserID' => 1005],
            ['EmployeeID' => 'EMP-1006', 'TeacherName' => 'Sharmeen Sultana', 'DepartmentCode' => 'ENG', 'DesignationName' => 'Lecturer', 'Mobile' => '01711000006', 'Email' => 'sharmeen.sultana@example.test', 'ZKUserID' => 1006],
        ];

        foreach ($teachers as $teacher) {
            DB::table('tblTeacher')->updateOrInsert(
                ['EmployeeID' => $teacher['EmployeeID']],
                [
                    'TeacherName' => $teacher['TeacherName'],
                    'DepartmentID' => $departmentIds[$teacher['DepartmentCode']],
                    'DesignationID' => $designationIds[$teacher['DesignationName']],
                    'Mobile' => $teacher['Mobile'], 'Email' => $teacher['Email'], 'ZKUserID' => $teacher['ZKUserID'],
                    'updated_at' => $now, 'created_at' => $now,
                ]
            );
        }

        $subjects = [
            ['Code' => 'CSE-101', 'SubjectName' => 'Programming Fundamentals', 'DepartmentCode' => 'CSE'],
            ['Code' => 'CSE-201', 'SubjectName' => 'Object Oriented Programming', 'DepartmentCode' => 'CSE'],
            ['Code' => 'CSE-301', 'SubjectName' => 'Database Management System', 'DepartmentCode' => 'CSE'],
            ['Code' => 'EEE-101', 'SubjectName' => 'Circuit Theory', 'DepartmentCode' => 'EEE'],
            ['Code' => 'EEE-201', 'SubjectName' => 'Digital Electronics', 'DepartmentCode' => 'EEE'],
            ['Code' => 'BBA-101', 'SubjectName' => 'Principles of Management', 'DepartmentCode' => 'BBA'],
            ['Code' => 'ENG-101', 'SubjectName' => 'Business Communication', 'DepartmentCode' => 'ENG'],
        ];

        foreach ($subjects as $subject) {
            DB::table('tblSubject')->updateOrInsert(
                ['Code' => $subject['Code']],
                ['SubjectName' => $subject['SubjectName'], 'DepartmentID' => $departmentIds[$subject['DepartmentCode']], 'updated_at' => $now, 'created_at' => $now]
            );
        }

        foreach ([
            ['BatchName' => 'CSE-61', 'Session' => '2025-2026', 'Semester' => 1],
            ['BatchName' => 'CSE-60', 'Session' => '2024-2025', 'Semester' => 3],
            ['BatchName' => 'EEE-32', 'Session' => '2025-2026', 'Semester' => 1],
            ['BatchName' => 'BBA-25', 'Session' => '2025-2026', 'Semester' => 1],
            ['BatchName' => 'ENG-20', 'Session' => '2025-2026', 'Semester' => 1],
        ] as $batch) {
            DB::table('tblBatch')->updateOrInsert(
                ['BatchName' => $batch['BatchName']],
                [...$batch, 'Status' => 1, 'updated_at' => $now, 'created_at' => $now]
            );
        }

        $rooms = [];
        $floorNames = [1 => '1st Floor', 2 => '2nd Floor', 3 => '3rd Floor', 4 => '4th Floor', 5 => '5th Floor'];
        foreach (range(1, 5) as $floor) {
            foreach (range(1, 18) as $number) {
                $rooms[] = ['RoomNo' => (string) ($floor * 100 + $number), 'Floor' => $floorNames[$floor]];
            }
        }

        foreach ($rooms as $room) {
            DB::table('tblRoom')->updateOrInsert(
                ['RoomNo' => $room['RoomNo']],
                [...$room, 'updated_at' => $now, 'created_at' => $now]
            );
        }

        $roomRows = DB::table('tblRoom')->whereIn('RoomNo', collect($rooms)->pluck('RoomNo'))->get()->keyBy('RoomNo');
        foreach ($rooms as $index => $room) {
            $serial = 'ZKT-ROOM-'.str_pad((string) ($index + 1), 3, '0', STR_PAD_LEFT);
            DB::table('tblDevice')->updateOrInsert(
                ['RoomID' => $roomRows[$room['RoomNo']]->RoomID],
                [
                    'DeviceName' => 'ZKT '.$room['RoomNo'], 'RoomID' => $roomRows[$room['RoomNo']]->RoomID,
                    'IPAddress' => '192.168.10.'.(101 + $index), 'Status' => 1,
                    'updated_at' => $now, 'created_at' => $now,
                ]
            );
        }

        foreach ([
            ['shiftName' => 'Academic Shift', 'startTime' => '08:30:00', 'workinghour' => 7.00, 'daystart' => '08:30:00', 'dayhour' => 7.00],
            ['shiftName' => 'Morning Shift', 'startTime' => '08:00:00', 'workinghour' => 8.00, 'daystart' => '08:00:00', 'dayhour' => 8.00],
            ['shiftName' => 'Evening Shift', 'startTime' => '14:00:00', 'workinghour' => 6.00, 'daystart' => '14:00:00', 'dayhour' => 6.00],
        ] as $shift) {
            DB::table('tblShift')->updateOrInsert(
                ['shiftName' => $shift['shiftName']],
                [...$shift, 'ysnActive' => 1, 'updated_at' => $now, 'created_at' => $now]
            );
        }

        foreach ([
            ['name' => 'Casual Leave', 'days' => 10, 'IsPaid' => 1, 'Remarks' => 'Annual casual leave'],
            ['name' => 'Sick Leave', 'days' => 14, 'IsPaid' => 1, 'Remarks' => 'Medical leave'],
            ['name' => 'Earned Leave', 'days' => 20, 'IsPaid' => 1, 'Remarks' => 'Annual earned leave'],
            ['name' => 'Without Pay Leave', 'days' => 365, 'IsPaid' => 0, 'Remarks' => 'Unpaid leave'],
        ] as $leaveType) {
            DB::table('tblLeaveType')->updateOrInsert(['name' => $leaveType['name']], [...$leaveType, 'updated_at' => $now, 'created_at' => $now]);
        }

        foreach ([
            ['HolidayName' => 'International Mother Language Day', 'holidaydate' => '2026-02-21', 'strDescription' => 'National holiday', 'type' => 'National'],
            ['HolidayName' => 'Independence Day', 'holidaydate' => '2026-03-26', 'strDescription' => 'National holiday', 'type' => 'National'],
            ['HolidayName' => 'Victory Day', 'holidaydate' => '2026-12-16', 'strDescription' => 'National holiday', 'type' => 'National'],
        ] as $holiday) {
            DB::table('tblHolidaySetup')->updateOrInsert(['holidaydate' => $holiday['holidaydate']], [...$holiday, 'updated_at' => $now, 'created_at' => $now]);
        }

        $teacherRows = DB::table('tblTeacher')->whereIn('EmployeeID', collect($teachers)->pluck('EmployeeID'))->get()->keyBy('EmployeeID');
        $subjectRows = DB::table('tblSubject')->whereIn('Code', collect($subjects)->pluck('Code'))->get()->keyBy('Code');
        $batchRows = DB::table('tblBatch')->whereIn('BatchName', ['CSE-61', 'CSE-60', 'EEE-32', 'BBA-25', 'ENG-20'])->get()->keyBy('BatchName');
        $deviceRows = DB::table('tblDevice')->whereIn('RoomID', $roomRows->pluck('RoomID'))->get()->keyBy('RoomID');

        $classes = [
            ['Teacher' => 'EMP-1001', 'Subject' => 'CSE-101', 'Batch' => 'CSE-61', 'Room' => '101', 'StartTime' => '09:00:00', 'EndTime' => '10:00:00', 'ClassType' => 'Theory', 'Remarks' => 'Introduction to C programming'],
            ['Teacher' => 'EMP-1002', 'Subject' => 'CSE-201', 'Batch' => 'CSE-60', 'Room' => '102', 'StartTime' => '10:15:00', 'EndTime' => '11:15:00', 'ClassType' => 'Theory', 'Remarks' => 'OOP concepts'],
            ['Teacher' => 'EMP-1003', 'Subject' => 'EEE-101', 'Batch' => 'EEE-32', 'Room' => '201', 'StartTime' => '09:00:00', 'EndTime' => '10:00:00', 'ClassType' => 'Theory', 'Remarks' => 'AC circuit analysis'],
            ['Teacher' => 'EMP-1004', 'Subject' => 'EEE-201', 'Batch' => 'EEE-32', 'Room' => '202', 'StartTime' => '11:30:00', 'EndTime' => '12:30:00', 'ClassType' => 'Lab', 'Remarks' => 'Logic gate laboratory'],
            ['Teacher' => 'EMP-1005', 'Subject' => 'BBA-101', 'Batch' => 'BBA-25', 'Room' => '103', 'StartTime' => '12:45:00', 'EndTime' => '13:45:00', 'ClassType' => 'Theory', 'Remarks' => 'Management functions'],
            ['Teacher' => 'EMP-1006', 'Subject' => 'ENG-101', 'Batch' => 'ENG-20', 'Room' => '104', 'StartTime' => '14:00:00', 'EndTime' => '15:00:00', 'ClassType' => 'Theory', 'Remarks' => 'Professional communication'],
        ];

        foreach ($classes as $class) {
            $room = $roomRows[$class['Room']];
            DB::table('tblRoutine')->updateOrInsert(
                ['RoutineDate' => '2026-08-24', 'TeacherID' => $teacherRows[$class['Teacher']]->TeacherID, 'StartTime' => $class['StartTime']],
                [
                    'SubjectID' => $subjectRows[$class['Subject']]->SubjectID, 'BatchID' => $batchRows[$class['Batch']]->BatchID,
                    'RoomID' => $room->RoomID, 'DeviceID' => $deviceRows[$room->RoomID]->DeviceID,
                    'EndTime' => $class['EndTime'], 'GraceMinute' => 10, 'DayName' => 'Monday', 'ClassType' => $class['ClassType'],
                    'Remarks' => $class['Remarks'], 'Status' => 1, 'updated_at' => $now, 'created_at' => $now,
                ]
            );
        }

        $leaveTypes = DB::table('tblLeaveType')->pluck('id', 'name');
        foreach ([
            ['Teacher' => 'EMP-1002', 'Type' => 'Casual Leave', 'from' => '2026-08-26', 'to' => '2026-08-27', 'status' => 'Approved', 'reason' => 'Family program'],
            ['Teacher' => 'EMP-1003', 'Type' => 'Sick Leave', 'from' => '2026-08-25', 'to' => '2026-08-25', 'status' => 'Pending', 'reason' => 'Medical consultation'],
        ] as $leave) {
            DB::table('tblLeave')->updateOrInsert(
                ['empID' => (string) $teacherRows[$leave['Teacher']]->TeacherID, 'leave_from' => $leave['from']],
                [
                    'empType' => 'Teacher', 'leave_type_id' => $leaveTypes[$leave['Type']], 'leave_to' => $leave['to'],
                    'total_days' => 1 + \Carbon\Carbon::parse($leave['from'])->diffInDays($leave['to']), 'reason' => $leave['reason'],
                    'status' => $leave['status'], 'approved_by' => $leave['status'] === 'Approved' ? 'System Admin' : null,
                    'approved_at' => $leave['status'] === 'Approved' ? $now : null, 'updated_at' => $now, 'created_at' => $now,
                ]
            );
        }

        // Attendance test cases: Present, Incomplete Punch, Proxy, Absent, and Left Early.
        $punches = [
            ['User' => 'EMP-1001', 'Room' => '101', 'time' => '2026-08-24 08:57:00'], ['User' => 'EMP-1001', 'Room' => '101', 'time' => '2026-08-24 09:58:00'],
            ['User' => 'EMP-1002', 'Room' => '102', 'time' => '2026-08-24 10:26:00'],
            ['User' => 'EMP-1004', 'Room' => '201', 'time' => '2026-08-24 09:03:00'], ['User' => 'EMP-1004', 'Room' => '201', 'time' => '2026-08-24 09:50:00'],
            ['User' => 'EMP-1005', 'Room' => '103', 'time' => '2026-08-24 12:58:00'], ['User' => 'EMP-1005', 'Room' => '103', 'time' => '2026-08-24 13:42:00'],
            ['User' => 'EMP-1006', 'Room' => '104', 'time' => '2026-08-24 14:02:00'], ['User' => 'EMP-1006', 'Room' => '104', 'time' => '2026-08-24 14:59:00'],
        ];

        foreach ($punches as $punch) {
            $room = $roomRows[$punch['Room']];
            $device = $deviceRows[$room->RoomID];
            DB::table('tblAttendanceLog')->updateOrInsert(
                ['EmployeeID' => $teacherRows[$punch['User']]->ZKUserID, 'PunchTime' => $punch['time'], 'DeviceSerialNo' => $device->SerialNo],
                [
                    'DeviceID' => $device->DeviceID, 'PunchState' => 0, 'VerifyMode' => 1, 'WorkCode' => null,
                    'Temperature' => null, 'Mask' => null, 'UploadSource' => 'Demo Seeder', 'SyncTime' => $now,
                    'IsProcessed' => 0, 'updated_at' => $now, 'created_at' => $now,
                ]
            );
        }
    }
}
