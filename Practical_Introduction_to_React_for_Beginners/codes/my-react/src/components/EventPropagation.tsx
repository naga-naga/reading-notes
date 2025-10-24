import type React from 'react';

export const EventPropagation: React.FC = () => {
  const handleParentClick = () => console.log('#parent clicked');
  const handleMyClick = () => console.log('#my clicked');
  const handleChildClick = () => console.log('#child clicked');

  return (
    <div id='parent' onClick={handleParentClick} onClickCapture={handleParentClick}>
      親要素
      <div id='my' onClick={handleMyClick} onClickCapture={handleMyClick}>
        自分要素
        <div id='child' onClick={handleChildClick} onClickCapture={handleChildClick}>
          子要素
        </div>
      </div>
    </div>
  );
};
