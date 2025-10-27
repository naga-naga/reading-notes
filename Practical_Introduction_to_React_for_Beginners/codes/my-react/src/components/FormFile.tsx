import { useState } from 'react';

export const FormFile: React.FC = () => {
  const [file, setFile] = useState<File[] | null>(null);

  const handleForm = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files != null) {
      setFile(Array.from(e.target.files));
    }
  };

  const show = () => {
    if (file != null) {
      file.forEach((f) => {
        console.log(
          `ファイル名: ${f.name}, サイズ: ${f.size}バイト, タイプ: ${f.type}`
        );
      });
    }
  };

  return (
    <form>
      <input type='file' onChange={handleForm} multiple />
      <button type='button' onClick={show}>
        詳細をコンソールに表示
      </button>
    </form>
  );
};
