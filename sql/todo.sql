/*
 Navicat Premium Data Transfer

 Source Server         : lokal
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : todo

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 23/09/2019 09:42:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `todo_list_id` int(10) UNSIGNED NOT NULL,
  `completed_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tasks_todo_list_id_foreign`(`todo_list_id`) USING BTREE,
  CONSTRAINT `tasks_todo_list_id_foreign` FOREIGN KEY (`todo_list_id`) REFERENCES `todo_lists` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES (28, 'belajar ips', 12, '2019-09-21 17:27:02', '2019-09-21 17:27:00', '2019-09-21 17:27:02');
INSERT INTO `tasks` VALUES (29, 'belajar ngaji', 12, NULL, '2019-09-21 17:27:09', '2019-09-23 02:26:59');
INSERT INTO `tasks` VALUES (31, 'coba', 13, NULL, '2019-09-23 02:40:22', '2019-09-23 02:40:22');

-- ----------------------------
-- Table structure for todo_lists
-- ----------------------------
DROP TABLE IF EXISTS `todo_lists`;
CREATE TABLE `todo_lists`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of todo_lists
-- ----------------------------
INSERT INTO `todo_lists` VALUES (12, 'belajar saja', 'belajar untuk kuliah saja', 1, '2019-09-21 17:24:54', '2019-09-23 02:26:29');
INSERT INTO `todo_lists` VALUES (13, 'satu', 'satu saja\r\n', 1, '2019-09-23 02:27:12', '2019-09-23 02:27:12');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'jojo', '11aryawiratama@gmail.com', '$2y$10$AD6gp5NE3ZOg/YHzRxF2luJVKRlsIxbe/LMsh/bXnHlNXgJbmIKDe', 'IijoGQ6G7CJ2OKlLwenJl8IjlUwyKpGXnRkwUhpieZz5lmpOIdpEYEVjBOV5', '2019-09-21 17:22:00', '2019-09-23 02:39:50');
INSERT INTO `users` VALUES (4, 'arya', 'aa@gmai.com', '$2y$10$tz091IQQC8XygrRtPSzD5.G8cTM5lZJzUyNadVRb4gWMuqCMSRQsu', NULL, '2019-09-22 00:10:51', '2019-09-22 00:10:51');

SET FOREIGN_KEY_CHECKS = 1;
