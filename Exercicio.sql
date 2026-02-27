use ecommerce;
-- ================================================= I N I C I A N T E =================================================
-- 1.	Liste todos os clientes cadastrados.
select * from clients;

-- 2.	Mostre apenas o nome e o sobrenome dos clientes.
desc clients;
select Fname, Lname from clients;

-- 3.	Liste todos os produtos da categoria Eletrônico.
show tables;
select * from product where category ='Eletrônico';

-- 4.	Mostre todos os pedidos com status Confirmado.
select * from orders where orderStatus = 'Confirmado';

-- 5.	Liste os produtos com avaliação maior que 4.
desc product;
select * from product where avaliacao > 4;

-- 6.	Mostre os produtos ordenados pela avaliação do maior para o menor.
select * from product order by avaliacao desc;

-- 7.	Liste os clientes que moram em Belo Horizonte.
select * from clients where Address Like'%Belo Horizonte';

-- 8.	Mostre o nome do produto e sua categoria.
desc product;
select Pname, category from product;

-- 9.	Liste todos os fornecedores cadastrados.
desc suppliers;
select * from supplier;

-- 10.	Mostre todos os pedidos com valor de frete maior que 20.
desc orders;
select * from orders where sendValue > 20;

-- ============================================ I N T E R M E D I Á R I O ===========================================
-- 11.	Mostre o nome do cliente e o status do pedido.
desc clients ;-- Fname, Lname , idClient
desc orders; -- orderStatus, idOrderClient
select concat(c.Fname, ' ', c.Lname)as Complete_name, orderStatus from clients c 
	inner join orders o on c.idClient = o.idOrderClient;
    
-- 12.	Liste o nome do cliente e a descrição do pedido.
desc clients;
desc orders;
select concat(c.Fname, ' ', c.Lname)as Complete_name, orderDescription from clients c
	inner join orders o on c.idClient = o.idOrderClient;

-- 13.	Mostre todos os produtos e suas quantidades em estoque.
show tables;
desc productOrder; -- poQuantity, idPOproduct
desc product; -- idProduct, Pname
select p.Pname, po.poQuantity as Quantity from product p
	inner join productOrder po on po.idPOproduct = p.idProduct;

-- 14.	Liste os vendedores e os produtos que eles vendem.
show tables;
desc seller; -- idSeller, SocialName
desc productseller; -- idPSeller, idProduct
desc product; -- idProduct, Pname
select s.SocialName, p.Pname from seller s
	inner join productseller ps on s.idSeller = ps.idPSeller
    inner join product p using(idProduct);
    
-- 15.	Mostre todos os pedidos com o nome do produto.
desc product; -- Pname, idProduct
show tables;
desc productorder; -- idPOproduct, idPOrder
desc orders; -- idOrder
select p.Pname from product p 
	inner join productorder po on po.idPOproduct = p.idProduct
    inner join orders o on o.idOrder = po.idPOrder;
    
-- 16.	Conte quantos clientes existem.
select count(*) as Total_clients from clients;

-- 17.	Calcule a média de avaliação dos produtos.
desc product; -- avaliacao
select round(avg(avaliacao),2) as media_das_avaliações from product; 

-- 18.	Mostre o produto com maior avaliação.
select max(avaliacao) maior_avaliação from product;

-- 19.	Mostre o produto com menor avaliação.
select min(avaliacao) menor_avaliação from product;

-- 20.	Liste quantos pedidos cada cliente fez.
desc orders; -- idOrderClient
select count(idOrderClient) Total_pedidos from orders;

-- ============================================ A V A N Ç A D O ===========================================
-- 21.	Mostre os clientes que fizeram mais de um pedido.
desc orders; -- idOrderClient
desc clients; -- idClient, Fname
select o.idOrderClient, c.Fname from clients c
	inner join orders o on o.idOrderClient = c.idClient
    group by o.idOrderClient, c.Fname
    having count(*)>1;

-- 22.	Mostre o total de produtos vendidos por cada vendedor.
show tables;
select * from productseller; -- idPseller, prodQuantity
desc seller; -- idSeller
select s.SocialName, sum(prodQuantity) as Produtos_vendidos from productseller prod
	inner join seller s on s.idSeller = prod.idPseller
	group by s.SocialName    ;

-- 23.	Mostre o total de pedidos por status.
show tables;
desc productorder; -- poStatus, idPOrder
desc orders; -- idOrder, orderStatus
select orderStatus, count(idOrder) as Total_pedido from orders o
	inner join productorder p on p.idPOrder = o.idOrder
    group by orderStatus;
    
-- 24.	Mostre o valor médio do frete dos pedidos.
show tables;
select avg(sendValue) as Valor_medio from orders;

-- 25.	Mostre o nome do cliente que fez o pedido com maior valor de frete.
show tables;
desc clients; -- Fname, idClient
select * from clients;
desc orders; -- sendValue, idOrderClient
select * from orders;

select concat(c.Fname, ' ', Lname) as Name_Complete, sendValue as Frete from clients c
	inner join orders o on o.idOrderClient = c.idCLient
	order by sendValue;
    
-- 26.	Liste os produtos que nunca foram pedidos.
show tables;
select * from product; -- idProduct
select * from productorder; -- idPOproduct
select Pname from product p
    left join productorder po on po.idPOproduct = p.idProduct
    where po.idPOproduct is null;
    
-- 27.	Liste os clientes que nunca fizeram pedidos.
desc clients; -- idClient, Fname
show tables;
desc orders; -- idOrderClient, idOrder
select c.Fname from clients c 
	left join orders o on o.idOrderClient = c.idClient
    where idOrder is null;
    
-- 28.	Mostre o produto mais vendido.
show tables;
desc productorder; -- idPOrder, idPOproduct, poQuantity
select * from productorder;
desc product; -- idProduct, Pname
select * from product;
select p.Pname, sum(poQuantity) as Total from product p 
	join productorder po on  po.idPOproduct = p.idProduct
    group by p.Pname
    order by Total desc
    Limit 1;
    

    
    
    

