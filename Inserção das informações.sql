use ecommerce;

-- =========================
-- CLIENTES
-- =========================
insert into clients (Fname, Minit, Lname, CPF, Address) values
('Ana', 'M', 'Silva', '12345678901', 'Rua A, 123 - Belo Horizonte'),
('Carlos', 'R', 'Souza', '23456789012', 'Av. Brasil, 456 - São Paulo'),
('Juliana', 'P', 'Oliveira', '34567890123', 'Rua das Flores, 789 - Rio'),
('Marcos', 'T', 'Santos', '45678901234', 'Av. Central, 321 - Curitiba'),
('Fernanda', 'L', 'Costa', '56789012345', 'Rua Verde, 654 - Salvador');

-- =========================
-- PRODUTOS
-- =========================
insert into product (Pname, classification_kids, category, avaliacao, size) values
('Notebook', false, 'Eletrônico', 4.5, null),
('Camiseta', false, 'Vestimentas', 4.2, 'M'),
('Chocolate', true, 'Alimentos', 4.8, '200g'),
('Sofá', false, 'Móveis', 4.1, 'Grande'),
('Tablet', false, 'Eletrônico', 4.3, null);

-- =========================
-- PEDIDOS
-- =========================
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash, idPayment) values
(1, 'Confirmado', 'Compra de notebook', 20, false, 1),
(2, 'Em processamento', 'Compra de camiseta', 15, true, 1),
(3, 'Confirmado', 'Compra de chocolate', 10, true, 2),
(4, 'Cancelado', 'Compra de sofá', 50, false, 2),
(5, 'Confirmado', 'Compra de tablet', 25, false, 3);

-- =========================
-- PAGAMENTOS
-- =========================
insert into payments (idClient, idPayment, typePayment, limiteAvailable) values
(1, 1, 'Cartão', 3000),
(2, 1, 'Boleto', 0),
(3, 2, 'Cartão', 1500),
(4, 2, 'Dois cartões', 5000),
(5, 3, 'Cartão', 2000);

-- =========================
-- ESTOQUE
-- =========================
insert into productStorage (storageLocation, quantity) values
('Galpão A', 50),
('Galpão B', 30),
('Galpão C', 100),
('Galpão D', 20),
('Galpão E', 40);

-- =========================
-- FORNECEDORES
-- =========================
insert into supplier (SocialName, CNPJ, contact) values
('Tech Distribuidora', '12345678000101', '31999990001'),
('Moda Brasil', '23456789000102', '31999990002'),
('Alimentos Gerais', '34567890000103', '31999990003'),
('Moveis Prime', '45678901000104', '31999990004'),
('Eletronicos Max', '56789012000105', '31999990005');

-- =========================
-- VENDEDORES
-- =========================
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
('Loja Tech', 'Tech', '11111111000101', null, 'São Paulo', '31988880001'),
('Loja Moda', 'Moda', '22222222000102', null, 'Rio de Janeiro', '31988880002'),
('Loja Food', 'Food', null, '123456789', 'Belo Horizonte', '31988880003'),
('Loja Casa', 'Casa', '33333333000103', null, 'Curitiba', '31988880004'),
('Loja Digital', 'Digital', '44444444000104', null, 'Porto Alegre', '31988880005');

-- =========================
-- PRODUTO POR VENDEDOR
-- =========================
insert into productSeller (idPSeller, idProduct, prodQuantity) values
(1, 1, 10),
(2, 2, 20),
(3, 3, 50),
(4, 4, 5),
(5, 5, 15);

-- =========================
-- RELAÇÃO PEDIDO-PRODUTO
-- =========================
insert into productOrder (idPOrder, idPOproduct, poQuantity, poStatus) values
(1, 1, 1, 'Disponível'),
(2, 2, 2, 'Disponível'),
(3, 3, 5, 'Disponível'),
(4, 4, 1, 'Sem estoque'),
(5, 5, 1, 'Disponível');

-- =========================
-- LOCALIZAÇÃO DO ESTOQUE
-- =========================
insert into storagelocation (idLProduct, idLstorage, location) values
(1, 1, 'Prateleira A1'),
(2, 2, 'Prateleira B1'),
(3, 3, 'Prateleira C1'),
(4, 4, 'Prateleira D1'),
(5, 5, 'Prateleira E1');
