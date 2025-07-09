const message: string = 'Hello, World!';
console.log(message);

// 数値
console.log(9007199254740993); // 2^53 + 1 なので正確に表せない
console.log(9007199254740993n); // bigint なので表現できる
console.log(0.1 + 0.2); // 計算誤差

// 型の変換
console.log(Number('123'));
console.log(Number(true));
console.log(Number('foo'));
// console.log(BigInt('foo')); // 死ぬ
console.log(+'123'); // + でも変換できる
