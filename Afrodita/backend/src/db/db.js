const mysql = require('mysql2/promise');

const db = async () => {
  return await mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'afrodita01'
  });
}

async function getDbConnection() {
  const connection = await db();
  return connection;
}

module.exports = {
  getDbConnection
}
 