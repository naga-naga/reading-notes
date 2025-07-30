const map = <T, U>(array: T[], callback: (item: T) => U): U[] => {
  return array.map(callback);
}

const data = [1, 3, 9, 23, 8];

console.log(map(data, item => item * 3));
