export type Book = {
  isbn: string;
  title: string;
  price: number;
  summary: string;
  download: boolean;
};

export const books: Book[] = [
  {
    isbn: '978-4-7981-6212-4',
    title: 'React実践入門',
    price: 3480,
    summary: 'Reactの基礎から実践的なアプリケーション開発までを解説した一冊です。',
    download: true,
  },
  {
    isbn: '978-4-7981-6213-1',
    title: 'TypeScript入門',
    price: 2980,
    summary: 'TypeScriptの基本的な使い方と応用技術を学べる入門書です。',
    download: false,
  },
  {
    isbn: '978-4-7981-6214-8',
    title: 'JavaScriptデザインパターン',
    price: 3980,
    summary: 'JavaScriptで使えるデザインパターンを豊富な例とともに紹介しています。',
    download: true,
  },
  {
    isbn: '978-4-7981-6215-5',
    title: 'フロントエンド開発の基礎',
    price: 3200,
    summary: 'HTML、CSS、JavaScriptを使ったフロントエンド開発の基礎を解説します。',
    download: false,
  },
];
