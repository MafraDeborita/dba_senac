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

-- 03/07
-- 2 LISTE OS NOMES DOS FUNCIONARIOS E NOME DOS PROJETOS EM QUE TRABALHAM ,
-- INCLUINDO OS FUNCIONARIOS QUE NÃO ESTÃO ALOCADOS EM NENHUM PROJETOS

SELECT funcionarios.nome, funcionarios.departamento, projetos.nome AS NomeProjeto
FROM funcionarios
LEFT JOIN Projetos ON funcionarios.departamento = Projetos.departamento;



SELECT * FROM funcionarios;
SELECT * FROM projetos;

SELECT nome AS NomeFuncionarios
FROM funcionarios
GROUP BY projetos;

-- 3 LISTE OS NOMES DOS PROJETOS E NOME DOS FUNCIONARIOS  QUE TRABALHAM neles,
-- INCLUINDO OS PROJETOS QUE NÃO tem nenhum FUNCIONARIOS ALOCADOS.

SELECT Projetos.nome, projetos.departamento, funcionarios.nome  AS Nomefuncionario
FROM projetos
RIGHT JOIN funcionarios ON Projetos.departamento = funcionarios.departamento;

-- 4 LISTE TODOS OS FUNCIONARIOS E PROJETOS, INCLUINDO AQUELES QUE NÃO TEM CORRESPONDENCIA
-- EM QUALQUER UMA DAS TABELAS.
SELECT funcionarios.nome, funcionarios.departamento, projetos.nome AS NomeProjeto
FROM funcionarios
LEFT JOIN Projetos ON funcionarios.departamento = Projetos.departamento
UNION
SELECT Projetos.nome, projetos.departamento, funcionarios.nome  AS Nomefuncionario
FROM projetos
RIGHT JOIN funcionarios ON Projetos.departamento = funcionarios.departamento;