import { useState } from 'react';

type EventMouseProps = {
  before: string;
  after: string;
};

export const EventMouse: React.FC<EventMouseProps> = ({ before, after }) => {
  const [current, setCurrent] = useState(before);

  const handleMouseEnter = () => setCurrent(after);
  const handleMouseLeave = () => setCurrent(before);

  return (
    <p onMouseEnter={handleMouseEnter} onMouseLeave={handleMouseLeave}>
      {current}
    </p>
  );
};
