SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`publications`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`publications` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`publications` (
  `name` VARCHAR(250) NOT NULL ,
  `avatar` VARCHAR(250) NULL ,
  PRIMARY KEY (`name`) )
ENGINE = InnoDB;
Insert INTO mydb.publications VALUES ('The Daily Reviewer','glyphicon-eye-open');
Insert INTO mydb.publications VALUES ('International Movie Critic','glyphicon-fire');
Insert INTO mydb.publications VALUES ('MoviesNow','glyphicon-time');
Insert INTO mydb.publications VALUES ('MyNextReview','glyphicon-record');
Insert INTO mydb.publications VALUES ('Movies n\' Games','glyphicon-heart-empty');
Insert INTO mydb.publications VALUES ('TheOne','glyphicon-globe');
Insert INTO mydb.publications VALUES ('ComicBookHero.com','glyphicon-flash');


-- -----------------------------------------------------
-- Table `mydb`.`reviewers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`reviewers` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`reviewers` (
  `name` VARCHAR(255) NOT NULL ,
  `publication` VARCHAR(250) NULL ,
  `avatar` VARCHAR(250) NULL ,
  PRIMARY KEY (`name`) ,
  CONSTRAINT `publication`
    FOREIGN KEY (`publication` )
    REFERENCES `mydb`.`publications` (`name` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
Insert INTO mydb.reviewers VALUES ('Robert Smith','The Daily Reviewer','https://s3.amazonaws.com/uifaces/faces/twitter/angelcolberg/128.jpg');
Insert INTO mydb.reviewers VALUES ('Chris Harris','International Movie Critic','https://s3.amazonaws.com/uifaces/faces/twitter/bungiwan/128.jpg');
Insert INTO mydb.reviewers VALUES ('Janet Garcia','MoviesNow','https://s3.amazonaws.com/uifaces/faces/twitter/grrr_nl/128.jpg');
Insert INTO mydb.reviewers VALUES ('Andrew West','MyNextReview','https://s3.amazonaws.com/uifaces/faces/twitter/d00maz/128.jpg');
Insert INTO mydb.reviewers VALUES ('Mindy Lee','Movies n\' Games','https://s3.amazonaws.com/uifaces/faces/twitter/laurengray/128.jpg');
Insert INTO mydb.reviewers VALUES ('Martin Thomas','TheOne','https://s3.amazonaws.com/uifaces/faces/twitter/karsh/128.jpg');
Insert INTO mydb.reviewers VALUES ('Anthony Miller','ComicBookHero.com','https://s3.amazonaws.com/uifaces/faces/twitter/9lessons/128.jpg');



CREATE INDEX `publication_idx` ON `mydb`.`reviewers` (`publication` ASC) ;


-- -----------------------------------------------------
-- Table `mydb`.`movies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`movies` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`movies` (
  `title` VARCHAR(250) NOT NULL ,
  `release` VARCHAR(250) NULL ,
  `score` INT(11) NULL ,
  `reviewer` VARCHAR(250) NULL ,
  `publication` VARCHAR(250) NULL ,
  PRIMARY KEY (`title`) ,
  CONSTRAINT `reviewer`
    FOREIGN KEY (`reviewer` )
    REFERENCES `mydb`.`reviewers` (`name` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
Insert INTO mydb.movies VALUES ('Suicide Squad','2016','8','Robert Smith','The Daily Reviewer');
Insert INTO mydb.movies VALUES ('Batman vs. Superman','2016','6','Chris Harris','International Movie Critic');
Insert INTO mydb.movies VALUES ('Captain America: Civil War','2016','9','Janet Garcia','MoviesNow');
Insert INTO mydb.movies VALUES ('Deadpool','2016','9','Andrew West','MyNextReview');
Insert INTO mydb.movies VALUES ('Avengers: Age of Ultron','2015','7','Mindy Lee','Movies n\' Games');
Insert INTO mydb.movies VALUES ('Ant-Man','2015','8','Martin Thomas','TheOne');
Insert INTO mydb.movies VALUES ('Guardians of the Galaxy','2014','10','Anthony Miller','ComicBookHero.com');
CREATE INDEX `reviewer_idx` ON `mydb`.`movies` (`reviewer` ASC) ;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

GRANT ALL PRIVILEGES ON mydb.* TO moviesbackend IDENTIFIED BY "moviesbackend";