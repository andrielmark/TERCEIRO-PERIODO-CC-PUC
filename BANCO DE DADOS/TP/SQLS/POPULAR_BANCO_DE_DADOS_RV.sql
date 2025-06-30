USE `mydb`;

INSERT INTO CONFRARIA (NomeInstitucional, Endereço) VALUES
('Igreja São Vicente de Paulo', 'Rua da Fé, 123, Centro, Rio Vermelho - MG');

INSERT INTO CONFRADE (CPF, Nome, Sobrenome, CONFRARIA_NomeInstitucional) VALUES
('11111111111', 'João', 'Silva', 'Igreja São Vicente de Paulo'),
('22222222222', 'Maria', 'Souza', 'Igreja São Vicente de Paulo'),
('33333333333', 'Carlos', 'Oliveira', 'Igreja São Vicente de Paulo'),
('44444444444', 'Ana', 'Pereira', 'Igreja São Vicente de Paulo');

INSERT INTO MANDATO_PRESIDENCIA (Data_Inicio, Data_Termino, CONFRADE_CPF) VALUES
('2018-01-01', '2019-12-31', '11111111111'),
('2020-01-01', '2021-12-31', '22222222222'),
('2022-01-01', '2023-12-31', '11111111111'),
('2024-01-01', '2025-12-31', '33333333333');

INSERT INTO FUNCIONARIO (CPF, Nome, Sobrenome, Data_Contratacao) VALUES
('55555555555', 'Fernanda', 'Costa', '2020-01-15'),
('66666666666', 'Pedro', 'Santos', '2021-03-20');

INSERT INTO DOADOR (CPF, Nome, Sobrenome, Email, Telefone) VALUES
('77777777777', 'Gabriela', 'Martins', 'gabriela.m@email.com', '31987654321'),
('88888888888', 'Rafael', 'Gomes', 'rafael.g@email.com', '31998765432'),
('99999999999', 'Juliana', 'Almeida', 'juliana.a@email.com', '31976543210'),
('10101010101', 'Lucas', 'Ribeiro', 'lucas.r@email.com', '31981234567'),
('20202020202', 'Patrícia', 'Diniz', 'patricia.d@email.com', '31987659876');

INSERT INTO IDOSO (CPF, Nome, Sobrenome, Data_Nascimento, Beneficio_Mensal, Nome_Familiar, Telefone_Familiar) VALUES
('12121212121', 'Antônio', 'Ferreira', '1935-05-10', 1500.00, 'Marta Ferreira', '31988776655'),
('13131313131', 'Beatriz', 'Lima', '1940-11-20', 1200.00, NULL, NULL),
('14141414141', 'José', 'Carvalho', '1930-01-01', 1800.00, 'Clara Carvalho', '31987651234'),
('15151515151', 'Helena', 'Rocha', '1945-07-25', 1000.00, NULL, NULL),
('16161616161', 'Paulo', 'Sousa', '1938-03-15', 1300.00, 'André Sousa', '31991234567'),
('17171717171', 'Laura', 'Nunes', '1942-09-05', 1100.00, NULL, NULL);

INSERT INTO TRANSACAO (Data, CONFRARIA_NomeInstitucional, IDOSO_CPF, DOADOR_CPF, FUNCIONARIO_CPF) VALUES
('2024-01-10', 'Igreja São Vicente de Paulo', '12121212121', '77777777777', '55555555555'),
('2024-01-15', 'Igreja São Vicente de Paulo', '13131313131', '88888888888', '66666666666'),
('2024-02-01', 'Igreja São Vicente de Paulo', '14141414141', '99999999999', '55555555555'),
('2024-02-10', 'Igreja São Vicente de Paulo', '15151515151', '10101010101', '66666666666'),
('2024-03-05', 'Igreja São Vicente de Paulo', '16161616161', '77777777777', '55555555555'),
('2024-01-20', 'Igreja São Vicente de Paulo', '12121212121', '20202020202', '55555555555'),
('2024-02-25', 'Igreja São Vicente de Paulo', '12121212121', '88888888888', '66666666666'),
('2024-03-15', 'Igreja São Vicente de Paulo', '12121212121', '99999999999', '55555555555'),
('2024-04-01', 'Igreja São Vicente de Paulo', '12121212121', '10101010101', '66666666666'),
('2024-04-10', 'Igreja São Vicente de Paulo', '17171717171', '77777777777', '55555555555');

INSERT INTO DOACAO (Data, TRANSACAO_Id_Transacao) VALUES
('2024-01-10', 1),
('2024-01-15', 2),
('2024-02-01', 3),
('2024-02-10', 4),
('2024-03-05', 5),
('2024-01-20', 6),
('2024-02-25', 7),
('2024-03-15', 8),
('2024-04-01', 9),
('2024-04-10', 10);

INSERT INTO DOACAO_MATERIAL (DOACAO_Id_Doacao, Tipo_Item, Quantidade) VALUES
(1, 'Fraldas G', 20),
(3, 'Alimentos não-perecíveis', 50),
(5, 'Roupas de cama', 10),
(6, 'Material de limpeza', 30),
(8, 'Medicamentos básicos', 15);

INSERT INTO DOACAO_FINANCEIRA (DOACAO_Id_Doacao, Valor, Forma_Pagamento) VALUES
(2, 200.00, 'PIX'),
(4, 150.00, 'Transferência Bancária'),
(7, 500.00, 'Dinheiro em espécie'),
(9, 300.00, 'PIX'),
(10, 100.00, 'Transferência Bancária');
