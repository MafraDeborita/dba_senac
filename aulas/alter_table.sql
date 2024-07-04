CREATE DATABASE escola;
USE escola;

CREATE TABLE estudantes (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
idade INT,
turma_id INT
);
 
 CREATE TABLE turmas (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
periodo VARCHAR(50)
);


 CREATE TABLE professor (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
materia VARCHAR(50)
);

 CREATE TABLE aulas (
id INT AUTO_INCREMENT PRIMARY KEY,
professor_id INT,
turma_id INT,
FOREIGN KEY (professor_id) REFERENCES professor(id),
FOREIGN KEY (turma_id) REFERENCES turmas(id)
);

INSERT INTO turmas (nome, periodo) VALUES
('1 ano', 'manhã'),
('2 ano', 'tarde');

INSERT INTO estudantes (nome, idade, turma_id) VALUES
('Alice', 15, 1),
('Bruno', 16, 2),
('Carla', 15, 1),
('Daniel', 16, 2);

INSERT INTO professor (nome, materia) VALUES
('Prof Silva', 'Matemática'),
('Prof Oliveira', 'Portugues');

INSERT INTO aulas (professor_id, turma_id) VALUES
(1, 1),
(2, 2);

-- EXEMPLO 1
-- ADICIONAR UM CAMPO "EMAIL" NA TABELA "ESTUDANTES"

ALTER TABLE estudantes
ADD COLUMN email VARCHAR(100);

SELECT * FROM ESTUDANTES;

-- EXEMPLO 2
-- MODIFICAR O ATRIBUTO "NOME" DA TABELA "ESTUDANTES" PARA VARCHAR(200)

ALTER TABLE estudantes
MODIFY COLUMN nome VARCHAR(200);

-- EXEMPLO 3
-- RENOMEAR A COLUNA "EMAIL" PARA "EMAIL_ESTUDANTE" DA TABELA "ESTUDANTE"
-- ALTER TABLE ESTUDANTE RENAME COLUMN EMAIL TO EMAIL_ESTUDANTE;

ALTER TABLE estudantes
CHANGE COLUMN email email_estudante VARCHAR(100);

-- EXEMPLO 4
-- EXCLUIR A COLUNA "EMAIL_ESTUDANTE" DA TABELA "ESTUDANTE"

ALTER TABLE estudantes
DROP COLUMN email_estudante;

-- EXEMPLO 4
-- LISTAR AS IDADES DISTINTAS DOS ESTUDANTES

SELECT DISTINCT idade FROM estudantes;

-- VERIFICAR AS IDADES POR TURMAS, MESMO SE A IDADE FOR A MESMA, E AS TURMAS FOREM DIFERENTES 
SELECT DISTINCT idade, turma_id FROM estudantes;

-- SELECT IN SELECT
-- ENCONTRAR ESTUDANTES QUE ESTÃO EM TURMAS QUE TEM AULAS COM O "PROF. SILVA"

SELECT nome FROM estudantes WHERE turma_id
IN (SELECT turma_id FROM aulas WHERE professor_id = (SELECT id from professor WHERE nome = 'Prof Silva'));