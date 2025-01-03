var database = require("../database/config");

function buscarkpis() {

    // O novo select para as KPI's da dashboard onde apresenta o valor em percentual dos livros com avaliações positivas e mostra o ranking do livro com mais avaliação positiva para o que menos tem 02/01/2025

    var instrucaoSql = `SELECT 
    l.Nome as titulo_livro,
    COUNT(a.idAvaliacao) as total_avaliacoes,
    COUNT(CASE WHEN a.Nota >= 4 THEN 1 END) as avaliacoes_positivas,
    CONCAT(ROUND((COUNT(CASE WHEN a.Nota >= 4 THEN 1 END) * 100.0) / COUNT(a.idAvaliacao), 2), '%') as percentual_positivas,
    CONCAT(DENSE_RANK() OVER (ORDER BY COUNT(CASE WHEN a.Nota >= 4 THEN 1 END) DESC), '°') as ranking
    FROM livro as l
    LEFT JOIN avaliacao as a
    ON l.idLivro = a.fkLivro
    GROUP BY l.Nome, l.idLivro
    ORDER BY ranking
    LIMIT 3;`;

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
