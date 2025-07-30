const getFizzBuzzString = (num: number): string => {
  if (num % 3 === 0 && num % 5 === 0) return 'FizzBuzz';
  if (num % 3 === 0) return 'Fizz';
  if (num % 5 === 0) return 'Buzz';
  return num.toString();
}

const sequence = (start: number, end: number): number[] => {
  const result: number[] = [];
  for (let i = start; i <= end; i++) {
    result.push(i);
  }
  return result;
}

for (let i = 0; i < 100; i++) {
  console.log(getFizzBuzzString(i));
}

for (const num of sequence(1, 100)) {
  console.log(getFizzBuzzString(num));
}
