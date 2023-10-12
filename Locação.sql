create database Aluguel_Carro; --tabela de locação de veiculos

--Tabela de carros voltado pra locação dos veiculos 
create table Carros(
	Id int identity(1, 1),
	Modelo varchar(100) not null, 
	Placa varchar(100) not null, 
	Marca varchar(100) not null,
	constraint Carros_Id_pk primary key(Id),
	constraint Carros_Placa unique(Placa),
	constraint Carros_Modelo check(Modelo in('Suv', 'Sedan', 'Hibrido', 'Hatch'));
); 

select * from Carros;  

--Tabela voltado pra cadastro do cliente 
create table Cliente(
	Id_Cliente int identity(1, 1),
	Nome Varchar(100) not null,
	Sexo char(2),
	CNH varchar(100) not null,
	Forma_Pagamento varchar(100),
	constraint Cliente_Id_Cliente_pk primary key(Id_Cliente),
	constraint Cliente_CNH_un unique(CNH)
);

--Aluguel do veiculo, conta com a data de locaçao de inicio até finalização desta locação, foi utilizado uma constraint 
create table Locacao(
	Id_Locacao int identity(1, 1), 
	Data_Locacao datetime not null, 
	Devolucao datetime not null,
	Modelo varchar(100) not null,
	Forma_Pagamento varchar(100) not null,
	Quantidade_Veiculos_Alugados int not null,
	Telefone int,
	Preco numeric constraint Preco_Veiculo check(Preco > 0) --O preço gera uma restrição a determinado valor inserido
	constraint Locacao_Id_Locacao_pk primary key(Id_Locacao),
	constraint Locacao_Quantidade_Veiculos_Alugados_fk foreign key(Quantidade_Veiculos_Alugados) references Locacao(Id_Locacao),
	constraint Locacao_Telefone_fk foreign key(Telefone) references Locacao (Id_Locacao)
);

select * from Carros; --Seleciona a tabela do banco de dados criado

use Aluguel_Carro; --banco de dados criado 

set IDENTITY_INSERT Aluguel_Carro on;

select * from Cliente; 

insert into Cliente ([Id_Cliente], [Nome], [Sexo], [CNH], [Forma_Pagamento]) values (1, 'Cleide', 'F', '3105808097', 'Dinheiro');
