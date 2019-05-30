/*
 Navicat Premium Data Transfer

 Source Server         : LOCALHOST
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : mweb-digital_store

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 31/05/2019 00:46:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart_products
-- ----------------------------
DROP TABLE IF EXISTS `cart_products`;
CREATE TABLE `cart_products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_unit` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cart_products_stock_unit_uindex`(`stock_unit`) USING BTREE,
  UNIQUE INDEX `cart_products_cart_id_stock_unit_uindex`(`cart_id`, `stock_unit`) USING BTREE,
  CONSTRAINT `cart_products_carts_id_fk` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cookie_cart` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `owner_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cart_cookie_cart_uindex`(`cookie_cart`) USING BTREE,
  UNIQUE INDEX `carts_owner_id_uindex`(`owner_id`) USING BTREE,
  CONSTRAINT `carts_users_id_fk` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES (11, '5cea5c697d63b', '2019-05-26 11:29:13', 9);
INSERT INTO `carts` VALUES (12, '5ceee40b0e622', '2019-05-29 21:56:59', NULL);
INSERT INTO `carts` VALUES (13, '5ceeec266b5d7', '2019-05-29 22:31:34', NULL);

-- ----------------------------
-- Table structure for cookies
-- ----------------------------
DROP TABLE IF EXISTS `cookies`;
CREATE TABLE `cookies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cookie_session` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cookies_cookie_session_uindex`(`cookie_session`) USING BTREE,
  INDEX `cookies_users_id_fk`(`user_id`) USING BTREE,
  CONSTRAINT `cookies_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cookies
-- ----------------------------
INSERT INTO `cookies` VALUES (1, '5ce906a72d796', 9, '2019-05-25 11:11:03');
INSERT INTO `cookies` VALUES (2, '5ce906bdcaccc', 9, '2019-05-25 11:11:25');
INSERT INTO `cookies` VALUES (3, '5ce975580cc36', 9, '2019-05-25 19:03:20');
INSERT INTO `cookies` VALUES (4, '5ce975d627ea1', 9, '2019-05-25 19:05:26');
INSERT INTO `cookies` VALUES (5, '5ce976a4b2800', 9, '2019-05-25 19:08:52');
INSERT INTO `cookies` VALUES (6, '5ce9a914eb449', 9, '2019-05-25 22:44:04');
INSERT INTO `cookies` VALUES (7, '5ce9aa527830f', 9, '2019-05-25 22:49:22');
INSERT INTO `cookies` VALUES (8, '5ce9b43a472ed', 9, '2019-05-25 23:31:38');
INSERT INTO `cookies` VALUES (9, '5ce9b4f765687', 9, '2019-05-25 23:34:47');
INSERT INTO `cookies` VALUES (10, '5ce9b55a4d157', 9, '2019-05-25 23:36:26');
INSERT INTO `cookies` VALUES (11, '5cea5a7100176', 9, '2019-05-26 11:20:49');
INSERT INTO `cookies` VALUES (12, '5cea5c09d494f', 9, '2019-05-26 11:27:37');
INSERT INTO `cookies` VALUES (13, '5cea5cd0e199c', 9, '2019-05-26 11:30:56');
INSERT INTO `cookies` VALUES (14, '5cea5d4a95df1', 9, '2019-05-26 11:32:58');
INSERT INTO `cookies` VALUES (15, '5cea5d939de6d', 9, '2019-05-26 11:34:11');
INSERT INTO `cookies` VALUES (16, '5cea5e2301577', 9, '2019-05-26 11:36:35');
INSERT INTO `cookies` VALUES (17, '5cea5ea9a4777', 9, '2019-05-26 11:38:49');
INSERT INTO `cookies` VALUES (18, '5ceef08e825e1', 9, '2019-05-29 22:50:22');
INSERT INTO `cookies` VALUES (19, '5ceef29eaeb25', 9, '2019-05-29 22:59:10');
INSERT INTO `cookies` VALUES (20, '5cef056ae5950', 9, '2019-05-30 00:19:22');
INSERT INTO `cookies` VALUES (21, '5cf02b40e959e', 9, '2019-05-30 21:13:04');
INSERT INTO `cookies` VALUES (22, '5cf044a17980d', 9, '2019-05-30 23:01:21');

-- ----------------------------
-- Table structure for order_products
-- ----------------------------
DROP TABLE IF EXISTS `order_products`;
CREATE TABLE `order_products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_unit` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_products_orders_id_fk`(`order_id`) USING BTREE,
  CONSTRAINT `order_products_orders_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_products
-- ----------------------------
INSERT INTO `order_products` VALUES (1, 3, 5);
INSERT INTO `order_products` VALUES (2, 36, 5);
INSERT INTO `order_products` VALUES (3, 46, 5);
INSERT INTO `order_products` VALUES (4, 53, 5);
INSERT INTO `order_products` VALUES (8, 5, 6);
INSERT INTO `order_products` VALUES (9, 11, 7);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `owner_id` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `shipment_type` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `shipping_address_id` int(11) NOT NULL,
  `code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_transaction_uindex`(`transaction`) USING BTREE,
  UNIQUE INDEX `orders_code_uindex`(`code`) USING BTREE,
  INDEX `orders_users_id_fk`(`owner_id`) USING BTREE,
  INDEX `orders_payment_methods_id_fk`(`payment_method_id`) USING BTREE,
  INDEX `orders_shipping_addresses_id_fk`(`shipping_address_id`) USING BTREE,
  CONSTRAINT `orders_payment_methods_id_fk` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_shipping_addresses_id_fk` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_addresses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_users_id_fk` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (5, 'transaction_5cf05a97bf1b3', 0, 9, '2019-05-31 00:35:03', 0, 1, 1, 'ord_5cf05a97bf26f');
INSERT INTO `orders` VALUES (6, 'transaction_5cf05b1e1d725', 0, 9, '2019-05-31 00:37:18', 0, 1, 1, 'ord_5cf05b1e1d820');
INSERT INTO `orders` VALUES (7, 'transaction_5cf05c0fdfcea', 0, 9, '2019-05-31 00:41:19', 0, 1, 1, 'ord_5cf05c0fdfde5');

-- ----------------------------
-- Table structure for payment_methods
-- ----------------------------
DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE `payment_methods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_digits` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry` date NOT NULL,
  `owner_id` int(11) NOT NULL,
  `token_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_payment_methods_users`(`owner_id`) USING BTREE,
  CONSTRAINT `FK_payment_methods_users` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payment_methods
-- ----------------------------
INSERT INTO `payment_methods` VALUES (1, 'Visa', '4242', '2020-02-01', 9, '5cf0413ecd373', 'Gabor Galazzo');

-- ----------------------------
-- Table structure for product_watchers
-- ----------------------------
DROP TABLE IF EXISTS `product_watchers`;
CREATE TABLE `product_watchers`  (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_id`(`product_id`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `product_watchers_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_watchers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` float NOT NULL,
  `category` int(11) NOT NULL,
  `date_added` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `small_description` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a:0:{}',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  FULLTEXT INDEX `search_index`(`name`, `description`, `small_description`, `category_info`)
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (7, 'B019PIOJYU', 'https://images-eu.ssl-images-amazon.com/images/I/51fonMmNpnL.jpg', '\"Turning the envelope over, his hand trembling, Harry saw a purple wax seal bearing a coat of arms; a lion, an eagle, a badger and a snake surrounding a large letter \'H\'.\"  \r\n\r\nHarry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry\'s eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!  Harry Potter and the Philosopherâ€™s Stone is also available as an Illustrated Kindle-in-Motion edition.', 'Harry Potter and the Philosopher\'s Stone', 17.7, 1, '2019-05-25 11:55:30', '\"Turning the envelope over, his hand trembling, Harry saw a purple wax seal bearing a coat of arms; a lion, an eagle, a badger and a snake surrounding a large letter \'H\'.\"', 'a:5:{s:6:\"Author\";s:14:\" J.K. Rowling \";s:6:\"Editor\";s:21:\"Pottermore Publishing\";s:4:\"ISBN\";s:10:\"1408855895\";s:12:\"Print length\";s:3:\"345\";s:16:\"Publication year\";s:4:\"2015\";}');
INSERT INTO `products` VALUES (8, 'B019PIOJY0', 'https://images-eu.ssl-images-amazon.com/images/I/51OZerWcGCL.jpg', '\"\'There is a plot, Harry Potter. A plot to make most terrible things happen at Hogwarts School of Witchcraft and Wizardry this year.\'\"   \r\n\r\nHarry Potter\'s summer has included the worst birthday ever, doomy warnings from a house-elf called Dobby, and rescue from the Dursleys by his friend Ron Weasley in a magical flying car! Back at Hogwarts School of Witchcraft and Wizardry for his second year, Harry hears strange whispers echo through empty corridors - and then the attacks start. Students are found as though turned to stone... Dobby\'s sinister predictions seem to be coming true.', 'Harry Potter and the Chamber of Secrets', 14.28, 1, '2019-05-25 11:57:44', '\"\'There is a plot, Harry Potter. A plot to make most terrible things happen at Hogwarts School of Witchcraft and Wizardry this year.\'\" ', 'a:5:{s:6:\"Author\";s:13:\"J.K. Rowling \";s:6:\"Editor\";s:21:\"Pottermore Publishing\";s:4:\"ISBN\";s:10:\"B019PIOJY0\";s:12:\"Print length\";s:3:\"373\";s:16:\"Publication year\";s:4:\"2015\";}');
INSERT INTO `products` VALUES (9, 'B019PIOJZ4', 'https://images-eu.ssl-images-amazon.com/images/I/51NuYi4-XoL.jpg', '\"\'Welcome to the Knight Bus, emergency transport for the stranded witch or wizard. Just stick out your wand hand, step on board and we can take you anywhere you want to go.\'\"  \r\n\r\nWhen the Knight Bus crashes through the darkness and screeches to a halt in front of him, it\'s the start of another far from ordinary year at Hogwarts for Harry Potter. Sirius Black, escaped mass-murderer and follower of Lord Voldemort, is on the run - and they say he is coming after Harry. In his first ever Divination class, Professor Trelawney sees an omen of death in Harry\'s tea leaves... But perhaps most terrifying of all are the Dementors patrolling the school grounds, with their soul-sucking kiss...', 'Harry Potter and the Prisoner of Azkaban', 12.21, 1, '2019-05-25 11:58:46', '\"\'Welcome to the Knight Bus, emergency transport for the stranded witch or wizard. Just stick out your wand hand, step on board and we can take you anywhere you want to go.\'\"', 'a:5:{s:6:\"Author\";s:13:\"J.K. Rowling \";s:6:\"Editor\";s:21:\"Pottermore Publishing\";s:4:\"ISBN\";s:10:\"B019PIOJZ4\";s:12:\"Print length\";s:3:\"475\";s:16:\"Publication year\";s:4:\"2015\";}');
INSERT INTO `products` VALUES (10, 'B019PIOJWW', 'https://images-eu.ssl-images-amazon.com/images/I/51WR45IjfSL.jpg', '\"\'There will be three tasks, spaced throughout the school year, and they will test the champions in many different ways â€¦ their magical prowess - their daring - their powers of deduction - and, of course, their ability to cope with danger.\'\"  \r\n\r\nThe Triwizard Tournament is to be held at Hogwarts. Only wizards who are over seventeen are allowed to enter - but that doesn\'t stop Harry dreaming that he will win the competition. Then at Hallowe\'en, when the Goblet of Fire makes its selection, Harry is amazed to find his name is one of those that the magical cup picks out. He will face death-defying tasks, dragons and Dark wizards, but with the help of his best friends, Ron and Hermione, he might just make it through - alive!', 'Harry Potter and the Goblet of Fire', 12, 1, '2019-05-25 12:00:10', '\"\'There will be three tasks, spaced throughout the school year, and they will test the champions in many different ways â€¦ their magical prowess - their daring - their powers of deduction - and, of course, their ability to cope with danger.\'\"', 'a:5:{s:6:\"Author\";s:12:\"J.K. Rowling\";s:6:\"Editor\";s:21:\"Pottermore Publishing\";s:4:\"ISBN\";s:10:\"B019PIOJWW\";s:12:\"Print length\";s:3:\"633\";s:16:\"Publication year\";s:4:\"2015\";}');
INSERT INTO `products` VALUES (11, 'B019PIOJV8', 'https://images-eu.ssl-images-amazon.com/images/I/51-zRYQweBL.jpg', '\"\'You are sharing the Dark Lord\'s thoughts and emotions. The Headmaster thinks it inadvisable for this to continue. He wishes me to teach you how to close your mind to the Dark Lord.\'\"  \r\n\r\nDark times have come to Hogwarts. After the Dementors\' attack on his cousin Dudley, Harry Potter knows that Voldemort will stop at nothing to find him. There are many who deny the Dark Lord\'s return, but Harry is not alone: a secret order gathers at Grimmauld Place to fight against the Dark forces. Harry must allow Professor Snape to teach him how to protect himself from Voldemort\'s savage assaults on his mind. But they are growing stronger by the day and Harry is running out of time...', 'Harry Potter and the Order of the Phoenix', 17.59, 1, '2019-05-25 12:01:23', '\"\'You are sharing the Dark Lord\'s thoughts and emotions. The Headmaster thinks it inadvisable for this to continue. He wishes me to teach you how to close your mind to the Dark Lord.\'\"', 'a:5:{s:6:\"Author\";s:12:\"J.K. Rowling\";s:6:\"Editor\";s:21:\"Pottermore Publishing\";s:4:\"ISBN\";s:10:\"B019PIOJV8\";s:12:\"Print length\";s:3:\"815\";s:16:\"Publication year\";s:4:\"2015\";}');
INSERT INTO `products` VALUES (12, 'B019PIOJZE', 'https://images-eu.ssl-images-amazon.com/images/I/519RmXyy9EL.jpg', '\"There it was, hanging in the sky above the school: the blazing green skull with a serpent tongue, the mark Death Eaters left behind whenever they had entered a buildingâ€¦ wherever they had murderedâ€¦\"  \r\n\r\nWhen Dumbledore arrives at Privet Drive one summer night to collect Harry Potter, his wand hand is blackened and shrivelled, but he does not reveal why. Secrets and suspicion are spreading through the wizarding world, and Hogwarts itself is not safe. Harry is convinced that Malfoy bears the Dark Mark: there is a Death Eater amongst them. Harry will need powerful magic and true friends as he explores Voldemort\'s darkest secrets, and Dumbledore prepares him to face his destiny...', 'Harry Potter and the Half-Blood Prince', 15.01, 1, '2019-05-25 12:03:28', '\"There it was, hanging in the sky above the school: the blazing green skull with a serpent tongue, the mark Death Eaters left behind whenever they had entered a buildingâ€¦ wherever they had murderedâ€¦\"', 'a:5:{s:6:\"Author\";s:12:\"J.K. Rowling\";s:6:\"Editor\";s:22:\"Pottermore Publishing \";s:4:\"ISBN\";s:10:\"0439785960\";s:12:\"Print length\";s:3:\"652\";s:16:\"Publication year\";s:4:\"2015\";}');
INSERT INTO `products` VALUES (13, 'B019PIOJVI', 'https://images-eu.ssl-images-amazon.com/images/I/51d1HdwwlOL.jpg', '\"\'Give me Harry Potter,\' said Voldemort\'s voice, \'and none shall be harmed. Give me Harry Potter, and I shall leave the school untouched. Give me Harry Potter, and you will be rewarded.\'\"  \r\n\r\nAs he climbs into the sidecar of Hagrid\'s motorbike and takes to the skies, leaving Privet Drive for the last time, Harry Potter knows that Lord Voldemort and the Death Eaters are not far behind. The protective charm that has kept Harry safe until now is broken, but he cannot keep hiding. The Dark Lord is breathing fear into everything Harry loves and to stop him Harry will have to find and destroy the remaining Horcruxes. The final battle must begin - Harry must stand and face his enemy ...', 'Harry Potter and the Deathly Hallows', 15.54, 1, '2019-05-25 12:04:36', '\"\'Give me Harry Potter,\' said Voldemort\'s voice, \'and none shall be harmed. Give me Harry Potter, and I shall leave the school untouched. Give me Harry Potter, and you will be rewarded.\'\"', 'a:5:{s:6:\"Author\";s:12:\"J.K. Rowling\";s:6:\"Editor\";s:21:\"Pottermore Publishing\";s:4:\"ISBN\";s:10:\"1512379786\";s:12:\"Print length\";s:3:\"313\";s:16:\"Publication year\";s:4:\"2015\";}');
INSERT INTO `products` VALUES (16, '0785191364', 'https://images-na.ssl-images-amazon.com/images/I/51qpNjOKMRL._SX345_BO1,204,203,200_.jpg', 'Gathering together to face Loki, Iron Man, Thor, Hulk, Ant-Man and the Wasp formed comic\'s greatest assemblage of super heroes-the Avengers. Then, pulled from the icy northern Atlantic, Captain America returned and the Avengers truly became Earth\'s Mightiest Heroes! Written by Stan \"The Man\" Lee and illustrated by Jack Kirby and Don Heck, this debut Avengers Masterworks includes the first appearances of Kang the Conqueror, Wonder Man, the Space Phantom and Baron Zemo and the Masters of Evil, as well as the Hulk\'s departure from the team and his battle with the Sub-Mariner against the Avengers. They\'re the Masterworks that the Marvel Universe was built upon that every Avengers fan should experience, so reserve your copy today!', 'Marvel Masterworks: The Avengers Volume 1 (New Printing)', 17.1, 2, '2019-05-25 13:02:23', 'Gathering together to face Loki, Iron Man, Thor, Hulk, Ant-Man and the Wasp formed comic\'s greatest assemblage of super heroes-the Avengers.', 'a:5:{s:6:\"Author\";s:8:\"Stan Lee\";s:6:\"Editor\";s:27:\"Marvel; Revised ed. edition\";s:4:\"ISBN\";s:14:\"978-0785191360\";s:12:\"Print length\";s:3:\"248\";s:16:\"Publication year\";s:4:\"2015\";}');
INSERT INTO `products` VALUES (17, '0785121056', 'https://images-na.ssl-images-amazon.com/images/I/51ylDy4BHfL._SX322_BO1,204,203,200_.jpg', 'After Adam Warlock\'s return in Infinity Gauntlet, his worse half the Magus wasn\'t far behind! The struggle for ultimate power over the universe continues when a stockpile of evil twins overwhelm the Fantastic Four, Avengers, X-Men, New Warriors, Alpha Flight and more! Will the universe be saved, destroyed... or both? Collects Infinity War #1-6, Warlock and the Infinity Watch #7-10 and Marvel Comics Presents #108-111.', 'Infinity War', 20.52, 2, '2019-05-25 15:00:13', 'After Adam Warlock\'s return in Infinity Gauntlet, his worse half the Magus wasn\'t far behind! ', 'a:5:{s:6:\"Author\";s:12:\" Jim Starlin\";s:6:\"Editor\";s:7:\"Marvel \";s:4:\"ISBN\";s:14:\"978-0785121053\";s:12:\"Print length\";s:3:\"400\";s:16:\"Publication year\";s:4:\"2006\";}');
INSERT INTO `products` VALUES (18, '0785156593', 'https://images-na.ssl-images-amazon.com/images/I/61qmnnRvXML._SX323_BO1,204,203,200_.jpg', 'It\'s the Avengers, the New Warriors, the X-Men and more against the omnipotent Eternal, Thanos! The Mad Titan has become the most powerful being in the universe, and enslavement or destruction may be the only choices he gives it! The successive Starlin sagas that shook space and time start here!', 'Infinity Gauntlet', 11.39, 2, '2019-05-25 15:01:12', 'It\'s the Avengers, the New Warriors, the X-Men and more against the omnipotent Eternal, Thanos! The Mad Titan has become the most powerful being in the universe, and enslavement or destruction may be the only choices he gives it! The successive Starlin sagas that shook space and time start here!', 'a:5:{s:6:\"Author\";s:11:\"Jim Starlin\";s:6:\"Editor\";s:23:\"Marvel; 13454th edition\";s:4:\"ISBN\";s:14:\"978-0785156598\";s:12:\"Print length\";s:4:\"256 \";s:16:\"Publication year\";s:4:\"2011\";}');
INSERT INTO `products` VALUES (19, '0785107746', 'https://images-na.ssl-images-amazon.com/images/I/51R7D2FRA0L._SX313_BO1,204,203,200_.jpg', 'The Avengers must confront their greatest foe yet: Ultron, the sentient robot created by Avenger Hank Pym, who has seized control of the world\'s media and destroyed the Eastern European country of Slorenia.', 'AVENGERS: ULTRON UNLIMITED', 20, 2, '2019-05-25 15:03:09', 'The Avengers must confront their greatest foe yet: Ultron, the sentient robot created by Avenger Hank Pym, who has seized control of the world\'s media and destroyed the Eastern European country of Slorenia.', 'a:5:{s:6:\"Author\";s:11:\"Kurt Busiek\";s:6:\"Editor\";s:18:\"Marvel Enterprises\";s:4:\"ISBN\";s:14:\"978-0785107743\";s:12:\"Print length\";s:2:\"96\";s:16:\"Publication year\";s:4:\"2001\";}');
INSERT INTO `products` VALUES (20, 'B01KKN0I1C', 'https://images-na.ssl-images-amazon.com/images/I/61%2BOAGNenIL._SX425_.jpg', '', 'Harry Potter and the Sorcerer\'s Stone', 5.69, 5, '2019-05-25 15:24:34', '', 'a:4:{s:8:\"Director\";s:14:\"Chris Columbus\";s:6:\"Actors\";s:73:\"Daniel Radcliffe, Rupert Grint, Emma Watson, John Cleese, Robbie Coltrane\";s:5:\"Genre\";s:7:\"Fantasy\";s:16:\"Publication year\";s:4:\"2016\";}');
INSERT INTO `products` VALUES (21, 'B01KKN0HYU', 'https://images-na.ssl-images-amazon.com/images/I/91JyewI8jCL._SX425_.jpg', '', 'Harry Potter and the Chamber of Secrets', 6.48, 5, '2019-05-25 15:25:44', '', 'a:4:{s:8:\"Director\";s:14:\"Chris Columbus\";s:6:\"Actors\";s:73:\"Daniel Radcliffe, Rupert Grint, Emma Watson, Kenneth Branagh, John Cleese\";s:5:\"Genre\";s:7:\"Fantasy\";s:16:\"Publication year\";s:4:\"2016\";}');
INSERT INTO `products` VALUES (22, 'B01KKN0HZ4', 'https://images-na.ssl-images-amazon.com/images/I/6144DDhmciL._SX425_.jpg', '', 'Harry Potter and the Prisoner of Azkaban', 9.96, 5, '2019-05-25 15:26:35', '', 'a:4:{s:8:\"Director\";s:15:\"Alfonso CuarÃ³n\";s:6:\"Actors\";s:76:\"Daniel Radcliffe, Rupert Grint, Emma Watson, Robbie Coltrane, Michael Gambon\";s:5:\"Genre\";s:7:\"Fantasy\";s:16:\"Publication year\";s:4:\"2016\";}');
INSERT INTO `products` VALUES (23, '', 'https://images-na.ssl-images-amazon.com/images/I/91eek4GJobL._SX425_.jpg', '', 'Harry Potter and the Goblet of Fire', 7.93, 5, '2019-05-25 15:28:28', '', 'a:4:{s:8:\"Director\";s:11:\"Mike Newell\";s:6:\"Actors\";s:75:\"Daniel Radcliffe, Rupert Grint, Emma Watson, Robbie Coltrane, Ralph Fiennes\";s:5:\"Genre\";s:7:\"Fantasy\";s:16:\"Publication year\";s:4:\"2016\";}');
INSERT INTO `products` VALUES (25, 'B01KMWAV3Q', 'https://images-na.ssl-images-amazon.com/images/I/91XzfVwf76L._SX425_.jpg', '', 'Harry Potter and the Deathly Hallows, Part II', 10.88, 5, '2019-05-25 15:30:46', '', 'a:4:{s:8:\"Director\";s:11:\"David Yates\";s:6:\"Actors\";s:82:\"Daniel Radcliffe, Rupert Grint, Emma Watson, Helena Bonham Carter, Robbie Coltrane\";s:5:\"Genre\";s:7:\"Fantasy\";s:16:\"Publication year\";s:4:\"2016\";}');
INSERT INTO `products` VALUES (26, 'B07BYWVLZR', 'https://images-na.ssl-images-amazon.com/images/I/81GfZasnt9L._SY500_.jpg', 'An unprecedented cinematic journey ten years in the making and spanning the entire Marvel Cinematic Universe, Marvel Studios\' \'Avengers: Infinity War\' brings to the screen the ultimate, deadliest showdown of all time. As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.', 'AVENGERS: INFINITY WAR', 13.94, 5, '2019-05-25 15:35:14', 'An unprecedented cinematic journey ten years in the making and spanning the entire Marvel Cinematic Universe, MARVEL STUDIOS\' THE AVENGERS', 'a:4:{s:8:\"Director\";s:19:\"Joe & Anthony Russo\";s:6:\"Actors\";s:81:\"Robert Downey Jr., Chris Hemsworth, Mark Ruffalo, Chris Evans, Scarlett Johansson\";s:5:\"Genre\";s:6:\"Action\";s:16:\"Publication year\";s:4:\"2018\";}');
INSERT INTO `products` VALUES (28, 'B01L7DYMIE', 'https://images-na.ssl-images-amazon.com/images/I/917IDVbIJRL._SY500_.jpg', '', 'Marvel\'s The Avengers 2-Movie Collection', 46, 5, '2019-05-25 15:38:01', '', 'a:4:{s:8:\"Director\";s:19:\"Joe & Anthony Russo\";s:6:\"Actors\";s:61:\"Chris Evans, Robert Jr. Downey, Mark Ruffalo, Chris Hemsworth\";s:5:\"Genre\";s:6:\"Action\";s:16:\"Publication year\";s:4:\"2016\";}');
INSERT INTO `products` VALUES (29, 'B07HN2XHVC', 'https://images-na.ssl-images-amazon.com/images/I/81Qmd0Dv43L._SX522_.jpg', '', 'love', 16.49, 3, '2019-05-29 22:17:22', '', 'a:3:{s:6:\"Author\";s:14:\"Buble\' Michael\";s:16:\"Publication year\";s:4:\"2018\";s:6:\"Tracks\";a:10:{i:0;s:29:\"When I Fall In Love - (04:03)\";i:1;s:34:\"I Only Have Eyes for You - (03:22)\";i:2;s:26:\"Love You Anymore - (03:02)\";i:3;s:56:\"La vie en rose (feat. CÃ©cile McLorin Salvant) - (03:49)\";i:4;s:28:\"My Funny Valentine - (04:25)\";i:5;s:22:\"Such a Night - (03:17)\";i:6;s:21:\"Forever Now - (03:40)\";i:7;s:64:\"Help Me Make It Through the Night (feat. Loren Allred) - (03:42)\";i:8;s:29:\"When You\'re Smiling - (02:50)\";i:10;s:24:\" Where or When - (03:05)\";}}');
INSERT INTO `products` VALUES (31, 'B0041KVZ1I', 'https://images-na.ssl-images-amazon.com/images/I/81oFpzU4d3L._SX522_PJautoripBadge,BottomRight,4,-40_OU11__.jpg', '', 'Abbey Road', 22.99, 4, '2019-05-29 22:36:55', '', 'a:1:{s:6:\"Tracks\";a:15:{i:0;s:27:\"\"Come Together\"	Lennon	4:19\";i:1;s:43:\"\"Something\" (George Harrison)	Harrison	3:02\";i:2;s:40:\"\"Maxwell\'s Silver Hammer\"	McCartney	3:27\";i:3;s:28:\"\"Oh! Darling\"	McCartney	3:27\";i:4;s:47:\"\"Octopus\'s Garden\" (Richard Starkey)	Starr	2:51\";i:5;s:41:\"\"I Want You (She\'s So Heavy)\"	Lennon	7:47\";i:6;s:52:\"\"Here Comes the Sun\" (George Harrison)	Harrison	3:05\";i:7;s:45:\"\"Because\"	Lennon, McCartney and Harrison	2:45\";i:8;s:51:\"\"Sun King\"	Lennon, with McCartney and Harrison	2:26\";i:10;s:30:\"\"Mean Mr. Mustard\"	Lennon	1:06\";i:11;s:27:\"\"Polythene Pam\"	Lennon	1:13\";i:12;s:56:\"\"She Came In Through the Bathroom Window\"	McCartney	1:58\";i:13;s:32:\"\"Golden Slumbers\"	McCartney	1:31\";i:14;s:67:\"\"Carry That Weight\"	McCartney, with Lennon, Harrison and Starr	1:36\";i:15;s:24:\"\"The End\"	McCartney	2:05\";}}');
INSERT INTO `products` VALUES (32, 'B00K6IU3MG', 'https://images-na.ssl-images-amazon.com/images/I/91iW%2BpWm6WL._AC_SX215_.jpg', 'Nintendo Super Mario Galaxy 2, Wii. Piattaforma: Nintendo Wii, Genere: Piattaforma, Classificazione ESRB: E (tutti)', 'Super Mario: Galaxy 2', 27.9, 6, '2019-05-29 22:42:51', 'Nintendo Super Mario Galaxy 2, Wii. Piattaforma: Nintendo Wii, Genere: Piattaforma, Classificazione ESRB: E (tutti)', 'a:3:{s:8:\"Platform\";s:12:\"Nintendo Wii\";s:9:\"Publisher\";s:8:\"Nintendo\";s:16:\"Publication year\";s:4:\"2014\";}');
INSERT INTO `products` VALUES (33, 'B005KJG6TA', 'https://images-na.ssl-images-amazon.com/images/I/51JaVWRVHwL._AC_SX215_.jpg', 'Super Mario Galaxy, Nintendo Wii', 'Super Mario Galaxy - Nintendo Selects Edition', 27.98, 6, '2019-05-29 22:43:50', 'Super Mario Galaxy, Nintendo Wii', 'a:3:{s:8:\"Platform\";s:12:\"Nintendo Wii\";s:9:\"Publisher\";s:8:\"Nintendo\";s:16:\"Publication year\";s:4:\"2011\";}');

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `author_id`(`author_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 251 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES (1, 23, 25, 3, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (2, 86, 23, 1, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (3, 99, 8, 3, 'Phasellus sit amet erat. Nulla tempus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (4, 53, 18, 3, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (5, 113, 26, 4, 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (6, 33, 7, 4, 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (7, 72, 25, 1, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (8, 109, 9, 1, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (9, 95, 9, 3, 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (10, 57, 26, 4, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (11, 38, 16, 4, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (12, 20, 23, 3, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (13, 96, 28, 1, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (14, 58, 20, 3, 'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (15, 75, 7, 2, 'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (16, 21, 22, 1, 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (17, 106, 18, 1, 'Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (19, 109, 18, 3, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (20, 71, 16, 2, 'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (22, 31, 10, 2, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (23, 95, 16, 1, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (25, 73, 17, 3, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (27, 104, 8, 3, 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (28, 93, 8, 2, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (30, 31, 13, 1, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (31, 23, 8, 2, 'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (32, 109, 12, 3, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (33, 25, 20, 3, 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (35, 75, 20, 2, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (36, 55, 16, 2, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (37, 90, 7, 3, 'Fusce consequat. Nulla nisl.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (38, 105, 9, 4, 'Morbi non lectus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (39, 86, 26, 2, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (40, 88, 25, 1, 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (41, 39, 12, 3, 'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (42, 109, 16, 1, 'Sed accumsan felis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (43, 55, 25, 2, 'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (44, 101, 16, 4, 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (45, 47, 19, 2, 'Praesent blandit.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (46, 49, 13, 3, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (48, 67, 12, 1, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (49, 112, 12, 4, 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (51, 50, 10, 1, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (52, 44, 13, 3, 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (53, 26, 23, 4, 'Donec semper sapien a libero.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (54, 69, 22, 3, 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (55, 68, 23, 2, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (56, 108, 22, 2, 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (57, 79, 26, 1, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (59, 86, 19, 1, 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (60, 62, 7, 4, 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (61, 111, 17, 3, 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (62, 55, 22, 2, 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (64, 82, 12, 2, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (65, 107, 17, 1, 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (66, 25, 19, 4, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (67, 95, 17, 3, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (68, 95, 26, 3, 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (70, 30, 12, 1, 'Nullam sit amet turpis elementum ligula vehicula consequat.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (71, 81, 17, 2, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (72, 82, 11, 4, 'Donec dapibus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (73, 112, 28, 3, 'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (74, 21, 17, 1, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (76, 55, 17, 3, 'Quisque id justo sit amet sapien dignissim vestibulum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (77, 56, 23, 3, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (78, 86, 22, 3, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (79, 19, 10, 4, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (80, 102, 12, 3, 'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (82, 46, 19, 4, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (83, 101, 21, 2, 'Nullam molestie nibh in lectus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (84, 94, 10, 4, 'Nam dui.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (85, 41, 25, 2, 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (86, 97, 21, 2, 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (87, 105, 18, 4, 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (90, 32, 12, 2, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (91, 110, 22, 4, 'Praesent lectus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (92, 34, 16, 4, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (93, 98, 21, 4, 'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (94, 51, 11, 2, 'Nulla ut erat id mauris vulputate elementum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (95, 32, 23, 2, 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (96, 56, 25, 2, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (97, 80, 19, 2, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (98, 42, 10, 1, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (101, 60, 22, 2, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (102, 24, 19, 4, 'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (103, 64, 11, 3, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (104, 110, 7, 3, 'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (106, 40, 21, 2, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (107, 95, 8, 2, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (108, 39, 16, 2, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (109, 113, 18, 2, 'Pellentesque at nulla.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (110, 107, 23, 3, 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (111, 83, 26, 1, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (112, 99, 26, 3, 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (113, 109, 7, 4, 'Vivamus vestibulum sagittis sapien.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (114, 81, 23, 4, 'Proin risus. Praesent lectus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (116, 86, 16, 1, 'Phasellus id sapien in sapien iaculis congue.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (118, 101, 17, 4, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (119, 16, 23, 2, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (120, 77, 20, 3, 'In hac habitasse platea dictumst.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (121, 29, 13, 3, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (122, 28, 9, 1, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (123, 74, 12, 3, 'Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (124, 96, 17, 2, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (125, 33, 17, 1, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (126, 36, 20, 3, 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (127, 50, 25, 3, 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (129, 32, 22, 4, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (130, 112, 25, 4, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (131, 105, 26, 1, 'Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (132, 92, 28, 2, 'Curabitur in libero ut massa volutpat convallis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (134, 30, 19, 1, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (135, 72, 20, 4, 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (136, 39, 8, 4, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (137, 76, 18, 2, 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (138, 34, 19, 2, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (140, 30, 23, 1, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (142, 95, 26, 2, 'Ut at dolor quis odio consequat varius. Integer ac leo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (143, 28, 23, 4, 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (144, 54, 11, 2, 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (145, 90, 7, 4, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (146, 98, 10, 3, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (147, 24, 11, 2, 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (148, 18, 10, 3, 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (149, 24, 10, 1, 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (150, 109, 25, 4, 'Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (151, 76, 21, 3, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (152, 69, 20, 2, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (153, 76, 10, 2, 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (154, 91, 17, 1, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (155, 110, 8, 1, 'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (157, 33, 8, 4, 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (158, 69, 23, 4, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (159, 54, 11, 1, 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (160, 20, 11, 2, 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (161, 102, 8, 2, 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (162, 62, 21, 4, 'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (163, 42, 26, 1, 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (164, 79, 21, 3, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (165, 47, 12, 1, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (166, 30, 10, 1, 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (167, 29, 26, 1, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (168, 90, 26, 3, 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (169, 61, 11, 3, 'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (170, 101, 28, 1, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (171, 107, 25, 1, 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (172, 45, 20, 1, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (174, 82, 18, 2, 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (176, 84, 12, 2, 'Pellentesque at nulla.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (177, 105, 9, 2, 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (178, 28, 20, 3, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (179, 66, 20, 1, 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (181, 104, 23, 2, 'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (183, 76, 10, 3, 'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (185, 95, 8, 1, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (186, 114, 7, 3, 'In hac habitasse platea dictumst.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (188, 53, 23, 1, 'Donec dapibus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (189, 84, 19, 3, 'Quisque ut erat. Curabitur gravida nisi at nibh.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (190, 100, 21, 2, 'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (191, 35, 16, 3, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (193, 95, 17, 4, 'In congue. Etiam justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (194, 108, 20, 3, 'Nunc rhoncus dui vel sem.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (195, 46, 8, 2, 'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (196, 47, 9, 1, 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (198, 112, 17, 2, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (199, 113, 12, 3, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (201, 58, 28, 3, 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (202, 17, 25, 2, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (203, 22, 18, 4, 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (204, 88, 11, 1, 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (205, 26, 28, 2, 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (206, 63, 9, 2, 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (207, 27, 7, 3, 'Vestibulum ac est lacinia nisi venenatis tristique.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (210, 18, 19, 3, 'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (211, 88, 19, 3, 'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (212, 32, 21, 3, 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (213, 111, 18, 1, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (215, 95, 23, 3, 'Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (216, 38, 8, 2, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (217, 15, 26, 1, 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (218, 93, 23, 4, 'Duis aliquam convallis nunc.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (219, 71, 22, 1, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (220, 60, 13, 3, 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (221, 37, 13, 3, 'In congue. Etiam justo. Etiam pretium iaculis justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (222, 84, 9, 4, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (223, 39, 18, 2, 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (224, 20, 26, 4, 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (225, 59, 23, 1, 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (227, 17, 13, 3, 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (228, 78, 26, 4, 'Etiam vel augue.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (229, 113, 13, 2, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (231, 16, 13, 1, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (232, 85, 13, 3, 'Nulla suscipit ligula in lacus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (233, 91, 9, 4, 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (234, 66, 19, 2, 'Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (235, 40, 28, 3, 'Nulla ut erat id mauris vulputate elementum.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (236, 75, 11, 3, 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (237, 82, 11, 1, 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (238, 15, 20, 1, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (239, 97, 26, 3, 'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (240, 26, 17, 3, 'Aliquam erat volutpat. In congue. Etiam justo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (241, 71, 8, 1, 'Nam tristique tortor eu pede.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (242, 78, 21, 2, 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (243, 97, 28, 1, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (244, 48, 11, 4, 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (246, 113, 9, 1, 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (247, 79, 18, 4, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (248, 45, 21, 2, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (249, 107, 16, 2, 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', '2019-05-25 16:17:24');
INSERT INTO `reviews` VALUES (250, 97, 25, 3, 'Phasellus id sapien in sapien iaculis congue.', '2019-05-25 16:17:24');

-- ----------------------------
-- Table structure for shipping_addresses
-- ----------------------------
DROP TABLE IF EXISTS `shipping_addresses`;
CREATE TABLE `shipping_addresses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `full_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_shipping_addresses_users`(`owner_id`) USING BTREE,
  CONSTRAINT `FK_shipping_addresses_users` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shipping_addresses
-- ----------------------------
INSERT INTO `shipping_addresses` VALUES (1, 'Via Wagner 51', 'Alessandria', 'AL', 'Italia', '15121', 9, 'Gabor Galazzo');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `stock_sku_uindex`(`sku`) USING BTREE,
  INDEX `FK_stock_productd`(`product_id`) USING BTREE,
  CONSTRAINT `FK_stock_productd` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES (1, '19UUA9F70DA886121', 7, 0);
INSERT INTO `stock` VALUES (2, '1D7RV1CTXBS811810', 22, 0);
INSERT INTO `stock` VALUES (3, '1FBNE3BL8DD202648', 26, 1);
INSERT INTO `stock` VALUES (4, '1FMCU4K30AK453436', 22, 0);
INSERT INTO `stock` VALUES (5, '1FMCU4K34AK849014', 20, 1);
INSERT INTO `stock` VALUES (6, '1FTEW1CM3EK881407', 10, 0);
INSERT INTO `stock` VALUES (7, '1FTMF1C83AK748476', 7, 0);
INSERT INTO `stock` VALUES (8, '1FTMF1EW4AF413554', 21, 0);
INSERT INTO `stock` VALUES (9, '1FTSW2B50AE116621', 20, 0);
INSERT INTO `stock` VALUES (10, '1FTWW3B51AE053083', 13, 0);
INSERT INTO `stock` VALUES (11, '1G4HR57Y16U050016', 19, 1);
INSERT INTO `stock` VALUES (12, '1G6AH5R35E0244048', 11, 0);
INSERT INTO `stock` VALUES (13, '1G6DC8EY0B0707787', 11, 0);
INSERT INTO `stock` VALUES (14, '1G6DH5E5XD0909710', 7, 0);
INSERT INTO `stock` VALUES (15, '1G6YV36AX75719908', 13, 0);
INSERT INTO `stock` VALUES (16, '1GD12ZCG4CF534398', 19, 0);
INSERT INTO `stock` VALUES (17, '1GTG5BE3XF1000654', 28, 0);
INSERT INTO `stock` VALUES (18, '1N6AF0KX1FN177582', 9, 0);
INSERT INTO `stock` VALUES (19, '2C3CDXGJ6DH297998', 18, 0);
INSERT INTO `stock` VALUES (20, '2C3CK5CV7AH660288', 19, 0);
INSERT INTO `stock` VALUES (21, '2G4GX5GV4B9967353', 17, 0);
INSERT INTO `stock` VALUES (22, '2T3BFREV7FW205402', 18, 0);
INSERT INTO `stock` VALUES (23, '3D73Y4HL6BG121373', 10, 0);
INSERT INTO `stock` VALUES (24, '3GYFNEEY9AS457157', 16, 0);
INSERT INTO `stock` VALUES (25, '3N1CN7AP6FL423134', 28, 0);
INSERT INTO `stock` VALUES (26, '3VW517AT9FM291007', 21, 0);
INSERT INTO `stock` VALUES (27, '4T1BD1EB3DU651209', 10, 0);
INSERT INTO `stock` VALUES (28, '5UXZW0C53BL655234', 21, 0);
INSERT INTO `stock` VALUES (29, 'JH4CU26649C970274', 13, 0);
INSERT INTO `stock` VALUES (30, 'JN1AZ4EH8FM373954', 21, 0);
INSERT INTO `stock` VALUES (31, 'JN8AF5MR1CT602924', 28, 0);
INSERT INTO `stock` VALUES (32, 'JTEBU4BFXAK344197', 9, 0);
INSERT INTO `stock` VALUES (33, 'KMHHT6KD2BU402087', 28, 0);
INSERT INTO `stock` VALUES (34, 'SCBLC43F15C164457', 17, 0);
INSERT INTO `stock` VALUES (35, 'SCFEBBCF9CG561189', 12, 0);
INSERT INTO `stock` VALUES (36, 'TRURD28N261244474', 26, 1);
INSERT INTO `stock` VALUES (37, 'VNKJTUD37FA655595', 12, 0);
INSERT INTO `stock` VALUES (38, 'WA1CGAFE2DD084042', 18, 0);
INSERT INTO `stock` VALUES (39, 'WA1EY74L78D614957', 26, 0);
INSERT INTO `stock` VALUES (40, 'WA1VGBFP7EA117894', 28, 0);
INSERT INTO `stock` VALUES (41, 'WA1VMAFP1EA855998', 17, 0);
INSERT INTO `stock` VALUES (42, 'WA1VMBFE8BD068478', 7, 0);
INSERT INTO `stock` VALUES (43, 'WAUCFAFR7CA333928', 16, 0);
INSERT INTO `stock` VALUES (44, 'WAUFFAFL9EA815473', 16, 0);
INSERT INTO `stock` VALUES (45, 'WAUFGAFC5DN260204', 9, 0);
INSERT INTO `stock` VALUES (46, 'WAUGL58EX5A567043', 23, 1);
INSERT INTO `stock` VALUES (47, 'WAUGU44D82N754466', 9, 0);
INSERT INTO `stock` VALUES (48, 'WAUNF98P48A372230', 17, 0);
INSERT INTO `stock` VALUES (49, 'WAURD68D02A908125', 8, 0);
INSERT INTO `stock` VALUES (50, 'WAURD68D92A675684', 28, 0);
INSERT INTO `stock` VALUES (51, 'WAUUL68E05A771794', 20, 0);
INSERT INTO `stock` VALUES (52, 'WBABD53464P771274', 21, 0);
INSERT INTO `stock` VALUES (53, 'WBAEP33412P992075', 23, 1);
INSERT INTO `stock` VALUES (54, 'WBAVC93597K465705', 25, 0);
INSERT INTO `stock` VALUES (55, 'WP0AB2A90AS594196', 13, 0);
INSERT INTO `stock` VALUES (56, 'WVGAV7AX6FW296220', 9, 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` int(11) NOT NULL,
  `secret` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_payment_method` int(11) NULL DEFAULT NULL,
  `default_shipping_address` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_uindex`(`email`) USING BTREE,
  INDEX `FK_users_payment_methods`(`default_payment_method`) USING BTREE,
  INDEX `FK_users_shipping_addresses`(`default_shipping_address`) USING BTREE,
  CONSTRAINT `FK_users_shipping_addresses` FOREIGN KEY (`default_shipping_address`) REFERENCES `shipping_addresses` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_payment_methods_id_fk` FOREIGN KEY (`default_payment_method`) REFERENCES `payment_methods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (9, 'Gabor', 'Galazzo', 'gabor.galazzo@gmail.com', 8866424, '$2y$12$bj5wurPlxQnTB4EojGM4febvXNiywv040h28vpSoCORrI0.x903w6', 1, 1);
INSERT INTO `users` VALUES (11, 'Gabor', 'Galazzo', 'gaborando@live.it', 4393958, '$2y$12$oHUwQ.YZYQorATYaMvIDYORGyxJE5yQPTucDbmexOXZiIQAg3gHYy', NULL, NULL);
INSERT INTO `users` VALUES (12, 'Michela', 'Galazzo', 'michelagalazzo@icloud.com', 2196061, '$2y$12$OWx3dhFC/fnV/RZB2ftGcOurN1agSNJ2gTPGCwZ2s3ejaeNoAl6d2', NULL, NULL);
INSERT INTO `users` VALUES (14, 'Mario', 'Galazzo', 'mariogalazzo@libero.it', 4130327, '$2y$12$0ulOIDL0sLXQWZtcvn/eU.0l8epRlsejZMZuUgR06C.cPRAlP7uyu', NULL, NULL);
INSERT INTO `users` VALUES (15, 'Kaycee', 'Mendenhall', 'kmendenhall0@symantec.com', 4482847, '318a45920a7013344896d01eab384dff8a9b76e0', NULL, NULL);
INSERT INTO `users` VALUES (16, 'Derrek', 'Caitlin', 'dcaitlin1@odnoklassniki.ru', 2308963, '2bf08d7402cd6f6966bdbfdb43a6eeb5569275f7', NULL, NULL);
INSERT INTO `users` VALUES (17, 'Winslow', 'Renzullo', 'wrenzullo2@sohu.com', 5685668, 'ea14f13161b744c140b7322d5cfdc7850da8eacc', NULL, NULL);
INSERT INTO `users` VALUES (18, 'Cchaddie', 'Losano', 'closano3@gov.uk', 4650503, 'b79100ee7ecb5e1a3025aa3b36d200d5abe97fc7', NULL, NULL);
INSERT INTO `users` VALUES (19, 'Glory', 'Jowett', 'gjowett4@japanpost.jp', 5800603, '19d3e5453885658c8060ae2cfa22791c5702743a', NULL, NULL);
INSERT INTO `users` VALUES (20, 'Celie', 'Closs', 'ccloss5@techcrunch.com', 4768633, '4b2e1d795568d060a13f19c8530028da9bb33d16', NULL, NULL);
INSERT INTO `users` VALUES (21, 'Cordula', 'Caldaro', 'ccaldaro6@feedburner.com', 6332601, '4bfa8cd73038b1c164ab7ce2361e2917cbf1ef35', NULL, NULL);
INSERT INTO `users` VALUES (22, 'Ryan', 'Whitcomb', 'rwhitcomb7@techcrunch.com', 2344315, 'a8b12e5f5d962e290aaaf2bd03684fe21a2fadf2', NULL, NULL);
INSERT INTO `users` VALUES (23, 'Gus', 'Ortells', 'gortells8@oaic.gov.au', 1208066, 'e8dcd1d3704418fb66bcb5dd7a2efeda9ff0e500', NULL, NULL);
INSERT INTO `users` VALUES (24, 'Sterne', 'Kittles', 'skittles9@nymag.com', 2406737, '725e9686c34754eda1406e18b47e59ea3bc00f37', NULL, NULL);
INSERT INTO `users` VALUES (25, 'Harman', 'Battersby', 'hbattersbya@mediafire.com', 9806927, '72c98bf151c588b62b0cd3c2409bacc4425bcf96', NULL, NULL);
INSERT INTO `users` VALUES (26, 'Serene', 'McGarvie', 'smcgarvieb@wunderground.com', 3642151, '023bdbe616e3e44b75294b0a1bbfafc1f9bb2ef9', NULL, NULL);
INSERT INTO `users` VALUES (27, 'Francisco', 'Conisbee', 'fconisbeec@go.com', 4396988, '211f79a2fc6f190a0d9d225a38e7876c4d58fb7f', NULL, NULL);
INSERT INTO `users` VALUES (28, 'Ettore', 'Madill', 'emadilld@domainmarket.com', 9189506, '9ea2e984499a6f56245a752fa703ba7d819d7653', NULL, NULL);
INSERT INTO `users` VALUES (29, 'Mohammed', 'Gallamore', 'mgallamoree@ifeng.com', 1549089, '5cb7b4a8840e03d0bf4708b9a5e43735fd6b8b3e', NULL, NULL);
INSERT INTO `users` VALUES (30, 'Annemarie', 'Lambird', 'alambirdf@trellian.com', 2100015, 'd021b985893de0b23c9fd735e744e1bb34a56e24', NULL, NULL);
INSERT INTO `users` VALUES (31, 'Jens', 'Milmoe', 'jmilmoeg@facebook.com', 4471837, 'c1ad8afbfdeaac950e570e6967a0f6b0dd61dc7a', NULL, NULL);
INSERT INTO `users` VALUES (32, 'Larine', 'Sell', 'lsellh@cdbaby.com', 9455003, '8177de2ec5c0c001019924dd87750a12ad38a3f7', NULL, NULL);
INSERT INTO `users` VALUES (33, 'Laurene', 'Denziloe', 'ldenziloei@163.com', 3743091, 'dce389656544c7d2e1a3de18ac99c88493da60ef', NULL, NULL);
INSERT INTO `users` VALUES (34, 'Kelsy', 'Tickle', 'kticklej@flavors.me', 8117254, 'ca2a85fbb4956e2fa7ec5540e9d5a32ba844a6c3', NULL, NULL);
INSERT INTO `users` VALUES (35, 'Gretchen', 'Borne', 'gbornek@fc2.com', 1876691, '362f9781697c3ce5063e091db1a0cc88665b2f22', NULL, NULL);
INSERT INTO `users` VALUES (36, 'Michaeline', 'Kiraly', 'mkiralyl@ebay.com', 2495344, '98fd3233004db92f7ee92a62fa7c00b1ee89d590', NULL, NULL);
INSERT INTO `users` VALUES (37, 'Natty', 'Sinclair', 'nsinclairm@e-recht24.de', 2394746, '06b7fb85885df4a5d7cf2fa7781bc58031028810', NULL, NULL);
INSERT INTO `users` VALUES (38, 'Demott', 'Moth', 'dmothn@aol.com', 2669782, '31fb89437aea6ca1c7fd8240d5c058b3c24d7ec7', NULL, NULL);
INSERT INTO `users` VALUES (39, 'Rosita', 'Hayton', 'rhaytono@icio.us', 9432003, '317b77e0790231ed053ae2331773e1bb38493ad3', NULL, NULL);
INSERT INTO `users` VALUES (40, 'Julius', 'Oehme', 'joehmep@cloudflare.com', 9229565, '66ff3c5c36148eb8e8ec87b59aa61ca1822a5dd0', NULL, NULL);
INSERT INTO `users` VALUES (41, 'Page', 'Martino', 'pmartinoq@posterous.com', 5399438, '5617cd22c2ff5e707331446052461a6f1371b89e', NULL, NULL);
INSERT INTO `users` VALUES (42, 'Cicely', 'Sheahan', 'csheahanr@booking.com', 3666642, 'cc9d9d9fc6098bc56849cd54f2a59d980cbe9f04', NULL, NULL);
INSERT INTO `users` VALUES (43, 'Inesita', 'Yakubov', 'iyakubovs@furl.net', 5720337, '51b04fc49a4899869569cf4856040070e563b951', NULL, NULL);
INSERT INTO `users` VALUES (44, 'Pattie', 'Lindenblatt', 'plindenblattt@biglobe.ne.jp', 7426297, '9ff4c22b9dc1684993a2e867294f1b447803f4c1', NULL, NULL);
INSERT INTO `users` VALUES (45, 'Nicolais', 'Gunn', 'ngunnu@ihg.com', 4281093, '7b1cab0341e0389a21c2b365af45c51c09d63850', NULL, NULL);
INSERT INTO `users` VALUES (46, 'Hamish', 'Garrand', 'hgarrandv@t.co', 4543816, '3121578d3be03b12b03eda07b1e412b78bcc6b53', NULL, NULL);
INSERT INTO `users` VALUES (47, 'Ariel', 'Sans', 'asansw@ed.gov', 1682101, '7ce1a68c892ec97aacdf5775e3de6aa2a508fbc4', NULL, NULL);
INSERT INTO `users` VALUES (48, 'Vivienne', 'Shewan', 'vshewanx@homestead.com', 9326719, 'cd2ae77ca4200908615c4bb254833da9be205de8', NULL, NULL);
INSERT INTO `users` VALUES (49, 'Shae', 'Spikins', 'sspikinsy@weebly.com', 1923726, '11652f3338c462b2556730f2a2c699c647d197fa', NULL, NULL);
INSERT INTO `users` VALUES (50, 'Kellsie', 'McKeurton', 'kmckeurtonz@squidoo.com', 5970163, '88becb1ae8462f6347f93cd10391c5aaa777390b', NULL, NULL);
INSERT INTO `users` VALUES (51, 'Elset', 'Pease', 'epease10@paginegialle.it', 8004599, '550df70c2592ec526de0630fc08a98072339049b', NULL, NULL);
INSERT INTO `users` VALUES (52, 'Angel', 'Ennew', 'aennew11@xrea.com', 2325906, '183020607923fc35d82207a3d5764f804f75811e', NULL, NULL);
INSERT INTO `users` VALUES (53, 'Oona', 'Brainsby', 'obrainsby12@cloudflare.com', 6498639, 'f77478cdf40691af33be28fa523c7024df454fd9', NULL, NULL);
INSERT INTO `users` VALUES (54, 'Melania', 'Nieass', 'mnieass13@simplemachines.org', 4229187, 'beb05b712c1ef2a2f151068dc55456c32f3da48a', NULL, NULL);
INSERT INTO `users` VALUES (55, 'Brett', 'Beavors', 'bbeavors14@sakura.ne.jp', 8933108, '5e26b57ec11633df0e00bbf0630c765e7559ef9f', NULL, NULL);
INSERT INTO `users` VALUES (56, 'Gennifer', 'Auguste', 'gauguste15@hp.com', 3105136, '1a7831c9e09d4c130d73bb3dcecbf4af91c8b7fc', NULL, NULL);
INSERT INTO `users` VALUES (57, 'Kally', 'Gobeau', 'kgobeau16@tuttocitta.it', 9120665, 'e8532bd51f623b32d578d0ef1a277037efabdd82', NULL, NULL);
INSERT INTO `users` VALUES (58, 'Pollyanna', 'Danahar', 'pdanahar17@surveymonkey.com', 5572765, '36884150f77b0683bc7dafa709f4a46e6063c81f', NULL, NULL);
INSERT INTO `users` VALUES (59, 'Drusilla', 'McIlory', 'dmcilory18@mac.com', 6815671, '3d8540f8b8f101e34a82f6f1b57fdd96e7fc5593', NULL, NULL);
INSERT INTO `users` VALUES (60, 'Mikael', 'Carty', 'mcarty19@foxnews.com', 1673990, '625a6ca4501698a8c45a09c8f74f590eeebfc4e3', NULL, NULL);
INSERT INTO `users` VALUES (61, 'Angelia', 'Humble', 'ahumble1a@vimeo.com', 3391140, '7b0ce0f326b28b57115da64784dbb5813010d2b7', NULL, NULL);
INSERT INTO `users` VALUES (62, 'Malinde', 'Van Oord', 'mvanoord1b@mail.ru', 1647773, 'f8328f0f52703a2e3dab3269f5e2cc126f2d35ee', NULL, NULL);
INSERT INTO `users` VALUES (63, 'Shalne', 'Heaviside', 'sheaviside1c@dailymotion.com', 2983351, 'e21133f86d1afa5a9afb7edd3c41502a5abb00c7', NULL, NULL);
INSERT INTO `users` VALUES (64, 'Guntar', 'Cassimer', 'gcassimer1d@engadget.com', 5631115, 'c49e243588bab9b6db001f5adc71d7822527788e', NULL, NULL);
INSERT INTO `users` VALUES (65, 'Junette', 'Plewright', 'jplewright1e@google.it', 2776537, '08c9c1e373cd70e9fcc0fd9476fb572fdb493662', NULL, NULL);
INSERT INTO `users` VALUES (66, 'Vikky', 'Sibbons', 'vsibbons1f@amazonaws.com', 7632534, '4c2c34ae2fc7fa45a71ea6cb786478f8845037e0', NULL, NULL);
INSERT INTO `users` VALUES (67, 'Orv', 'Siaspinski', 'osiaspinski1g@princeton.edu', 7027646, 'a1a4f75b30e396af63dffe08e8366825dbe0b1eb', NULL, NULL);
INSERT INTO `users` VALUES (68, 'Garwin', 'Brands', 'gbrands1h@redcross.org', 6247348, 'eaf1f1b3e6acde56af405cd387767250591860f7', NULL, NULL);
INSERT INTO `users` VALUES (69, 'Jannelle', 'Philler', 'jphiller1i@gmpg.org', 9111631, '199f4ac1a8304fb398afe2be2c4ae5c679bf7772', NULL, NULL);
INSERT INTO `users` VALUES (70, 'Florinda', 'Deering', 'fdeering1j@ed.gov', 9573965, 'e51bfb02234fc5d2e70700b2356d997e129cf2a4', NULL, NULL);
INSERT INTO `users` VALUES (71, 'Harris', 'Sidebottom', 'hsidebottom1k@live.com', 2187226, 'eada53ac410244b23b527f1100fe2a7e7ffa93a8', NULL, NULL);
INSERT INTO `users` VALUES (72, 'Alric', 'Yele', 'ayele1l@who.int', 7569427, 'b9f92ec9e51c4cda48df0ee131699e654addeb65', NULL, NULL);
INSERT INTO `users` VALUES (73, 'Gretal', 'Attyeo', 'gattyeo1m@nhs.uk', 5274778, 'ae9978e63520c8c8079d5ea2eddf2dcb106bf901', NULL, NULL);
INSERT INTO `users` VALUES (74, 'Amie', 'Goldes', 'agoldes1n@miibeian.gov.cn', 4186126, 'cffc7ed376b7e7968187ba05a98440fb18c984d4', NULL, NULL);
INSERT INTO `users` VALUES (75, 'Maximilianus', 'Thomelin', 'mthomelin1o@wikipedia.org', 2800749, 'ecc05b1e3f4ea03f90bb16684734a0d50095ad3a', NULL, NULL);
INSERT INTO `users` VALUES (76, 'Coreen', 'Stapele', 'cstapele1p@slate.com', 2325521, 'a90f2ea1a90da7d609d7cbf9635b016c7cb7b473', NULL, NULL);
INSERT INTO `users` VALUES (77, 'Rudd', 'Luc', 'rluc1q@mlb.com', 1769580, '0d08270568e3f20a7def808a7a34e06a7f6dd96d', NULL, NULL);
INSERT INTO `users` VALUES (78, 'Chrissie', 'Roser', 'croser1r@columbia.edu', 2154436, '89dbef0512a847bdc072fd788ee0c10ab8353830', NULL, NULL);
INSERT INTO `users` VALUES (79, 'Janeva', 'Czaple', 'jczaple1s@csmonitor.com', 8277396, '6593b42702333952a46293470dd5555d3c643b7b', NULL, NULL);
INSERT INTO `users` VALUES (80, 'Marrilee', 'Abbado', 'mabbado1t@tripod.com', 5088814, '8c8dd0c8642a189cbafece313c02070794a16205', NULL, NULL);
INSERT INTO `users` VALUES (81, 'Corenda', 'Derisley', 'cderisley1u@bloglines.com', 1531475, '62407c53cdcadf788590f65d406b483110f946ab', NULL, NULL);
INSERT INTO `users` VALUES (82, 'Shaina', 'Held', 'sheld1v@java.com', 5821488, 'bc5981e90b42c7a5edd61dd18803500943c94b42', NULL, NULL);
INSERT INTO `users` VALUES (83, 'Issiah', 'Stienham', 'istienham1w@freewebs.com', 8187872, '0059eba2769b4b4a200ab661ff59d54754513130', NULL, NULL);
INSERT INTO `users` VALUES (84, 'Ewen', 'Eastop', 'eeastop1x@army.mil', 4664049, '05ba7067c39a3a2a66aefe3e963bf467a9b0b0cd', NULL, NULL);
INSERT INTO `users` VALUES (85, 'Brian', 'Catterill', 'bcatterill1y@marriott.com', 9556340, 'e6ba459424444323f2eb82bcf6c943b3ce29604b', NULL, NULL);
INSERT INTO `users` VALUES (86, 'Terry', 'Ziemsen', 'tziemsen1z@thetimes.co.uk', 8830146, '7c760a640621f3f9e85955a494203f89f11bd0e9', NULL, NULL);
INSERT INTO `users` VALUES (87, 'Donall', 'Hendrik', 'dhendrik20@un.org', 5510874, '8f402e6ddb04a742c71396f787deadbcd2e37d2a', NULL, NULL);
INSERT INTO `users` VALUES (88, 'Vick', 'Tyrrell', 'vtyrrell21@hao123.com', 2334018, '3008661a58df05e186c79268065dda003d9af880', NULL, NULL);
INSERT INTO `users` VALUES (89, 'Alexia', 'Durrance', 'adurrance22@comsenz.com', 1785250, '53281e04766e67d3c70b3531c48c00ad3f82cf63', NULL, NULL);
INSERT INTO `users` VALUES (90, 'Farah', 'Andrieux', 'fandrieux23@woothemes.com', 2308429, '39ece9313e09b19eff5556ad0b5b2c2c3d562105', NULL, NULL);
INSERT INTO `users` VALUES (91, 'Priscella', 'Stanlick', 'pstanlick24@kickstarter.com', 2455110, '78519209cd858944194b0b9f7a482d887253675c', NULL, NULL);
INSERT INTO `users` VALUES (92, 'Mill', 'Everleigh', 'meverleigh25@irs.gov', 7977652, 'c54cee82172701b339bc431d974e22b67e4f8237', NULL, NULL);
INSERT INTO `users` VALUES (93, 'Saundra', 'Koeppe', 'skoeppe26@dropbox.com', 9892485, 'bf4acc2a4609e22082262e09fe65eab18e2660e1', NULL, NULL);
INSERT INTO `users` VALUES (94, 'Donnie', 'Knowlman', 'dknowlman27@fda.gov', 2175951, 'a774c98ecee4375f773bb7c01abd84d71175bff5', NULL, NULL);
INSERT INTO `users` VALUES (95, 'Annamarie', 'Elman', 'aelman28@reddit.com', 3182765, 'e0be533e0f831f56cbe262c4e6976819aad742c2', NULL, NULL);
INSERT INTO `users` VALUES (96, 'Kris', 'Gregol', 'kgregol29@wunderground.com', 7432251, '2eab464716e13c4c36b535010561fb25f0e52643', NULL, NULL);
INSERT INTO `users` VALUES (97, 'Jodi', 'Tassel', 'jtassel2a@indiatimes.com', 5798228, 'd95ba45e91c58320b455cbd76b6396e64aa29bfd', NULL, NULL);
INSERT INTO `users` VALUES (98, 'Karlik', 'Kettlesting', 'kkettlesting2b@uiuc.edu', 3488696, '24b62189c2c4cefb46ff09cc1bb928ef719254ec', NULL, NULL);
INSERT INTO `users` VALUES (99, 'Haydon', 'Brandone', 'hbrandone2c@shinystat.com', 9844953, '26aca81f01c4b7c6176d5a3921ac22dda1cb9653', NULL, NULL);
INSERT INTO `users` VALUES (100, 'Rozella', 'Ford', 'rford2d@seattletimes.com', 2941584, 'b43b120240175495ac1e68393aa4f6c1de51b6d1', NULL, NULL);
INSERT INTO `users` VALUES (101, 'Sharyl', 'McGeachie', 'smcgeachie2e@opera.com', 8566119, 'a6e7d1427a019ca28bf08def97bbc67a4b8871cf', NULL, NULL);
INSERT INTO `users` VALUES (102, 'Gerick', 'Annice', 'gannice2f@eepurl.com', 9096106, '2f8a38dcafb63aa95d7046b18c73d4815f3048b3', NULL, NULL);
INSERT INTO `users` VALUES (103, 'Ronnie', 'Lindenstrauss', 'rlindenstrauss2g@blog.com', 3340187, 'ab48feaefef60ea433571f9919e5f0304111210c', NULL, NULL);
INSERT INTO `users` VALUES (104, 'Georgette', 'Bosanko', 'gbosanko2h@163.com', 9130314, '7609830ea89d49cb2975d6b5188db751da60baa3', NULL, NULL);
INSERT INTO `users` VALUES (105, 'Josi', 'Gounel', 'jgounel2i@google.pl', 6964126, '273f5200c1d92f34a4eb13f9ba9a7603197704ba', NULL, NULL);
INSERT INTO `users` VALUES (106, 'Maury', 'Sellner', 'msellner2j@cdc.gov', 8525892, '081fca041b25452eea5de48a8a4bae956b8b3e25', NULL, NULL);
INSERT INTO `users` VALUES (107, 'Jeramey', 'Folkerts', 'jfolkerts2k@yale.edu', 4482440, 'fc076d0148203a16176e2e90f42d780e68893c6c', NULL, NULL);
INSERT INTO `users` VALUES (108, 'Orion', 'Pettengell', 'opettengell2l@stumbleupon.com', 1012557, '0c2aeecb284cf6036ae6ed185dcf08ecb36d1aed', NULL, NULL);
INSERT INTO `users` VALUES (109, 'Bevin', 'Spatig', 'bspatig2m@adobe.com', 1898118, '97daad6e6926e1f175d7c04897badecc577bfc58', NULL, NULL);
INSERT INTO `users` VALUES (110, 'Stephine', 'Gammons', 'sgammons2n@multiply.com', 2185462, '9508af83f97222ed3370e88cac72fb31d8775c5e', NULL, NULL);
INSERT INTO `users` VALUES (111, 'Michaelina', 'Cartan', 'mcartan2o@ycombinator.com', 5201914, '3d39fed9012c21e4546d29e033499cd0da7e4413', NULL, NULL);
INSERT INTO `users` VALUES (112, 'Hamlin', 'Polglaze', 'hpolglaze2p@answers.com', 3864838, '1eee93d2e5f2e5df35991c917e924d2e28a58ac5', NULL, NULL);
INSERT INTO `users` VALUES (113, 'Lorenzo', 'Pyle', 'lpyle2q@mashable.com', 1346957, 'ee688a4732eeb618ccfc937afafdefc42b907c4b', NULL, NULL);
INSERT INTO `users` VALUES (114, 'Linnea', 'Sear', 'lsear2r@weibo.com', 8714392, 'f71ab65b7e03c506a7ee33fa22f99e7b13629928', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
