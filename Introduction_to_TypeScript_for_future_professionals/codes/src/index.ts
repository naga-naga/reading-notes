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

// オブジェクト
const username = 'Alice';
const propName = 'age';
const user = {
  username, // 省略記法
  '🫠': 'melt', // 文字列プロパティ
  [propName]: 20, // 動的プロパティ
}
console.log(user);

const user2 = {
  // username: 'Bob', // これは上書きされるのでエラーになる
  ...user, // スプレッド構文
  email: '',
}
console.log(user2);

// オブジェクトの型
const obj: {
  username: string;
  age: number;
} = {
  username: 'Alice',
  age: 20,
  // age: true, // エラー
};

// 型に名前を付ける
type User = {
  readonly id: number;
  username: string;
  age: number;
  email?: string; // string | undefined
};
const user3: User = {
  id: 1,
  username: 'Charlie',
  age: 25,
}
console.log(user3.email?.toUpperCase()); // undefined の場合があるので ?. でアクセス
// user3.id = 2; // readonly なのでエラー

// インデックスシグネチャ
type PriceData = {
  [key: string]: number; // 任意の文字列キーの型が number
};
const data: PriceData = {
  apple: 100,
  banana: 200,
  // orange: '300', // エラー
};

// typeof
const commands = ['start', 'stop', 'pause'] as const;
type Command = typeof commands[number];
