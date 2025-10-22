import React from 'react';
import type { Book } from '../fixtures/books';

type BookListProps = {
  books: Book[];
};

export const BookList: React.FC<BookListProps> = ({ books }) => {
  return (
    <dl>
      {books.map((book) => (
        <React.Fragment key={book.isbn}>
          <dt>
            {book.title} ({book.price}円)
          </dt>
          <dd>{book.summary}</dd>
        </React.Fragment>
      ))}
    </dl>
  );
};
