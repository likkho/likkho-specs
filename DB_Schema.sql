/* Schema */

DROP TABLE IF EXISTS `likkhodb`.`ldb_users`;
CREATE TABLE `likkhodb`.`ldb_users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_full_name` VARCHAR(1000) NULL,
  `user_email` VARCHAR(1000) NULL,
  `user_login_type` INT NULL,
  `user_joining_date` DATETIME NULL,
  `user_profile_pic_url` VARCHAR(1000) NULL,
  `user_tagline` VARCHAR(3999) NULL,
  `is_active` BIT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `user_login_type_index` (`user_login_type` ASC));

DROP TABLE IF EXISTS `likkhodb`.`ldb_community`;
CREATE TABLE `likkhodb`.`ldb_community` (
  `community_id` INT NOT NULL AUTO_INCREMENT,
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

DROP TABLE IF EXISTS `likkhodb`.`ldb_posts`;
CREATE TABLE `likkhodb`.`ldb_posts` (
  `post_id` INT NOT NULL  AUTO_INCREMENT,
  `post_title` VARCHAR(3999) NOT NULL,
  `post_text` TEXT NOT NULL,
  `post_url` VARCHAR(3999) NOT NULL,
  `post_media_url` VARCHAR(3999) NULL,
  `post_author_id` INT NOT NULL,
  `post_type_id` INT NOT NULL,
  `post_status_id` INT NOT NULL,
  `post_community_id` INT NOT NULL,
  `post_reference_url` VARCHAR(3999) NULL,
  `post_created_on` DATETIME NOT NULL,
  `is_private` BIT NULL,
  `num_min_read` INT NULL,
  `is_active` BIT NULL DEFAULT 1,
  PRIMARY KEY (`post_id`),
  INDEX `post_author_id_idx` (`post_author_id` ASC),
  INDEX `post_community_id_idx` (`post_community_id` ASC),
  INDEX `created_on` (`post_created_on` ASC),
  CONSTRAINT `post_author_id`
    FOREIGN KEY (`post_author_id`)
    REFERENCES `likkhodb`.`ldb_users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `post_community_id`
    FOREIGN KEY (`post_community_id`)
    REFERENCES `likkhodb`.`ldb_community` (`community_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

DROP TABLE IF EXISTS `likkhodb`.`ldb_comments`;
CREATE TABLE `likkhodb`.`ldb_comments` (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `comment_author_id` INT NOT NULL,
  `comment_text` TEXT NOT NULL,
  `commentd_on` DATETIME NOT NULL,
  `reply_to_comment_id` INT NULL,
  `offensive_flag_count` INT NULL,
  `is_active` BIT NULL,
  PRIMARY KEY (`comment_id`),
  INDEX `post_id_idx` (`post_id` ASC),
  INDEX `comment_author_id_idx` (`comment_author_id` ASC),
  INDEX `commentd_on_index` (`commentd_on` ASC),
  CONSTRAINT `post_id`
    FOREIGN KEY (`post_id`)
    REFERENCES `likkhodb`.`ldb_posts` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comment_author_id`
    FOREIGN KEY (`comment_author_id`)
    REFERENCES `likkhodb`.`ldb_users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

DROP TABLE IF EXISTS `likkhodb`.`ldb_likes`;
CREATE TABLE `likkhodb`.`ldb_likes` (
  `like_id` INT NOT NULL AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `liked_on` DATETIME NOT NULL,
  `is_active` BIT NULL DEFAULT 1,
  PRIMARY KEY (`like_id`),
  INDEX `post_id_idx` (`post_id` ASC),
  INDEX `user_id_idx` (`user_id` ASC),
  CONSTRAINT `likes_post_id`
    FOREIGN KEY (`post_id`)
    REFERENCES `likkhodb`.`ldb_posts` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `likes_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `likkhodb`.`ldb_users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

DROP TABLE IF EXISTS `likkhodb`.`ldb_tags`;
CREATE TABLE `likkhodb`.`ldb_tags` (
  `tag_id` INT NOT NULL AUTO_INCREMENT,
  `tag_name` VARCHAR(1000) NOT NULL,
  `tag_rank` INT NOT NULL,
  `is_active` BIT NULL,
  PRIMARY KEY (`tag_id`));

DROP TABLE IF EXISTS `likkhodb`.`ldb_posts_tags`;
CREATE TABLE `likkhodb`.`ldb_posts_tags` (
  `posts_tags_id` INT NOT NULL AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  `tagged_on` DATETIME NOT NULL,
  `is_active` BIT NULL DEFAULT 1,
  PRIMARY KEY (`posts_tags_id`),
  INDEX `posts_tags_post_id_idx` (`post_id` ASC),
  INDEX `posts_tags_tag_id_idx` (`tag_id` ASC),
  CONSTRAINT `posts_tags_post_id`
    FOREIGN KEY (`post_id`)
    REFERENCES `likkhodb`.`ldb_posts` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `posts_tags_tag_id`
    FOREIGN KEY (`tag_id`)
    REFERENCES `likkhodb`.`ldb_tags` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

DROP TABLE IF EXISTS `likkhodb`.`ldb_followers`;
CREATE TABLE `likkhodb`.`ldb_followers` (
  `follower_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `following_user_id` INT NOT NULL,
  `followed_on` DATETIME NOT NULL,
  `is_active` BIT NULL DEFAULT 1,
  PRIMARY KEY (`follower_id`),
  INDEX `follower_user_id_idx` (`user_id` ASC),
  INDEX `following_user_id_idx` (`following_user_id` ASC),
  CONSTRAINT `follower_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `likkhodb`.`ldb_users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `following_user_id`
    FOREIGN KEY (`following_user_id`)
    REFERENCES `likkhodb`.`ldb_users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

DROP TABLE IF EXISTS `likkhodb`.`ldb_community_followers`;
CREATE TABLE `likkhodb`.`ldb_community_followers` (
  `community_follower_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `community_id` INT NOT NULL,
  `followed_on` DATETIME NOT NULL,
  `is_active` BIT NULL DEFAULT 1,
  PRIMARY KEY (`community_follower_id`),
  INDEX `community_follower_user_id_idx` (`user_id` ASC),
  INDEX `community_follower_community_id_idx` (`community_id` ASC),
  CONSTRAINT `community_follower_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `likkhodb`.`ldb_users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `community_follower_community_id`
    FOREIGN KEY (`community_id`)
    REFERENCES `likkhodb`.`ldb_community` (`community_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

DROP TABLE IF EXISTS `likkhodb`.`ldb_saved_posts`;
CREATE TABLE `likkhodb`.`ldb_saved_posts` (
  `saved_post_id` INT NOT NULL AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `saved_on` DATETIME NOT NULL,
  `saved_status_id` INT NOT NULL,
  `is_active` BIT NULL DEFAULT 1,
  PRIMARY KEY (`saved_post_id`),
  INDEX `saved_user_id_idx` (`user_id` ASC),
  INDEX `saved_post_id_idx` (`post_id` ASC),
  CONSTRAINT `saved_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `likkhodb`.`ldb_users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `saved_post_id`
    FOREIGN KEY (`post_id`)
    REFERENCES `likkhodb`.`ldb_posts` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

DROP TABLE IF EXISTS `likkhodb`.`ldb_favorite_posts`;
CREATE TABLE `likkhodb`.`ldb_favorite_posts` (
  `favorite_post_id` INT NOT NULL AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `favorited_on` DATETIME NOT NULL,
  `is_active` BIT NULL DEFAULT 1,
  PRIMARY KEY (`favorite_post_id`),
  INDEX `favorite_user_id_idx` (`user_id` ASC),
  INDEX `favorite_post_id_idx` (`post_id` ASC),
  CONSTRAINT `favorite_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `likkhodb`.`ldb_users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `favorite_post_id`
    FOREIGN KEY (`post_id`)
    REFERENCES `likkhodb`.`ldb_posts` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

DROP TABLE IF EXISTS `likkhodb`.`ldb_popular_posts`;
CREATE TABLE `likkhodb`.`ldb_popular_posts` (
  `popular_post_id` INT NOT NULL AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `num_likes` BIGINT NULL,
  `num_reads` BIGINT NULL,
  `num_shares` INT NULL,
  `num_marked_offensive` INT NULL,
  `is_active` BIT NULL DEFAULT 1,
  PRIMARY KEY (`popular_post_id`),
  INDEX `popular_post_id_idx` (`post_id` ASC),
  CONSTRAINT `popular_post_id`
    FOREIGN KEY (`post_id`)
    REFERENCES `likkhodb`.`ldb_posts` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

