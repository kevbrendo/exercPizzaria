create database pizzaria1;

use pizzaria1;

create table embalagens (
    embalagem_id int primary key auto_increment,
    material varchar(50),
    tamanho varchar(50),
    preco decimal(10,2)
);

create table receitas (
    receitas_id int primary key auto_increment,
    instrucoes varchar(200),
    autor varchar(100)
);

create table pizzas  (
	pizza_id int primary key auto_increment,
    sabor varchar(60),
    preco decimal(10,2),
    descricao varchar(50),
    tamanho varchar(50),
    ingredientes varchar(50),

    pizza_embalagem_id int,
    pizza_receita_id int,
    constraint fk_embalagens foreign key(pizza_embalagem_id) references embalagens(embalagem_id),
    constraint fk_receitas foreign key(pizza_receita_id) references receitas(receitas_id)
);

create table pizza_pizzaiolo (
    pp_pizza_id int references pizzas(pizza_id),
    pp_pizzaiolo_id int references pizzaiolos(pizzaiolo_id),

    primary key (pp_pizza_id, pp_pizzaiolo_id)
);

create table pizzaiolos (
	pizzaiolo_id int primary key auto_increment,
    nome varchar(50),
    salario varchar(50)
);

-- Inserts:
INSERT INTO embalagens (material, tamanho, preco) VALUES
('Papelão', 'Pequeno', 1.99),
('Plástico', 'Médio', 2.49),
('Papel', 'Grande', 2.99),
('Madeira', 'Pequeno', 3.99),
('Alumínio', 'Médio', 4.49),
('Vidro', 'Grande', 4.99),
('Plástico', 'Pequeno', 1.99),
('Papelão', 'Médio', 2.49),
('Madeira', 'Grande', 3.99),
('Vidro', 'Pequeno', 2.99),
('Alumínio', 'Médio', 4.49),
('Papel', 'Grande', 4.99),
('Madeira', 'Pequeno', 3.99),
('Papelão', 'Médio', 2.49),
('Plástico', 'Grande', 4.99),
('Alumínio', 'Pequeno', 1.99),
('Papel', 'Médio', 2.99),
('Vidro', 'Grande', 3.99),
('Plástico', 'Pequeno', 1.99),
('Madeira', 'Médio', 4.49);

INSERT INTO receitas (instrucoes, autor) VALUES
('Misture a farinha, água e sal.', 'Chef Maria'),
('Adicione o molho de tomate e o queijo.', 'Chef João'),
('Prepare a massa e deixe descansar por 30 minutos.', 'Chef Carlos'),
('Corte os ingredientes em pedaços pequenos.', 'Chef Ana'),
('Asse a pizza a 200°C por 15 minutos.', 'Chef Laura'),
('Adicione o azeite e o orégano.', 'Chef André'),
('Faça uma massa fina e crocante.', 'Chef Pedro'),
('Use ingredientes frescos e de alta qualidade.', 'Chef Sofia'),
('Cozinhe em forno a lenha por um sabor autêntico.', 'Chef Lucas'),
('Misture o molho de tomate com ervas e especiarias.', 'Chef Julia'),
('Adicione um toque de pimenta para um sabor picante.', 'Chef Miguel'),
('Decore com folhas de manjericão.', 'Chef Isabela'),
('Adicione presunto e cogumelos para uma pizza clássica.', 'Chef Mateus'),
('Inove com ingredientes como abacaxi e frango.', 'Chef Beatriz'),
('Experimente uma pizza vegetariana com legumes variados.', 'Chef Rodrigo'),
('Prepare uma pizza de pepperoni bem apimentada.', 'Chef Carolina'),
('Combine queijo de cabra com figos para um sabor sofisticado.', 'Chef Rafael'),
('Faça uma pizza de quatro queijos com variedade de queijos.', 'Chef Mariana'),
('Adicione camarões e molho de alho para uma pizza de frutos do mar.', 'Chef Gustavo'),
('Experimente uma pizza de chocolate com morangos para a sobremesa.', 'Chef Gabriela');


