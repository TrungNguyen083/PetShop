-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: petshop
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `totalPrice` double NOT NULL DEFAULT '0',
  `discount` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `iduser_idx` (`iduser`),
  CONSTRAINT `iduser` FOREIGN KEY (`iduser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (5,2,1,1070000,'0'),(6,1,1,900000,'0'),(7,1,1,310000,'0'),(8,2,1,1185000,'0'),(9,2,1,3030000,'0'),(10,2,1,1650000,'0'),(11,2,0,0,'0'),(12,9,1,1150000,'0'),(13,9,0,0,'0'),(14,10,0,0,'0'),(15,1,0,0,'0');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idproduct` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT '0',
  `idBill` int(11) NOT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDBILL_idx` (`idBill`),
  CONSTRAINT `IDBILL` FOREIGN KEY (`idBill`) REFERENCES `bill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (45,1,3,6,0,0),(53,2,1,6,0,0),(54,12,2,6,0,0),(55,7,1,6,0,0),(56,3,2,5,0,0),(57,2,3,5,0,0),(58,3,1,8,0,0),(59,5,1,8,0,0),(60,2,3,8,0,0),(61,1,1,9,0,0),(62,10,1,9,0,0),(64,8,2,7,0,0),(65,4,2,10,0,0),(66,2,4,10,0,0),(67,5,1,7,0,0),(68,2,3,12,0,0),(69,12,2,12,0,0),(70,5,1,13,0,0),(71,9,1,13,0,0),(73,15,2,14,0,0),(75,17,1,14,0,0),(77,4,3,15,0,0),(78,2,3,15,0,0),(79,3,2,15,0,0),(80,8,1,15,0,0),(81,12,1,15,0,0);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `Category` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Thức ăn'),(2,'Vệ sinh'),(3,'Phụ kiện'),(4,'Nhà');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oder`
--

DROP TABLE IF EXISTS `oder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameProduct` varchar(100) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Price` double NOT NULL,
  `urlImage` varchar(500) NOT NULL,
  `idBill` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IdBill_idx` (`idBill`),
  KEY `IdUser_idx` (`idUser`),
  CONSTRAINT `IdBillOder` FOREIGN KEY (`idBill`) REFERENCES `bill` (`id`),
  CONSTRAINT `IdUserOder` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oder`
--

LOCK TABLES `oder` WRITE;
/*!40000 ALTER TABLE `oder` DISABLE KEYS */;
/*!40000 ALTER TABLE `oder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `description` varchar(500) NOT NULL,
  `price` double NOT NULL,
  `brand` varchar(45) NOT NULL,
  `idCategory` int(11) NOT NULL,
  `urlImage` varchar(500) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `idCategory_idx` (`idCategory`),
  CONSTRAINT `idCategory` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Xương gặm sạch răng cho chó VEGEBRAND Orgo Freshening Peppermint','Xương gặm với công dụng làm sạch răng cho chó. Được cấu tạo từ các nguyên liệu tự nhiên, bảo vệ sức khỏe cho thú cưng của bạn',100000,'VEGEBRAND',1,'xuong-cho-cho-vi-sua-bo-vegebrand-orgo-high-calcium-oat-milk.jpg'),(2,'Sữa bột cho chó BBN Goat’s Milk New Zealand','Sữa bột giúp thú cưng của bạn phát triển một cách toàn diện với công nghệ tiệt trùng sữa đến từ NewZealand',320000,'BBN',1,'sua-bot-cho-bbn-goats-milk-new-zealand.jpg'),(3,'Pate cho chó vị thịt bò cà rốt JERHIGH Beef Grilled Carrot Gravy','Pate với hương vị mới giúp thú cưng của bạn thay đổi khẩu vị trong những bữa ăn',35000,'JERHIGH',1,'pate-cho-cho-ho-tro-he-tieu-hoa-iris-benefit-for-enteric-canal.jpg'),(4,'Thuốc bổ sung Vitamin tổng hợp cho chó VEGEBRAND Fruit Vitamin','Thực phẩm chức năng dành cho thú cưng. Giúp thú cưng của bạn phát triển nhanh chóng',170000,'VEGEBRAND',1,'thuoc-bo-sung-vitamin-tong-hop-cho-cho-vegebrand-fruit-vitamin.jpg'),(5,'Xương cho chó gặm vị thịt bò VEGEBRAND 7 Dental Effects Beef Flavor','Xương cho thú cưng với hương vị thịt bò giúp thú cưng của bạn thích nghi dễ hơn',150000,'VEGEBRAND',1,'xuong-gam-sach-rang-cho-cho-vi-thit-bo-nuong-vegebrand-7-dental-effects-roast-beef.jpg'),(6,'Vòng cổ chống liếm cho chó mèo PAW Pet Elizabethan Collar','Vòng cổ giúp thú cưng của bạn không tự liếm lông, tăng cường ngăn chặn bệnh túi lông',50000,'PAW',2,'vong-co-chong-liem-cho-cho-meo-paw-pet-elizabethan-collar.jpg'),(7,'Kẹp hót phân chó mèo PAW Pet Pick Up Feces Clip','Dụng cụ giúp cho bạn dọn dẹp phân của thú cưng một cách dễ dàng hơn, vệ sinh hơn',80000,'PAW',2,'hop-dung-tui-gap-phan-cho-meo-hinh-xuong.jpg'),(8,'Còi siêu âm huấn luyện chó PAW Ultrasonic Dog Whistles','Còi ra hiệu cho thú cưng của bạn, giúp người huấn luyện tương tác dễ dàng hơn với thú cưng',65000,'PAW',2,'dat-cho-meo-di-dao-tu-cuon-dele-009-retractable-leash.jpg'),(9,'Nước hoa cho chó mèo JOYCE & DOLLS N°1 L’Eau D’Issey','Nước hoa giúp tấm lông của thú cưng thơm tho hơn',280000,'JOYCE & DOLLS',2,'sua-tam-cho-cho-bo-sung-duong-chat-cho-long-joyce-dolls-102-double-coat.jpg'),(10,'Bàn cắt tỉa lông cho chó mèo PAW Grooming Table','Bàn tỉa lông giúp bạn dễ dàng hơn trong việc cố định thú cưng của bạn bằng những trang bị có sẵn của bàn',2900000,'PAW',2,'ban-cat-tia-long-cho-cho-meo-paw-grooming-table.jpg'),(11,'Vòng cổ chó mèo kèm dây dắt cỡ mini HAND IN HAND','Vòng cổ giúp chú mèo của bạn trong dễ thương hơn, kèm theo dây dắt giúp bạn có thể dẫn chúng đi dạo',70000,'HAND IN HAND',3,'xich-cho-cho-dai-nguc-phan-quang-hand-in-hand-reflective-adjustable-0.jpg'),(12,'Rọ mõm cho chó giả da HAND IN HAND Dog Muzzle','Rọ mõm cho thú cưng của bạn giúp an toàn khi ra đường',75000,'HAND IN HAND',3,'ro-mom-cho-cho-mom-ngan-paw-nhieu-kich-co.jpg'),(13,'Quần áo cho chó mèo AMBABY PET 2JXF164','Trang trí cho thú cưng của bạn, quận áo cho chó mèo giúp thú cưng trông đẹp hơn, ngoài ra còn thoải mái khi mặc',245000,'AMBABY PET',3,'quan-ao-cho-cho-meo-ambaby-pet-2jxf109.jpg'),(14,'Yếm cho chó mèo kèm dây dắt AMBABY PET 1JXS058','Yếm giúp chó mèo đi dạo, có kèm dây dắt',255000,'AMBABY PET',3,'yem-cho-cho-meo-kem-day-dat-ambaby-pet-1jxs054.jpg'),(15,'Xích cho chó đai ngực cỡ trung bình TOUCH DOG','Bộ đồ xích chó cỡ trung bình, với thiết kế an toàn, đẹp đẽ',235000,'TOUCH DOG',3,'xich-cho-cho-dai-nguc-co-to-touch-dog.jpg'),(16,'Nhà nhựa cho chó mèo cửa sắt PAW Pet House cỡ vừa','Nhà nhựa dành cho chó mèo với thiết kế đẹp đẻ, sang trọng',1700000,'PAW',4,'nha-nhua-cho-cho-meo-paw-cua-sat-co-vua.jpg'),(17,'Nhà nhựa cho chó mèo hình quả trứng AUPET Egg House','Nhà dành cho chó mèo với thiết kế hình quả trứng độc lạ',900000,'AUPET',4,'nha-nhua-cho-cho-meo-co-mai-hien-paw-plastic-house.jpg'),(18,'Nhà cho chó bằng nhựa có hiên XINDING Pet House 424','Nhà nhựa dành cho chó mèo với thiết kế có mái hiên, sang trọng như ngồi nhà của bạn',1950000,'XINDING',4,'nha-nhua-cho-cho-xinding-dog-house-4321.jpg'),(19,'Ổ đệm cho chó mèo hình lều BOBBY PET 16CT003','Ổ đệm cho chó mèo với thiết kế hình chiếc lều nhỏ nhắn, xinh xắn',495000,'BOBBYPET',4,'o-dem-cho-cho-meo-cham-bi-elite.jpg'),(20,'Ổ đệm cho chó mèo PAW hình dưa hấu','Ổ đệm cho chó mèo với thiết kế hình quả dưa hấu xinh xắn, dễ thương',180000,'PAW',4,'o-dem-cho-cho-meo-hinh-leu-bobby-pet-16ct003.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship`
--

DROP TABLE IF EXISTS `ship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship`
--

LOCK TABLES `ship` WRITE;
/*!40000 ALTER TABLE `ship` DISABLE KEYS */;
INSERT INTO `ship` VALUES (1,'Standard-Delivery',30000),(2,'Fast-Delivery',50000),(3,'Savings-Delivery',40000);
/*!40000 ALTER TABLE `ship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(45) NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `PHONENUMBER` varchar(45) DEFAULT NULL,
  `Type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`),
  UNIQUE KEY `idUser_UNIQUE` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Trung Nguyên','nguyennguyen6616634@gmail.com','nguyen12','Ninh Thuận','0919790544',0),(2,'Văn Ngọc','ntnguyen083@gmail.com','nguyen13','Hà Nội','123456789',0),(3,'Nguyên','20110388@student.hcmute.edu.vn','nguyen12',NULL,NULL,1),(8,'Ngọc','20110385@student.hcmute.edu.vn','nguyen12','Bình Phước','0359067627',1),(9,'Phong Nguyên','phongnguyen@gmail.com','nguyen12','Đà Lạt','111222333',0),(10,'Vũ Nguyên','vunguyen@gmail.com','nguyen12',NULL,NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-08 16:22:17
