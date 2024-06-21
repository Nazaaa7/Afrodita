const mysql = require("mysql2/promise"); //importar la libreria 

const newConnection = async () =>{//funcion asincrona para poder usar el await.
    //el await solo se pude usar con el async o con el import (en la libreria)
    const conexion = await mysql.createConnection({//no te olvides del await 
        host: "localhost", 
        user:"root",
        database: "afrodita", //nombre bd 
        password: ""//no exige la contraseña
    })

//     const [results, fields]= await conexion.query(`INSERT INTO tabla1 (descripcion) values ('holaaaaa')`);

//     console.log(results);
//     conexion.end()
// }

return conexion
}

module.exports = {newConnection}