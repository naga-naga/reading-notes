const results: string[] = [];

for (let i: number = 0; i < 100; i++) {
  if (i % 3 === 0 && i % 5 === 0) {
    results.push('FizzBuzz');
  } else if (i % 3 === 0) {
    results.push('Fizz');
  } else if (i % 5 === 0) {
    results.push('Buzz');
  } else {
    results.push(i.toString());
  }
}

console.log(results.join(' '));
