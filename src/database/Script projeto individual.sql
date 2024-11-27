use The_Empyrean;

create table usuario(
idUsuario int primary key auto_increment,
Nome varchar(45),
Email varchar(45),
Telefone char(11),
Senha varchar(45)
);

create table livro(
idLivro int primary key auto_increment,
Nome varchar(45),
dtLancamento date
);

create table avaliacao(
idAvaliacao int primary key auto_increment,
Nota int,
	constraint chkNota check (Nota in (1, 2, 3, 4, 5)),
Descricao varchar(500),
fkUsuario int,
	constraint fkUsuarioAvaliacao foreign key (fkUsuario)
			references usuario(idUsuario),
fkLivro int,
	constraint fkLivroAvaliacao foreign key (fkLivro)
			references livro(idLivro)
);

insert into usuario (Nome, Email, Telefone, Senha) values
('Laiza', 'laizatavares@gmail.com', '11993473590', 'Lol@2502'),
('Geovanna', 'geovanna@gmail.com', '1125674896', '@Ge19'),
('Amanda', 'amanda@gmail.com', 11945678765, 'Amanda123');

insert into livro (Nome, dtLancamento) values
('Quarta Asa', '2023-10-24'),
('Chama de Ferro', '2024-03-19'),
('Tempestade de Ônix', '2025-01-22');

insert into avaliacao (Nota, descricao, fkUsuario, fkLivro) values
(5, 'Perfeito!', 1, 1),
(4, 'Plot twist...', 1, 2),
(5, 'Não vou Superar', 2, 3),
(5, 'Sem palavras', 2, 1),
(5, 'Simplesmente incrível', 3, 2),
(5, 'Estou surtando!!!', 3, 3);

select * from avaliacao;
select * from usuario;
select * from livro;

SELECT 
    (SELECT COUNT(*) FROM usuario) AS Total_Usuarios,
    l.Nome AS Livro_Mais_Avaliado,
    ROUND(AVG(a.Nota), 2) AS Media_Avaliacoes,
    COUNT(a.fkLivro) AS Quantidade_Avaliacoes
    FROM livro as l
    LEFT JOIN avaliacao as a 
    ON l.idLivro = a.fkLivro
    GROUP BY l.Nome
    ORDER BY Quantidade_Avaliacoes DESC
LIMIT 1;