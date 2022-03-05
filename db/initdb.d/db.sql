CREATE DATABASE IF NOT EXISTS school_power;

USE school_power;

SET NAMES utf8mb4;

-- ----------------------------
-- Table structure for sp_room
-- ----------------------------
DROP TABLE IF EXISTS `sp_room`;
CREATE TABLE `sp_room`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `area` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `building` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `room` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `power` decimal(10, 2) NOT NULL DEFAULT 0,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_show` bool NOT NULL DEFAULT true,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `room`(`room`) USING BTREE,
  INDEX `area`(`area`) USING BTREE,
  INDEX `building`(`building`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sp_log
-- ----------------------------
DROP TABLE IF EXISTS `sp_log`;
CREATE TABLE `sp_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `room` int(10) UNSIGNED NOT NULL,
  `power` decimal(10, 2) NOT NULL,
  `log_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `room`(`room`) USING BTREE,
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`room`) REFERENCES `sp_room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;
