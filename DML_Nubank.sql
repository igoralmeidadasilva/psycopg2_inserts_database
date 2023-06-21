INSERT INTO Cliente
	(cpf_cliente, nome_cliente, data_nascimento, contato_celular, email)
	VALUES ('12345678911', 'Marcelo Soares', '1975-12-01', '28999765409', 'marcelo@coop.com.br');
	
UPDATE Cliente
	SET email= 'marcelo@edu.com.br'
	WHERE cpf_cliente = '12345678911';
	
DELETE FROM Cliente
	WHERE cpf_cliente = '12345678911';
	
SELECT * FROM Cliente;
-- -----------------------------------------------
INSERT INTO Wallet (saldo_wallet, cpf_cliente, cod_wallet)
	VALUES (300.00, '12345678911', 1);
	
UPDATE Wallet
	SET saldo_wallet = 450.00
	WHERE cpf_cliente = '12345678911';
	
DELETE FROM Wallet
	WHERE cpf_cliente = '12345678911';

SELECT * FROM Wallet;
-- -----------------------------------------------
INSERT INTO Criptomoeda(
	nome_cripto, sigla_cripto, valor_atual)
	VALUES ('Bitcoin', 'BTC', 27000);
	
UPDATE Criptomoeda
	SET valor_atual= 30000
	WHERE cod_criptomoeda = 1;
	
DELETE FROM Criptomoeda
	WHERE cod_criptomoeda = 1;
	
SELECT * FROM Criptomoeda;
-- -----------------------------------------------
INSERT INTO Criptos_na_carteira(
	quantidade, cod_criptomoeda, cod_wallet)
	VALUES (45, 1, 1);
	
UPDATE Criptos_na_carteira
	SET quantidade=60
	WHERE cod_criptomoeda = 1 AND cod_wallet = 1;
	
DELETE FROM Criptos_na_carteira
	WHERE cod_criptomoeda = 1 AND cod_wallet = 1;
	
SELECT * FROM Criptos_na_carteira;
-- -----------------------------------------------	
INSERT INTO Trade(
	hash_id, tipo_movimentacao, data_trade, hora_trade)
	VALUES ('476F6E746F207769746820616E2048494420666F72206578616D706C652C476F6','COMPRA', '2023-06-14', '20:00');

SELECT * FROM Trade;
-- -----------------------------------------------	
INSERT INTO Trade_realiza(hash_id, cod_criptomoeda, cod_wallet, cpf_cliente)
	VALUES ('476F6E746F207769746820616E2048494420666F72206578616D706C652C476F6', 1,1, '12345678911');
	
SELECT * FROM Trade_realiza;
	













