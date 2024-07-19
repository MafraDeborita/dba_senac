-- VIEWS - É UMA TABELA VIRTUAL CRIADA COM UMA CONSULTA SQL. PERMITE SIMPLIFICAR CONSULTAS COMPLEXAS, MELHORA A SEGURANÇA E A MANUTENÇÃO DOS DADOS.

CREATE DATABASE school_views;
USE school_views;

CREATE TABLE students (
studentsID INT PRIMARY KEY AUTO_INCREMENT,
FistName VARCHAR(50),
LastName VARCHAR(50),
age INT,
grade VARCHAR(5)
);

INSERT INTO students (FistName, LastName, age, grade) VALUES
('Jhon', 'Doe', 18,'A'),
('Jane', 'Smith', 17,'B'),
('Emily', 'Jones', 19,'A'),
('Michael', 'Brown', 18,'C');


-- SIMPLIFICANDO A CONSULTA DE ALUNOS COM NOTA "A".

CREATE VIEW Topstudentes
AS 
SELECT FistName, LastName, age
FROM students
WHERE grade = "C";

SELECT * FROM Topstudentes;

-- FUNCTIONS É UM BLOCO DE CODIGO SQL REUTILIZAVEL QUE REALIZA UMA TAREFA ESPECÍFICA E RETORNA UM VALOR.
-- CRIAR UMA FUNÇÃO PARA CALCULAR A IDADE MEDIA DOS ALUNOS.alter

DELIMITER //
CREATE FUNCTION AverageAge() RETURNS  -- Esta linha cria uma função chamada AverageAge() que retorna um valor inteiro (INT).
INT
BEGIN -- Inicia o corpo da função.
	DECLARE avg_age INT; -- Declara uma variável local chamada avg_age do tipo inteiro para armazenar a média das idades.
    SELECT AVG(age) INTO avg_age FROM students; -- Calcula a média das idades na tabela students e armazena o resultado na variável avg_age.
    RETURN avg_age; -- Retorna o valor da média calculada como resultado da função.
END // -- Finaliza o corpo da função.
DELIMITER ;  -- Redefine o delimitador padrão para ';' após a criação da função.

SELECT AverageAge();

-- PROCEDURES (PROCEDIMENTOS) {NÃO RETORNA VALOR}
-- É SEMELHANTE A UMA FUNÇÃO, MAS PODE REALIZAR OPERAÇÕES MAIS COMPLEXAS E NÃO PRECISA RETORNAR VALOR
-- É ULTILIZADO PARA AUTOMATIZAR PROCESSOS REPETITIVOS E ENCAPSULAR LOGICA DE NEGOCIOS.
-- CRIAR UMA PROCEDURE PARA ADICIONAR NOVOS ALUNOS 

DELIMITER //

CREATE PROCEDURE AddStudent(
	IN p_FistName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_age INT,
    IN p_grade VARCHAR(5)
)
BEGIN
    INSERT INTO students (FistName, LastName, age, grade)
    VALUES (p_FistName, p_LastName, p_age, p_grade);

END //
DELIMITER ;

CALL AddStudent('Chris', 'Evans', 20, 'B');

SELECT * FROM students;




-- procedure é incrível, estudar mai sobre.


