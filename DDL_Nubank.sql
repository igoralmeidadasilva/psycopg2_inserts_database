DROP TABLE IF EXISTS Criptos_na_carteira;
DROP TABLE IF EXISTS Trade_realizada;
DROP TABLE IF EXISTS Wallet;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Criptomoeda;
DROP TABLE IF EXISTS Trade;

CREATE TABLE Cliente (
    cpf_cliente 	CHAR(11) 	NOT NULL,
    nome_cliente 	VARCHAR 	NOT NULL,
    data_nascimento DATE 		NOT NULL,
    contato_celular CHAR(11) 	NOT NULL,
    email 			VARCHAR 	NOT NULL,
	CONSTRAINT pk_cliente
		PRIMARY KEY(cpf_cliente)
);

CREATE TABLE Wallet (
    cod_wallet 		SERIAL	 	NOT NULL,
    saldo_wallet 	FLOAT 		NOT NULL,
    cpf_cliente 	CHAR(11) 	NOT NULL,
	CONSTRAINT pk_wallet
		PRIMARY KEY (cod_wallet),
	CONSTRAINT fk_wallet_cliente
		FOREIGN KEY (cpf_cliente)
    	REFERENCES Cliente (cpf_cliente)
);

CREATE TABLE Criptomoeda (
    cod_criptomoeda 	SERIAL	 	NOT NULL,
    nome_cripto 		VARCHAR 	NOT NULL,
    sigla_cripto 		CHAR(3) 	NOT NULL,
    valor_atual 		FLOAT 		NOT NULL,
	CONSTRAINT pk_criptomoeda
		PRIMARY KEY(cod_criptomoeda)
);

CREATE TABLE Trade (
    hash_id 			CHAR(65) 	NOT NULL,
    tipo_movimentacao 	VARCHAR 	NOT NULL,
    data_trade 			DATE 		NOT NULL,
    hora_trade 			TIME 		NOT NULL,
	CONSTRAINT pk_trade
		PRIMARY KEY(hash_id)
);

CREATE TABLE Criptos_na_carteira (
    quantidade 			INTEGER 	NOT NULL,
    cod_criptomoeda 	INTEGER 	NOT NULL,
    cod_wallet 			INTEGER 	NOT NULL,
	CONSTRAINT fk_criptos_na_carteira_criptomoeda
		FOREIGN KEY (cod_criptomoeda)
    	REFERENCES Criptomoeda (cod_criptomoeda),
	CONSTRAINT fk_wallet_criptomoeda
		FOREIGN KEY (cod_wallet)
    	REFERENCES Wallet (cod_wallet)
);

CREATE TABLE Trade_realizada (
    hash_id 		CHAR(65) 	NOT NULL,
	cod_criptomoeda INTEGER 	NOT NULL,
	cod_wallet 		INTEGER 	NOT NULL,
	cpf_cliente 	CHAR(11) 	NOT NULL,
	CONSTRAINT fk_trade_realiza_trade
		FOREIGN KEY (hash_id)
    	REFERENCES Trade (hash_id),
	CONSTRAINT fk_trade_realizada_criptomoeda
		FOREIGN KEY (cod_criptomoeda)
    	REFERENCES Criptomoeda (cod_criptomoeda),
	CONSTRAINT fk_trade_realizada_wallet
		FOREIGN KEY (cod_wallet)
    	REFERENCES Wallet (cod_wallet),
	CONSTRAINT fk_trade_realizada_cliente
		FOREIGN KEY (cpf_cliente)
    	REFERENCES Cliente (cpf_cliente)	
);
 
