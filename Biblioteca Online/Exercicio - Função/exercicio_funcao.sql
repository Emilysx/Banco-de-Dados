-- Exercicio de Função - 28/10/2025
USE BibliotecaOnline;

-- Exercicio 1 
SELECT nome, year(data_cadastro) as Ano FROM usuario;

-- Exercicio 2
SELECT nome, month(data_nascimento) AS Mês FROM autor;

-- Exercicio 3
SELECT usuario.nome, livro.titulo, emprestimo.data_emprestimo, emprestimo.data_devolucao, datediff(emprestimo.data_devolucao, emprestimo.data_emprestimo) AS DiferencaEntreDias
FROM emprestimo 
JOIN Usuario ON emprestimo.usuario_id = usuario.id
JOIN Livro ON emprestimo.livro_id = livro.id
WHERE emprestimo.data_devolucao IS NOT NULL;

-- Exercicio 4
SELECT livro.titulo, date_format(data_emprestimo, '%d/%m/%y') AS DataFotmadata
FROM emprestimo
JOIN livro ON emprestimo.livro_id = livro.id;

-- Exercicio 5
SELECT data_cadastro, dayname(data_cadastro) AS DiaDaSenama
FROM usuario;

-- Exercicio 6 
SELECT 
	abs(datediff(emprestimo.data_devolucao, emprestimo.data_devolucao_limite)) AS diferenca_absoluta,
	datediff(emprestimo.data_devolucao, emprestimo.data_devolucao_limite) AS diferenca
FROM Emprestimo
JOIN Usuario ON emprestimo.usuario_id = usuario.id
JOIN Livro ON emprestimo.livro_id = livro.id
WHERE emprestimo.data_devolucao IS NOT NULL;

-- Exercicio 7
SELECT ROUND(DATEDIFF(data_devolucao, data_devolucao_limite), 2) AS valor_multa
FROM emprestimo
WHERE data_devolucao > data_devolucao_limite;

-- Exercicio 8
SELECT UPPER(nome)
FROM usuario;

-- Exercicio 9
SELECT LEFT(titulo, 5)
FROM livro;

-- Exercicio 10
SELECT CONCAT(nome, ' - ', email)
FROM usuario;

-- Exercicio 11
SELECT REPLACE(nome, 'a', '@')
FROM autor;

-- Exercicio 12
SELECT titulo, LENGTH(titulo)
FROM livro;

-- Exercicio 13
SELECT COUNT(id)
FROM usuario;

-- Exercicio 14
SELECT AVG(DATEDIFF(data_devolucao, data_emprestimo))
FROM emprestimo
WHERE data_devolucao IS NOT NULL;

-- Exercicio 15
SELECT 
    MIN(DATEDIFF(data_devolucao, data_emprestimo)),
    MAX(DATEDIFF(data_devolucao, data_emprestimo))
FROM emprestimo
WHERE data_devolucao IS NOT NULL;

-- Exercicio 16
SELECT nivel_associacao, COUNT(id)
FROM usuario
GROUP BY nivel_associacao;

-- Exercicio 17
SELECT usuario.nome, COUNT(emprestimo.id)
FROM emprestimo
JOIN usuario ON emprestimo.usuario_id = usuario.id
GROUP BY usuario.nome;

-- Exercicio 18
SELECT MONTH(data_emprestimo), COUNT(id)
FROM emprestimo
GROUP BY MONTH(data_emprestimo);

-- Exercicio 19
SELECT categoria.nome, COUNT(livrocategoria.livro_id)
FROM categoria
JOIN livrocategoria ON categoria.id = livrocategoria.categoria_id
GROUP BY categoria.nome;

-- Exercicio 20
SELECT nivel_associacao, COUNT(id)
FROM usuario
GROUP BY nivel_associacao
HAVING COUNT(id) > 3;

-- Exercicio 21
SELECT usuario.nome, COUNT(emprestimo.id)
FROM emprestimo
JOIN usuario ON emprestimo.usuario_id = usuario.id
GROUP BY usuario.nome
HAVING COUNT(emprestimo.id) > 1;

-- Exercicio 22
SELECT MONTH(data_emprestimo), COUNT(id)
FROM emprestimo
GROUP BY MONTH(data_emprestimo)
HAVING COUNT(id) > 2;

-- Exercicio 23
SELECT categoria.nome, COUNT(livrocategoria.livro_id)
FROM categoria
JOIN livrocategoria ON categoria.id = livrocategoria.categoria_id
GROUP BY categoria.nome
HAVING COUNT(livrocategoria.livro_id) > 1;