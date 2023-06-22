create database web_db;

CREATE TABLE web_db.heart_attack (
	id INT not null primary key auto_increment,
	image1 LONGTEXT NULL,
	image2 longtext NULL,
	image3 LONGTEXT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE web_db.breast_cancer (
	id INT not null primary key auto_increment,
	image1 LONGTEXT NULL,
	image2 longtext NULL,
	image3 LONGTEXT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE web_db.stroke (
	id INT not null primary key auto_increment,
	image1 LONGTEXT NULL,
	image2 longtext NULL,
	image3 LONGTEXT NULL
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;