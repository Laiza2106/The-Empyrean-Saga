create database The_Empyrean;
use The_Empyrean;

create table Usuario(
idUsuario int primary key auto_increment,
Nome varchar(45),
Email varchar(45),
Telefone char(11),
Senha varchar(45),
Confirmar_Senha varchar(45)
);

create table Avaliacao(
idAvaliacao int primary key auto_increment,
Nota int,
	constraint chkNota check (Nota in (1, 2, 3, 4, 5)),
Descricao varchar(500),
fkUsuario int,
	constraint fkUsuarioAvaliacao foreign key (fkUsuario)
			references Usuario(idUsuario)
);

create table Curtidas(
idCurtidas int primary key auto_increment,
Likes int,
	constraint chkLikes check(Likes in(0, 1)),
fkUsuarioLike int, 
	constraint fkUsuarioCurtidas foreign key (fkUsuarioLike)
			references Usuario(idUsuario),
fkAvaliacao int,
	constraint fkAvaliacaoCurtidas foreign key (fkAvaliacao)
			references Avaliacao(idAvaliacao)
);

create table Livro(
idLivro int primary key auto_increment,
Nome varchar(45),
dtLancamento date
);

create table Registro (
idRegistro int primary key auto_increment,
fkLivro int,
	constraint fkLivroRegistro foreign key (fkLivro)
			references Livro(idLivro),
fkAvaliacao_Livro int,
	constraint fkAvaliacaoRegistro foreign key (fkAvaliacao_Livro)
			references Avaliacao(idAvaliacao)
);

insert into Usuario (Nome, Email, Telefone, Senha, Confirmar_Senha) values
('Laiza', 'laizatavares@gmail.com', '11993473590', 'Lol@2502', 'Lol@2502'),
('Geovanna', 'geovanna@gmail.com', '1125674896', '@Ge19', '@Ge19');

insert into Livro (Nome, dtLancamento) values
('Quarta Asa', '2023-10-24'),
('Chama de Ferro', '2024-03-19'),
('Tempestade de Ônix', '2025-01-22');

insert into Avaliacao (Nota, descricao, fkUsuario) values
(5, 'Perfeito!', 1),
(4, 'Plot twist...', 1),
(5, 'Não vou Superar', 2),
(5, 'Sem palavras', 2);

insert into Curtidas (Likes, fkUsuarioLike, fkAvaliacao) values
('1', '1', '1'),
('0', '2', '4');

insert into Registro (fkLivro, fkAvaliacao_Livro) values
(1, 1),
(2, 2),
(1, 3),
(2, 4);

select * from Usuario;
select * from Avaliacao;
select * from Curtidas;
select * from Livro;
select * from Registro;

select Usuario.Nome as 'Usuário', Usuario.Email as 'E-mail do Usuário',
Livro.Nome as 'Nome do Livro', Avaliacao.Nota as 'Avaliação do Livro',
Avaliacao.Descricao as 'Comentário da Leitura'
from Usuario 
join Avaliacao
on Usuario.idUsuario = Avaliacao.fkUsuario
join Registro
on Avaliacao.idAvaliacao = Registro.fkAvaliacao_Livro
join Livro
on Livro.idLivro = Registro.fkLivro;

select Usuario.Nome as 'Usuário', Livro.Nome as 'Nome do Livro', 
Avaliacao.Descricao as 'Comentário da Leitura',
Curtidas.Likes as 'Quantidade de Likes'
from Usuario
join Avaliacao
on Usuario.idUsuario = Avaliacao.fkUsuario
join Registro
on Avaliacao.idAvaliacao = Registro.fkAvaliacao_Livro
join Livro
on Livro.idLivro = Registro.fkLivro
join Curtidas
on Curtidas.fkAvaliacao = Avaliacao.idAvaliacao;

select Usuario.Nome as 'Usuário', Usuario.Email as 'E-mail do Usuário',
Livro.Nome as 'Nome do Livro', Avaliacao.Nota as 'Avaliação do Livro',
Avaliacao.Descricao as 'Comentário da Leitura'
from Usuario 
join Avaliacao
on Usuario.idUsuario = Avaliacao.fkUsuario
join Registro
on Avaliacao.idAvaliacao = Registro.fkAvaliacao_Livro
join Livro
on Livro.idLivro = Registro.fkLivro
where Usuario.idUsuario = 1;

select Usuario.Nome as 'Usuário', Usuario.Email as 'E-mail do Usuário',
Livro.Nome as 'Nome do Livro', Avaliacao.Nota as 'Avaliação do Livro',
Avaliacao.Descricao as 'Comentário da Leitura'
from Usuario 
join Avaliacao
on Usuario.idUsuario = Avaliacao.fkUsuario
join Registro
on Avaliacao.idAvaliacao = Registro.fkAvaliacao_Livro
join Livro
on Livro.idLivro = Registro.fkLivro
where Usuario.idUsuario = 2;

select Usuario.Nome as 'Usuário', Livro.Nome as 'Nome do Livro', 
Avaliacao.Descricao as 'Comentário da Leitura',
Curtidas.Likes as 'Quantidade de Likes'
from Usuario
join Avaliacao
on Usuario.idUsuario = Avaliacao.fkUsuario
join Registro
on Avaliacao.idAvaliacao = Registro.fkAvaliacao_Livro
join Livro
on Livro.idLivro = Registro.fkLivro
join Curtidas
on Curtidas.fkAvaliacao = Avaliacao.idAvaliacao
where Usuario.idUsuario = 1;

select Usuario.Nome as 'Usuário', Livro.Nome as 'Nome do Livro', 
Avaliacao.Descricao as 'Comentário da Leitura',
Curtidas.Likes as 'Quantidade de Likes'
from Usuario
join Avaliacao
on Usuario.idUsuario = Avaliacao.fkUsuario
join Registro
on Avaliacao.idAvaliacao = Registro.fkAvaliacao_Livro
join Livro
on Livro.idLivro = Registro.fkLivro
join Curtidas
on Curtidas.fkAvaliacao = Avaliacao.idAvaliacao
where Usuario.idUsuario = 2;

insert into Usuario (Nome, Email, Telefone, Senha, Confirmar_Senha) values
('Amanda', 'amanda@gmail.com', 11945678765, 'Amanda123', 'Amanda123');




	