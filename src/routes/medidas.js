var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/kpis", function (req, res) {
    medidaController.buscarkpis(req, res);
});

router.get("/grafico", function (req, res) {
    medidaController.buscargrafico(req, res);
});

router.post("/estrela", function (req, res){
    medidaController.buscarestrela(req, res);
});

module.exports = router;