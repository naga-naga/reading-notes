import { useState } from 'react';
import './App.css';
import reactLogo from './assets/react.svg';
import { MyHello } from './components/MyHello';
import viteLogo from '/vite.svg';
import { EventBasic } from './components/EventBasic';
import { StateBasic } from './components/StateBasic';
import { BookList } from './components/BookList';
import { books } from './fixtures/books';
import { StateParent } from './components/StateParent';
import { EventMouse } from './components/EventMouse';
import { EventKey } from './components/EventKey';
import { EventPropagation } from './components/EventPropagation';
import { EventOnce } from './components/EventOnce';

function App() {
  const [count, setCount] = useState(0);

  return (
    <>
      <div>
        <a href='https://vite.dev' target='_blank'>
          <img src={viteLogo} className='logo' alt='Vite logo' />
        </a>
        <a href='https://react.dev' target='_blank'>
          <img src={reactLogo} className='logo react' alt='React logo' />
        </a>
      </div>
      <h1>Vite + React</h1>
      <div className='card'>
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <p>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      <p className='read-the-docs'>
        Click on the Vite and React logos to learn more
      </p>
      <MyHello name='たろう' />
      <EventBasic type='foo' />
      <StateBasic initialCount={10} />
      <BookList books={books} />
      <StateParent />
      <EventMouse before='マウスが離れています' after='マウスが乗っています' />
      <EventKey />
      <EventPropagation />
      <EventOnce />
    </>
  );
}

export default App;
