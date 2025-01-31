var database = require("../database/config");

function buscarkpis() {

    // O novo select para as KPI's da dashboard onde apresenta o valor em percentual dos livros com avaliações positivas e mostra o ranking do livro com mais avaliação positiva para o que menos tem 02/01/2025

    // foi atualizado novamente o select para melhor desempenho da KPI de Ranking, porém a chances de alterações futuramente 08/01

    // O novo select funciona nomalmente para as KPI's porém o gráfico não aparece no site então este ultimo sera revisado

    var instrucaoSql = `select L.idLivro, L.Nome as "Nome do Livro",
    round((count(case when A.Nota >= 4 then 1 end) * 100.0) / count(A.idAvaliacao), 2) as "Percentual_de_Avaliações_Positivas",
    concat(row_number() over (order by count(case when A.Nota >= 4 then 1 end) desc), '° ', L.Nome) as "Ranking",
    count(case when A.Nota >= 4 then 1 end) as "Avaliações Positivas dos livros",
    count(A.idAvaliacao) as "Total de Avaliações"
    from livro as L
    left join avaliacao as A
    on L.idLivro = A.fkLivro
    group by L.idLivro, L.Nome
    order by "Avaliações Positivas dos livros" desc;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscargrafico() {

    var instrucaoSql = `SELECT l.Nome AS livro,
    COUNT(a.idAvaliacao) AS TotalAvaliacoes,
    SUM(CASE WHEN a.Nota >= 4 THEN 1 ELSE 0 END) AS AvaliacoesPositivas
    FROM livro as l
    LEFT JOIN avaliacao as a 
    ON l.idLivro = a.fkLivro
    GROUP BY l.Nome;`;

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
