import { useState } from 'react';
import './App.css';
import reactLogo from './assets/react.svg';
import { BookList } from './components/BookList';
import { EventBasic } from './components/EventBasic';
import { EventKey } from './components/EventKey';
import { EventMouse } from './components/EventMouse';
import { EventOnce } from './components/EventOnce';
import { EventPropagation } from './components/EventPropagation';
import { FormFile } from './components/FormFile';
import { MyHello } from './components/MyHello';
import { StateBasic } from './components/StateBasic';
import { StateForm } from './components/StateForm';
import { StateParent } from './components/StateParent';
import { books } from './fixtures/books';
import viteLogo from '/vite.svg';
import { FormBasic } from './components/FormBasic';

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
      <StateForm />
      <FormFile />
      <FormBasic />
    </>
  );
}

export default App;
