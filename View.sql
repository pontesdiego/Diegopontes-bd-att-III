-- VIEW

create database view;

 -- 1. Crie uma view chamada "vw_funcionarios_departamento" que mostre o nome e cargo de todos os funcionários do departamento "Administrativo".
 
 Create table view.Funcionarios(
 ID int primary key auto_increment,
 Nome varchar(255)
 );
 
 insert into view.Funcionarios(Nome)
 Values("Carlos");
 
  insert into view.Funcionarios(Nome)
 Values("Jaca");
 
  insert into view.Funcionarios(Nome)
 Values("Diego");
 
 Create table view.Departamento(
 ID int primary key auto_increment,
 Cargo Varchar(255) not null,
 Id_Funcionarios int,
 foreign key (Id_Funcionarios) references view.Funcionarios(ID)
 );
 
 insert into view.Departamento(Cargo,Id_Funcionarios)
 Values('Administrativo',1);
 
insert into view.Departamento(Cargo,Id_Funcionarios)
 Values('Financeiro',2);
 
  insert into view.Departamento(Cargo,Id_Funcionarios)
 Values('Administrativo',3);
 
 Create view view.vw_funcionarios_departamento as
 select 
 F.Nome,
 D.Cargo
 From view.Funcionarios F
 inner join view.Departamento D
  on F.ID = Id_Funcionarios
  where D.Cargo='Administrativo';
 
 
 SELECT * FROM view.vw_funcionarios_departamento;
 
  -- drop view view.vw_funcionarios_departamento;
 -- select * from view.Funcionarios;
 -- select  * from view.Departamento; 
 -- drop database view;
 

-- 2. Crie uma view chamada "vw_estoque_insuficiente" que mostre os produtos com quantidade em estoque abaixo de 5 produtos.

 Create table view.Produtos(
 ID int primary key auto_increment,
 Nome varchar(255) not null,
 Estoque int
 );
 
 insert into view.Produtos(Nome,Estoque)
 Values("Herbissimo",3);
 
  insert into view.Produtos(Nome,Estoque)
 Values("Bola",50);
 
  insert into view.Produtos(Nome,Estoque)
 Values("Feijao",7);
 
 Create View view.vw_estoque_insuficiente as
 select Nome,Estoque
 From view.Produtos
 where Estoque < 5;
 
 Select * from view.vw_estoque_insuficiente;
 
 
-- 3. Crie uma view chamada "vw_relacionamento_cliente_vendedor" que mostre o relacionamento entre um cliente e o vendedor que o atendeu.

CREATE TABLE view.Clientes(
Id int primary key auto_increment,
Nome varchar(255) not null,
DataNascimento date not null,
Telefone varchar(22) not null,
IDVendedor int,
foreign key (IDVendedor) references Vendedor(Id)
);

CREATE TABLE view.Vendedor(
Id int primary key auto_increment,
Nome varchar(255) not null,
Produto varchar(255)
);

insert into view.Clientes(Nome,DataNascimento,Telefone,IDVendedor)
Values("Diego","2003-06-06","(71) 93456-8926",1);

insert into view.Clientes(Nome,DataNascimento,Telefone,IDVendedor)
 Values("Ricardo","2000-07-13","(71) 98752-7867",2);
 
insert into view.Clientes(Nome,DataNascimento,Telefone,IDVendedor)
Values("Carlos","2005-04-30","(71) 66666-6666",3);

insert into view.Vendedor(Nome,Produto)
 Values("Arthur","Bermuda");
 
 insert into view.Vendedor(Nome,Produto)
 Values("Matheus","Camisa");
 
 insert into view.Vendedor(Nome,Produto)
 Values("Lima","GTA V");
 
 

 Create view view.vw_relacionamento_cliente_vendedor as
 select 
 C.Nome AS "Nome do Cliente",
 C.DataNascimento as "Data de Nascimento do Cliente",
 C.Telefone as "Telefone do Cliente",
 V.Nome as "Nome do Vendedor",
 V.Produto as "Produto do Vendedor"
 From view.Vendedor V
 inner join view.Clientes C 
on V.Id = C.IDVendedor;

select * from view.vw_relacionamento_cliente_vendedor;







-- 4. Crie uma view chamada "vw_produtos_caros" que mostre apenas os produtos com preço acima de R$ 100.

 Create table view.Produtos_Preco(
 ID int primary key auto_increment,
 Nome varchar(255) not null,
 Preco float
 );
 
 insert into view.Produtos_Preco(Nome,Preco)
 Values("Guarana ",3.00);
 
  insert into view.Produtos_Preco(Nome,Preco)
 Values("Pes 2024",150.00);
 
 insert into view.Produtos_Preco(Nome,Preco)
 Values("FIFA 23",235.00);
 
 Create View view.vw_produtos_caros as
 select Nome,Preco
 From view.Produtos_Preco
 where Preco > 100;
 
 Select * from view.vw_produtos_caros;
 
 -- 5. Crie uma view chamada "vw_pedidos_pendentes" que mostre os pedidos que ainda não foram entregues com status de "Pendente".

 Create table view.Pedidos(
 ID int primary key auto_increment,
 Nome varchar(255) not null,
 Status varchar(255) not null
 );
 
 insert into view.Pedidos(Nome,Status)
 Values("Sofa","Pendente");
 
insert into view.Pedidos(Nome,Status)
 Values("PlayStation ","Entregue");
 
 insert into view.Pedidos(Nome,Status)
 Values("Perfume","Entregue");
 
 Create View view.vw_pedidos_pendentes as
 select Nome,Status
 From view.Pedidos
 where Status = "Pendente";
 
 Select * from view.vw_pedidos_pendentes;