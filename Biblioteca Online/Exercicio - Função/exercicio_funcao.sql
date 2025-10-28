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
SELECT datediff(data_devolucao, data_devolucao_limite) AS DiferencaDias, abs(datediff(data_devolucao, data_devolucao_limite)) AS DiferencaAbsoluta
FROM emprestimo
WHERE data_devolucao IS NOT NULL;

-- Exercicio 7
SELECT data_devolucao, data_devolucao_limite
FROM emprestimo
WHERE data_devolucao > 
data_devolucao_limite;