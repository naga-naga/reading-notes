import process from 'process';
import fs from 'fs';

const filepath = process.argv[2];

if (!filepath) {
  console.error('No file path provided');
  process.exit(1);
}

const regex = /foo/gm;

fs.readFile(filepath, { encoding: 'utf-8' }, (err, data) => {
  const matches = data.match(regex);
  console.log(matches ? matches.length : 0);
});
