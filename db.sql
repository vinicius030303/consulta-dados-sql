CREATE TABLE usuarios (
  id INTEGER PRIMARY KEY,
  nome TEXT,
  email TEXT,
  cidade TEXT,
  idade INTEGER
);

CREATE TABLE produtos (
  id INTEGER PRIMARY KEY,
  nome TEXT,
  preco DECIMAL
);

CREATE TABLE pedidos (
  id INTEGER PRIMARY KEY,
  usuario_id INTEGER,
  produto_id INTEGER,
  data TEXT,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO usuarios VALUES
(1, 'Ana Lima', 'ana@email.com', 'São Paulo', 28),
(2, 'Carlos Souza', 'carlos@email.com', 'Curitiba', 34),
(3, 'Bruna Alves', 'bruna@email.com', 'Recife', 22);

INSERT INTO produtos VALUES
(1, 'Teclado Mecânico', 350.00),
(2, 'Mouse Gamer', 190.00),
(3, 'Monitor 24"', 890.00);

INSERT INTO pedidos VALUES
(1, 1, 2, '2025-07-20'),
(2, 3, 1, '2025-07-19'),
(3, 2, 3, '2025-07-18');