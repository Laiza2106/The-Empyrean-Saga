var database = require("../database/config");

function buscarkpis() {

    var instrucaoSql = `SELECT 
    (SELECT COUNT(*) FROM Usuario) AS Total_Usuarios,
    l.Nome AS Livro_Mais_Avaliado,
    COUNT(r.fkLivro) AS Quantidade_Avaliacoes
    FROM Livro l
    JOIN Registro r ON l.idLivro = r.fkLivro
    GROUP BY l.Nome
    ORDER BY Quantidade_Avaliacoes DESC
    LIMIT 1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscargrafico() {

    var instrucaoSql = `SELECT 
    l.Nome AS Livro,
    COUNT(r.fkLivro) AS Quantidade_Avaliacoes
    FROM Livro l
    LEFT JOIN Registro r ON l.idLivro = r.fkLivro
    GROUP BY l.Nome
    ORDER BY Quantidade_Avaliacoes DESC;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarkpis,
    buscargrafico
}
