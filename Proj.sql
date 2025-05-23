
-- MISSÃO PRÁTICA - LOGIMOVE (Versão Única)

-- ACESSAR (exemplo de conexão)
-- sqlcmd -S tcp:logimovepro.database.windows.net,1433 -d LogiMoveDB -U devuser -P 'SenhaSegura123!' -N -l 30

-- CRIAR TABELA DE MOTORISTAS
CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    Nome VARCHAR(100),
    CNH VARCHAR(20),
    Endereço VARCHAR(200),
    Contato VARCHAR(50)
);

-- INSERIR MOTORISTAS
INSERT INTO Drivers (DriverID, Nome, CNH, Endereço, Contato)
VALUES (101, 'Lucas Andrade', '9876543210', 'Rua São Miguel, 88', 'lucas.andrade@exemplo.com');

INSERT INTO Drivers (DriverID, Nome, CNH, Endereço, Contato)
VALUES (102, 'Carla Nunes', '5432167890', 'Av. Pedro Álvares, 200', 'carla.nunes@exemplo.com');

INSERT INTO Drivers (DriverID, Nome, CNH, Endereço, Contato)
VALUES (103, 'Rafael Torres', '6543219870', 'Rua da Vitória, 55', 'rafael.torres@exemplo.com');

-- CONSULTAR MOTORISTAS
SELECT * FROM Drivers;


-- CRIAR TABELA DE CLIENTES
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Empresa VARCHAR(100),
    Endereço VARCHAR(200),
    Contato VARCHAR(50)
);

-- INSERIR CLIENTES
INSERT INTO Clients (ClientID, Nome, Empresa, Endereço, Contato)
VALUES (201, 'Helena Mota', 'TransGlobal', 'Rua das Rosas, 150', 'helena@transglobal.com');

INSERT INTO Clients (ClientID, Nome, Empresa, Endereço, Contato)
VALUES (202, 'Thiago Lima', 'EcoTransportes', 'Av. Brasil, 785', 'thiago@eco.com');

INSERT INTO Clients (ClientID, Nome, Empresa, Endereço, Contato)
VALUES (203, 'Fernanda Costa', 'AlphaCargo', 'Rua Central, 19', 'fernanda@alphacargo.com');

-- CONSULTAR CLIENTES
SELECT * FROM Clients;


-- CRIAR TABELA DE PEDIDOS
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ClientID INT,
    DriverID INT,
    DetalhesPedido TEXT,
    DataEntrega DATE,
    Status VARCHAR(50),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

-- INSERIR PEDIDOS
INSERT INTO Orders (OrderID, ClientID, DriverID, DetalhesPedido, DataEntrega, Status)
VALUES (301, 202, 101, 'Entrega urgente de eletrônicos, manuseio com cuidado.', '2024-09-15', 'Pendente');

INSERT INTO Orders (OrderID, ClientID, DriverID, DetalhesPedido, DataEntrega, Status)
VALUES (302, 201, 103, 'Volumes grandes, necessário veículo com baú.', '2024-10-05', 'Em andamento');

INSERT INTO Orders (OrderID, ClientID, DriverID, DetalhesPedido, DataEntrega, Status)
VALUES (303, 203, 102, 'Remessa fracionada, entrega em três locais.', '2024-11-12', 'Aguardando');

-- CONSULTAR PEDIDOS
SELECT * FROM Orders;
