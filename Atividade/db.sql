CREATE DATABASE futebol_db;

USE futebol_db;

CREATE TABLE times (
    id INT AUTO_INCINCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL UNIQUE,
    cidade VARCHAR(120)
);

CREATE TABLE jogadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    time_id INT NOT NULL,
    nome VARCHAR(120) NOT NULL,
    posicao ENUM('GOL','ZAG','LAT','VOL','MEI','ATA','PONT') NOT NULL,
    numero_camisa INT NOT NULL,
    CONSTRAINT fk_jog_time FOREIGN KEY (club_id) REFERENCES club(id)
);

CREATE TABLE partidas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_partida DATE NOT NULL,
    mandante_id INT NOT NULL,
    visitante_id INT NOT NULL,
    gols_mandante INT DEFAULT 0,
    gols_visitante INT DEFAULT 0,

    CONSTRAINT fk_par_mand FOREIGN KEY (mandante_id) REFERENCES club(id),
    CONSTRAINT fk_par_visitante FOREIGN KEY (visitante_id) REFERENCES club(id)
);