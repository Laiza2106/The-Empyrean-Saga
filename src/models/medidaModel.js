var database = require("../database/config");

function buscarkpis() {

    var instrucaoSql = `SELECT 
    (SELECT COUNT(*) FROM usuario) AS Total_Usuarios,
    l.Nome AS Livro_Mais_Avaliado,
    ROUND(AVG(a.Nota), 2) AS Media_Avaliacoes,
    COUNT(a.fkLivro) AS Quantidade_Avaliacoes
    FROM livro as l
    LEFT JOIN avaliacao as a 
    ON l.idLivro = a.fkLivro
    GROUP BY l.Nome
    ORDER BY Quantidade_Avaliacoes DESC
    LIMIT 1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscargrafico() {

    var instrucaoSql = `SELECT 
    l.Nome AS Livro,
    COUNT(a.fkLivro) AS Quantidade_Avaliacoes
    FROM livro as l
    LEFT JOIN avaliacao as a 
    ON l.idLivro = a.fkLivro
    GROUP BY l.Nome
    ORDER BY Quantidade_Avaliacoes DESC;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarestrela(nota, descricao, fkUsuario, fkLivro) {
    console.log("INSERI NOTA NA AVALIACAO \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function avaliar():", nota, descricao, fkUsuario, fkLivro);

    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO avaliacao (Nota, Descricao, fkUsuario, fkLivro) VALUES ('${nota}', '${descricao}', ${fkUsuario}, ${fkLivro});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarkpis,
    buscargrafico,
    buscarestrela
}
