-- Exercicio da Atividade dos Operadores - 20/10/2025
USE BibliotecaOnline;
 
-- EXERCICIO 1
SELECT Livro.titulo, Categoria.nome
FROM Livro
JOIN LivroCategoria ON Livro.id = LivroCategoria.livro_id
JOIN Categoria ON LivroCategoria.categoria_id = Categoria.id
WHERE Categoria.nome = 'Mistério'
ORDER BY Livro.titulo ASC;
 
 
-- EXERCICIO 2
SELECT Livro.titulo, Livro.isbn
FROM Livro
WHERE Livro.titulo LIKE 'O%';
 
-- EXERCICIO 3
SELECT Usuario.nome, Usuario.nivel_associacao
FROM Usuario
WHERE Usuario.data_cadastro > '2023-06-01';
 
-- EXERCICIO 4
SELECT Autor.nome
FROM Autor
WHERE Autor.data_nascimento IS NULL;
 
-- EXERCICIO 5
SELECT Livro.titulo, Livro.descricao
FROM Livro
WHERE Livro.descricao IS NOT NULL;
 
-- EXERCICIO 6
SELECT Usuario.nome, Usuario.data_cadastro
FROM Usuario
WHERE Usuario.nivel_associacao IN ('regular', 'premium');
 
-- EXERCICIO 7
SELECT Livro.titulo, Livro.isbn
FROM Livro
WHERE Livro.id BETWEEN 303 AND 306;
 
-- EXERCICIO 8
SELECT Usuario.nome, Usuario.email
FROM Usuario
WHERE Usuario.nome NOT LIKE 'M%';
 
-- EXERCICIO 9
SELECT Livro.titulo
FROM Livro
JOIN Emprestimo ON Livro.id = Emprestimo.livro_id
WHERE Emprestimo.data_devolucao IS NULL;
 
-- EXERCICIO 10
SELECT Livro.id, Livro.titulo, Livro.isbn
FROM Livro
ORDER BY Livro.id ASC
LIMIT 5;
 
-- EXERCICIO 11
SELECT Livro.id, Livro.titulo, Livro.isbn
FROM Livro
LIMIT 5 OFFSET 3;
 
-- EXERCICIO 12
SELECT Livro.titulo
FROM Livro
WHERE Livro.titulo LIKE '_____rry%';
 
-- EXERCICIO 13
SELECT Usuario.nome, Usuario.data_cadastro
FROM Usuario
WHERE Usuario.nivel_associacao = 'premium'
AND Usuario.data_cadastro > '2023-07-31';
 
-- EXERCICIO 14
SELECT Livro.titulo
FROM Livro
JOIN LivroCategoria ON Livro.id = LivroCategoria.livro_id
JOIN Categoria ON LivroCategoria.categoria_id = Categoria.id
WHERE Categoria.nome IN ('Ficção', 'Mistério')
AND Livro.descricao IS NOT NULL;
 
-- EXERCICIO 15
SELECT Livro.titulo, Autor.nome, Categoria.nome
FROM Livro
JOIN LivroAutor ON Livro.id = LivroAutor.livro_id
JOIN Autor ON LivroAutor.autor_id = Autor.id
JOIN LivroCategoria ON Livro.id = LivroCategoria.livro_id
JOIN Categoria ON LivroCategoria.categoria_id = Categoria.id
JOIN Emprestimo ON Livro.id = Emprestimo.livro_id
WHERE Emprestimo.data_emprestimo BETWEEN '2024-01-01' AND '2024-02-29'
  AND Livro.titulo LIKE 'O%'
  AND Livro.descricao IS NOT NULL
  AND Categoria.nome IN ('Mistério', 'Ficção', 'Fantasia')
  AND Autor.nome LIKE '%a%'
ORDER BY Livro.titulo ASC;