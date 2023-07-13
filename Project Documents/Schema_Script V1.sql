-- Wed Jul  5 00:49:07 2023
-- Model: New Model    Version: 1.0


-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tbl_VideoCapture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tbl_VideoCapture` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tbl_VideoCapture` (
  `IDs` INT NOT NULL,
  `IsOpened` VARCHAR(1) NULL,
  `Read` VARCHAR(1) NULL,
  `Open` VARCHAR(1) NULL,
  PRIMARY KEY (`IDs`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_main`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tbl_main` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tbl_main` (
  `Face_Cascade` INT NOT NULL,
  `Eyes_Cascade` INT NULL,
  PRIMARY KEY (`Face_Cascade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_Points`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tbl_Points` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tbl_Points` (
  `X_Cord` INT NOT NULL,
  `Y_Cord` INT NULL,
  PRIMARY KEY (`X_Cord`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_CascadeClassifier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tbl_CascadeClassifier` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tbl_CascadeClassifier` (
  `scaleFactor` DOUBLE NOT NULL,
  `minNeighbors` INT NULL,
  `minSize` INT NULL,
  `maxSize` INT NULL,
  `data` VARCHAR(45) NULL,
  PRIMARY KEY (`scaleFactor`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `data_UNIQUE` ON `mydb`.`tbl_CascadeClassifier` (`data` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_Rect`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tbl_Rect` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tbl_Rect` (
  `X_Cord` INT NOT NULL,
  `Y_Cord` INT NULL,
  `Width_Cord` INT NULL,
  `Height_Cord` INT NULL,
  PRIMARY KEY (`X_Cord`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbl_CommandLineParser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tbl_CommandLineParser` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tbl_CommandLineParser` (
  `argc` INT NOT NULL,
  `argv` CHAR NULL,
  `aboutMessage` VARCHAR(45) NULL,
  PRIMARY KEY (`argc`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Students` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Students` (
  `Student_ID` INT NOT NULL AUTO_INCREMENT,
  `Student_Name` VARCHAR(45) NULL,
  `Student_Mobile` VARCHAR(45) NULL,
  `Student_eMail` VARCHAR(45) NULL,
  `Student_Image_Loc` VARCHAR(100) NOT NULL,
  `Audit_Ins_By` VARCHAR(45) NOT NULL,
  `Audit_Ins_DT` DATETIME NOT NULL,
  `Audit_Upd_By` VARCHAR(45) NULL,
  `Audit_Upd_DT` DATETIME NULL,
  PRIMARY KEY (`Student_ID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Student_Name_UNIQUE` ON `mydb`.`Students` (`Student_Name` ASC) VISIBLE;

CREATE UNIQUE INDEX `Student_eMail_UNIQUE` ON `mydb`.`Students` (`Student_eMail` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Departments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Departments` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Departments` (
  `Dept_CD` INT NOT NULL AUTO_INCREMENT,
  `Dept_Name` VARCHAR(45) NULL,
  `Audit_Ins_By` VARCHAR(45) NOT NULL,
  `Audit_Ins_DT` DATETIME NOT NULL,
  `Audit_Upd_By` VARCHAR(45) NULL,
  `Audit_Upd_DT` DATETIME NULL,
  `Departments_Dept_CD` INT NOT NULL,
  PRIMARY KEY (`Dept_CD`),
  CONSTRAINT `fk_Departments_Departments1`
    FOREIGN KEY (`Departments_Dept_CD`)
    REFERENCES `mydb`.`Departments` (`Dept_CD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Dept_Name_UNIQUE` ON `mydb`.`Departments` (`Dept_Name` ASC) VISIBLE;

CREATE INDEX `fk_Departments_Departments1_idx` ON `mydb`.`Departments` (`Departments_Dept_CD` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Courses` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Courses` (
  `Departments_Dept_CD` INT NOT NULL,
  `Cours_ID` INT NOT NULL AUTO_INCREMENT,
  `Cours_Name` VARCHAR(45) NULL,
  `Cours_List_DT` DATETIME NULL,
  `Cours_Remov_DT` DATETIME NULL,
  `Cours_Active` CHAR NULL,
  `Audit_Ins_By` VARCHAR(45) NOT NULL,
  `Audit_Ins_DT` DATETIME NOT NULL,
  `Audit_Upd_By` VARCHAR(45) NULL,
  `Audit_Upd_DT` DATETIME NULL,
  PRIMARY KEY (`Cours_ID`),
  CONSTRAINT `fk_Courses_Departments`
    FOREIGN KEY (`Departments_Dept_CD`)
    REFERENCES `mydb`.`Departments` (`Dept_CD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Cours_Name_UNIQUE` ON `mydb`.`Courses` (`Cours_Name` ASC) VISIBLE;

CREATE INDEX `fk_Courses_Departments_idx` ON `mydb`.`Courses` (`Departments_Dept_CD` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Instructors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Instructors` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Instructors` (
  `Instrct_CD` INT NOT NULL AUTO_INCREMENT,
  `Instrct_Name` VARCHAR(45) NULL,
  `Instrct_eMail` VARCHAR(45) NULL,
  `Instrct_Mobile` VARCHAR(45) NULL,
  `Audit_Ins_By` VARCHAR(45) NOT NULL,
  `Audit_Ins_DT` DATETIME NOT NULL,
  `Audit_Upd_By` VARCHAR(45) NULL,
  `Audit_Upd_DT` DATETIME NULL,
  PRIMARY KEY (`Instrct_CD`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Instrct_Name_UNIQUE` ON `mydb`.`Instructors` (`Instrct_Name` ASC) VISIBLE;

CREATE UNIQUE INDEX `Instrct_Mobile_UNIQUE` ON `mydb`.`Instructors` (`Instrct_Mobile` ASC) VISIBLE;

CREATE UNIQUE INDEX `Instrct_eMail_UNIQUE` ON `mydb`.`Instructors` (`Instrct_eMail` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Course_Admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Course_Admin` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Course_Admin` (
  `Admint_CD` INT NOT NULL AUTO_INCREMENT,
  `Admin_Name` VARCHAR(45) NULL,
  `Admin_eMail` VARCHAR(45) NULL,
  `Admin_Mobile` VARCHAR(45) NULL,
  `Admin_User` VARCHAR(45) NOT NULL,
  `Admin_Paswrd` VARCHAR(45) NOT NULL,
  `Audit_Ins_By` VARCHAR(45) NOT NULL,
  `Audit_Ins_DT` DATETIME NOT NULL,
  `Audit_Upd_By` VARCHAR(45) NULL,
  `Audit_Upd_DT` DATETIME NULL,
  PRIMARY KEY (`Admint_CD`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Instrct_Name_UNIQUE` ON `mydb`.`Course_Admin` (`Admin_Name` ASC) VISIBLE;

CREATE UNIQUE INDEX `Instrct_Mobile_UNIQUE` ON `mydb`.`Course_Admin` (`Admin_Mobile` ASC) VISIBLE;

CREATE UNIQUE INDEX `Instrct_eMail_UNIQUE` ON `mydb`.`Course_Admin` (`Admin_eMail` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Course_Schedul`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Course_Schedul` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Course_Schedul` (
  `Courses_Cours_ID` INT NOT NULL,
  `Students_Student_ID` INT NOT NULL,
  `Class_ID` INT NOT NULL AUTO_INCREMENT,
  `Class_Location` VARCHAR(45) NULL,
  `Class_CamID` VARCHAR(45) NULL,
  `Class_CamURL` VARCHAR(45) NULL,
  `Course_Start_DT` DATETIME NULL,
  `Course_End_DT` DATETIME NULL,
  `Instructors_Instrct_CD` INT NOT NULL,
  `Course_Fee` INT NULL,
  `Audit_Ins_By` VARCHAR(45) NOT NULL,
  `Audit_Ins_DT` DATETIME NOT NULL,
  `Audit_Upd_By` VARCHAR(45) NULL,
  `Audit_Upd_DT` DATETIME NULL,
  `Course_Admin_Admint_CD` INT NOT NULL,
  PRIMARY KEY (`Class_ID`),
  CONSTRAINT `fk_Course_Schedul_Courses1`
    FOREIGN KEY (`Courses_Cours_ID`)
    REFERENCES `mydb`.`Courses` (`Cours_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_Schedul_Students1`
    FOREIGN KEY (`Students_Student_ID`)
    REFERENCES `mydb`.`Students` (`Student_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_Schedul_Instructors1`
    FOREIGN KEY (`Instructors_Instrct_CD`)
    REFERENCES `mydb`.`Instructors` (`Instrct_CD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course_Schedul_Course_Admin1`
    FOREIGN KEY (`Course_Admin_Admint_CD`)
    REFERENCES `mydb`.`Course_Admin` (`Admint_CD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Class_Location_UNIQUE` ON `mydb`.`Course_Schedul` (`Class_Location` ASC) VISIBLE;

CREATE INDEX `fk_Course_Schedul_Courses1_idx` ON `mydb`.`Course_Schedul` (`Courses_Cours_ID` ASC) VISIBLE;

CREATE INDEX `fk_Course_Schedul_Students1_idx` ON `mydb`.`Course_Schedul` (`Students_Student_ID` ASC) VISIBLE;

CREATE INDEX `fk_Course_Schedul_Instructors1_idx` ON `mydb`.`Course_Schedul` (`Instructors_Instrct_CD` ASC) VISIBLE;

CREATE INDEX `fk_Course_Schedul_Course_Admin1_idx` ON `mydb`.`Course_Schedul` (`Course_Admin_Admint_CD` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Attendances`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Attendances` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Attendances` (
  `Attndnc_ID` INT NOT NULL AUTO_INCREMENT,
  `Attndnc_IN_DT` DATETIME NULL,
  `Course_Schedul_Class_ID` INT NOT NULL,
  `Audit_Ins_By` VARCHAR(45) NOT NULL,
  `Audit_Ins_DT` DATETIME NOT NULL,
  `Audit_Upd_By` VARCHAR(45) NULL,
  `Audit_Upd_DT` DATETIME NULL,
  PRIMARY KEY (`Attndnc_ID`),
  CONSTRAINT `fk_Attendances_Course_Schedul1`
    FOREIGN KEY (`Course_Schedul_Class_ID`)
    REFERENCES `mydb`.`Course_Schedul` (`Class_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Attendances_Course_Schedul1_idx` ON `mydb`.`Attendances` (`Course_Schedul_Class_ID` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
