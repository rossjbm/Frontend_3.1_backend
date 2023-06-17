const resenasModels = require("../models/resenas.m")

class resenasControllers {
    listar() {
        return new Promise((resolve, reject) => {
            resenasModels.listar()
            .then((resultado) => { 
                if (resultado.length == 0) { 
                  return resolve('Por ahora no hay resenas registrados :)') 
                }
                resolve (resultado) 
              })
              .catch((err) => { 
                reject (err)
              }) 
        })
    }
}

module.exports = new resenasControllers();