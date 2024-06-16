USE Biblioteca;

CREATE TABLE autores(
    id INT PRIMARY KEY AUTO_INCREMENT,  -- preenchimento automatico
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(100) NOT NULL
);

CREATE TABLE livros( /*livros é uma entidade*/
    id INT PRIMARY KEY AUTO_INCREMENT, /*O que tem dentro da entidade são atributos*/
    titulo VARCHAR(100) NOT NULL, /*quando eu for preencher com os dados se chama registro*/
    genero VARCHAR(50) NOT NULL,
    ano_publicacao INT NOT NULL,
    autor_id INT, 
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

-- inserção de registros na tabela autores
INSERT INTO autores (nome, nacionalidade) VALUES
('J.K. Rowling', 'Britanica'),
('George R.R. Martin', 'Americano'),
('J.R.R Tolkien', 'Britanico'),
('Gabriel Garcia Marquez', 'Columbiano');


-- inserção de registros na tabela Livros
INSERT INTO livros (titulo, genero, ano_publicacao, autor_id) VALUES
('Harry Potter e a Pedra Filosofal', 'Fantasia', 1997, 1),
('A Guerra dos Tronos', 'Fantasia', 1996, 2),
('O Senhor dos Aneis', 'Fantasia', 1954, 3),
('Cem Anos de Dolodão', 'Realismo Magico', 1967, 4),
('Harry Potter e a Câmara Secreta', 'Fantasia', 2005, 1),
('O festim dos Corvos', 'Fantasia', 2005, 2),
('O Hobbit', 'Fantasia', 1973, 3),
('O Amor nos Tempos de Cólera', 'Romance', 1985, 4);



SELECT *  FROM autores;
SELECT * FROM livros;

-- 
-- consulta simples (WHERE)
-- selecionar todos os livros escritos por J.K. Rowling 
SELECT titulo FROM livros WHERE autor_id = 1;

SELECT titulo FROM livros WHERE genero = 'fantasia';

-- Selecionar todos os autores britanicos
SELECT nome FROM autores WHERE nacionalidade = 'britanico';

-- selecionar todos os livros publicados no ano de 1996
SELECT titulo FROM Livros WHERE ano_publicacao = 1996;




UPDATE autores
SET nome = 'J.K. Rowling', nacionalidade = 'Britanico'
WHERE id = 1;

UPDATE tabela_nome
SET coluna1 = novo_valor1,
    coluna2 = novo_valor2
WHERE id_registro = identificador_unico;