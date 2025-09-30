-- Atividade 30/09/2025
USE biblioteca_emily;

-- Select(1)
SELECT titulo, descricao FROM livro WHERE id_livro=4;

-- Insert (1)
ALTER TABLE livro ADD edicao VARCHAR(255), ADD data_publicacao DATE;
INSERT INTO Autor (nome, nascimento, biografia) VALUES ("Eric Matthes","1972-06-27","Um escritor famoso");
INSERT INTO Livro (titulo, isbn, descricao, data_publicacao, edicao) VALUES ("Python", "13-1718502702", "Livro de Python básico", "2023-04-24", "3ª edição.");
INSERT INTO Categoria (nome) VALUES ("técnico");
INSERT INTO Livro_Autor (id_livro, id_autor) VALUES (11, 11);
INSERT INTO Livro_Categoria (id_livro, id_categoria) VALUES (11, 11);

-- UPDATE(4)
UPDATE usuario SET email = 'teste@email.com' WHERE id_usuario = 1;
UPDATE livro SET titulo = 'Curso Intensivo de Python: uma Introdução Prática e Baseada em Projetos à Programação' WHERE id_livro = 11;

-- Colocando datas em outros livros
UPDATE livro SET data_publicacao = '1949=05-04' WHERE id_livro = 5;
UPDATE livro SET data_publicacao = '1997-03-19' WHERE id_livro = 8;
ALTER TABLE livro ADD status ENUM('ativo', 'inativo') DEFAULT 'ativo';

-- Para desabilitar a "segurança" do mysql
SET SQL_SAFE_UPDATES = 0;
UPDATE livro  SET status = 'inativo' WHERE data_publicacao < '2000-01-01';
SELECT * FROM livro;

-- DELETE (4)
-- Apagando o livro de id 2
DELETE FROM emprestimo where id_livro=2;
DELETE FROM livro_autor where id_livro=2;
DELETE FROM livro_categoria where id_livro=2;
DELETE FROM Livro WHERE id_livro=2;

-- Apagando o usuario Testador
INSERT INTO Usuario (nome, num_identificacao, email, data_cadastro, nivel_associadado) VALUES ("Teste Testador", "U1012", "teste.testador@email.com", "2024-07-15", "Bronze");
DELETE FROM usuario WHERE id_usuario=11;

-- Apagando o livro no status "danificado"
ALTER TABLE livro MODIFY COLUMN status ENUM('ativo', 'inativo', 'danificado');
UPDATE livro SET status = 'danificado' WHERE id_livro = 1;
DELETE FROM emprestimo where id_livro=1;
DELETE FROM livro_autor where id_livro=1;
DELETE FROM livro_categoria where id_livro=1;
DELETE FROM Livro WHERE id_livro=1;
SELECT * from livro;

-- Apagando emprestimo realizados no ano de 2020
UPDATE emprestimo SET data_emprestimo = '2020-05-14' WHERE id_livro = 9;
DELETE FROM emprestimo WHERE id_emprestimo=9;
SELECT * from emprestimo;

