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

// subtype
type FooBar = {
  foo: string;
  bar: number;
};
type FooBarBaz = {
  foo: string;
  bar: number;
  baz: boolean;
};
const fooBarBazObj: FooBarBaz = {
  foo: 'hello',
  bar: 42,
  baz: true,
};
const fooBarObj: FooBar = fooBarBazObj; // コンパイルエラーは出ない

// 余剰プロパティ
type User2 = {
  name: string;
  age: number;
};
const user2_1: User2 = {
  name: 'Alice',
  age: 30,
  // email: '', // リテラルの代入時は余剰プロパティはエラー
};
const user2_obj = {
  name: 'Alice',
  age: 30,
  email: ''
};
const user2_2: User2 = user2_obj; // 変数に入れて渡すと余剰プロパティチェックはされない

// 型引数
type List<T> = {
  items: T[];
};
type Family<Parent, Child> = { // 2文字以上も可
  mother: Parent;
  father: Parent;
  children: Child[];
};

// extends
type HasName = {
  name: string;
};
type Family2<Parent extends HasName, Child extends HasName> = {
  mother: Parent;
  father: Parent;
  children: Child[];
};
// type T = Family2<number, string>; // number は HasName を満たさないのでエラー
// type T = Family2<User2, User2>; // User2 は HasName を満たすのでOK
type Animal2 = {
  name: string;
};
type Human2 = {
  name: string;
  age: number;
};
// type T = Family2<Animal2, Human2>; // Animal2 は HasName を満たすのでOK

// オプショナルな型引数
type List2<T, U = string> = {
  items: T[];
  description: U; // オプショナルな型引数
};
// type T = List2<number>; // U は string になる

// 配列
const arr1 = [1, 'foo', true];
console.log(arr1['1']); // コンパイルエラーになると本には書いてあるが、出力される🤔？
const arr2: string[] = ['a', 'b', 'c'];
const arr3: (number | { name: string })[] = [{ name: 'Alice' }, { name: 'Bob' }, 1]; // こんな書き方もできる
const readonlyArray: readonly string[] = ['x', 'y', 'z']; // readonly
console.log(readonlyArray.includes('x'));

for (const item of arr1) {
  console.log(item);
}

// タプル
const tuple: [number, string, boolean] = [1, 'foo', true]; // タプル型

// 分割代入
const { foo, bar: barVar, baz } = { foo: 'hello', bar: 42, baz: true }; // 別名を付けられる
console.log(foo, barVar, baz);

const { foo2, bar2: { baz2 } } = { foo2: 'world', bar2: { baz2: 100 } }; // ネストしたオブジェクトも分割代入できる
const [foo3, , bar3, , , baz3] = ['a', 'b', 'c', 'd', 'e', 'f']; // 配列の分割代入も可能。変数を書かないと飛ばせる。
const { foo4 = 'default', bar4 = 42 } = { foo4: 'custom', bar4: null }; // null の時はデフォルト値は使われない
console.log(foo4, bar4);

// 分割代入の複雑な例
type NestedObj = {
  obj?: {
    foo: number;
  }
};
const nested1: NestedObj = { obj: { foo: 42 } };
const nested2: NestedObj = {};
const { obj: { foo: fooFromNested1 } = { foo: 500 } } = nested1;
const { obj: { foo: fooFromNested2 } = { foo: 500 } } = nested2;
console.log(fooFromNested1, fooFromNested2);

// rest
const [first, second, ...rest] = ['a', 'b', 'c', 'd', 'e'];
console.log(first, second, rest);

// Map
const map1: Map<string, number> = new Map();
map1.set('apple', 100);

// WeakMap
const weakMap1: WeakMap<object, number> = new WeakMap();
weakMap1.set({ name: 'Alice' }, 100);
console.log(weakMap1.get({ name: 'Alice' })); // キーの参照が他にないのでガベージコレクトされて undefined

const objForWeakMap = { name: 'Alice' };
weakMap1.set(objForWeakMap, 100);
console.log(weakMap1.get(objForWeakMap));

// 部分型の仕組みにより、これらはコンパイルエラーにならない
const val1: {} = 1;
const val2: {} = 'foo';
