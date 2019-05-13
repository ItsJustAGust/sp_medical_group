CREATE DATABASE SP_MEDICAL_GROUP;

USE SP_MEDICAL_GROUP;

CREATE TABLE CLINICA(
	 ID INT IDENTITY PRIMARY KEY
	,ENDERECO VARCHAR(255) NOT NULL
	,HORARIO_DE_FUNCIONAMENTO DATETIME
	,CNPJ VARCHAR(255) NOT NULL
	,RAZAO_SOCIAL VARCHAR(255) NOT NULL
);

CREATE TABLE ESPECIALIDADE(
	 ID INT IDENTITY PRIMARY KEY
	,NOME VARCHAR(100) NOT NULL
);

CREATE TABLE SITUACAO(
	 ID INT IDENTITY PRIMARY KEY
	,NOME VARCHAR(100)
);

CREATE TABLE TIPO_USUARIO(
	 ID INT IDENTITY PRIMARY KEY
	,NOME VARCHAR(50)
);

CREATE TABLE USUARIOS(
	 ID INT IDENTITY PRIMARY KEY
	,TIPO_USUARIO_ID INT FOREIGN KEY REFERENCES TIPO_USUARIO(ID)
	,EMAIL VARCHAR(110) NOT NULL
	,SENHA VARCHAR(110) NOT NULL
);

CREATE TABLE MEDICOS(
	 ID INT IDENTITY PRIMARY KEY
	,NOME VARCHAR(150) NOT NULL
	,CRM BIGINT NOT NULL UNIQUE
	,ESPECIALIDADE_ID INT FOREIGN KEY REFERENCES ESPECIALIDADE(ID)
	,CLINICA_ID INT FOREIGN KEY REFERENCES CLINICA(ID)
	,USUARIO_ID INT FOREIGN KEY REFERENCES USUARIOS(ID)
);


CREATE TABLE PACIENTES(
	 ID INT IDENTITY PRIMARY KEY
	,NOME VARCHAR(110)
	,E_MAIL VARCHAR(110) 
	,TELEFONE VARCHAR(50) 
	,RG BIGINT UNIQUE
	,CPF BIGINT UNIQUE
	,CEP INT
	,DATA_NASCIMENTO DATETIME
	,USUARIO_ID INT FOREIGN KEY REFERENCES USUARIOS(ID)
);

CREATE TABLE CONSULTAS(
	 ID INT IDENTITY PRIMARY KEY
	,PACIENTE_ID INT FOREIGN KEY REFERENCES PACIENTES(ID)
	,MEDICOS_ID INT FOREIGN KEY REFERENCES MEDICOS(ID)
	,DATA_AGENDAMENTO DATETIME 
	,DESCRICAO VARCHAR(255)
	,SITUACAO_ID INT FOREIGN KEY REFERENCES SITUACAO(ID)
);

--==============incerção de dados ===============--

bulk insert CLINICA
FROM 'C:\db\clinica.csv'
	with(
		format = 'csv',
		firstrow = 2, -- primeira linha de dados = 2 
		fieldterminator = ';', -- separador de campos = ';'
		rowterminator = '\n', -- separador de linhas = '\n'
		CODEPAGE = 'ACP', -- codificação dos dados = 'ACP'
		DATAFILETYPE = 'Char' -- tipo do arquivo = 'Char'
	);

select * from CLINICA -- Lista todos os registros da tabela personagens

bulk insert ESPECIALIDADE
FROM 'C:\db\especialidade1.csv'
	with(
		format = 'csv',
		firstrow = 2, -- primeira linha de dados = 2 
		fieldterminator = ';', -- separador de campos = ';'
		rowterminator = '\n', -- separador de linhas = '\n'
		CODEPAGE = 'ACP', -- codificação dos dados = 'ACP'
		DATAFILETYPE = 'Char' -- tipo do arquivo = 'Char'
	);

select * from ESPECIALIDADE -- Lista todos os registros da tabela personagens

bulk insert SITUACAO
FROM 'C:\db\SITUACAO.csv'
	with(
		format = 'csv',
		firstrow = 2, -- primeira linha de dados = 2 
		fieldterminator = ';', -- separador de campos = ';'
		rowterminator = '\n', -- separador de linhas = '\n'
		CODEPAGE = 'ACP', -- codificação dos dados = 'ACP'
		DATAFILETYPE = 'Char' -- tipo do arquivo = 'Char'
	);

select * from SITUACAO -- Lista todos os registros da tabela personagens

bulk insert TIPO_USUARIO
FROM 'C:\db\tipoUsuario.csv'
	with(
		format = 'csv',
		firstrow = 2, -- primeira linha de dados = 2 
		fieldterminator = ';', -- separador de campos = ';'
		rowterminator = '\n', -- separador de linhas = '\n'
		CODEPAGE = 'ACP', -- codificação dos dados = 'ACP'
		DATAFILETYPE = 'Char' -- tipo do arquivo = 'Char'
	);

select * from TIPO_USUARIO -- Lista todos os registros da tabela personagens

bulk insert USUARIOS
FROM 'C:\db\usuario.csv'
	with(
		format = 'csv',
		firstrow = 2, -- primeira linha de dados = 2 
		fieldterminator = ';', -- separador de campos = ';'
		rowterminator = '\n', -- separador de linhas = '\n'
		CODEPAGE = 'ACP', -- codificação dos dados = 'ACP'
		DATAFILETYPE = 'Char' -- tipo do arquivo = 'Char'
	);

select * from USUARIOS -- Lista todos os registros da tabela personagens

bulk insert MEDICOS
FROM 'C:\db\medicos.csv'
	with(
		format = 'csv',
		firstrow = 2, -- primeira linha de dados = 2 
		fieldterminator = ';', -- separador de campos = ';'
		rowterminator = '\n', -- separador de linhas = '\n'
		CODEPAGE = 'ACP', -- codificação dos dados = 'ACP'
		DATAFILETYPE = 'Char' -- tipo do arquivo = 'Char'
	);

select * from MEDICOS -- Lista todos os registros da tabela personagens

bulk insert PACIENTES
FROM 'C:\db\paciente.csv'
	with(
		format = 'csv',
		firstrow = 2, -- primeira linha de dados = 2 
		fieldterminator = ';', -- separador de campos = ';'
		rowterminator = '\n', -- separador de linhas = '\n'
		CODEPAGE = 'ACP', -- codificação dos dados = 'ACP'
		DATAFILETYPE = 'Char' -- tipo do arquivo = 'Char'
	);

select * from PACIENTES -- Lista todos os registros da tabela personagens

bulk insert CONSULTAS
FROM 'C:\db\consultas.csv'
	with(
		format = 'csv',
		firstrow = 2, -- primeira linha de dados = 2 
		fieldterminator = ';', -- separador de campos = ';'
		rowterminator = '\n', -- separador de linhas = '\n'
		CODEPAGE = 'ACP', -- codificação dos dados = 'ACP'
		DATAFILETYPE = 'Char' -- tipo do arquivo = 'Char'
	);

select * from CONSULTAS -- Lista todos os registros da tabela personagens

--============== Aplicação de Views ===============--

SELECT FLOOR(DATEDIFF(DAY, DATA_NASCIMENTO, GETDATE()) / 365.25) FROM PACIENTES