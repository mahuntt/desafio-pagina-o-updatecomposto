USE master
GO
DROP DATABASE IF EXISTS db_Oficinapag
GO
CREATE DATABASE db_Oficinapag ON PRIMARY (
	NAME = db_Oficinapag,
	FILENAME = 'C:\Workspace\db_Oficinapag.MDF',
	SIZE = 6MB,
	MAXSIZE = UNLIMITED
)
GO
USE db_Oficinapag
GO
DROP TABLE IF EXISTS Pessoa
GO
CREATE TABLE Pessoa (
	ID_Pessoa INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(15) NOT NULL,
	Sobrenome VARCHAR(15) NOT NULL,
	CPF CHAR(14) NOT NULL UNIQUE,
	Whatsapp CHAR(15) NOT NULL,
	Email VARCHAR(35),
	Endereco VARCHAR(50) NOT NULL,
	Num_end INT NOT NULL,
	CEP CHAR(10) NOT NULL,
	Cidade VARCHAR(20) NOT NULL,
	Nascimento DATE NOT NULL
)
GO
DROP TABLE IF EXISTS Cliente
GO
CREATE TABLE Cliente (
	ID_Cliente INT PRIMARY KEY,
	ID_Pessoa INT NOT NULL CONSTRAINT fk_ID_PessoaC FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa
)
GO
DROP TABLE IF EXISTS Cargo
GO
CREATE TABLE Cargo (
	ID_Cargo INT PRIMARY KEY,
	Cargo VARCHAR(25)
)
GO
DROP TABLE IF EXISTS Funcionario
GO
CREATE TABLE Funcionario (
	ID_Funcionario INT PRIMARY KEY,
	Especialidade VARCHAR(20) NOT NULL,
	ID_Pessoa INT NOT NULL CONSTRAINT fk_ID_PessoaF FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa,
	ID_Cargo INT NOT NULL CONSTRAINT fk_ID_Cargo FOREIGN KEY (ID_Cargo) REFERENCES Cargo,
	ID_Func INT CONSTRAINT fk_ID_Funcionario FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario,
	Superior VARCHAR(25)
)
GO
CREATE TABLE Veiculo (
	ID_Veiculo INT PRIMARY KEY,
	Fabricante VARCHAR(15) NOT NULL,
	Modelo VARCHAR(50) NOT NULL,
	Placa CHAR(11) NOT NULL,
	Renavam CHAR(17) NOT NULL,
	Ano CHAR(4),
	Cor VARCHAR(10),
	Observacao VARCHAR(100),
	ID_Cliente INT NOT NULL CONSTRAINT fk_ID_Cliente FOREIGN KEY (ID_Cliente) REFERENCES Cliente
)
GO
DROP TABLE IF EXISTS Orcamento
GO
CREATE TABLE Orcamento (
	ID_Orcamento INT PRIMARY KEY,
	Descricao VARCHAR(100) NOT NULL,
	Quantidade INT NOT NULL,
	Valor MONEY NOT NULL,
	Data_Inicio DATE NOT NULL,
	Data_Termino DATE NOT NULL,
	ID_Veiculo INT NOT NULL CONSTRAINT fk_ID_Veiculo FOREIGN KEY (ID_Veiculo) REFERENCES Veiculo,
	ID_Funcionario INT NOT NULL CONSTRAINT fk_ID_Or_Funcionario FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario
)
GO
DROP TABLE IF EXISTS OrdemServico
GO
CREATE TABLE OrdemServico (
	ID_OS INT PRIMARY KEY,
	Status_OS VARCHAR(20) NOT NULL,
	Data_Entrega DATE NOT NULL,
	Descricao_OS VARCHAR(100) NOT NULL,
	Valor_OS MONEY NOT NULL,
	ID_Orcamento INT NOT NULL CONSTRAINT fk_ID_OS FOREIGN KEY (ID_Orcamento) REFERENCES Orcamento
)
GO
INSERT INTO Pessoa (Nome, Sobrenome, CPF, Whatsapp, Email, Endereco, Num_end, CEP, Cidade, Nascimento)
VALUES
	('Ana', 'Silva', '123.456.789-00', '(11) 99999-0000', 'ana.silva@email.com', 'Rua A', '100', '00000-000', 'São Paulo', '1990-01-01'),
	('Bruno', 'César', '234.567.890-11', '(11) 99999-1111', 'bruno.souza@email.com', 'Rua B', '200', '11111-111', 'Rio de Janeiro', '1995-02-02'),
	('Carla', 'Lima', '345.678.901-22', '(11) 99999-2222', 'carla.lima@email.com', 'Rua C', '300', '22222-222', 'Belo Horizonte', '1980-03-03'),
	('Daniel', 'Costa', '456.789.012-33', '(11) 99999-3333', 'daniel.costa@email.com', 'Rua D', '400', '33333-333', 'Curitiba', '1975-04-04'),
	('Elisa', 'Almeida', '567.890.123-44', '(11) 99999-4444', 'elisa.almeida@email.com', 'Rua E', '500', '44444-444', 'Porto Alegre', '1985-05-05'),
	('Felipe', 'Ribeiro', '678.901.234-55', '(11) 99999-5555', 'felipe.ribeiro@email.com', 'Rua F', '600', '55555-555', 'Recife', '1992-06-06'),
	('Gabriela', 'Fernandes', '789.012.345-66', '(11) 99999-6666', 'gabriela.fernandes@email.com', 'Rua G', '700', '66666-666', 'Salvador', '1987-07-07'),
	('Henrique', 'Pereira', '890.123.456-77', '(11) 99999-7777', 'henrique.pereira@email.com', 'Rua H', '800', '77777-777', 'Fortaleza', '1982-08-08'),
	('Isabela', 'Barbosa', '901.234.567-88', '(11) 99999-8888', 'isabela.barbosa@email.com', 'Rua I', '900', '88888-888', 'Brasília', '1998-09-09'),
	('João', 'Nascimento', '012.345.678-99', '(11) 99999-9999', 'joao.nascimento@email.com', 'Rua J', '1000', '99999-999', 'Manaus', '1989-10-10'),
	('José', 'Santos', '123.456.789-01', '(11) 98888-0000', 'jose.santos@email.com', 'Rua K', '1100', '00000-001', 'São Paulo', '1978-02-04'),
	('Laura', 'Oliveira', '234.567.890-12', '(11) 98888-1111', 'laura.oliveira@email.com', 'Rua L', '1200', '11111-112', 'Rio de Janeiro', '1993-11-11'),
	('Marcos', 'Ramos', '345.678.901-23', '(11) 98888-2222', 'marcos.ramos@email.com', 'Rua M', '1300', '22222-223', 'Belo Horizonte', '1976-12-12'),
	('Natália', 'Silveira', '456.789.012-34', '(11) 98888-3333', 'natalia.silveira@email.com', 'Rua N', '1400', '33333-334', 'Curitiba', '1991-01-13'),
	('Otávio', 'Lopes', '567.890.123-45', '(11) 98888-4444', 'otavio.lopes@email.com', 'Rua O', '1500', '44444-445', 'Porto Alegre', '1984-02-14'),
	('Paula', 'Castro', '678.901.234-56', '(11) 98888-5555', 'paula.castro@email.com', 'Rua P', '1600', '55555-556', 'Recife', '1979-03-15'),
	('Rafael', 'Sousa', '789.012.345-67', '(11) 98888-6666', 'rafael.sousa@email.com', 'Rua Q', '1700', '66666-667', 'Salvador', '1988-04-16'),
	('Sofia', 'Mendes', '890.123.456-78', '(11) 98888-7777', 'sofia.mendes@email.com', 'Rua R', '1800', '77777-778', 'Fortaleza', '1983-05-17'),
	('Thiago', 'Gonçalves', '901.234.567-89', '(11) 98888-8888', 'thiago.goncalves@email.com', 'Rua S', '1900', '88888-889', 'Brasília', '1997-06-18'),
	('Valentina', 'Araújo', '012.345.678-90', '(11) 98888-9999', 'valentina.araujo@email.com', 'Rua T', '2000', '99999-900', 'Manaus', '1986-07-19'),
	('Vitor', 'Costa', '123.456.789-02', '(11) 97777-0000', 'vitor.costa@email.com', 'Rua U', '2100', '00000-002', 'São Paulo', '1981-08-20'),
	('Yasmin', 'Barros', '234.567.890-13', '(11) 97777-1111', 'yasmin.barros@email.com', 'Rua V', '2200', '11111-113', 'Rio de Janeiro', '1996-09-21'),
	('Collen', 'Jochanany', '398-65-8037', '161-230-6375', 'cjochanany0@hc360.com', 'Arapahoe', '20', '63-910', 'Miejska Górka', '1999-10-11'),
	('Basilius', 'Reynault', '223-26-1249', '508-649-0365', 'breynault2@usnews.com', 'Goodland', '35246', '8134', 'Médanos', '1959-08-25'),
	('Andy', 'Burleton', '689-46-3407', '722-886-7777', 'aburleton1@wikia.com', 'Forest', '4194', '356011', 'Sosnovka', '1974-03-20'),
	('Putnam', 'Bilbrook', '629-94-1310', '581-921-9279', 'pbilbrook3@instagram.com', 'Ramsey', '968', '1239', 'Srbinovo', '1961-12-20'),
	('Ephrem', 'Willshaw', '476-28-1923', '705-305-9824', 'ewillshaw4@upenn.edu', 'Ilene', '939', '12412', 'Pampachiri', '1988-05-10'),
	('Faythe', 'Campbell-Dunlop', '234-26-9851', '205-330-4814', 'fcampbelldunlop5@linkedin.com', 'Melby', '4', '349-1104', 'Kurihashi', '2002-12-25'),
	('Oralle', 'Northeast', '604-76-1247', '514-471-9405', 'onortheast6@usa.gov', 'Lukken', '81','215352', 'Chang’an', '2000-02-28'),
	('Hart', 'Petrushkevich', '751-34-7777', '378-529-2945', 'hpetrushkevich7@pinterest.com', 'Eagle Crest', '57', '5882', 'Tingqian', '1966-07-10'),
	('Mariel', 'Bruckman', '812-14-9803', '314-914-3252', 'mbruckman8@bloomberg.com', 'Russell', '27501', '7010', 'Mabuhay', '1992-06-21'),
	('Lucille', 'Loughlan', '293-49-7642', '277-147-1951', 'lloughlan9@scribd.com', 'Claremont', '1', '588522', 'Kaliprak', '1964-09-14'),
	('Avril', 'Mayhew', '831-76-1320', '128-913-0106', 'amayhewa@weibo.com', 'American Ash', '617', '303021', 'Muyudian','1963-05-24'),
	('Benny', 'Badham', '344-07-0556', '707-218-4061', 'bbadhamb@usatoday.com', 'Myrtle', '1849', '4622', 'Yerba Buena','1980-03-09'),
	('Lionel', 'Danovich', '656-39-5185', '659-964-6625', 'ldanovichc@house.gov', 'Lighthouse Bay', '480', '29411', 'Landerneau', '1969-01-09'),
	('Marylinda', 'Crassweller', '839-34-3720', '636-502-2666', 'mcrasswellerd@infoseek.co.jp', 'American Ash', '11', '141028', 'Kostrovo', '1993-05-29'),
	('Aurie', 'Ancliffe', '895-25-1088', '829-330-7799', 'aancliffee@shareasale.com', 'Brentwood', '1', '15241', 'Kubangkondang','1958-12-19'),
	('Pavlov', 'Paice', '583-45-8547', '265-743-6457', 'ppaicef@g.co', 'Superior', '773', '8530', 'Panchagarh','1985-04-09'),
	('Damien', 'Ors', '777-93-9833', '557-931-3478', 'dorsg@tiny.cc', 'Katie', '63132', '671836', 'Kudara-Somon','1966-07-11'),
	('Henriette', 'Pavese', '858-99-8228', '440-414-8428', 'hpaveseh@imdb.com', 'Spaight', '8975', '056818', 'Murindó','1991-12-14'),
	('Brittaney', 'Gange', '527-82-3933', '446-764-1269', 'bgangei@netscape.com', 'Novick', '9', '89888', 'Independencia','1973-11-19'),
	('Noach', 'Sheather', '136-39-5693', '484-255-7989', 'nsheatherj@nature.com', 'High Crossing', '0040', '4602', 'Talisay','1963-11-05')
