import { useState } from 'react';

type Form = {
  name: string;
  age: number;
};

export const StateForm: React.FC = () => {
  const [form, setForm] = useState<Form>({
    name: 'Alice',
    age: 20,
  });

  const handleForm = (e: React.ChangeEvent<HTMLInputElement>) => {
    setForm({
      ...form,
      [e.target.name]: e.target.value,
    });
  };

  const show = () => {
    console.log(`名前: ${form.name}, 年齢: ${form.age}`);
  };

  return (
    <form>
      <div>
        <label htmlFor='name'>名前：</label>
        <input
          id='name'
          name='name'
          type='text'
          onChange={handleForm}
          value={form.name}
        />
      </div>
      <div>
        <label htmlFor='age'>年齢：</label>
        <input
          id='age'
          name='age'
          type='text'
          onChange={handleForm}
          value={form.age}
        />
      </div>
      <div>
        <button type='button' onClick={show}>
          表示
        </button>
      </div>
      <p>
        こんにちは、{form.name}さん！あなたは{form.age}歳です。
      </p>
    </form>
  );
};
