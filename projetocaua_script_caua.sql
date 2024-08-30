/*drop database caixa_colegio;*/

create database caixa_colegio;

use caixa_colegio;

create table conta(
	pk int not null auto_increment, primary key(pk),
	nome varchar(255),
	descricao varchar(255)
);

create table operacao(
	pk int not null auto_increment, primary key(pk),
    nome varchar(255)
);

create table fluxo(
	pk int not null auto_increment, primary key(pk),
	data_fluxo datetime not null,
	descricao varchar(255) not null,
	valor decimal(4) not null,
	conta_fk int not null, foreign key(conta_fk) references conta(pk),
    operacao_fk int not null, foreign key(operacao_fk) references operacao(pk)
);

/*inserts conta*/

insert into conta (nome, descricao) value ("Quadra", "Aluguel Para Futsal em 2024");
insert into conta (nome, descricao) value ("Cantina", "Venda de Salgados em 2024 ");
insert into conta (nome, descricao) value ("Festa", "Fantasia");
insert into conta (nome, descricao) value ("Festa a Fantasia", "Venda de Fichas Para Discoteca em 2024");
insert into conta (nome, descricao) value ("Festa Julina", "Festa Julina realiza em 2024");
insert into conta (nome, descricao) value ("Festa Julina", "compras para comidas da festa julina");

update conta set nome = "Festa a Fantasia", descricao = "Festa a Fantasia realiza em 2024" where pk = 5;

delete from conta where pk = 3;

select * from conta;

/*inserts operacao*/

insert into operacao (nome) value ("Entrada");
insert into operacao (nome) value ("Furto");
insert into operacao (nome) value ("Perca");
insert into operacao (nome) value ("Furto");
insert into operacao (nome) value ("Furto");

update operacao set nome = "Saída" where pk = 2;

delete from operacao where pk = 5;

select * from operacao;

/*inserts fluxo*/

insert into fluxo (data_fluxo, descricao, valor, conta_fk, operacao_fk) value ('2024-07-26 09:18:03', "Venda de Salgados em 2024", '400.00', 2, 1);
insert into fluxo (data_fluxo, descricao, valor, conta_fk, operacao_fk) value ('2024-07-25 18:59:57', "Aluguel da Quadra Para Futsal em 2024", '300.00', 1, 1);
insert into fluxo (data_fluxo, descricao, valor, conta_fk, operacao_fk) value ('2024-07-27 23:20:18', "Venda de Fichas Para a Discoteca em 2024", '4000.00', 4, 1);
insert into fluxo (data_fluxo, descricao, valor, conta_fk, operacao_fk) value ('2024-07-27 23:25:18', "Vendss de Fichas Paaara a Discoteca em 2023", '8000.0000', 1, 1);
insert into fluxo (data_fluxo, descricao, valor, conta_fk, operacao_fk) value ('2024-07-27 23:20:18', "Venda de Fichas Para a Discoteca em 2023", '8000.00', 6, 2);

update fluxo set data_fluxo = '2024-08-09 08:00:00', descricao = "Compras Para comidas para festa a fantasia",  valor = '2500.00', conta_fk = 6, operacao_fk = 2  where pk = 4;

delete from fluxo where pk = 5;

select * from fluxo;