GO
INSERT INTO Cliente (ID_Cliente, ID_Pessoa)
VALUES
	(1,1), 
	(2,2),
	(3,3),
	(4,4),
	(5,5)
GO
INSERT INTO Cargo (ID_Cargo, Cargo)
VALUES
	(1,'Mecânico N1'),
	(2,'Mecânico N2')
GO
INSERT INTO Funcionario (ID_Funcionario, Especialidade, ID_Pessoa, ID_Cargo, Superior)
VALUES
	(1, 'Geral', 6, 1, 'Gabriela'),
	(2, 'Carros Luxuosos', 7, 2, '')
GO
INSERT INTO Veiculo (ID_Veiculo, Fabricante, Modelo, Placa, Renavam, Ano, Cor, Observacao, ID_Cliente)
VALUES
	(1, 'Volvo', 'S40 2.0 Aut.', 'IAJ-0693', '1FTWW3B57AE985739', 2012, 'Vermelho', 'Pastilhas de freio gastas', 1),
	(2, 'BMW', '3 Series 2.0 Turbo', 'MSE-7493', 'WAUBG78E96A833891', 2006, 'Branco', 'Pneus gastos', 2),
	(3, 'Ferrari', 'California F1 V8 460cv', 'FER-2193', '1GYFC53219R666489', 2019, 'Vermelho', 'Revisão', 3),
	(4, 'Dodge', 'Spirit 1.6 Eco', 'LKJ-1284', 'WBAPK73539A625408', 1995, 'Cinza', 'Parabrisa trincado', 4),
	(5, 'Cadillac', 'Escalade 2.0 Turbo', 'ASX-2142', 'WBA3X5C58FD552292', 2010, 'Branco', 'Revisão', 5)
