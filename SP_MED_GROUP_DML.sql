USE SP_MEDICAL_GROUP;


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

--============== Aplicação de Funções ===============--

SELECT FLOOR(DATEDIFF(DAY, DATA_NASCIMENTO, GETDATE()) / 365.25) FROM PACIENTES


CREATE PROCEDURE MEDICO
@ESPECIALIDADES VARCHAR(100)
AS
BEGIN
SELECT COUNT(*) FROM MEDICOS
INNER JOIN ESPECIALIDADE 
ON MEDICOS.ESPECIALIDADE_ID = ESPECIALIDADE.ID
AND ESPECIALIDADE.NOME = @ESPECIALIDADES
END
EXEC MEDICO 'Psiquiatra'
