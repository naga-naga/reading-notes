type EventBasicProps = {
  type: string;
};

export const EventBasic = ({ type }: EventBasicProps) => {
  const date = new Date();

  const current = () => {
    switch (type) {
      case 'date':
        console.log(date.toLocaleDateString());
        break;
      case 'time':
        console.log(date.toLocaleTimeString());
        break;
      default:
        console.log(date.toLocaleString());
        break;
    }
  };

  return (
    <div>
      <button onClick={current}>現在時刻を取得</button>
    </div>
  );
};
