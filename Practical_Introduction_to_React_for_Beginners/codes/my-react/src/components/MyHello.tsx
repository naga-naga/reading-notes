type MyHelloProps = {
  name: string;
};

export const MyHello = ({ name }: MyHelloProps) => {
  return <div>こんにちは、{name}さん</div>;
};