GO
INSERT INTO Orcamento (ID_Orcamento, Descricao, Quantidade, Valor, Data_Inicio, Data_Termino, ID_Veiculo, ID_Funcionario)
VALUES
	(1, 'Troca de pastilhas de freio', 4, 800, '2022-10-20', '2022-10-23', 1, 2),
	(2, 'Troca de pneus', 4, 2500, '2022-10-21', '2022-10-24', 2, 1),
	(3, 'Lavagem completa', 4, 100, '2022-10-21', '2022-10-24', 2, 1),
	(4, 'Troca de óleo e fluido de freio', 2, 5000, '2022-09-26', '2022-09-27', 3, 2),
	(5, 'Troca do parabrisa', 1, 500, '2022-10-02', '2022-10-05', 4, 1),
	(6, 'Troca de óleo e fluido de freio', 2, 1000, '2022-09-10', '2022-09-15', 5, 2)
GO
INSERT INTO OrdemServico (ID_OS, Status_OS, Data_Entrega, Descricao_OS, Valor_OS, ID_Orcamento)
VALUES
	(1, 'Entregue', '2022-10-23', 'Troca de pastilhas de freio', 800, 1),
	(2, 'Andamento', '2022-10-24', 'Troca de pneus', 2500, 2),
	(3, 'Andamento', '2022-10-24', 'Lavagem completa', 100, 2),
	(4, 'Andamento', '2022-09-27', 'Troca de óleo e fluido de freio', 5000, 3)
