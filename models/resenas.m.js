const connection = require('../conecction/conexion')

class resenasModels {
    listar(){
        return new Promise( (resolve, reject) => {
            //La DB seleccionara todos los resena
            connection.query('SELECT * FROM `resenas`', function (error, results, fields) {
                if (error) throw error;
                resolve (results);
            });
        })
    }
}

module.exports = new resenasModels();