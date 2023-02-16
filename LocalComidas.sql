CREATE SCHEMA IF NOT EXISTS `LOCAL_COMIDAS`;
USE `LOCAL_COMIDAS` ;

CREATE TABLE IF NOT EXISTS `LOCAL_COMIDAS`.`CIUDADES` (
  `id_ciudad` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_ciudad`),
  UNIQUE INDEX `id_ciudad PK_UNIQUE` (`id_ciudad` ASC));

CREATE TABLE IF NOT EXISTS `LOCAL_COMIDAS`.`CLIENTES` (
  `id_cliente` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `id_ciudad` INT NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `id_cliente_UNIQUE` (`id_cliente` ASC) ,
  INDEX `id_ciudad_idx` (`id_ciudad` ASC) ,
  CONSTRAINT `id_ciudad`
    FOREIGN KEY (`id_ciudad`)
    REFERENCES `LOCAL_COMIDAS`.`CIUDADES` (`id_ciudad`));

CREATE TABLE IF NOT EXISTS `LOCAL_COMIDAS`.`COMIDAS` (
  `id_comida` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(90) NULL,
  `precio` FLOAT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`id_comida`),
  UNIQUE INDEX `idCOMIDAS_UNIQUE` (`id_comida` ASC));

CREATE TABLE IF NOT EXISTS `LOCAL_COMIDAS`.`FORMA _DE_PAGO` (
  `id_forma_pago` INT NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_forma_pago`),
  UNIQUE INDEX `id_forma_pago_UNIQUE` (`id_forma_pago` ASC));

CREATE TABLE IF NOT EXISTS `LOCAL_COMIDAS`.`PEDIDOS` (
  `id_pedido` INT NOT NULL,
  `nro_pedido` INT NOT NULL,
  `id_comida` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_forma_pago` INT NOT NULL,
  `descripcion` VARCHAR(100) NULL,
  `dirección` VARCHAR(100) NULL,
  `fecha` DATETIME NULL,
  `hora` DATETIME NULL,
  `total` FLOAT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE INDEX `id_pedido_UNIQUE` (`id_pedido` ASC) ,
  INDEX `id_cliente_idx` (`id_cliente` ASC) ,
  INDEX `id_comidaFK_idx` (`id_comida` ASC) ,
  INDEX `id_forma_pago_FK_idx` (`id_forma_pago` ASC) ,
  CONSTRAINT `id_cliente_FK`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `LOCAL_COMIDAS`.`CLIENTES` (`id_cliente`),
  CONSTRAINT `id_comida_FK`
    FOREIGN KEY (`id_comida`)
    REFERENCES `LOCAL_COMIDAS`.`COMIDAS` (`id_comida`),
  CONSTRAINT `id_forma_pago_FK`
    FOREIGN KEY (`id_forma_pago`)
    REFERENCES `LOCAL_COMIDAS`.`FORMA _DE_PAGO` (`id_forma_pago`));

CREATE TABLE IF NOT EXISTS `LOCAL_COMIDAS`.`SUCURSALES` (
  `id_sucursal` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `id_ciudad` INT NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  UNIQUE INDEX `id_sucursal_UNIQUE` (`id_sucursal` ASC) ,
  INDEX `id_ciudad_FK_idx` (`id_ciudad` ASC) ,
  CONSTRAINT `id_ciudad_FK`
    FOREIGN KEY (`id_ciudad`)
    REFERENCES `LOCAL_COMIDAS`.`CIUDADES` (`id_ciudad`));