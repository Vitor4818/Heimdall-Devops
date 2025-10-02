-- ============================================
-- Banco de Dados Heimdall - Estrutura de Tabelas
-- Gerado a partir dos models C# do DbContext
-- ============================================

-- Tabela de Categorias de Usuário
CREATE TABLE categorias_usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);
COMMENT ON TABLE categorias_usuario IS 'Tabela de categorias de usuários';
COMMENT ON COLUMN categorias_usuario.nome IS 'Nome da categoria (Administrador, Usuário, etc)';

-- Tabela de Usuários
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    categoria_usuario_id INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    CONSTRAINT fk_categoria FOREIGN KEY(categoria_usuario_id)
        REFERENCES categorias_usuario(id)
        ON DELETE CASCADE
);
COMMENT ON TABLE usuarios IS 'Tabela de usuários do sistema';
COMMENT ON COLUMN usuarios.nome IS 'Nome do usuário';
COMMENT ON COLUMN usuarios.sobrenome IS 'Sobrenome do usuário';
COMMENT ON COLUMN usuarios.data_nascimento IS 'Data de nascimento do usuário';
COMMENT ON COLUMN usuarios.cpf IS 'CPF do usuário';
COMMENT ON COLUMN usuarios.email IS 'Email do usuário';
COMMENT ON COLUMN usuarios.senha IS 'Senha do usuário (hash)';

-- Tabela de Motos
CREATE TABLE moto (
    id SERIAL PRIMARY KEY,
    tipo_moto VARCHAR(50) NOT NULL,
    placa VARCHAR(10) NOT NULL,
    num_chassi VARCHAR(50) NOT NULL
);
COMMENT ON TABLE moto IS 'Tabela de motos cadastradas';
COMMENT ON COLUMN moto.tipo_moto IS 'Tipo da moto';
COMMENT ON COLUMN moto.placa IS 'Placa da moto';
COMMENT ON COLUMN moto.num_chassi IS 'Número do chassi';

-- Tabela de Tags RFID
CREATE TABLE tags_rfid (
    id SERIAL PRIMARY KEY,
    moto_id INT UNIQUE NOT NULL,
    faixa_frequencia VARCHAR(50) NOT NULL,
    banda VARCHAR(50) NOT NULL,
    aplicacao VARCHAR(100) NOT NULL,
    CONSTRAINT fk_moto FOREIGN KEY(moto_id)
        REFERENCES moto(id)
        ON DELETE CASCADE
);
COMMENT ON TABLE tags_rfid IS 'Tabela de tags RFID associadas às motos';
COMMENT ON COLUMN tags_rfid.faixa_frequencia IS 'Faixa de frequência da tag';
COMMENT ON COLUMN tags_rfid.banda IS 'Banda da tag';
COMMENT ON COLUMN tags_rfid.aplicacao IS 'Aplicação da tag';
COMMENT ON COLUMN tags_rfid.moto_id IS 'ID da moto associada à tag';
