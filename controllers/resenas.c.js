const resenasModels = require("../models/resenas.m")

class resenasControllers {
    listar() {
        return new Promise((resolve, reject) => {
            resenasModels.listar()
            .then((resultado) => { 
                if (resultado.length == 0) { 
                  return resolve('no hay reseñas registradas') 
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