-- Atividade 14/10/2025 - Inner Join
USE biblioteca_emily;

SELECT livro.titulo, autor.nome, categoria.nome, usuario.nome, emprestimo.data_emprestimo, emprestimo.data_devol_limite
FROM livro
-- Nome do autor
INNER JOIN livro_autor ON livro.id_livro = livro_autor.id_livro
INNER JOIN autor ON autor.id_autor = livro_autor.id_autor

-- Categoria do livro
INNER JOIN livro_categoria ON livro.id_livro = livro_categoria.id_livro
INNER JOIN categoria ON categoria.id_categoria = livro_categoria.id_categoria

-- Nome do usuario
INNER JOIN emprestimo ON emprestimo.id_livro = livro.id_livro
INNER JOIN usuario ON usuario.id_usuario = emprestimo.id_usuario;



