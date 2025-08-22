import fsPromises from "fs/promises";

const filepath = process.argv[2];

if (!filepath) {
  console.error("No file path provided");
  process.exit(1);
}

const regex = /foo/gm;

// const readFilePromise = fsPromises.readFile(filepath, { encoding: "utf-8" });

// readFilePromise
//   .then((data) => {
//     const matches = data.match(regex);
//     console.log(matches ? matches.length : 0);
//   })
//   .catch((error) => {
//     console.error("Error reading file:", error);
//   });

const promise = Promise.race([
  fsPromises.readFile(filepath, { encoding: "utf-8" }),
  new Promise((_, reject) => setTimeout(() => reject(new Error('Timeout!')), 1)),
  // new Promise((resolve, _) => setTimeout(() => resolve(''), 1)),
]).catch((_) => {
  return '';
});

promise.then((data) => {
  if (typeof data === 'string') {
    const matches = data.match(regex);
    console.log(matches ? matches.length : 0);
  }
}).catch((error) => {
  console.error("Error reading file:", error);
});
