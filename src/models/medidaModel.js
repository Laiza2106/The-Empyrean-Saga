var database = require("../database/config");

function buscarkpis() {

    var instrucaoSql = `SELECT 
    (SELECT COUNT(*) FROM Usuario) AS Total_Usuarios,
    l.Nome AS Livro_Mais_Avaliado,
    round(AVG(r.fkAvaliacao_Livro)) AS Media_Avaliacoes,
    COUNT(r.fkLivro) AS Quantidade_Avaliacoes
    FROM Livro as l
    JOIN Registro as r 
    ON l.idLivro = r.fkLivro
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
    FROM Livro as l
    LEFT JOIN Registro as r ON l.idLivro = r.fkLivro
    GROUP BY l.Nome
    ORDER BY Quantidade_Avaliacoes DESC;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarkpis,
    buscargrafico
}
