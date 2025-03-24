SHOW DATABASES;
use mysql
CREATE DATABASE banco_ecommerce;
CREATE DATABASE banco_ecom;
USE banco_ecom;


-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT primary key not null,
    Pnome VARCHAR(10),
    CPF CHAR(11) not null,
    Endereco VARCHAR(45),
    Numero_Inicial VARCHAR(3),
    Sobrenome VARCHAR(28),
    Data_de_Nascimento DATE,
    CNPJ CHAR(14),
    Razão Social VARCHAR (45),
    Telefone VARCHAR(14),
    CEP VARCHAR(9),
    Pagamento_idPagamento INT,
    Constraint unique_CPF_cliente unique cpf,
    Constraint unique_CNPJ_cliente unique cnpj
    );
    alter talbe cliente auto_increment=1;
    insert into cliente (Nome, Sobrenome, CPF, Endereço)
    values ('Maria', 'Silva', 12346789, 'rua silva de prata 290, carangola - cidade das flores'),
		 ('Matheus', 'Pimentel', 98754321, 'rua alameda 289, centro - cidade das flores'),
         ('Ricardo', 'Silva', 45678913, 'avenida alameda vinha 1009, centro, cidade das flores'),
         ('Julia', 'frança', 7891234546, 'rua laranjeiras 861, centro -  cidade das flores'),
         ('Roberta', 'assis', 9875631, 'avenida koller 19, centro - cidade das flores'),
         ('isabela', 'cruz', 654789123, 'rua alameda das flores 28, centro - cidade das flores');
         
         
    
    
    CREATE TABLE Produto (
  SKU INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Produto VARCHAR(45) not null,
    Valor_Unitario INT,
    Categoria VARCHAR(45),
    Descricao VARCHAR(45)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY AUTO_INCREMENT,
    Cartao_Credito VARCHAR(45),
    Cartao_Debito VARCHAR(45),
    PIX INT,
    Boleto INT,
    Pedido_idPedido INT
);

-- Tabela Cartão
CREATE TABLE Cartao (
    idCartao INT PRIMARY KEY AUTO_INCREMENT,
    Numero_Cartao INT,
    Nome VARCHAR(45),
    Data_Validade DATE,
    CVV VARCHAR(3),
    Pagamento_idPagamento INT
);

-- Tabela Boleto
CREATE TABLE Boleto (
    idBoleto INT PRIMARY KEY AUTO_INCREMENT,
    Codigo_Barras INT,
    Pagamento_idPagamento INT
);


-- Tabela Pedido de Compra
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT primary key not null,
    Frete INT,
    Entrega int,
    Valor total int,
    Forma de pagamento int,
    constraint fk_cliente foreign key (idCliente) references cliente (idCliente)
    );


    
-- Tabela Estoque
CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    Produto_SKU INT,
    Quantidade INT,
    Categoria VARCHAR(45),
    FOREIGN KEY (Produto_SKU) REFERENCES Produto(SKU)
);


-- Tabela Estoque
CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    Produto_SKU INT,
    Quantidade INT,
    Categoria VARCHAR(45),
    FOREIGN KEY (Produto_SKU) REFERENCES Produto(SKU)
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY,
    Razao_Social VARCHAR(45) not null,
    Endereco VARCHAR(45) not null,
    Telefone CHAR(11) not null,
    CNPJ CHAR(14) not null
    constraint unique_fornecedor unique (CNPJ)
);

-- Tabela Pedido
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    Cliente_idCliente INT,
    Frete INT,
    Entrega VARCHAR(45),
    Valor_Total INT,
    Forma_de_Pagamento INT
);

-- Tabela Entrega
CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY AUTO_INCREMENT,
    Rastreio INT,
    Transportadora VARCHAR(45),
    Status_Entrega VARCHAR(45),
    Pedido_idPedido INT,
    Pedido_Cliente_idCliente INT
);

-- Tabela Produto
CREATE TABLE Produto (
    SKU INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Produto VARCHAR(45),
    Valor_Unitario INT,
    Categoria VARCHAR(45),
    Descricao VARCHAR(45)
);

-- Tabela Produtos do Pedido
CREATE TABLE Produtos_do_pedido (
    idPedido INT,
    Produto_SKU INT,
    Quantidade INT,
    PRIMARY KEY (idPedido, Produto_SKU),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Produto_SKU) REFERENCES Produto(SKU)
);



    
