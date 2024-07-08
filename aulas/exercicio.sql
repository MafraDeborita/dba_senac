-- exercicio de fim de unidade

CREATE DATABASE gereciador_bancario;
USE gereciador_bancario;
-- DROP DATABASE gereciador_bancario;


CREATE TABLE banco (
codigo INT PRIMARY KEY AUTO_INCREMENT,
nome_banco VARCHAR(30) NOT NULL UNIQUE
);

INSERT INTO banco (nome_banco) VALUES
('Banco do Brasil'),
('Caixa Economica');


CREATE TABLE agencia (
numero_agencia INT PRIMARY KEY,
endereco VARCHAR(40) NOT NULL,
cod_banco INT,
FOREIGN KEY (cod_banco) REFERENCES banco(codigo)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO agencia (numero_agencia, endereco, cod_banco) VALUES
(0562, 'Rua Joaquim Teixeira Alves', 2),
(3153, 'Av. Marcelino Pires, ', 1);


CREATE TABLE  cliente (
cpf VARCHAR(30) PRIMARY KEY,
nome VARCHAR(30) NOT NULL,
sexo CHAR NOT NULL,
endereco VARCHAR(40) NOT NULL
);
-- SET SQL_SAFE_UPDATES = 0;
INSERT INTO cliente (cpf, nome, sexo, endereco) VALUES
('111.222.333-44', 'Jenifer B Souza', 'F', 'Rua Cuiaba, 1050'),
('666.777.888-99', 'Caetanto K Lima', 'M', 'Rua Invihema, 879'),
('555.444.777-33', 'Silva Macedo', 'F', 'Rua Estados Unidos, 735');
SELECT * FROM cliente;


CREATE TABLE conta (
numero_conta INT PRIMARY KEY,
saldo INT,
tipo_conta VARCHAR(40) NOT NULL,
numero_agencia INT,
FOREIGN KEY (numero_agencia) REFERENCES agencia(numero_agencia)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO conta (numero_conta, saldo, tipo_conta, numero_agencia) VALUES
(863502, 763.05, 2, 3153),
(235847, 3879.12, 1, 0562);


CREATE TABLE historico (
cpf_cliente VARCHAR(30),
num_conta INT NOT NULL,
data_inicio DATE NOT NULL,
PRIMARY KEY (cpf_cliente, num_conta),
FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY (num_conta) REFERENCES conta(numero_conta)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO historico (cpf_cliente, num_conta, data_inicio) VALUES
('111.222.333-44', 235847, '1997-12-17'), 
('666.777.888-99', 863502, '2010-11-29');
-- SELECT * FROM historico;
SELECT * FROM conta WHERE numero_conta IN (235847, 863502);



CREATE TABLE telefone_cliente (
  cpf_cliente VARCHAR(30) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  PRIMARY KEY (cpf_cliente, telefone),
  FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



INSERT INTO telefone_cliente (cpf_cliente, telefone) VALUES
('111.222.333-44', '(67)3422-7788'),
('666.777.888-99', '(67)3423-9900');






-- 1. Altere a tabela cliente e crie um novo atributo chamado email para armazenar os emails dos
-- clientes. O campo e-mail deve ser um varchar (255) null,

ALTER TABLE cliente
ADD COLUMN email VARCHAR(255) NULL;

-- 2. Recupere o cpf e o endereço do(s) cliente(s) cujo nome seja ‘Paulo A Lima’.
-- SELECT cpf, endereco FROM cliente WHERE nome = 'Paulo A Lima';
SELECT cpf, endereco
FROM cliente
WHERE nome = 'Caetanto K Lima';


-- 3. Recupere o número da agência e endereço de todas as agências do Banco do Brasil.

SELECT numero_agencia, endereco FROM agencia
JOIN banco ON agencia.cod_banco = banco.codigo
WHERE banco.nome_banco = 'Banco do Brasil';


-- 4 Para cada cliente, liste o número da sua conta, o número da agência que a controla e o nome do
-- cliente.

SELECT 