GO
DROP PROCEDURE IF EXISTS spc_customerbasicQuery
GO
CREATE PROCEDURE spc_customerbasicQuery @NumberPages INT = 1, @NumberItemPage INT = 20
AS
BEGIN TRY
	BEGIN TRANSACTION
		DECLARE @TotalPages INT
		SELECT @TotalPages = CEILING(CAST(COUNT(*) AS NUMERIC (18,2))/CAST(@NumberItemPage AS NUMERIC (18,2))) FROM Pessoa
	IF @NumberPages < 1
	BEGIN
		SET @NumberPages = 1
	END
	IF @NumberPages > @TotalPages
	BEGIN
		SET @NumberPages = @TotalPages
	END
		SELECT ID_Pessoa, Nome, CPF, Email
		FROM Pessoa ORDER BY ID_Pessoa
		OFFSET (@Numberpages - 1) * @NumberItemPage ROWS
		FETCH NEXT @NumberItemPage ROWS ONLY
	IF @@ERROR = 0
		COMMIT
END TRY
BEGIN CATCH
	DECLARE @NUM INT = ERROR_NUMBER(), @SEVERIDADE INT = ERROR_SEVERITY(), @MSG VARCHAR(200) = ERROR_MESSAGE()
	RAISERROR(@MSG, @SEVERIDADE, @NUM)
	IF @@TRANCOUNT <> 0
	BEGIN
        ROLLBACK
		RETURN
	END
