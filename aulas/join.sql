-- 02/07/2024
CREATE DATABASE exemplo_join;
USE exemplo_join;


CREATE TABLE tabelaA (
nome VARCHAR(50) NULL
);

CREATE TABLE tabelaB (
nome VARCHAR(50) NULL
);

INSERT INTO tabelaA VALUES
('Fernanda'),
('Josefa'),
('Luis'),
('Fernando');

INSERT INTO tabelaB VALUES
('Carlos'),
('Manoel'),
('Luis'),
('Fernando');

-- INER JOIN -- 

SELECT a.nome, b.nome
FROM tabelaA AS A 
INNER JOIN tabelaB AS B ON a.nome = b.nome;

-- LEFT JOIN -- 

SELECT a.nome, b.nome
FROM tabelaA AS A 
LEFT JOIN tabelaB AS B ON a.nome = b.nome;

-- RIGTH JOIN -- 

SELECT a.nome, b.nome
FROM tabelaA AS A 
RIGHT JOIN tabelaB AS B ON a.nome = b.nome;

-- FULL JOIN -- 

SELECT a.nome, b.nome
FROM tabelaA AS A 
LEFT JOIN tabelaB AS B ON a.nome = b.nome
UNION
SELECT a.nome, b.nome
FROM tabelaA AS A 
RIGHT JOIN tabelaB AS B ON a.nome = b.nome;


-- 02/07/2024
-- essa atividade é de outro banco de dados chamado empresa
-- Consultas com Join 
-- 1 LISTE OS NOMES DOS FUNCIONARIOS JUNTAMENTE COM OS NOMES DOS PROJETOS EM QUE TRABALHAM ,
-- MAS APENAS PARA OS FUNCIONARIOS QUE ESTÃO ALOCADOS EM DEPARTAMENTOS QUE POSSUEM PROJETOS

SELECT funcionarios.nome, funcionarios.departamento, projetos.nome AS NomeProjeto
FROM funcionarios
INNER JOIN Projetos ON funcionarios.departamento = Projetos.departamento;