-- aula sobre ALIAS (AS) --
-- ALIAS (AS) --



CREATE DATABASE IF NOT EXISTS Escola;
USE Escola;

CREATE TABLE alunos (
aluno_id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
sobrenome VARCHAR(100) NOT NULL,
idade INT
);

INSERT INTO alunos (nome, sobrenome, idade) VALUES
('João', 'Silva', 20),
('Maria', 'Santos', 22),
('Pedro', 'Sousa', 21),
('Ana', 'Oliveira', 19),
('Carlos', 'Ribeiro', 23);


CREATE TABLE cursos (
curso_id INT AUTO_INCREMENT PRIMARY KEY,
nome_curso VARCHAR(100) NOT NULL,
descricao TEXT
);

INSERT INTO cursos (nome_curso, descricao) VALUES
('Matematica', 'Curso de matematica basica'),
('Ingles', 'Curso de ingles intermediario'),
('Programação', 'Curso de introdução a programação'),
('Historia', 'Curso de historia mundial'),
('Artes', 'Curso de artes plasticas');

CREATE TABLE matriculas (
matricula INT AUTO_INCREMENT PRIMARY KEY,
aluno_id INT,
curso_id INT,
data_matricula DATE,
FOREIGN KEY (aluno_id) REFERENCES alunos(aluno_id),
FOREIGN KEY (curso_id) REFERENCES cursos(curso_id)
);

INSERT INTO matriculas (aluno_id, curso_id, data_matricula) VALUES
(1, 1, '2023-01-15'),
(2, 3, '2023-02-20'),
(3, 2, '2023-03-10'),
(4, 4, '2023-04-05'),
(5, 5, '2023-05-12');




-- JOIN --
-- Consulta de matricula de alunos em cursos, mostrando o nome do aluno e o nome do curso.

-- SELECT a.nome  -- é o campo nome da tabela alunos(a é a inicial de alunos)
-- AS nome_aluno, -- usando o alias vou criar o campo temporario
-- c.nome_curso -- antes do ponto nome tabela depois do ponto o nome do atributo que quero acessar
-- AS curso

SELECT a.nome AS nome_aluno, c.nome_curso AS curso
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.aluno_id
JOIN cursos c ON m.curso_id = c.curso_id;

-- consulta da inscrição do aluno no curso, mostrando o nome do aluno e a data de matricula
SELECT a.nome  AS nome_aluno, m.data_matricula AS data_matricula
FROM matriculas m
JOIN alunos a ON m.matricula = a.aluno_id;
-- JOIN data_matricula m ON m.data_matricula = a.aluno;