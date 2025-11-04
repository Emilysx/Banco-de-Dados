-- Exercicios de Outros Joins - 04/11/2025
-- Emily Gabrielle Oliveira, 2DSTB - 18
USE biblioteca_joins;

-- Exercicio 1
SELECT emprestimos.id_emprestimo, leitores.nome_leitor AS Nome_Leitor, livros.titulo AS Titulo
FROM emprestimos
INNER JOIN livros ON livros.id_livro = emprestimos.id_livro
INNER JOIN emprestimos_leitores ON emprestimos.id_emprestimo = emprestimos_leitores.id_emprestimo
INNER JOIN leitores ON emprestimos_leitores.id_leitor = leitores.id_leitor;

-- Exercicio 2
SELECT livros.titulo, autores.nome_autor
FROM livros
LEFT JOIN autores ON autores.id_autor = livros.id_autor;

-- Exercicio 3
SELECT autores.nome_autor, livros.titulo
FROM autores
RIGHT JOIN livros ON livros.id_autor = autores.id_autor;

-- Exercicio 4
SELECT livros.titulo, editoras.nome_editora
FROM livros
LEFT JOIN editoras ON editoras.id_editora = livros.id_editora
UNION
SELECT livros.titulo, editoras.nome_editora
FROM livros
RIGHT JOIN editoras ON livros.id_editora = editoras.id_editora;

-- Exercicio 5
SELECT leitores.nome_leitor, livros.titulo
FROM livros
CROSS JOIN leitores;

-- Exercicio 6
SELECT autores.nome_autor AS Nome
FROM autores
UNION
SELECT editoras.nome_editora as Nome
FROM editoras;

-- Exercicio 7
SELECT emprestimos.id_emprestimo, livros.titulo
FROM emprestimos
LEFT JOIN livros ON emprestimos.id_livro = livros.id_livro;

-- Exercicio 8
SELECT emprestimos.id_emprestimo, leitores.nome_leitor
FROM emprestimos
INNER JOIN emprestimos_leitores ON emprestimos_leitores.id_emprestimo = emprestimos.id_emprestimo
INNER JOIN leitores ON leitores.id_leitor = emprestimos_leitores.id_leitor;

-- Exercicio 9
SELECT editoras.nome_editora, livros.titulo
FROM livros
RIGHT JOIN editoras ON livros.id_editora = editoras.id_editora;

-- Exercicio 10
SELECT leitores.nome_leitor, livros.titulo
FROM leitores
LEFT JOIN emprestimos_leitores ON emprestimos_leitores.id_leitor = leitores.id_leitor
LEFT JOIN emprestimos ON emprestimos.id_emprestimo = emprestimos_leitores.id_emprestimo
LEFT JOIN livros ON livros.id_livro = emprestimos.id_livro;

-- Exercicio 11
SELECT autores.nome_autor, livros.titulo
FROM autores
LEFT JOIN livros ON autores.id_autor = livros.id_autor;
