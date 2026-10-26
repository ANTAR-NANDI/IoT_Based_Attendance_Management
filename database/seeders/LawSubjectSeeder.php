<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LawSubjectSeeder extends Seeder
{
    public function run(): void
    {
        $lawDepartmentId = DB::table('tblDepartment')->where('DepartmentCode', 'LAW')->value('DepartmentID');
        if (!$lawDepartmentId) {
            throw new \RuntimeException('The Law department must be seeded before running LawSubjectSeeder.');
        }

        $now = now();
        foreach ([
            ['4211101', 'Jurisprudence and Legal Theory (Section A)'], ['4211101', 'Jurisprudence and Legal Theory (Section B)'],
            ['4211102', 'Legal History and Legal System of Bangladesh (Section A)'], ['4211102', 'Legal History and Legal System of Bangladesh (Section B)'],
            ['2311101', 'Functional English (Section A)'], ['2311101', 'Functional English (Section B)'],
            ['2301102', 'English for Law (Section A)'], ['2301102', 'English for Law (Section B)'],
            ['4211203', 'Constitutional Law of Bangladesh and Interpretation of Statutes(Section A)'], ['4211203', 'Constitutional Law of Bangladesh and Interpretation of Statutes (Section B)'],
            ['4211204', 'Law of Torts and Consumer Protection(Section A)'], ['4211204', 'Law of Torts and Consumer Protection (Section B)'],
            ['4211205', 'Muslim Law (Section A)'], ['4211205', 'Muslim Law (Section B)'],
            ['4211206', 'Law of Contract (Section A)'], ['4211206', 'Law of Contract (Section B)'],
            ['6111203', 'Computer and Its Application (Section A)'], ['6111203', 'Computer and Its Application (Section B)'],
            ['2311204', 'Public Speaking (Section A)'], ['2311204', 'Public Speaking (Section B)'],
            ['4212101', 'Company and Securities Law (Section A)'], ['4212101', 'Company and Securities Law (Section B)'],
            ['4212102', 'Law of Equity and Trust (Section A)'], ['4212102', 'Law of Equity and Trust (Section B)'],
            ['4212103', 'Law of Partnership and Insurance (Section A)'], ['4212103', 'Law of Partnership and Insurance (Section B)'],
            ['4212104', 'Hindu Law and Christian Law (Section A)'], ['4212104', 'Hindu Law and Christian Law (Section B)'],
            ['3122105', 'Government and Politics (Section A)'], ['3122105', 'Government and Politics (Section B)'],
            ['2322106', 'Bangla Language and Literature (Section A)'], ['2322106', 'Bangla Language and Literature (Section B)'],
            ['4212205', 'Media and Information Technology Law'], ['4212206', 'Public International Law'],
            ['4212207', 'Land Laws of Bangladesh'], ['4212208', 'Sale of Goods and Carriage of Goods'],
            ['4212209', 'Law of Banking and Money Laundering Prevention'], ['2222207', 'Bangladesh Studies'],
            ['4213101', 'Environmental Law'], ['4213102', 'Fiscal Law'], ['4213103', 'Intellectual Property Law'],
            ['4213104', 'Law of Specific Relief, Limitation and Public Demand Recovery'], ['4213105', 'Law of Transfer of Property and Registration'],
            ['3183108', 'Criminology & Criminal Administration'], ['LAW 3206', 'Law of Crimes I'], ['LAW 3207', 'Labour Law'],
            ['LAW 3208', 'Law of Civil Procedure I'], ['LAW 3209', 'Law of Criminal Procedure I'], ['GED 3209', 'Introduction to International Relations'],
            ['GED 3210', 'Introduction to Economics'], ['LAW 4101', 'Law of Crimes II'], ['LAW 4102', 'Law of Civil Procedure II'],
            ['LAW 4103', 'Law of Criminal Procedure II'], ['LAW 4104', 'Law of Evidence'], ['LAW 4105', 'Medical Jurisprudence'],
            ['GED 4111', 'Peace and Conflict Studies'], ['LAW 4206', 'Legal Research and Monograph'],
            ['LAW 4207', 'Mock Trial & Advocacy (Civil and Criminal)'], ['LAW 4208', 'Law of Alternative Dispute Resolution'],
            ['LAW 4209', 'Legal Drafting (Civil and Criminal)'], ['LAW 4210', 'International Human Rights Law'], ['LAW 4211', 'Administrative Law'],
        ] as [$code, $subjectName]) {
            DB::table('tblSubject')->updateOrInsert(
                ['Code' => $code, 'SubjectName' => $subjectName, 'DepartmentID' => $lawDepartmentId],
                ['created_at' => $now, 'updated_at' => $now]
            );
        }
    }
}
