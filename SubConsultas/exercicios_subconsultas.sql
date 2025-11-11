-- Exercicios de Sub Consultas
USE lojaMarcia;

-- Exercicio 1 WHERE
SELECT nome_produto, preco 
FROM produtos
WHERE id_categoria = (
	SELECT id_categoria
    FROM categorias
    WHERE nome_categoria = "Eletrônicos"
);

-- Exercicio 2 IN e NOT IN

SELECT nome_produto, preco
FROM produtos
WHERE id_fornecedor IN (
	SELECT id_fornecedor
    FROM fornecedores
    WHERE pais = "EUA"
);

-- NOT IN 
SELECT nome_produto, preco
FROM produtos
WHERE id_fornecedor NOT IN (
	SELECT id_fornecedor
    FROM fornecedores
    WHERE pais = "EUA"
);

-- Exercicios ANY e ALL
-- ANY 
SELECT nome_produto, preco
FROM produtos
WHERE preco > ANY (
	SELECT preco 
    FROM produtos
    WHERE id_categoria = 2
);

-- ALL
SELECT nome_produto, preco
FROM produtos
WHERE preco > ALL (
	SELECT preco 
    FROM produtos
    WHERE id_categoria = 2
);

-- Exercicio EXISTS e NOT EXISTS
-- EXISTS
SELECT nome_categoria
FROM categorias
WHERE EXISTS(
	SELECT * 
    FROM produtos
    WHERE produtos.id_categoria = categorias.id_categoria
);

-- NOT EXISTS
SELECT nome_fornecedor
FROM fornecedores
WHERE NOT EXISTS(
	SELECT 1 
    FROM produtos
    WHERE produtos.id_fornecedor = fornecedores.id_fornecedor
);

-- Exercicio FROM 
SELECT Nome_Categoria, Media_Preco_Categoria
	FROM ( SELECT C.Nome_Categoria,
    AVG(P.Preco) AS Media_Preco_Categoria
    FROM Produtos AS P
    JOIN Categorias AS C ON P.ID_Categoria = C.ID_Categoria
    GROUP BY C.Nome_Categoria ) 
	AS Tabela_Medias WHERE Media_Preco_Categoria > 100;


-- Exercicio 
-- SELECT
SELECT Nome_Categoria, (
	SELECT COUNT(*)
    FROM Produtos
    WHERE Produtos.ID_Categoria = Categorias.ID_Categoria )
    AS Quantidade_Produtos FROM Categorias;
 