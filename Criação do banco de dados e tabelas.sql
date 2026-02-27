-- Criação do banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

-- criar tabela cliente 
create table clients(
	  idClient int auto_increment primary key,
    Fname varchar(10),
	  Minit char (3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(45),
    constraint unique_cpf_client unique(CPF)
);
-- criar tabela produto 
create table product (
	  idProduct int auto_increment primary key,
    Pname varchar(10),
    classification_kids bool default false,
    category enum('Eletrônico', 'Vestimentas', 'Alimentos','Móveis') not null,
    avaliacao float default 0,
    size varchar(10)
);

-- criar tabela pedido 
create table orders(
	  idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado', 'Confirmado','Em processamento') not null default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    idPayment int,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
		on update cascade
);
-- criar tabela de pagamento
create table payments(
	  idClient int,
    idPayment int,
    typePayment enum('Boleto','Cartão','Dois cartões'),
    limiteAvailable float,
    primary key(idclient,idpayment)
);

-- criar tabela estoque
create table productStorage (
	  idProductStorage int auto_increment primary key,
    storageLocation varchar (255),
    quantity int default 0
);

-- criar tabela fornecedor
create table supplier (
	  idSuppleir int auto_increment primary key,
    SocialName varchar (255) not null,
    CNPJ char(15) not null,
    contact char(11) not null, 
    constraint unique_supplier unique (CNPJ)
);

-- criar tabela vendedor
create table seller (
	  idSeller int auto_increment primary key,
    SocialName varchar (255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(9),
	location varchar(255),
    contact char(11) not null, 
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

-- criar a tabela produtos-vendedor
create table productSeller(
	  idPSeller int,
    idProduct int,
	  prodQuantity int default 1,
    primary key(idPSeller, idProduct),
    constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

-- criar a tabela produto fornecedor
create table productOrder(
	  idPOrder int,
    idPOproduct int,
    poQuantity int default 1,
    poStatus enum('Disponível','Sem estoque') default 'Disponível',
    primary key(idPOrder, idPOproduct),
    constraint fk_productorder_seller foreign key (idPOrder) references orders(idOrder),
    constraint fk_productorder_product foreign key (idPOproduct) references product(idProduct)
);

-- criar tabela armazenamento
create table storagelocation(
	  idLProduct int,
    idLstorage int,
    location varchar (255) not null,
    primary key(idLProduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLProduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProductStorage)
);	
