use bd3;

create table vendas (
	id int(11) not null auto_increment,
    nome varchar(200) not null,
    cidade varchar(200) not null,
    primary key(id)
);

create table alugueis (
	id int(11) not null auto_increment,
    nome varchar(200) not null,
    cidade varchar(200) not null,
    primary key(id)
);

-- insert
insert into vendas (nome, cidade) values ('venda 1', 'Rio de Janeiro');
insert into vendas (nome, cidade) values ('venda 2', 'São Paulo');
insert into vendas (nome, cidade) values ('venda 3', 'Rio de Janeiro');

insert into alugueis (nome, cidade) values ('aluguel 1', 'São Paulo');
insert into alugueis (nome, cidade) values ('aluguel 2', 'Belo Horizonte');
insert into alugueis (nome, cidade) values ('aluguel 3', 'Rio de Janeiro');

-- UNION vem com valores não duplicados (tipo distinct)
select cidade from vendas
union
select cidade from alugueis; 

create table inscricoes (
	id int(11) not null auto_increment,
    nome varchar(200) not null,
    cidade varchar(200) not null,
    primary key (id)
);

insert into inscricoes (nome, cidade) values ('André', 'Rio de Janeiro');
insert into inscricoes (nome, cidade) values ('Bruno', 'São Paulo');
insert into inscricoes (nome, cidade) values ('David', 'Rio de Janeiro');
insert into inscricoes (nome, cidade) values ('Wando', 'Recife');
insert into inscricoes (nome, cidade) values ('Paula', 'Belo Horizonte');
insert into inscricoes (nome, cidade) values ('Graciela', 'Rio de Janeiro');
insert into inscricoes (nome, cidade) values ('Renata', 'Vitória');
insert into inscricoes (nome, cidade) values ('Leticia', 'Rio de Janeiro');
insert into inscricoes (nome, cidade) values ('Milena', 'Rio de Janeiro');
insert into inscricoes (nome, cidade) values ('Patrícia', 'São Paulo');

select cidade, count(id)
from inscricoes
group by cidade;

create table vendedores (
	id int(11) not null auto_increment,
    nome varchar(200) not null,
    primary key (id)
);

drop table vendas;

create table vendas (
	id int(11)not null auto_increment,
    nome varchar(200) not null,
    vendedor_id int(11),
    primary key (id),
    foreign key (vendedor_id) references vendedores(id)
);

insert into vendedores (nome) values ('André');
insert into vendedores (nome) values ('Pedro');
insert into vendedores (nome) values ('João');

insert into vendas (nome, vendedor_id) values ('Venda 1', 1);
insert into vendas (nome, vendedor_id) values ('Venda 2', 1);
insert into vendas (nome, vendedor_id) values ('Venda 3', 1);
insert into vendas (nome, vendedor_id) values ('Venda 4', 2);
insert into vendas (nome, vendedor_id) values ('Venda 5', 2);
insert into vendas (nome, vendedor_id) values ('Venda 6', 3);

-- Desejo ordenar os vendedores começando pelo com o maior número de vendas
select vendedores.nome, count(vendas.id) as QuantidadeDeVendas from vendas
inner join vendedores on vendas.vendedor_id = vendedores.id
group by vendedores.nome
order by count(vendas.id) desc;