import React, { useState } from 'react';
import { StateCounter } from './StateCounter';

export const StateParent: React.FC = () => {
  const [count, setCount] = useState(0);

  const update = (step: number) => {
    setCount((count) => count + step);
  };

  return (
    <>
      <p>合計カウント: {count}</p>
      <StateCounter step={1} onUpdate={update} />
      <StateCounter step={5} onUpdate={update} />
      <StateCounter step={10} onUpdate={update} />
      <StateCounter step={-1} onUpdate={update} />
      <StateCounter step={-5} onUpdate={update} />
      <StateCounter step={-10} onUpdate={update} />
    </>
  );
};