END CATCH
GO
--EXEC spc_customerbasicQuery @NumberPages = 5, @NumberItemPage = 10
DROP PROCEDURE IF EXISTS spc_didnotbuyQuery
GO
CREATE PROCEDURE spc_didnotbuyQuery
AS
BEGIN TRY
	BEGIN TRANSACTION
		SELECT Nome +' '+ Sobrenome AS Nome, Fabricante + ' ' + Modelo AS Veiculo, Descricao, Valor FROM Cliente A
		INNER JOIN Pessoa B
		ON B.ID_Pessoa = A.ID_Pessoa
		INNER JOIN Veiculo C
		ON A.ID_Cliente = C.ID_Cliente
		INNER JOIN Orcamento D
		ON C.ID_Veiculo = D.ID_Veiculo
		LEFT JOIN OrdemServico F
		ON D.ID_Orcamento = F.ID_Orcamento
		WHERE ID_OS IS NULL
	IF @@ERROR = 0
		COMMIT
END TRY
BEGIN CATCH
	DECLARE @NUM INT = ERROR_NUMBER(), @SEVERIDADE INT = ERROR_SEVERITY(), @MSG VARCHAR(200) = ERROR_MESSAGE()
	RAISERROR(@MSG, @SEVERIDADE, @NUM)
	IF @@TRANCOUNT <> 0
	BEGIN
        ROLLBACK
		RETURN
	END
END CATCH
GO
-- EXEC spc_didnotbuyQuery
DROP PROCEDURE IF EXISTS spc_mostspentmonthQuery
GO
CREATE PROCEDURE spc_mostspentmonthQuery @Mes INT 
AS
BEGIN TRY
	BEGIN TRANSACTION
		SELECT TOP 10 @Mes AS 'Mês',Nome + ' ' + Sobrenome AS Cliente, SUM(Valor_OS) AS Valor FROM OrdemServico A
		INNER JOIN Pessoa B
		ON A.ID_Orcamento = B.ID_Pessoa
		WHERE MONTH(Data_Entrega) = @Mes
		GROUP BY Nome, Sobrenome
	IF @@ERROR = 0
		COMMIT
END TRY
BEGIN CATCH
	DECLARE @NUM INT = ERROR_NUMBER(), @SEVERIDADE INT = ERROR_SEVERITY(), @MSG VARCHAR(200) = ERROR_MESSAGE()
	RAISERROR(@MSG, @SEVERIDADE, @NUM)
	IF @@TRANCOUNT <> 0
	BEGIN
        ROLLBACK
		RETURN
	END
END CATCH
GO
-- EXEC spc_mostspentmonthQuery @Mes = 10
DROP PROCEDURE IF EXISTS spc_customerFullQueryID
GO
CREATE PROCEDURE spc_customerFullQueryID @Nome VARCHAR(15), @Sobrenome VARCHAR(15)
AS
BEGIN TRY
	BEGIN TRANSACTION
		SELECT * FROM Pessoa A
		INNER JOIN Cliente B
		ON A.ID_Pessoa = B.ID_Pessoa
		INNER JOIN Veiculo C
		ON C.ID_Cliente = B.ID_Cliente
		WHERE Nome COLLATE Latin1_General_CI_AI = @Nome
		AND Sobrenome COLLATE Latin1_General_CI_AI = @Sobrenome
	IF @@ERROR = 0
		COMMIT
