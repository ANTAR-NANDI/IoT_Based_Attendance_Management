import fs from 'node:fs/promises';

const source = await fs.readFile('tmp/build_law_fall_2026_routine.mjs', 'utf8');
const rawMatch = source.match(/const raw = (\[[\s\S]*?\]);\n\nconst detailRows/);
const teachersMatch = source.match(/const teacherCodes = (\{[\s\S]*?\n\});\nconst raw/);
if (!rawMatch || !teachersMatch) throw new Error('Routine source data was not found.');
const raw = Function(`return (${rawMatch[1]})`)();
const teacherCodes = Function(`return (${teachersMatch[1]})`)();
const importRows = raw.map(([day, start, end, room, subject, shortForm, level, term, note]) => [
  day, start, end, subject, teacherCodes[shortForm] ?? shortForm, room,
  [`Level ${level}`, `Term ${term}`, shortForm !== (teacherCodes[shortForm] ?? shortForm) ? `Teacher short form: ${shortForm}` : '', note].filter(Boolean).join(' | '),
]);
await fs.writeFile('tmp/law-fall-2026-import.json', JSON.stringify(importRows));
const csvCell = value => `"${String(value ?? '').replace(/"/g, '""')}"`;
await fs.writeFile('tmp/law-fall-2026-import.csv', [['Day','In Time','Out Time','Subject Code','Teacher Code','Room Number','Remarks'], ...importRows].map(row => row.map(csvCell).join(',')).join('\r\n'));
console.log(`Extracted ${importRows.length} routine rows.`);
