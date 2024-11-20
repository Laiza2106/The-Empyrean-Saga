create database PI;
use PI;

create table Grupo(
idGrupo int primary key auto_increment,
Nome varchar(45),
Descricao varchar(45)
);

create table Aluno(
idAluno int primary key auto_increment,
RA char(8),
Nome varchar(45),
Email varchar(45),
fkGrupo int,
	constraint fkGrupoAluno foreign key (fkGrupo)
			references Grupo(idGrupo)
)auto_increment = 100;

create table Professor(
idProfessor int primary key auto_increment,
 Nome varchar(45),
 Disciplina varchar(45)
 )auto_increment = 10000;
 
 create table Avaliacao(
 fkGrupo int,
	constraint fkGrupoProfessor foreign key (fkGrupo)
			references Grupo(idGrupo),
 fkProfessor int,
	constraint fkProfessorGrupo foreign key (fkProfessor)
			references Professor(idProfessor),
	constraint pkComposta primary key (fkGrupo, fkProfessor),
Data_Horario datetime,
Nota decimal(3, 1)
); 

insert into Grupo(Nome, Descricao) values
("Grupo 1", "Projeto 10"),
("Grupo 2", "Projeto 11"),
("Grupo 3", "Projeto 12"),
("Grupo 4", "Projeto 13"),
("Grupo 5", "Projeto 14");

select * from Grupo;

insert into Aluno(RA, Nome, Email, fkGrupo) values
("12345678", "Laiza", "laiza@gmail.com", "1"),
("01234567", "Laysa", "laysa@gmail.com", "2"),
("98765432", "Guilherme", "guilherme@gmail.com", "3"),
("01010202", "Nicoly", "nicoly@gmail.com", "4"),
("35353636", "Amanda", "amanda@gmail.com", "5"),
("84848787", "Gaby", "gaby@gmail.com", "1"),
("91919292", "Miguel", "miguel@gmail.com", "2"),
("55556666", "Lara", "lara@gmail.com", "3"),
("48454845", "Isabela", "izabela@gmail.com", "4"),
("12131213", "Mario", "mario@gmail.com", "5");

select * from Aluno;

insert into Professor(Nome, Disciplina) values
("Vivian", "Banco de Dados"),
("JP", "Algoritmos"),
("Márcio", "Introdução a SO");

select * from Professor;

insert into Avaliacao(fkGrupo, fkProfessor, Data_Horario, Nota) values
(1, 10000, "2024-06-01 13:00:00", "7.5"),
(2, 10001, "2024-06-01 14:00:00", "7.0"),
(3, 10002, "2024-06-01 15:00:00", "8.0"),
(4, 10000, "2024-06-02 10:00:00", "7.9"),
(5, 10001, "2024-06-02 11:00:00", "7.3"),
(1, 10002, "2024-08-01 13:00:00", "7.4"),
(2, 10000, "2024-08-01 14:00:00", "7.8"),
(3, 10000, "2024-08-01 15:00:00", "8.5"),
(4, 10001, "2024-08-02 10:00:00", "8.9"),
(5, 10002, "2024-08-02 11:00:00", "8.3");

select * from Avaliacao;

select Grupo.Nome as "Nome do Grupo", Grupo.Descricao as "Descrição do Projeto",
Aluno.Nome as "Nome do Aluno", Aluno.RA 
from Grupo join Aluno
on fkGrupo = idGrupo;

select Grupo.Nome as "Nome do Grupo", Grupo.Descricao as "Descrição do Projeto",
Aluno.Nome as "Nome do Aluno", Aluno.RA, Aluno.Email 
from Grupo join Aluno
on fkGrupo = idGrupo
where idGrupo = 1;

select truncate(avg(Nota), 2) as "Média" from Avaliacao;

select truncate(min(Nota), 2) as "Nota Mínima",
truncate(max(Nota), 2) as "Nota Máxima"
from Avaliacao;

select truncate(sum(Nota), 2) as "Soma das Notas" from Avaliacao;

select Professor.Nome as "Nome do Professor", Professor.Disciplina as "Disciplina",
Grupo.Nome as "Nome do Grupo", Grupo.Descricao as "Descrição do Grupo",
Avaliacao.Data_Horario as "Data e Horário da Avaliação" 
from Avaliacao
join Grupo
on Avaliacao.fkGrupo = Grupo.idGrupo
join Professor
on Avaliacao.fkProfessor = Professor.idProfessor;

select Professor.Nome as "Nome do Professor", Professor.Disciplina as "Disciplina",
Grupo.Nome as "Nome do Grupo", Grupo.Descricao as "Descrição do Grupo",
Avaliacao.Data_Horario as "Data e Horário da Avaliação" 
from Avaliacao
join Grupo
on Avaliacao.fkGrupo = Grupo.idGrupo
join Professor
on Avaliacao.fkProfessor = Professor.idProfessor
where idGrupo = 4;

select Grupo.Nome as "Nome do Grupo", 
Professor.Nome as "Nome do Professor"
from Avaliacao
join Grupo
on Avaliacao.fkGrupo = Grupo.idGrupo
join Professor
on Avaliacao.fkProfessor = Professor.idProfessor
where idProfessor = 10000;

select Grupo.Nome as "Nome do Grupo", Grupo.Descricao as "Descrição do Grupo",
Aluno.Nome as "Nome do Aluno", Aluno.RA as "RA do Aluno", 
Aluno.Email as "Email do Aluno", Professor.Nome as "Nome do Professor",
Avaliacao.Data_Horario as "Data e Horário da Avaliação"
from Avaliacao
join Grupo
on Avaliacao.fkGrupo = Grupo.idGrupo
join Professor
on Avaliacao.fkProfessor = Professor.idProfessor
join Aluno
on Aluno.fkGrupo = Grupo.idGrupo;

select Avaliacao.Nota,
count(Avaliacao.Nota) as Quantidade 
from Avaliacao
group by Avaliacao.Nota;

select Professor.Nome as "Nome do Professor", 
truncate(avg(Avaliacao.Nota), 2) as "Média",
truncate(sum(Avaliacao.Nota), 2) as "Soma das Notas"
from Professor
join Avaliacao
on Avaliacao.fkProfessor = Professor.idProfessor
group by Professor.Nome;

select Grupo.Nome as "Nome do Grupo", 
truncate(avg(Avaliacao.Nota), 2) as "Média",
truncate(sum(Avaliacao.Nota), 2) as "Soma das Notas"
from Grupo
join Avaliacao
on Avaliacao.fkGrupo = Grupo.idGrupo
group by Grupo.Nome;

select Professor.Nome as "Nome do Professor", 
truncate(min(Nota), 2) as "Nota Mínima",
truncate(max(Nota), 2) as "Nota Máxima"
from Professor
join Avaliacao
on Avaliacao.fkProfessor = Professor.idProfessor
group by Professor.Nome;

select Grupo.Nome as "Nome do Grupo", 
truncate(min(Nota), 2) as "Nota Mínima",
truncate(max(Nota), 2) as "Nota Máxima"
from Grupo
join Avaliacao
on Avaliacao.fkGrupo = Grupo.idGrupo
group by Grupo.Nome;