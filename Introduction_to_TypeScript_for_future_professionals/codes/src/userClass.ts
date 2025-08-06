{
  class User {
    name: string;
    age: number;

    constructor(name: string, age: number) {
      if (name === '') {
        throw new Error('Name cannot be empty');
      }

      this.name = name;
      this.age = age;
    }

    getMessage(message: string): string {
      return `${this.name} (${this.age}) says: "${message}"`;
    }
  }

  const user = new User('Alice', 20);
  console.log(user.getMessage('Hello, TypeScript!'));
}
