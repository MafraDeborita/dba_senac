CREATE DATABASE IF NOT EXISTS BLOOD;
USE BLOOD;

create table tipo_sanguineo(
	id int primary key auto_increment,
    tipo varchar(3) not null
);

create table doador(
	id int primary key auto_increment,
    nome varchar(100),
    sobrenome varchar(100),
    cpf varchar(20) unique,
    idade int,
    data_nascimento date,
    tipo_sanguineo_id int,
    email varchar(100) unique,
    telefone varchar(20),
    endereco varchar(100),
    ultima_doacao date,
    outras_informacoes text,
    foreign key (tipo_sanguineo_id) references tipo_sanguineo(id)
);

create table hospital(
	id int primary key auto_increment,
    nome varchar(100) not null,
    cnpj varchar(100) not null,
    endereco varchar(100) not null,
    telefone varchar(20) not null,
    email varchar(100) unique not null
);

create table bolsa_sanguinea(
	id int primary key auto_increment,
    tipo_sanguineo_id int,
    doador_id int,
    quantidade decimal(10,2),
    data_extracao date,
    foreign key(tipo_sanguineo_id) references tipo_sanguineo(id),
    foreign key(doador_id) references doador(id)
);

create table estoque(
	id int primary key auto_increment,
    bolsa_sanguinea_id int,
    localizacao varchar(100),
    foreign key(bolsa_sanguinea_id) references bolsa_sanguinea(id)
);

create table pedido(
	id int primary key auto_increment,
    hospital_id int not null,
    tipo_sanguineo_id int not null,
    quantidade decimal(5,2) not null,
    data_pedido date not null,
    data_atendimento date,
    status_pedido enum('Atendido','Aberto'),
    foreign key(hospital_id) references hospital(id),
    foreign key(tipo_sanguineo_id) references tipo_sanguineo(id)
);

-- Aqui acontece a retirada da bolsa de sangue do estoque para a clinica/hospital que solicita.
create table doacao(
	id int primary key auto_increment,
    bolsa_sanguinea_id int,
    pedido_id int,
    data_retirada_estoque date,
    foreign key(bolsa_sanguinea_id) references bolsa_sanguinea(id),
    foreign key(pedido_id) references pedido(id)
);

-- Inserindo tipos sanguíneos
INSERT INTO tipo_sanguineo (tipo) VALUES 
('A+'), ('A-'), ('B+'), ('B-'), 
('AB+'), ('AB-'), ('O+'), ('O-');

-- Inserindo doadores
INSERT INTO doador (nome, sobrenome, cpf, idade, data_nascimento, tipo_sanguineo_id, email, telefone, endereco, ultima_doacao, outras_informacoes) VALUES
('João', 'Silva', '123.456.789-00', 30, '1994-01-15', 1, 'joao.silva@gmail.com', '9999-9999', 'Rua A, 123', '2023-06-20', 'Nenhuma'),
('Maria', 'Oliveira', '234.567.890-11', 28, '1995-03-22', 3, 'maria.oliveira@gmail.com', '9888-8888', 'Rua B, 456', '2023-05-10', 'Nenhuma'),
('Carlos', 'Santos', '345.678.901-22', 40, '1984-07-30', 5, 'carlos.santos@gmail.com', '9777-7777', 'Rua C, 789', '2023-07-01', 'Nenhuma'),
('Ana', 'Souza', '456.789.012-33', 35, '1988-11-05', 7, 'ana.souza@gmail.com', '9666-6666', 'Rua D, 101', '2023-04-15', 'Nenhuma');




-- Inserindo hospitais
INSERT INTO hospital (nome, cnpj, endereco, telefone, email) VALUES
('Hospital Milton Augostinho', '12.345.678/0001-99', 'Avenida Central, 1000', '9000-0000', 'contato@hospitalmilton.com.br'),
('Hospital Yorick', '23.456.789/0001-88', 'Rua do Norte, 200', '9111-1111', 'contato@hospitalyorick.com.br'),
('Hospital Cedro', '34.567.890/0001-77', 'Rua do Sul, 300', '9222-2222', 'contato@hospitalcedro.com.br'),
('Hospital Santa Casa', '45.678.901/0001-66', 'Avenida Leste, 400', '9333-3333', 'contato@santacasa.com.br');

-- Inserindo bolsas sanguíneas
INSERT INTO bolsa_sanguinea (tipo_sanguineo_id, doador_id, quantidade, data_extracao) VALUES
(1, 1, 0.5, '2023-06-20'),
(3, 2, 0.5, '2023-05-10'),
(5, 3, 0.5, '2023-07-01'),
(7, 4, 0.5, '2023-04-15');

-- Inserindo estoques
INSERT INTO estoque (bolsa_sanguinea_id, localizacao) VALUES
(1, 'Refrigerador A1'),
(2, 'Refrigerador B1'),
(3, 'Refrigerador C1'),
(4, 'Refrigerador D1');

-- Inserindo pedidos
INSERT INTO pedido (hospital_id, tipo_sanguineo_id, quantidade, data_pedido, data_atendimento, status_pedido) VALUES
(1, 1, 0.5, '2023-07-01', '2023-07-05', 'Atendido'),
(2, 3, 0.5, '2023-07-02', '2023-07-06', 'Atendido'),
(3, 5, 0.5, '2023-07-03', '2023-07-07', 'Atendido'),
(4, 7, 0.5, '2023-07-04', '2023-07-08', 'Atendido');

-- Inserindo doações
INSERT INTO doacao (bolsa_sanguinea_id, pedido_id, data_retirada_estoque) VALUES
(1, 1, '2023-07-05'),
(2, 2, '2023-07-06'),
(3, 3, '2023-07-07'),
(4, 4, '2023-07-08');
