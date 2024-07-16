CREATE DATABASE `uas_15200022_febri_milansyah_a_ti_dbms`;

CREATE TABLE `uas_15200022_febri_milansyah_a_ti_dbms`.`tblpegawai_15200022_ti_a`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `kode_pegawai` char(4) NOT NULL,
  `nama_pegawai` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(6) NOT NULL,
  `alamat` text NOT NULL,
  PRIMARY KEY (`id`)
);

DELIMITER $$
 
CREATE PROCEDURE insertPegawai(
	kode CHAR(4),
	nama VARCHAR(255),
	jk VARCHAR(6),
	alamat MEDIUMTEXT,
)
BEGIN
    INSERT INTO tblpegawai_15200022_ti_a (kode_pegawai, nama_pegawai, jenis_kelamin, alamat) VALUE (kode, nama, jk, alamat);
END$$

DELIMITER ;

DELIMITER $$
 
CREATE PROCEDURE updatePegawai(
	id_data INT(12),
	kode CHAR(4),
	nama VARCHAR(255),
	jk VARCHAR(6),
	alamat_data MEDIUMTEXT
)
BEGIN
    UPDATE tblpegawai_15200022_ti_a SET kode_pegawai=kode, nama_pegawai=nama, jenis_kelamin=jk, alamat=alamat_data WHERE id=id_data;
END$$

DELIMITER ;

DELIMITER $$
 
CREATE PROCEDURE deletePegawai(
	id_data INT(12)
)
BEGIN
    DELETE FROM tblpegawai_15200022_ti_a WHERE id=id_data;
END$$

DELIMITER ;

CREATE TABLE `uas_15200022_febri_milansyah_a_ti_dbms`.`log_tblpegawai_15200022_ti_a`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `id_data` int(12) NOT NULL,
  `kode_pegawai` char(4) NOT NULL,
  `nama_pegawai` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(6) NOT NULL,
  `alamat` text NOT NULL,
  `waktu` timestamp NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

DELIMITER $$
CREATE TRIGGER log_insert_barang
    AFTER INSERT
    ON `15200022_ti_a_tblbarang`
    FOR EACH ROW
BEGIN
    INSERT INTO log_15200022_ti_a_tblbarang SET id_data = new.id, kode_barang=new.kode_barang, nama_barang=new.nama_barang, harga_barang=new.harga_barang, stok_barang=new.stok_barang, waktu = NOW(), keterangan='INSERT';
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER log_update_barang
    BEFORE UPDATE 
    ON `15200022_ti_a_tblbarang`
    FOR EACH ROW 
BEGIN
    INSERT INTO log_15200022_ti_a_tblbarang SET id_data = old.id, kode_barang=old.kode_barang, nama_barang=old.nama_barang, harga_barang=old.harga_barang, stok_barang=old.stok_barang, waktu = NOW(), keterangan='UPDATE';
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER log_delete_barang 
    BEFORE DELETE 
    ON `15200022_ti_a_tblbarang`
    FOR EACH ROW 
BEGIN
    INSERT INTO log_15200022_ti_a_tblbarang SET id_data = old.id, kode_barang=old.kode_barang, nama_barang=old.nama_barang, harga_barang=old.harga_barang, stok_barang=old.stok_barang, waktu = NOW(), keterangan='DELETE';
END$$
DELIMITER ;

CREATE TABLE `uas_15200022_febri_milansyah_a_ti_dbms`.`15200022_ti_a_tblbarang`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `kode_barang` char(3) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `harga_barang` int(12) NOT NULL,
  `stok_barang` int(4) NOT NULL,
  PRIMARY KEY (`id`)
);

DELIMITER $$
 
CREATE PROCEDURE insertBarang(
	kode CHAR(3),
	nama VARCHAR(255),
	harga INT(12),
	stok INT(4)
)
BEGIN
    INSERT INTO `15200022_ti_a_tblbarang` (kode_barang, nama_barang, harga_barang, stok_barang) VALUE (kode, nama, harga, stok);
END$$

DELIMITER ;

DELIMITER $$
 
CREATE PROCEDURE updateBarang(
	id_data INT(12),
	kode CHAR(3),
	nama VARCHAR(255),
	harga INT(12),
	stok INT(4)
)
BEGIN
    UPDATE `15200022_ti_a_tblbarang` SET kode_barang=kode, nama_barang=nama, harga_barang=harga, stok_barang=stok WHERE id=id_data;
END$$

DELIMITER ;

DELIMITER $$
 
CREATE PROCEDURE deleteBarang(
	id_data INT(12)
)
BEGIN
    DELETE FROM `15200022_ti_a_tblbarang` WHERE id=id_data;
END$$

DELIMITER ;

CREATE TABLE `uas_15200022_febri_milansyah_a_ti_dbms`.`log_15200022_ti_a_tblbarang`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `id_data` int(12) NOT NULL,
  `kode_barang` char(3) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `harga_barang` int(12) NOT NULL,
  `stok_barang` int(4) NOT NULL,
  `waktu` timestamp NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);