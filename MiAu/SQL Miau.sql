/*DROP DATABASE Miau_Dote;
CREATE DATABASE MiAu_Dote;
USE MiAu_Dote;*/

CREATE TABLE usuario (
  id INT NOT NULL AUTO_INCREMENT,
  tipo_usuario ENUM('ADOTANTE','ONG') NOT NULL,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  cpf VARCHAR(15) DEFAULT NULL,
  cnpj VARCHAR(14) DEFAULT NULL,
  logradouro VARCHAR(100) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  complemento VARCHAR(50) DEFAULT NULL,
  bairro VARCHAR(50) NOT NULL,
  cep VARCHAR(9) NOT NULL,
  cidade VARCHAR(50) NOT NULL,
  estado CHAR(2) NOT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY email (email),
  CONSTRAINT usuario_chk_1 CHECK (
    (
      (tipo_usuario = 'ADOTANTE' AND cpf IS NOT NULL AND cnpj IS NULL) OR
      (tipo_usuario = 'ONG' AND cnpj IS NOT NULL AND cpf IS NULL)
    )
  )
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE animal (
  id INT NOT NULL AUTO_INCREMENT,
  usuarioId INT NOT NULL,
  nome VARCHAR(50) NOT NULL,
  especie VARCHAR(50) NOT NULL,
  raca VARCHAR(50) NOT NULL,
  idade INT NOT NULL,
  sexo ENUM('MACHO','FEMEA') NOT NULL,
  porte ENUM('PEQUENO','MEDIO','GRANDE') NOT NULL,
  castrado TINYINT(1) NOT NULL,
  status ENUM('DISPONIVEL','ADOTADO') NOT NULL,
  descricao TEXT,
  imagem VARCHAR(255),
  PRIMARY KEY (id),
  KEY usuarioId (usuarioId),
  CONSTRAINT animal_ibfk_1 FOREIGN KEY (usuarioId) REFERENCES usuario (id)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

