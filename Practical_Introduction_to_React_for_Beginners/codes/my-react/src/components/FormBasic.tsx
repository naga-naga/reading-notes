import { useForm } from 'react-hook-form';

export const FormBasic: React.FC = () => {
  const defaultValues = {
    name: '名無しさん',
    email: 'admin@example.com',
    gender: 'male',
    memo: '',
  };

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({ defaultValues});

  const onSubmit = (data: unknown) => {
    console.log(data);
  };

  const onError = (error: unknown) => {
    console.log(error);
  };

  return (
    <form onSubmit={handleSubmit(onSubmit, onError)} noValidate>
      <div>
        <label htmlFor='name'>名前：</label>
        <br />
        <input
          id='name'
          type='text'
          {...register('name', {
            required: '名前は必須です',
            maxLength: { value: 20, message: '20文字以内で入力してください' },
          })}
        />
        <div>{errors.name?.message}</div>
      </div>
      <div>
        <label htmlFor='gender'>性別：</label>
        <br />
        <label>
          <input
            type='radio'
            value='male'
            {...register('gender', { required: '性別は必須です' })}
          />
          男性
        </label>
        <label>
          <input
            type='radio'
            value='female'
            {...register('gender', { required: '性別は必須です' })}
          />
          女性
        </label>
        <div>{errors.gender?.message}</div>
      </div>
      <div>
        <label htmlFor='email'>メールアドレス：</label>
        <br />
        <input
          id='email'
          type='email'
          {...register('email', {
            required: 'メールアドレスは必須です',
            pattern: {
              value: /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/i,
              message: 'メールアドレスの形式で入力してください',
            },
          })}
        />
        <div>{errors.email?.message}</div>
      </div>
      <div>
        <label htmlFor='memo'>備考：</label>
        <br />
        <textarea
          id='memo'
          {...register('memo', {
            required: '備考は必須です',
            maxLength: { value: 200, message: '200文字以内で入力してください' },
          })}
        />
        <div>{errors.memo?.message}</div>
      </div>
      <div>
        <button type='submit'>送信</button>
      </div>
    </form>
  );
};
