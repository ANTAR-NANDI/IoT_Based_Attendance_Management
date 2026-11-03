import fs from 'node:fs/promises';

const text = await fs.readFile('database/seeders/RosterPersonSeeder.php', 'utf8');
const shortNamesMatch = text.match(/\$shortNames\s*=\s*(\{?[\s\S]*?\]);\n\s*\$employeePasswords/);
const mapBody = shortNamesMatch?.[1] ?? '';
const shortNames = Object.fromEntries([...mapBody.matchAll(/'([^']+)'\s*=>\s*'([^']+)'/g)].map(match => [match[1], match[2]]));
const people = [...text.matchAll(/\['([^']*)',\s*'([^']*)',\s*'([^']*)',\s*'([^']*)',\s*(true|false)(?:,\s*'([^']*)')?\]/g)]
  .map(match => ({ code: match[1], name: match[2], designation: match[3], department: match[4], active: match[5] === 'true', shortName: shortNames[match[1]] ?? match[6] ?? '' }))
  .filter(person => person.active)
  .sort((a, b) => a.name.localeCompare(b.name));
await fs.writeFile('tmp/seed-teachers.json', JSON.stringify(people, null, 2));
console.log(`Prepared ${people.length} active teacher/staff records.`);
