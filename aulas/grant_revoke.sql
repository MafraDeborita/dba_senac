-- GESTÃO DE PERMISSÕES (DATA TRANSACTION LANGUAGE) 24/07/2024

-- GRANT - O COMANDO GRANT É ULTILIZADO PARA CONCEDER  PERMISSÕES A UM OU MAIS USUÁRIOS.
-- SINTAXE
GRANT privilegio1, privilegio2 ON nome_do_banco.nome_da_tabela TO 'usuario'@'host';
GRANT SELECT,INSERT ON biblioteca.livros TO 'root'@'localhost';

-- REVOKE - É ULTILIZADO PARA RETIRAR PERMISSÕES CONCEDIDAS ANTERIOMENTE A UM OU MAIS USUARIOS.
-- SINTAXE
REVOKE privilegio1, privilegio2 ON nome_do_banco.nome_da_tabela FROM 'usuario'@'host';
REVOKE INSERT ON biblioteca.livros FROM 'usuario'@'localhost';