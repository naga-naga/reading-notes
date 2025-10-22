import { useState } from 'react';

type StateBasicProps = {
  initialCount: number;
};

export const StateBasic = ({ initialCount }: StateBasicProps) => {
  const [count, setCount] = useState(initialCount);
  const [doubleCount, setDoubleCount] = useState(initialCount * 2);

  const handleClick = () => {
    setCount(count => count + 1);
    setCount(count => count + 1);
  };
  const handleDouble = () => {
    setDoubleCount(doubleCount => doubleCount + 2);
  };

  return (
    <>
      <button onClick={handleClick}>カウント: {count}</button>
      <button onClick={handleDouble}>x2 カウント: {doubleCount}</button>
    </>
  );
};
