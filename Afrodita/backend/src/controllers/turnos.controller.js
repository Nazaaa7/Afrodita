const { getDbConnection } = require('../db/db.js');

// Función para crear un turno
const createTurno = async (req, res) => {
    const { fecha, hora, idPersonal, idServicio } = req.body;

    try {
        const connection = await getDbConnection();
        await connection.query(
            'INSERT INTO turnos ( fecha, hora, idPersonal, idServicio) VALUES (?, ?, ?, ?)',
            [ fecha, hora, idPersonal, idServicio]
        );

        await connection.end();
        res.sendStatus(201); // Respuesta de éxito
    } catch (error) {
        console.error('Error:', error);
        res.status(500).send('Error al crear turno'); // Respuesta de error
    }
};

// Función para obtener todos los turnos
const getAllTurnos = async (req, res) => {
    try {
        const connection = await getDbConnection();
        const [results] = await connection.query('SELECT * FROM turnos');
        res.json(results);
        await connection.end();
    } catch (err) {
        console.error(err);
        res.status(500).send('Error al obtener los turnos');
    }
};

// Función para obtener un turno por su ID
const getTurnoById = async (req, res) => {
    const { id } = req.params;
    try {
        const connection = await getDbConnection();
        const [results] = await connection.query('SELECT * FROM turnos WHERE id = ?', [id]);
        if (results.length > 0) {
            res.json(results[0]);
        } else {
            res.status(404).send('Turno no encontrado');
        }
        await connection.end();
    } catch (err) {
        console.error(err);
        res.status(500).send('Error al obtener el turno');
    }
};

// Función para actualizar un turno por su ID
const updateTurno = async (req, res) => {
    const { id } = req.params;
    const {  fecha, hora, idPersonal, idServicio } = req.body;

    try {
        const connection = await getDbConnection();
        await connection.query(
            'UPDATE turnos SET usuario = ?, fecha = ?, hora = ?, idPersonal = ?, idServicio = ? WHERE id = ?',
            [ fecha, hora, idPersonal, idServicio, id]
        );
        res.sendStatus(200);
        await connection.end();
    } catch (err) {
        console.error(err);
        res.status(500).send('Error al actualizar el turno');
    }
};

// Función para eliminar un turno por su ID
const deleteTurno = async (req, res) => {
    const { id } = req.params;
    try {
        const connection = await getDbConnection();
        await connection.query('DELETE FROM turnos WHERE id = ?', [id]);
        res.sendStatus(200);
        await connection.end();
    } catch (err) {
        console.error(err);
        res.status(500).send('Error al eliminar el turno');
    }
};

module.exports = {
    createTurno,
    getAllTurnos,
    getTurnoById,
    updateTurno,
    deleteTurno
};
