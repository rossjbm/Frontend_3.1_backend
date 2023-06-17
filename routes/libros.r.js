var express = require('express');
var router = express.Router();

const librosControllers = require("../controllers/libros.c")

router.get('/', function(req, res, next) {
    librosControllers.listar()
    .then((resultado) =>{
        res.status(200).send(resultado);
    })
    .catch ((err) => {
        res.status(404).render('error'); //mientras tanto voy a tener le error en ejs
    })
});
  
module.exports = router;
