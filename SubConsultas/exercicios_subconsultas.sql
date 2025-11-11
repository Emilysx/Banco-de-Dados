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

-- Exericio 4

-- Exericio 5

-- Exericio 6

-- Exericio 7

-- Exericio 8

-- Exericio 9

-- Exericio 10

-- Exericio 11

