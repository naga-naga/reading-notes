{
  const createUser = (name: string, age: number): (message: string) => string => {
    return (message: string): string => {
      if (name === '') {
        throw new Error('Name cannot be empty');
      }

      return `${name} (${age}) says: "${message}"`;
    };
  };

  const getMessage = createUser('Alice', 20);
  console.log(getMessage('Hello, TypeScript!'));
}