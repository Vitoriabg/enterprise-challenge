CREATE TABLE tipos_ativo (
    id_tipo_ativo SERIAL PRIMARY KEY,
    nome_tipo     VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE modelos_sensor (
    id_modelo   SERIAL PRIMARY KEY,
    nome_modelo VARCHAR(100) NOT NULL UNIQUE,
    fabricante  VARCHAR(100)
);

CREATE TABLE usuarios (
    id_usuario   SERIAL PRIMARY KEY,
    nome         VARCHAR(100) NOT NULL,
    email        VARCHAR(100) NOT NULL UNIQUE,
    senha_hash   VARCHAR(100) NOT NULL,
    cargo        VARCHAR(50)
);

CREATE TABLE ativos (
    id_ativo        SERIAL PRIMARY KEY,
    id_tipo_ativo   INTEGER NOT NULL,
    nome            VARCHAR(100) NOT NULL,
    localizacao     VARCHAR(100),
    dt_instalacao   DATE,
    status          VARCHAR(50) NOT NULL DEFAULT 'ativo',
    CONSTRAINT fk_ativos_tipos_ativo FOREIGN KEY (id_tipo_ativo) REFERENCES tipos_ativo (id_tipo_ativo)
);

CREATE TABLE sensores (
    id_sensor   SERIAL PRIMARY KEY,
    id_ativo    INTEGER NOT NULL,
    id_modelo   INTEGER NOT NULL,
    tipo_sensor VARCHAR(50) NOT NULL,
    status      VARCHAR(50) NOT NULL DEFAULT 'ativo',
    CONSTRAINT fk_sensores_ativos FOREIGN KEY (id_ativo) REFERENCES ativos (id_ativo),
    CONSTRAINT fk_sensores_modelos_sensor FOREIGN KEY (id_modelo) REFERENCES modelos_sensor (id_modelo)
);

CREATE TABLE alertas (
    id_alerta   SERIAL PRIMARY KEY,
    id_ativo    INTEGER NOT NULL,
    data_hora   TIMESTAMP NOT NULL,
    descricao   TEXT,
    severidade  VARCHAR(20),
    status      VARCHAR(20) NOT NULL DEFAULT 'aberto',
    CONSTRAINT fk_alertas_ativos FOREIGN KEY (id_ativo) REFERENCES ativos (id_ativo)
);

CREATE TABLE leituras (
    id_leitura   BIGSERIAL PRIMARY KEY,
    id_sensor    INTEGER NOT NULL,
    data_hora    TIMESTAMP NOT NULL,
    valor        NUMERIC(10, 2) NOT NULL,
    CONSTRAINT fk_leituras_sensores FOREIGN KEY (id_sensor) REFERENCES sensores (id_sensor)
);

CREATE TABLE ordens_manutencao (
    id_ordem          SERIAL PRIMARY KEY,
    id_alerta         INTEGER NOT NULL UNIQUE,
    id_usuario        INTEGER NOT NULL,
    data_criacao      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_conclusao    TIMESTAMP,
    status            VARCHAR(50) NOT NULL DEFAULT 'Aberta',
    descricao_servico TEXT,
    CONSTRAINT fk_ordens_manutencao_alertas FOREIGN KEY (id_alerta) REFERENCES alertas (id_alerta),
    CONSTRAINT fk_ordens_manutencao_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

CREATE INDEX idx_leituras_data_hora ON leituras (data_hora DESC);
CREATE INDEX idx_alertas_data_hora ON alertas (data_hora DESC);

