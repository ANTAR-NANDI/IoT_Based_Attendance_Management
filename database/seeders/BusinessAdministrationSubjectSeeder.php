<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BusinessAdministrationSubjectSeeder extends Seeder
{
    public function run(): void
    {
        $departmentId = DB::table('tblDepartment')->where('DepartmentCode', 'BBA')->value('DepartmentID');
        if (!$departmentId) throw new \RuntimeException('Business Administration must be seeded before its subjects.');

        $now = now();
        $subjects = [
            ['ACC4705', 'Cost Accounting'], ['FIN4706', 'Working Capital Management'], ['FIN4703', 'Financial Institutions & Markets'],
            ['FIN4812', 'Insurance & Risk Management'], ['FIN4704', 'Corporate Finance'], ['HRM4810', 'Training & Development'],
            ['MKT4814', 'E-Marketing'], ['HRM4703', 'Industrial Relations'], ['HRM4704', 'Conflict Management and Negotiation'],
            ['HRM4702', 'Career Management'], ['GED3616', 'Ethics and Sustainability'], ['MGT4802', 'Strategic Management'],
            ['ACC4704', 'Advanced Accounting'], ['ACC4811', 'Accounting based on IFRS'], ['FIN4705', 'Investment Analysis and Portfolio Management'],
            ['FIN4811', 'Bank Fund Management'], ['MKT4812', 'Integrated Marketing Communication'], ['MKT4704', 'Consumer Behavior'],
            ['HRM4809', 'Strategic HRM'], ['HRM4812', 'Compensation Management'], ['GED1208', 'Introduction to Sociology and Psychology'],
            ['GED1010', 'History of the Emergence of Independent Bangladesh'], ['ACC1201', 'Principles of Accounting'],
            ['MKT2301', 'Principles of Marketing'], ['BUS3603', 'Legal Environment of Business'], ['BUS1201', 'Business Communication'],
            ['GED1202', 'Advanced Mathematics'], ['BUS2304', 'Microeconomics'], ['ACC2302', 'Intermediate Accounting'],
            ['BUS2411', 'International Business Environment'], ['GED3510', 'Advanced Statistics'], ['GED3511', 'Advanced Statistics Sessional*'],
            ['FIN2402', 'Financial Management'], ['BUS2407', 'Organizational Behavior'], ['MKT2402', 'Marketing Management'],
            ['GED3105', 'Computer Application in Business'], ['GED3106', 'Computer Application in Business Sessional*'],
            ['BUS3509', 'Macroeconomics'], ['FIN3503', 'Banking & Insurance'], ['ACC3603', 'Management Accounting'],
            ['HRM3501', 'Human Resources Management'], ['BUS3510', 'Entrepreneurship Development'], ['BUS3612', 'Research Methodology'],
            ['BUS3614', 'Research Methodology Sessional*'], ['BUS3613', 'Project Management'], ['ACC2306', 'Taxation'],
            ['BUS3601', 'Operation & Supply Chain Management'], ['BUS4815', 'Industrial Attachment*'], ['GED3615', 'Data Analytics'],
            ['ACC4707', 'Corporate Taxation'], ['ACC4708', 'Auditing'], ['ACC4709', 'Accounting Theory'],
            ['GED1103', 'Functional English'], ['GED1106', 'Functional English Sessional*'], ['BUS1207', 'Introduction to Business'],
            ['GED1104', 'Bangladesh Studies'], ['GED1101', 'Fundamentals of Mathematics'], ['MGT1101', 'Principles of Management'],
            ['GED2305', 'Fundamentals of Statistics'], ['FIN2301', 'Principles of Finance'],
        ];

        foreach ($subjects as [$code, $subjectName]) {
            DB::table('tblSubject')->updateOrInsert(
                ['Code' => $code, 'SubjectName' => $subjectName, 'DepartmentID' => $departmentId],
                ['created_at' => $now, 'updated_at' => $now]
            );
        }
    }
}
