// const express = require('express');
// const cors = require('cors');
// const morgan = require('morgan');
// const path = require('path');
// const personalController = require('./backend/src/controllers/personal.controller');
// const turnosController = require('./backend/src/controllers/turnos.controller');
// // const detalleTurnosController = require('./controllers/detalle_turnos.controller');

// const app = express();
// const port = 3000;

// app.use(cors());
// app.use(morgan('dev'));
// app.use(express.json());
// app.use(express.urlencoded({ extended: true }));
// app.use('/assets', express.static(path.join(__dirname, 'client/assets')));

// // Rutas CRUD para personal
// app.post('/personal', personalController.createPersonal);
// app.get('/personal', personalController.getAllPersonal);
// app.get('/personal/:id', personalController.getPersonalById);
// app.put('/personal/:id', personalController.updatePersonal);
// app.delete('/personal/:id', personalController.deletePersonal);


//   //Rutas CRUD para turnos
//  app.post('/turnos', turnosController.createTurno);
//  app.get('/turnos', turnosController.getAllTurnos);
//  app.get('/turnos/:id', turnosController.getTurnoById);
//  app.put('/turnos/:id', turnosController.updateTurno);
//  app.delete('/turnos/:id', turnosController.deleteTurno);


// // Ruta para servir el archivo indexAdmin.html
// app.get('/', (req, res) => {
//   res.sendFile(path.join(__dirname, 'client', 'indexAdmin.html'));
// });

// // Ruta para servir el archivo altaPersonal.html
// app.get('/personal', (req, res) => {
//   res.sendFile(path.join(__dirname, 'client', 'altaPersonal.html'));
// });

// // Ruta para servir el archivo altaTurnos.html
// app.get('/altaTurnos', (req, res) => {
//   res.sendFile(path.join(__dirname, 'client', 'altaTurnos.html'));
// });

// // Ruta para servir el archivo detalleTurnos.html
// app.get('/detalleTurnos', (req, res) => {
//   res.sendFile(path.join(__dirname, 'client', 'detalleTurnos.html'));
// });


// // // Rutas CRUD para detalle turnos
// // app.post('/detalle_turnos', detalleTurnosController.createDetalleTurno);
// // app.get('/detalle_turnos', detalleTurnosController.getAllDetalleTurnos);
// // app.get('/detalle_turnos/:id', detalleTurnosController.getDetalleTurnoById);
// // app.put('/detalle_turnos/:id', detalleTurnosController.updateDetalleTurno);
// // app.delete('/detalle_turnos/:id', detalleTurnosController.deleteDetalleTurno);

// app.listen(port, () => {
//   console.log(`Servidor corriendo en http://localhost:${port}`);
// });
const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const path = require('path');
const personalController = require('./backend/src/controllers/personal.controller');
const turnosController = require('./backend/src/controllers/turnos.controller');

const app = express();
const port = 3000;

app.use(cors());
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/assets', express.static(path.join(__dirname, 'client/assets')));

// Rutas CRUD para personal
app.post('/personal', personalController.createPersonal);
app.get('/personal', personalController.getAllPersonal);
app.get('/personal/:id', personalController.getPersonalById);
app.put('/personal/:id', personalController.updatePersonal);
app.delete('/personal/:id', personalController.deletePersonal);

// Rutas CRUD para turnos
app.post('/turnos', turnosController.createTurno);
app.get('/turnos', turnosController.getAllTurnos);
app.get('/turnos/:id', turnosController.getTurnoById);
app.put('/turnos/:id', turnosController.updateTurno);
app.delete('/turnos/:id', turnosController.deleteTurno);

// Ruta para servir el archivo indexAdmin.html
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'client', 'indexAdmin.html'));
});

// Ruta para servir el archivo altaPersonal.html
app.get('/altaPersonal', (req, res) => {
    res.sendFile(path.join(__dirname, 'client', 'altaPersonal.html'));
});

// Ruta para servir el archivo altaTurnos.html
app.get('/altaTurnos', (req, res) => {
    res.sendFile(path.join(__dirname, 'client', 'altaTurnos.html'));
});

// Ruta para servir el archivo detalleTurnos.html
app.get('/detalleTurnos', (req, res) => {
    res.sendFile(path.join(__dirname, 'client', 'detalleTurnos.html'));
});

app.listen(port, () => {
    console.log(`Servidor corriendo en http://localhost:${port}`);
});
