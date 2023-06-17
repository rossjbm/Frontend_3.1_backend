const librosModels = require("../models/libros.m")

class librosControllers {
    listar() {
        return new Promise((resolve, reject) => {
            librosModels.listar()
            .then((resultado) => { 
                if (resultado.length == 0) { 
                  return resolve('Por ahora no hay libros registrados :)') 
                }
                resolve (resultado) 
              })
              .catch((err) => { 
                reject (err)
              }) 
        })
    }
}

module.exports = new librosControllers();