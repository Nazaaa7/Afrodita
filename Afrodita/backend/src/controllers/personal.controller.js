// Ejemplo básico de implementación de controlador
const { getDbConnection } = require('../db/db.js');

const createPersonal = async (req, res) => {
    const { nombres, apellidos, dni, fecha_nac, telefono, sexo, idCargo, beneficios } = req.body;

    try {
        const connection = await getDbConnection();
        await connection.query(
            'INSERT INTO personal (`nombres`, `apellidos`, `dni`, `fecha_nac`, `telefono`, `sexo`, `idCargo`, `beneficios`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
            [nombres, apellidos, dni, fecha_nac, telefono, sexo, idCargo, beneficios]
        );
        
        await connection.end();
        res.sendStatus(201); // Respuesta de éxito
    } catch (error) {
        console.error('Error:', error);
        res.status(500).send('Error al crear registro de personal'); // Respuesta de error
    }
};



const getAllPersonal = async (req, res) => {
  try {
    const connection = await getDbConnection();
    const [results] = await connection.query('SELECT * FROM personal');
    res.json(results);
    await connection.end();
  } catch (err) {
    console.error(err);
    res.status(500).send('Failed to fetch personal records');
  }
};

const getPersonalById = async (req, res) => {
  const { id } = req.params;
  try {
    const connection = await getDbConnection();
    const [results] = await connection.query('SELECT * FROM personal WHERE id = ?', [id]);
    if (results.length > 0) {
      res.json(results[0]);
    } else {
      res.status(404).send('Personal record not found');
    }
    await connection.end();
  } catch (err) {
    console.error(err);
    res.status(500).send('Failed to fetch personal record');
  }
};

const updatePersonal = async (req, res) => {
  const { id } = req.params;
  const { nombres, apellidos, dni, fecha_nac, telefono, sexo, idCargo, beneficios } = req.body;

  try {
    const connection = await getDbConnection();
    await connection.query(
      'UPDATE personal SET nombres = ?, apellidos = ?, dni = ?, fecha_nac = ?, telefono = ?, sexo = ?, cargo = ?, beneficios = ? WHERE id = ?',
      [nombres, apellidos, dni, fecha_nac, telefono, sexo, idCargo, beneficios, id]
    );
    res.sendStatus(200);
    await connection.end();
  } catch (err) {
    console.error(err);
    res.status(500).send('Failed to update personal record');
  }
};

const deletePersonal = async (req, res) => {
  const { id } = req.params;
  try {
    const connection = await getDbConnection();
    await connection.query('DELETE FROM personal WHERE id = ?', [id]);
    res.sendStatus(200);
    await connection.end();
  } catch (err) {
    console.error(err);
    res.status(500).send('Failed to delete personal record');
  }
};

module.exports = {
  createPersonal,
  getAllPersonal,
  getPersonalById,
  updatePersonal,
  deletePersonal
};