INSERT INTO pizzaiolos (nome, salario) VALUES
('João Silva', '2000.00'),
('Maria Santos', '1800.00'),
('Carlos Souza', '2200.00'),
('Ana Pereira', '1900.00'),
('Laura Ferreira', '2100.00'),
('André Rodrigues', '1950.00'),
('Pedro Oliveira', '2050.00'),
('Sofia Almeida', '2250.00'),
('Lucas Pereira', '1980.00'),
('Julia Costa', '2050.00'),
('Miguel Carvalho', '2100.00'),
('Isabela Santos', '1850.00'),
('Mateus Ribeiro', '2150.00'),
('Beatriz Lima', '1900.00'),
('Rodrigo Gomes', '2000.00'),
('Carolina Vieira', '2150.00'),
('Rafael Fonseca', '2100.00'),
('Mariana Torres', '1950.00'),
('Gustavo Mendes', '2200.00'),
('Gabriela Cunha', '1800.00');

INSERT INTO pizzas (sabor, preco, descricao, tamanho, ingredientes, pizza_embalagem_id, pizza_receita_id) VALUES
('Margarita', '12.99', 'Pizza clássica com molho de tomate e queijo', 'Média', 'Queijo, molho de tomate', 1, 1),
('Pepperoni', '14.99', 'Pizza de pepperoni apimentada', 'Grande', 'Pepperoni, queijo, molho de tomate', 2, 2),
('Calabresa', '13.99', 'Pizza de calabresa com cebola', 'Média', 'Calabresa, cebola, queijo, molho de tomate', 3, 3),
('Frango com Catupiry', '15.99', 'Pizza de frango com catupiry', 'Grande', 'Frango, catupiry, queijo, molho de tomate', 4, 4),
('Vegetariana', '14.99', 'Pizza vegetariana com legumes variados', 'Média', 'Legumes variados, queijo, molho de tomate', 5, 5),
('Quatro Queijos', '15.99', 'Pizza de quatro queijos', 'Grande', 'Queijo, molho de tomate', 6, 6),
('Portuguesa', '14.99', 'Pizza portuguesa com presunto e ovos', 'Média', 'Presunto, ovos, queijo, molho de tomate', 7, 7),
('Chocolate com Morango', '12.99', 'Pizza de chocolate com morangos', 'Grande', 'Chocolate, morangos', 8, 8),
('Frutos do Mar', '16.99', 'Pizza de frutos do mar com camarões', 'Média', 'Camarões, molho de alho, queijo, molho de tomate', 9, 9);


-- Relatório 1: Todas as pizzas e os pizzaiolos aptos a produzi-las:

SELECT
    p.sabor AS "Sabor da Pizza",
    pz.nome AS "Nome do Pizzaiolo",
    pz.salario AS "Salário do Pizzaiolo"
FROM
    pizzas p
INNER JOIN
    pizza_pizzaiolo pp ON p.pizza_id = pp.pp_pizza_id
INNER JOIN
    pizzaiolos pz ON pp.pp_pizzaiolo_id = pz.pizzaiolo_id;

-- Relatório 2: Todas as pizzas e seus ingredientes:

SELECT
    p.sabor AS "Sabor da Pizza",
    p.ingredientes AS "Ingredientes da Pizza"
FROM
    pizzas p;

-- Relatório 3: Todos os ingredientes e as pizzas onde são utilizados:

SELECT
    e.material AS "Ingrediente",
    p.sabor AS "Pizza que Utiliza"
FROM
    embalagens e
INNER JOIN
    pizzas p ON e.embalagem_id = p.pizza_embalagem_id
UNION
SELECT
    r.instrucoes AS "Ingrediente",
    p.sabor AS "Pizza que Utiliza"
FROM
    receitas r
INNER JOIN
    pizzas p ON r.receitas_id = p.pizza_receita_id;


-- Relatório 4: Sabores de todas as pizzas, nome dos pizzaiolos que as fazem e instruções para produzi-las:

SELECT
    p.sabor AS "Sabor da Pizza",
    pz.nome AS "Nome do Pizzaiolo",
    r.instrucoes AS "Instruções de Produção"
FROM
    pizzas p
INNER JOIN
    pizza_pizzaiolo pp ON p.pizza_id = pp.pp_pizza_id
INNER JOIN
    pizzaiolos pz ON pp.pp_pizzaiolo_id = pz.pizzaiolo_id
INNER JOIN
    receitas r ON p.pizza_receita_id = r.receitas_id;



