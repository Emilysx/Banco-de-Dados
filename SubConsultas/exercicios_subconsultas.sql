-- Exercicios de SubConsulta (Lista da Marcia) - 11/11/2025
USE bcd_subconsulta;


-- Exericio 1
SELECT pedidos.id_pedido, pedidos.data_pedido, pedidos.status,
(
	SELECT SUM(itens_pedido.qtde * itens_pedido.preco_unit)
    FROM itens_pedido
    WHERE itens_pedido.id_pedido = pedidos.id_pedido
) AS Total_Pedido
FROM pedidos;

-- Exericio 2
SELECT pedidos.id_pedido, pedidos.data_pedido,
(
	SELECT SUM(itens_pedido.qtde * itens_pedido.preco_unit)
    FROM itens_pedido
    WHERE itens_pedido.id_pedido = pedidos.id_pedido
) AS Total_Pedido
FROM pedidos
WHERE 
(
        SELECT SUM(itens_pedido.qtde * itens_pedido.preco_unit)
        FROM itens_pedido
        WHERE itens_pedido.id_pedido = pedidos.id_pedido
) > (
        SELECT AVG(total_por_pedido)
        FROM (
            SELECT SUM(i2.qtde * i2.preco_unit) AS total_por_pedido
            FROM itens_pedido i2
            GROUP BY i2.id_pedido
        ) AS medias
    );

-- Exericio 3
SELECT id_produto, nome
FROM produtos
WHERE NOT EXISTS (
	SELECT 1
    FROM itens_pedido
	WHERE itens_pedido.id_produto = produtos.id_produto
    );

-- Exericio 4
SELECT id_cliente, nome
FROM clientes
WHERE id_cliente NOT IN (
        SELECT DISTINCT pedidos.id_cliente
        FROM pedidos
        INNER JOIN itens_pedido ON pedidos.id_pedido = itens_pedido.id_pedido
        INNER JOIN produtos ON itens_pedido.id_produto = produtos.id_produto
        INNER JOIN categorias ON produtos.id_categoria = categorias.id_categoria
        WHERE categorias.nome = 'Games'
    );

-- Exericio 5
SELECT id_produto, nome, preco
FROM produtos
WHERE preco >= ALL (
	SELECT preco
	FROM produtos p2
	WHERE p2.id_categoria = produtos .id_categoria
    );
    
-- Exericio 6
SELECT entregas.id_pedido, entregas.prazo_dias
FROM entregas
INNER JOIN pedidos ON entregas.id_pedido = pedidos.id_pedido
WHERE pedidos.status = 'pago' AND entregas.prazo_dias < (
        SELECT AVG(prazo_dias)
        FROM entregas
    );

-- Exericio 7
SELECT produtos.id_produto, produtos.nome, produtos.preco
FROM produtos
WHERE produtos.preco > (
        SELECT AVG(TabelaInterna.preco)
        FROM produtos TabelaInterna
        WHERE TabelaInterna.id_categoria = produtos.id_categoria
    );

-- Exericio 8
SELECT ProdutoTeste.id_produto, ProdutoTeste.nome,
    ( 
		SELECT COUNT(*)
		FROM produtos Comparador
        WHERE Comparador.id_categoria = ProdutoTeste.id_categoria
		AND Comparador.preco > ProdutoTeste.preco
    ) AS qtd_mais_caros
FROM
    produtos ProdutoTeste;
    
SELECT ProdutoTeste.id_produto, ProdutoTeste.nome
FROM produtos ProdutoTeste
WHERE NOT EXISTS (
	SELECT 1
	FROM produtos Comparador
	WHERE Comparador.id_categoria = ProdutoTeste.id_categoria 
	AND Comparador.preco > ProdutoTeste.preco
    );

-- Exericio 9
SELECT id_produto, nome
FROM produtos
WHERE id_produto IN (
	SELECT itens_pedido.id_produto
	FROM itens_pedido
	WHERE itens_pedido.id_pedido IN (
			SELECT pagamentos.id_pedido
			FROM pagamentos
			WHERE pagamentos.status = 'aprovado'
            )
    );
    
-- DESAFIO 1

-- DESAFIO 2

