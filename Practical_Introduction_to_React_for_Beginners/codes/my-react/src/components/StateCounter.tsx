import type React from 'react';

type StateCounterProps = {
  step: number;
  onUpdate: (step: number) => void;
};

export const StateCounter: React.FC<StateCounterProps> = ({
  step,
  onUpdate,
}) => {
  const handleClick = () => onUpdate(step);

  return (
    <button onClick={handleClick}>
      <span>{step}</span>
    </button>
  );
};
