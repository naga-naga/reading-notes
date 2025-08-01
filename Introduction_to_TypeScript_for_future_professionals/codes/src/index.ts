{
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

  // 関数
  console.log(range(1, 5)); // 巻き上げられるので、ここより後に定義された関数も呼び出せる

  function range(start: number, end: number): number[] {
    const result: number[] = [];
    for (let i = start; i <= end; i++) {
      result.push(i);
    }
    return result;
  }

  // 関数式
  type Human = {
    height: number;
    weight: number;
  };
  const calculateBMI = function ({ height, weight }: Human): number {
    return weight / height ** 2;
  };
  console.log(calculateBMI({ height: 1.66, weight: 60 }));

  // アロー関数
  const calculateBMI2 = ({ height, weight }: Human): number => weight / height ** 2;
  const calculateBMI3 = ({ height, weight }: Human): number => { return weight / height ** 2; }; // 中括弧を使うと return が必要
  const calculateBMI4 = ({ height, weight }: Human) => ({ bmi: weight / height ** 2 }); // オブジェクトを返す場合は () で囲む

  // オブジェクト内の関数
  const objWithMethod = {
    double1(num: number): number {
      return num * 2;
    },
    double2: (num: number): number => num * 2,
  };

  // 可変長引数
  const sumArray = (...args: number[]): number => {
    return args.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
  };
  console.log(sumArray(...[123, 456, 789, 1000])); // スプレッド構文

  // オプショナル引数
  const optionalArgs = (a: number, b?: number, c: number = 10): number => {
    return a + (b ?? 0) + c;
  };
  console.log(optionalArgs(1));

  // 関数型
  type F1 = (repeatNum: number) => string;
  const xRepeat: F1 = (num: number): string => 'x'.repeat(num);
  console.log(xRepeat(5));

  // コールシグネチャ
  // 関数にプロパティを持たせることができる
  type MyFunc = {
    isUsed?: boolean;
    (arg: number): void;
  };
  const double1: MyFunc = (arg: number) => {
    console.log(arg * 2);
  }
  double1.isUsed = true;
  console.log(double1.isUsed);
  double1(100);
}

// 部分型
{
  type HasName = {
    name: string;
  };
  type HasNameAndAge = {
    name: string;
    age: number;
  };

  // 返り値の型による部分型
  const fromAge = (age: number): HasNameAndAge => ({
    name: 'John Smith',
    age,
  });

  const f: (age: number) => HasName = fromAge;
  const obj: HasName = f(100);

  // 引数の型による部分型
  const showName = (obj: HasName) => {
    console.log(obj.name);
  };
  const g: (obj: HasNameAndAge) => void = showName;

  g({ name: 'Alice', age: 30 });
}

// readonly の部分型
{
  const sum: (numbers: readonly number[]) => number = (numbers) => {
    return numbers.reduce((acc, num) => acc + num, 0);
  };

  const numbers1: readonly number[] = [1, 10, 100];
  const numbers2: number[] = [2, 20, 200];

  // numbers[] は readonly number[] の部分型
  console.log(sum(numbers1));
  console.log(sum(numbers2));
}

// ジェネリクス
{
  const repeat = <T>(value: T, times: number): T[] => {
    const result: T[] = [];
    for (let i = 0; i < times; i++) {
      result.push(value);
    }
    return result;
  }
  console.log(repeat<string>('Hello', 3));
  console.log(repeat<number>(42, 5));
  console.log(repeat(null, 2));

  const pair = <Left, Right>(left: Left, right: Right): [Left, Right] => [left, right];
  console.log(pair<string, number>('Alice', 30));
}

// クラス
{
  class User {
    static adminName: string = 'admin';
    static getAdminUser(): User {
      return new User(User.adminName, 0);
    }

    name: string;
    age: number;
    nickname?: string; // オプショナルなプロパティも宣言可能

    constructor(name: string = '', age: number = 0, nickname?: string) {
      this.name = name;
      this.age = age;
      if (nickname) {
        this.nickname = nickname;
      }
    }

    isAdult(): boolean {
      return this.age >= 18;
    }
  }

  const user1 = new User();
  console.log('user1 :>> ', user1);

  const object1 = {
    cl: User,
  };
  const user2 = new object1.cl();
  console.log('user2 :>> ', user2);

  const user3 = new User('Alice', 20, 'Ally');
  console.log('user3 :>> ', user3);

  console.log('User.getAdminUser() :>> ', User.getAdminUser());

  class User2 {
    // フィールド宣言とコンストラクタをまとめられる
    constructor(public name: string, public age: number) { }
  }

  console.log("new User2('Bob', 30) :>> ", new User2('Bob', 30));

  // クラス式
  const User3 = class {
    constructor(public name: string, private age: number) { }

    isAdult(): boolean {
      return this.age >= 18;
    }
  };

  console.log('new User3("Charlie", 25) :>> ', new User3("Charlie", 25));

  class User4 {
    static {
      console.log('User4 static block executed'); // クラスの静的ブロック
    }

    private _name: string;
    #age: number; // ECMAScript 由来の private フィールド

    constructor(name: string, age: number) {
      this._name = name;
      this.#age = age;
    }

    introduce(): string {
      return `My name is ${this._name} and I am ${this.#age} years old.`;
    }
  }

  const user4 = new User4("Dave", 40);
  console.log('user4 :>> ', user4);
  console.log('user4.introduce() :>> ', user4.introduce());

  class User5<T> {
    constructor(public name: string, public age: number, public data: T) { }
  }

  console.log('new User5("Eve", 35, { hobbies: ["reading", "gaming"] }) :>> ', new User5("Eve", 35, { hobbies: ["reading", "gaming"] }));
}