END TRY
BEGIN CATCH
	DECLARE @NUM INT = ERROR_NUMBER(), @SEVERIDADE INT = ERROR_SEVERITY(), @MSG VARCHAR(200) = ERROR_MESSAGE()
	RAISERROR(@MSG, @SEVERIDADE, @NUM)
	IF @@TRANCOUNT <> 0
	BEGIN
        ROLLBACK
		RETURN
	END
END CATCH
-- EXEC spc_customerFullQueryID @Nome = 'Bruno', @Sobrenome = 'CESAR'
GO
DROP PROCEDURE IF EXISTS spu_customerByID
GO
CREATE PROCEDURE spu_customerByID (@ID_Pessoa INT, @Nome VARCHAR(15) = NULL, @Sobrenome VARCHAR(15) = NULL, @CPF CHAR(14) = NULL,
@Whatsapp CHAR(15) = NULL, @Email VARCHAR(35) = NULL, @Endereco VARCHAR(50) = NULL, @Num_end INT = NULL, @CEP CHAR(10) = NULL,
@Cidade VARCHAR(20) = NULL, @Nascimento DATE = NULL)
AS
BEGIN TRY
	BEGIN TRANSACTION
		DECLARE @Command NVARCHAR(MAX) = ''
		SET @Command = 'UPDATE Pessoa' + CHAR(10) + 'SET '
			+ 
			STUFF (
				CASE ISNULL(@Nome, '') 
					WHEN '' THEN '' 
					ELSE ', Nome = @Nome' 
				END
				+ 
				CASE ISNULL(@Sobrenome, '') 
					WHEN '' THEN '' 
					ELSE ', Sobrenome = @Sobrenome' 
				END
				+
				CASE ISNULL(@CPF, '')
					WHEN '' THEN '' 
					ELSE ', CPF = @CPF' 
				END
				+
				CASE ISNULL(@Whatsapp, '')
					WHEN '' THEN '' 
					ELSE ', Whatsapp = @Whatsapp' 
				END
				+ 
				CASE ISNULL(@Email, '')
					WHEN '' THEN '' 
					ELSE ', Email = @Email' 
				END
				+
				CASE ISNULL(@Endereco, '')
					WHEN '' THEN '' 
					ELSE ', Endereco = @Endereco' 
				END
				+ 
				CASE ISNULL(@Num_end, '')
					WHEN '' THEN '' 
					ELSE ', Num_end = @Num_end' 
				END
				+ 
				CASE ISNULL(@CEP, '')
					WHEN '' THEN '' 
					ELSE ', CEP = @CEP' 
				END
				+
				CASE ISNULL(@Cidade, '')
					WHEN '' THEN '' 
					ELSE ', Cidade = @Cidade' 
				END
				+
				CASE ISNULL(@Nascimento, '')
					WHEN '' THEN '' 
					ELSE ', Nascimento = @Nascimento' 
				END
			, 1, 1, '')
			+ 
			CHAR(10)
			+
			'WHERE ID_Pessoa = @ID_Pessoa;'
			PRINT @Command
			EXEC sp_executesql @Command,
				N'@ID_Pessoa INT, @Nome VARCHAR(15), @Sobrenome VARCHAR(15), @CPF CHAR(14),
				@Whatsapp CHAR(15), @Email VARCHAR(35), @Endereco VARCHAR(50), @Num_end INT, @CEP CHAR(10), @Cidade VARCHAR(20), 
				@Nascimento DATE'
				, @ID_Pessoa, @Nome, @Sobrenome, @CPF, @Whatsapp, @Email, @Endereco, @Num_end, @CEP, @Cidade, @Nascimento
		IF @@ERROR = 0
			COMMIT
END TRY
BEGIN CATCH
	DECLARE @NUM INT = ERROR_NUMBER(), @SEVERIDADE INT = ERROR_SEVERITY(), @MSG VARCHAR(200) = ERROR_MESSAGE()
	RAISERROR(@MSG, @SEVERIDADE, @NUM);
	IF @@TRANCOUNT <> 0
	BEGIN
        ROLLBACK;
		RETURN;
	END
END CATCH
GO
EXEC spu_customerByID @ID_Pessoa = 1, @Sobrenome = 'Santos', @Email = 'ana.santos@email.com'

SELECT * FROM Pessoa