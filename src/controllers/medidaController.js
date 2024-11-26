var medidaModel = require("../models/medidaModel");

function buscarkpis(req, res) {

    console.log(`Recuperando as ultimas kpis`);

    medidaModel.buscarkpis().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar KPI's.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function buscargrafico(req, res) {

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscargrafico().then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar grafico.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarestrela(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nota = req.body.notaServer;
    var descricao = req.body.descricaoServer;
    var fkUsuario = req.body.fkUsuarioServer;
    var fkLivro = req.body.fkLivroServer;

    medidaModel.buscarestrela(nota, descricao, fkUsuario, fkLivro)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao inserir nota estrela! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );

}

module.exports = {
    buscarkpis,
    buscargrafico,
    buscarestrela
}