const connection = require('../conecction/conexion')

class librosModels {
    listar(){
        return new Promise( (resolve, reject) => {
            //La DB seleccionara todos los libros
            connection.query('SELECT * FROM `libros`', function (error, results, fields) {
                if (error) throw error;
                resolve (results);
            });
        })
    }
}

module.exports = new librosModels();