-- METODOS DE INDENTIFICAÇÃO DE FALHAS E INCONSISTENCIA NO BANCO DE DADOS (Analise de Demandas)

-- 1. Criar o banco de dados
CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

-- 2. Criar tabelas
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_name VARCHAR(100),
    quantity INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- 3. Inserir registros nas tabelas
INSERT INTO Users (username, email) VALUES ('john_doe', 'john@example.com');
INSERT INTO Users (username, email) VALUES ('jane_doe', 'jane@example.com');
INSERT INTO Users (username, email) VALUES ('sam_smith', 'sam@example.com');

INSERT INTO Orders (user_id, product_name, quantity) VALUES (1, 'Laptop', 1);
INSERT INTO Orders (user_id, product_name, quantity) VALUES (1, 'Mouse', 2);
INSERT INTO Orders (user_id, product_name, quantity) VALUES (2, 'Keyboard', 1);


-- INDENTIFICAR FALHAS E INCONSISTENCIAS
-- VERIFICAR INTEGRIDADE REFERENCIAL
SELECT * FROM Orders WHERE user_id
NOT IN (SELECT user_id FROM Users);

-- VERIFICAR TODOS OS DADOS DUPLICADOS
SELECT username, COUNT(*) AS count FROM Users GROUP BY username HAVING count > 1;

-- verificar email invalido

SELECT * FROM Users WHERE email NOT LIKE '%_@_%._%';

-- verificação de pedidos  com quantidade 0 .
SELECT * FROM Orders WHERE quantity <= 0;

-- analise de demanadas e atualizações 
-- simulação de atualização que podem levar a falhas
-- atualizações invalidas que podem causar inconsistencia
UPDATE Orders SET user_id = 99 WHERE order_id; -- atualização invalida(pois não se pode excluir ou editar uma chave primaria que ja esta referenciada como chave extrangeira)

-- adicionar novos usuarios e pedidos para simular um crescimento nos dados. Depois consultar novamente para garantir que não há inconsistencias.


INSERT INTO Users (username, email) VALUES 
('Joao', 'joao@example.com'),
('maria', 'maria@example.com'),
('Jack', 'jack@example.com');

INSERT INTO Orders (user_id, product_name, quantity) VALUES
(3, 'gabinete', 1),
(3, 'teclado', 2),
(3, 'tela', 1),
(1, 'Headphones', 4);


-- Verificando todos os usuários
SELECT * FROM Users;

-- Verificando todos os pedidos
SELECT * FROM Orders;


INSERT INTO Users (username, email) VALUES ('joaninha', 'joaninha.example.com');
SELECT * FROM Users WHERE email NOT LIKE '%_@_%._%';