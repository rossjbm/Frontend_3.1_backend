var express = require('express');
var router = express.Router();

const resenasControllers = require("../controllers/resenas.c")

router.get('/', function(req, res, next) {
    resenasControllers.listar()
    .then((resultado) =>{
        res.status(200).send(resultado);
    })
    .catch ((err) => {
        res.status(404).render('error');
    })
});
  
module.exports = router;