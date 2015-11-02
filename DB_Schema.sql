/* Schema */

// User table
CREATE TABLE `likkhodb`.`ldb_users` (
  `user_id` INT NOT NULL,
  `user_full_name` VARCHAR(1000) NULL,
  `user_email` VARCHAR(1000) NULL,
  `user_login_type` INT NULL,
  `user_joining_date` DATETIME NULL,
  `user_profile_pic_url` VARCHAR(1000) NULL,
  `user_tagline` VARCHAR(3999) NULL,
  `is_active` BIT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `user_login_type_index` (`user_login_type` ASC));

// Community Table
CREATE TABLE `likkhodb`.`ldb_community` (
  `community_id` INT NOT NULL,
  `community_name` VARCHAR(1000) NOT NULL,
  `community_pic_url` VARCHAR(3999) NULL,
  `community_desc` VARCHAR(3999) NULL,
  `community_moderator_id` INT NULL,
  `community_type` INT NOT NULL,
  `community_created_on` DATETIME NOT NULL,
  `is_active` BIT NULL DEFAULT 1,
  PRIMARY KEY (`community_id`),
  INDEX `moderator_id_idx` (`community_moderator_id` ASC),
  CONSTRAINT `moderator_id`
    FOREIGN KEY (`community_moderator_id`)
    REFERENCES `likkhodb`.`ldb_users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
