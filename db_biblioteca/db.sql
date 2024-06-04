CREATE DATABASE biblioteca;


CREATE TABLE livros( /*livros é uma entidade*/
    isbn INT PRIMARY KEY AUTO_INCREMENT, /*O que tem dentro da entidade são atributos*/
    titulo VARCHAR(255) NOT NULL, /*quando eu for preencher com os dados se chama registro*/
    editora VARCHAR(255) NOT NULL,
    ano_publicacao INT(4) NOT NULL,
);

CREATE TABLE autor(
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    nacionalidade VARCHAR(255) NOT NULL,
    data_nascimento INT(255) NOT NULL,
);

CREATE TABLE membro(
    id_membro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    funcionario VARCHAR(255) NOT NULL,
    aluno VARCHAR(255) NOT NULL,
);

CREATE TABLE emprestimo(
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    id_livro INT NOT NULL,
    id_membro INT NOT NULL,
    data_emprestimo INT NOT NULL,
);

CREATE TABLE devolucao(
    id_devolucao INT PRIMARY KEY AUTO_INCREMENT,
    id_emprestimo INT NOT NULL,
    data_devolucao INT NOT NULL,
);