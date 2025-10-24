export const EventKey: React.FC = () => {
  const handleKey = (event: React.KeyboardEvent<HTMLInputElement>) => {
    if (event.key === 'Enter') {
      alert(`入力された名前: ${(event.target as HTMLInputElement).value}`);
    }
  };

  return (
    <form>
      <label>
        名前：
        <input type='text' size={20} onKeyDown={handleKey} />
      </label>
    </form>
  );
};
