/*
O Banco Central de Financiamentos perdeu vários registros após uma falha no servidor que ocorreu no mês de Outubro. 
As datas de cobrança das parcelas foram perdidas. 
Porém uma cópia de segurança foi encontrada contendo as informações sobre as datas de pagamento das parcelas dos clientes.
Por tanto, o Banco pede a sua ajuda para selecionar os nomes e o dia do mês que cada cliente deve pagar sua parcela.
OBS: Obrigatoriamente o dia do mês precisa ser um inteiro.
*/

CREATE TABLE loan(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  value NUMERIC,
  payday TIMESTAMP
 );

INSERT INTO loan(id, name, value, payday)
VALUES
  (1, 'Cristian Ghyprievy', 3000.50, '2017-10-19'),
  (2, 'John Serial', 10000, '2017-10-10'),
  (3, 'Michael Seven', 5000.40, '2017-10-17'),
  (4, 'Joana Cabel', 2000, '2017-10-05'),
  (5, 'Miguel Santos', 4050, '2017-10-20');

/*
SELECT 
  name, cast(extract(day FROM payday) AS INTEGER) AS day
FROM loan