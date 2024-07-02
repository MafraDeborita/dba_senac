-- https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html#function_count -- 

-- funçoes de  agregação --

CREATE DATABASE Empresa;
USE Empresa;

CREATE TABLE Funcionarios (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
departamento VARCHAR(50),
salario DECIMAL (10, 2),
data_admissao DATE
);


CREATE TABLE Projetos (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
orcamento DECIMAL (15, 2),
departamento varchar (50)
);

INSERT INTO Funcionarios (nome, departamento, salario, data_admissao) VALUES
('João Silva', 'TI', 6000.00, '2020-01-15'),
('Marcos Santos', 'RH', 4000.00, '2019-03-22'),
('Carlos Oliveira', 'TI', 5500.00, '2021-07-30'),
('Ana Paula', 'Marketing', 4500.00, '2018-05-18'),
('Pedro Mendes', 'TI', 7000.00, '2017-11-03');

DESCRIBE Funcionarios;


INSERT INTO Projetos (nome, orcamento, departamento) VALUES
('Projeto A', 15000.00, 'TI'),
('Projeto B', 2000.00, 'Marketing'),
('Projeto C', 5000.00, 'RH'),
('Projeto D', 250000.00, 'TI'),
('Projeto E', 30000.00, 'TI');

-- MAX -- 
-- Encontre o maior salario entre todos os funcionarios --

SELECT MAX(salario) AS MaiorSalario FROM Funcionarios;

-- MIN --
-- Encontre o menor salario entre todos os funcionarios --

SELECT MIN(salario) AS MenorSalario FROM Funcionarios;

-- SUM --
-- Encontre a soma total do salario de todos os funcionarios --

SELECT SUM(salario) AS SomaSalario FROM Funcionarios;

-- AVG --
-- Calcule a media do salario de todos os funcionarios --

SELECT AVG(salario) AS MediaSalario FROM Funcionarios;

-- COUNT --
-- Conte o numero total de funcionarios --

SELECT COUNT(*) AS Funcionarios FROM Funcionarios;


-- MAX -- 
-- Encontre o maior salario entre todos os funcionarios --

SELECT MAX(salario) AS MaiorSalario FROM Funcionarios;

-- MIN --
-- Encontre o menor salario entre todos os funcionarios --

SELECT MIN(salario) AS MenorSalario FROM Funcionarios;

-- SUM --
-- Encontre a soma total do salario de todos os funcionarios --

SELECT SUM(salario) AS SomaSalario FROM Funcionarios;

-- AVG --
-- Calcule a media do salario de todos os funcionarios --

SELECT AVG(salario) AS MediaSalario FROM Funcionarios;

-- COUNT --
-- Conte o numero total de funcionarios --

SELECT COUNT(*) AS Funcionarios FROM Funcionarios;


-- GROUP BY --
-- calcule a media dos salariospor departamento

SELECT departamento, AVG(salario) AS MediaSalarioDepartamentos
FROM funcionarios
GROUP BY departamento;



-- HAVING --
-- Calcule media dos salarios por departamento, mas mostre apenas os departamentos cuja media
-- salarial seja superior a 5000.

SELECT departamento, AVG(salario) AS MediaSalarioDepartamentos
FROM funcionarios
GROUP BY departamento
HAVING AVG(salario) > 5000;




-- 26/06/2024
-- calcule a media do orçamento dos projetos por departamento

SELECT departamento,
AVG(orcamento)
AS MediaORcamento
FROM Projetos
GROUP BY departamento;

-- calcule o total de orçamento  dos projetos por departamento -- 
SELECT departamento, SUM(orcamento) AS totalOrcamento
FROM projetos
GROUP BY departamento;

-- calcule o numero total de funcionarios em cada departamento --
SELECT departamento, COUNT(*) AS totalfuncionarios
FROM funcionarios
GROUP BY departamento;

select * from funcionarios;

-- conte o numero de funcionarios admitidos em cada ano--
SELECT YEAR(data_admissao) AS Ano, COUNT(*) AS QuantidadeFuncionarios
FROM funcionarios
GROUP BY YEAR (data_admissao);


-- CALCULE A MEDIA SALARIAL POR DEPARTAMENTO, MAS INCLUA  APENAS DEPARTAMENTOS QUE TENHAM 
-- PELO MENOS 2 FUNCIONARIOS

SELECT departamento, AVG(salario) AS MediaSalariodepartamento
FROM funcionarios
GROUP BY departamento
HAVING COUNT(*) >= 2;



-- para fazer em casa
-- ENCONTRE O MAIOR E O MENOR SALARIO EM CADA DEPARTAMENTO.
SELECT departamento, MIN(salario) AS MenorSalario, MAX(salario) AS MaiorSalario
FROM Funcionarios
GROUP BY departamento;

-- LISTE OS PROJETOS CUJO ORÇAMENTO SEJA SUPERIOR A 10000.
SELECT nome, orcamento
FROM projetos
WHERE  (orcamento) > 10000;

-- LISTE OS DEPARTAMENTOS QUE TEM UM ORÇAMENTO MEDIO DE PROJETOS ACIMA DE 20000

SELECT departamento, AVG(ORCAMENTO) AS MediaOrcamento FROM PROJETOS GROUP BY departamento HAVING AVG(ORCAMENTO) > 2000;

-- LISTE OS DETALHES DOS FUNCIONARIOS QUE FORAM ADMITIDOS NOS ULTIMOS 2 ANOS
SELECT departamento, data_admissao from funcionarios where data_admissao >= DATE_SUB(curdate(), interval 2 YEAR);