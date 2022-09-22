CREATE TABLE Cliente_CPF (
Nome_Cliente varchar,
Identificacao varchar,
End_Cliente varchar,
Inscrito_Em timestamp,
ID_Cliente varchar PRIMARY KEY
)

CREATE TABLE Cliente_CNPJ (
ID_Cliente varchar PRIMARY KEY,
Nome_Cliente varchar,
Inscrito_Em timestamp,
Identificacao varchar,
End_Cliente varchar
)

CREATE TABLE Estoque (
ID_Estoque varchar PRIMARY KEY,
End_Estoque varchar
)

CREATE TABLE Fornecedor (
ID_Fornecedor int PRIMARY KEY,
Nome_Fornec varchar,
End_Fornec varchar
)

CREATE TABLE Produto (
ID_Produto int PRIMARY KEY,
Nome_Produto varchar,
Preco_Produto float,
Descricao varchar,
ID_Fornec int
)

CREATE TABLE Pedido (
ID_Pedido int PRIMARY KEY,
ID_Fornec int,
Descricao varchar,
Frete float,
Horario_Pedido timestamp,
Rastreio varchar,
Pagamento varchar,
ID_CNPJ varchar,
ID_CPF varchar
)

CREATE TABLE Entrega (
Codigo_Rastreio varchar PRIMARY KEY,
Status varchar
)

CREATE TABLE Produto_Em_Pedido (
Quantidade Texto(1),
ID_Pedido int,
ID_Produto int,
FOREIGN KEY(ID_Pedido) REFERENCES Pedido (ID_Pedido),
FOREIGN KEY(ID_Produto) REFERENCES Produto (ID_Produto)
)

CREATE TABLE Produto_Em_Estoque (
Quantidade int,
ID_Produto int,
ID_Estoque varchar,
FOREIGN KEY(ID_Produto) REFERENCES Produto (ID_Produto),
FOREIGN KEY(ID_Estoque) REFERENCES Estoque (ID_Estoque)
)

CREATE TABLE CNPJ_Pedido (
ID_Pedido int,
ID_Cliente varchar,
FOREIGN KEY(ID_Pedido) REFERENCES Pedido (ID_Pedido),
FOREIGN KEY(ID_Cliente) REFERENCES Cliente_CNPJ (ID_Cliente)
)

CREATE TABLE CPF_Pedido (
ID_Pedido int,
ID_Cliente varchar,
FOREIGN KEY(ID_Pedido) REFERENCES Pedido (ID_Pedido),
FOREIGN KEY(ID_Cliente) REFERENCES Cliente_CPF (ID_Cliente)
)

CREATE TABLE Entrega_do_Pedido (
Codigo_Rastreio varchar,
ID_Pedido int,
FOREIGN KEY(Codigo_Rastreio) REFERENCES Entrega (Codigo_Rastreio),
FOREIGN KEY(ID_Pedido) REFERENCES Pedido (ID_Pedido)
)

CREATE TABLE Fornece (
ID_Fornecedor int,
ID_Produto int,
FOREIGN KEY(ID_Fornecedor) REFERENCES Fornecedor (ID_Fornecedor),
FOREIGN KEY(ID_Produto) REFERENCES Produto (ID_Produto)
)

CREATE TABLE Fornec_Em_Pedido (
ID_Fornecedor int,
ID_Pedido Texto(1),
FOREIGN KEY(ID_Fornecedor) REFERENCES Fornecedor (ID_Fornecedor)
)

