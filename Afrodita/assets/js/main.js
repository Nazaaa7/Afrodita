const express = require("express");
const app =express()

const {newConnection} = require("./app.js")

app.use(express.json())



// app.get("/tablas", async (req, res) =>{
//     const conexion =  await newConnection()

//     const results = await conexion.query(`SELECT *  FROM tabla1`);

//     res.json(results[0]);

//     conexion.end()//siempre terminar la funcion 
// });

// app.getOne("/tablas/:id", async (req, res) =>{
//     const conexion =  await newConnection()
//     const id = req.params.id
//     const results = await conexion.query(`SELECT *  FROM tabla1 where idTabla = ?`, id);

//     res.json(results[0]);

//     conexion.end()//siempre terminar la funcion 
// });



// app.delete("/tablas/:id", async (req, res) =>{
//     const conexion =  await newConnection()
//     const id = req.params.id
//     const results = await conexion.query(`DELETE  FROM tabla1 where idTabla = ?`, id);

//     res.send("Tarea Eliminada")

//     conexion.end()//siempre terminar la funcion 
// });

app.post("/tablas", async (req, res)=>{
    console.log(req.body)
    const conexion = await newConnection()
    const { descripcion } = req.body
    conexion.query('INSERT INTO tabla1 (descripcion) values (?)', [descripcion]);
    res.json({descripcion});
    conexion.end()//siempre terminar la funcion 
    
});


// app.put("/tablas/:id", async (req, res) => {
//     const conexion = await newConnection();

//     try {
//         const id = req.params.id;
//         const { descripcion } = req.body;

//         // Corrección en la llamada al método 'query' para usar el array de parámetros
//         const results = await conexion.query('UPDATE tabla1 SET descripcion = ? WHERE idTabla = ?', [descripcion, id]);

//         res.send("Tarea actualizada");
//     } catch (error) {
//         console.error(error);
//         res.status(500).send("Error actualizando la tarea");
//     } finally {
//        conexion.end(); // Asegurarse de cerrar la conexión en cualquier caso
//     }
// });


app.listen(4000)
console.log("servidor iniciado")