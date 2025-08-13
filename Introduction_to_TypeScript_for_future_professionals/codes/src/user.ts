console.log('import されると最初に実行される');

// export const name = 'John Smith';
// export const age = 30;

// こうも書ける
// 実は as には予約語を使える（が、基本的には使わない方が良いだろう）
const name = 'John Smith';
const age = 30;
const getUserInfo = () => {
  return { userName: name, userAge: age };
}
export { name as userName, age as userAge, getUserInfo };
