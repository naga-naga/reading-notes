import { useState } from 'react';

export const EventOnce: React.FC = () => {
  const [clicked, setClicked] = useState(false);
  const [result, setResult] = useState('-');

  const handleClick = () => {
    if (!clicked) {
      setResult(Math.floor(Math.random() * 100 + 1).toString());
      setClicked(true);
    }
  };

  return (
    <>
      <button onClick={handleClick}>今日の運勢を占う</button>
      <p>今日の運勢は{result}点です</p>
    </>
  );
};
