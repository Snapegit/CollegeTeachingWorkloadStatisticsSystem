-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: cl72727314
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cl72727314`
--

/*!40000 DROP DATABASE IF EXISTS `cl72727314`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl72727314` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl72727314`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'swiper1','file/swiperPicture1.jpg'),(2,'swiper2','file/swiperPicture2.jpg'),(3,'swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gongzuoliangxinxi`
--

DROP TABLE IF EXISTS `gongzuoliangxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gongzuoliangxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lilun` varchar(200) DEFAULT NULL COMMENT '理论',
  `shiyan` varchar(200) DEFAULT NULL COMMENT '实验',
  `shixi` varchar(200) DEFAULT NULL COMMENT '实习',
  `kechengxishu` double DEFAULT NULL COMMENT '课程系数',
  `hebanshuliang` int(11) DEFAULT NULL COMMENT '合班数量',
  `hebanxishu` double DEFAULT NULL COMMENT '合班系数',
  `zhidaobiyeshengrenshu` double DEFAULT NULL COMMENT '指导毕业生人数',
  `lunwenjiaoxuegongzuoliang` double DEFAULT NULL COMMENT '论文教学工作量',
  `shiyanleixingxishu` double DEFAULT NULL COMMENT '实验类型系数',
  `shiyandiaozhengxishu` double DEFAULT NULL COMMENT '实验调整系数',
  `dangliangxueshi` double DEFAULT NULL COMMENT '当量学时',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `jiaoshigonghao` varchar(200) DEFAULT NULL COMMENT '教师工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `tijiaoshijian` date DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='工作量信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gongzuoliangxinxi`
--

LOCK TABLES `gongzuoliangxinxi` WRITE;
/*!40000 ALTER TABLE `gongzuoliangxinxi` DISABLE KEYS */;
INSERT INTO `gongzuoliangxinxi` VALUES (41,'2024-05-13 01:56:05','理论1','实验1','实习1',1,1,1,1,1,1,1,1,'备注1','教师工号1','教师姓名1','2024-05-13'),(42,'2024-05-13 01:56:05','理论2','实验2','实习2',2,2,2,2,2,2,2,2,'备注2','教师工号2','教师姓名2','2024-05-13'),(43,'2024-05-13 01:56:05','理论3','实验3','实习3',3,3,3,3,3,3,3,3,'备注3','教师工号3','教师姓名3','2024-05-13'),(44,'2024-05-13 01:56:05','理论4','实验4','实习4',4,4,4,4,4,4,4,4,'备注4','教师工号4','教师姓名4','2024-05-13'),(45,'2024-05-13 01:56:05','理论5','实验5','实习5',5,5,5,5,5,5,5,5,'备注5','教师工号5','教师姓名5','2024-05-13'),(46,'2024-05-13 01:56:05','理论6','实验6','实习6',6,6,6,6,6,6,6,6,'备注6','教师工号6','教师姓名6','2024-05-13');
/*!40000 ALTER TABLE `gongzuoliangxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gongzuoxinxi`
--

DROP TABLE IF EXISTS `gongzuoxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gongzuoxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gangweimingcheng` varchar(200) NOT NULL COMMENT '岗位名称',
  `gongzuoleixing` varchar(200) NOT NULL COMMENT '工作类型',
  `zhaopinrenshu` varchar(200) DEFAULT NULL COMMENT '招聘人数',
  `zhuanyeyaoqiu` varchar(200) DEFAULT NULL COMMENT '专业要求',
  `xueliyaoqiu` varchar(200) DEFAULT NULL COMMENT '学历要求',
  `xinzidaiyu` varchar(200) NOT NULL COMMENT '薪资待遇',
  `gongzuoshijian` varchar(200) DEFAULT NULL COMMENT '工作时间',
  `gangweixiangqing` longtext COMMENT '岗位详情',
  `qiyemingcheng` varchar(200) DEFAULT NULL COMMENT '企业名称',
  `qiyedizhi` varchar(200) DEFAULT NULL COMMENT '企业地址',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='工作信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gongzuoxinxi`
--

LOCK TABLES `gongzuoxinxi` WRITE;
/*!40000 ALTER TABLE `gongzuoxinxi` DISABLE KEYS */;
INSERT INTO `gongzuoxinxi` VALUES (61,'2024-05-13 01:56:06','岗位名称1','工作类型1','招聘人数1','专业要求1','学历要求1','薪资待遇1','工作时间1','岗位详情1','企业名称1','企业地址1','联系电话1'),(62,'2024-05-13 01:56:06','岗位名称2','工作类型2','招聘人数2','专业要求2','学历要求2','薪资待遇2','工作时间2','岗位详情2','企业名称2','企业地址2','联系电话2'),(63,'2024-05-13 01:56:06','岗位名称3','工作类型3','招聘人数3','专业要求3','学历要求3','薪资待遇3','工作时间3','岗位详情3','企业名称3','企业地址3','联系电话3'),(64,'2024-05-13 01:56:06','岗位名称4','工作类型4','招聘人数4','专业要求4','学历要求4','薪资待遇4','工作时间4','岗位详情4','企业名称4','企业地址4','联系电话4'),(65,'2024-05-13 01:56:06','岗位名称5','工作类型5','招聘人数5','专业要求5','学历要求5','薪资待遇5','工作时间5','岗位详情5','企业名称5','企业地址5','联系电话5'),(66,'2024-05-13 01:56:06','岗位名称6','工作类型6','招聘人数6','专业要求6','学历要求6','薪资待遇6','工作时间6','岗位详情6','企业名称6','企业地址6','联系电话6');
/*!40000 ALTER TABLE `gongzuoxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiaoshi`
--

DROP TABLE IF EXISTS `jiaoshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoshigonghao` varchar(200) NOT NULL COMMENT '教师工号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaoshixingming` varchar(200) NOT NULL COMMENT '教师姓名',
  `touxiang` longtext COMMENT '头像',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiaoshigonghao` (`jiaoshigonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='教师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiaoshi`
--

LOCK TABLES `jiaoshi` WRITE;
/*!40000 ALTER TABLE `jiaoshi` DISABLE KEYS */;
INSERT INTO `jiaoshi` VALUES (31,'2024-05-13 01:56:04','教师工号1','123456','教师姓名1','file/jiaoshiTouxiang1.jpg','19819881111','男'),(32,'2024-05-13 01:56:04','教师工号2','123456','教师姓名2','file/jiaoshiTouxiang2.jpg','19819881112','男'),(33,'2024-05-13 01:56:04','教师工号3','123456','教师姓名3','file/jiaoshiTouxiang3.jpg','19819881113','男'),(34,'2024-05-13 01:56:04','教师工号4','123456','教师姓名4','file/jiaoshiTouxiang4.jpg','19819881114','男'),(35,'2024-05-13 01:56:04','教师工号5','123456','教师姓名5','file/jiaoshiTouxiang5.jpg','19819881115','男'),(36,'2024-05-13 01:56:05','教师工号6','123456','教师姓名6','file/jiaoshiTouxiang6.jpg','19819881116','男');
/*!40000 ALTER TABLE `jiaoshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2024-05-13 01:56:06','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"所带课程\",\"menuJump\":\"列表\",\"tableName\":\"suodaikecheng\"}],\"fontClass\":\"icon-common49\",\"menu\":\"所带课程管理\",\"unicode\":\"&#xef79;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"教师\",\"menuJump\":\"列表\",\"tableName\":\"jiaoshi\"}],\"fontClass\":\"icon-user8\",\"menu\":\"教师管理\",\"unicode\":\"&#xef9e;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"工作信息\",\"menuJump\":\"列表\",\"tableName\":\"gongzuoxinxi\"}],\"fontClass\":\"icon-common21\",\"menu\":\"工作信息管理\",\"unicode\":\"&#xee03;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-skin\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"年度工作量\",\"导出\"],\"menu\":\"工作量信息\",\"menuJump\":\"列表\",\"tableName\":\"gongzuoliangxinxi\"}],\"fontClass\":\"icon-common8\",\"menu\":\"工作量信息管理\",\"unicode\":\"&#xedb6;\"}],\"frontMenu\":[],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\"],\"menu\":\"工作信息\",\"menuJump\":\"列表\",\"tableName\":\"gongzuoxinxi\"}],\"fontClass\":\"icon-common21\",\"menu\":\"工作信息管理\",\"unicode\":\"&#xee03;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-skin\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"导入\"],\"menu\":\"工作量信息\",\"menuJump\":\"列表\",\"tableName\":\"gongzuoliangxinxi\"}],\"fontClass\":\"icon-common8\",\"menu\":\"工作量信息管理\",\"unicode\":\"&#xedb6;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"所带课程\",\"menuJump\":\"列表\",\"tableName\":\"suodaikecheng\"}],\"fontClass\":\"icon-common49\",\"menu\":\"所带课程管理\",\"unicode\":\"&#xef79;\"}],\"frontMenu\":[],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"教师\",\"tableName\":\"jiaoshi\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suodaikecheng`
--

DROP TABLE IF EXISTS `suodaikecheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suodaikecheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengbianhao` varchar(200) DEFAULT NULL COMMENT '课程编号',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `shangkeshijian` varchar(200) DEFAULT NULL COMMENT '上课时间',
  `jiaoxuedidian` varchar(200) DEFAULT NULL COMMENT '教学地点',
  `tupian` longtext COMMENT '图片',
  `jiaoshigonghao` varchar(200) DEFAULT NULL COMMENT '教师工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kechengbianhao` (`kechengbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='所带课程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suodaikecheng`
--

LOCK TABLES `suodaikecheng` WRITE;
/*!40000 ALTER TABLE `suodaikecheng` DISABLE KEYS */;
INSERT INTO `suodaikecheng` VALUES (51,'2024-05-13 01:56:05','1111111111','课程名称1','上课时间1','教学地点1','file/suodaikechengTupian1.jpg,file/suodaikechengTupian2.jpg,file/suodaikechengTupian3.jpg','教师工号1','教师姓名1','2024-05-13 09:56:05'),(52,'2024-05-13 01:56:05','2222222222','课程名称2','上课时间2','教学地点2','file/suodaikechengTupian2.jpg,file/suodaikechengTupian3.jpg,file/suodaikechengTupian4.jpg','教师工号2','教师姓名2','2024-05-13 09:56:05'),(53,'2024-05-13 01:56:05','3333333333','课程名称3','上课时间3','教学地点3','file/suodaikechengTupian3.jpg,file/suodaikechengTupian4.jpg,file/suodaikechengTupian5.jpg','教师工号3','教师姓名3','2024-05-13 09:56:05'),(54,'2024-05-13 01:56:05','4444444444','课程名称4','上课时间4','教学地点4','file/suodaikechengTupian4.jpg,file/suodaikechengTupian5.jpg,file/suodaikechengTupian6.jpg','教师工号4','教师姓名4','2024-05-13 09:56:05'),(55,'2024-05-13 01:56:05','5555555555','课程名称5','上课时间5','教学地点5','file/suodaikechengTupian5.jpg,file/suodaikechengTupian6.jpg,file/suodaikechengTupian7.jpg','教师工号5','教师姓名5','2024-05-13 09:56:05'),(56,'2024-05-13 01:56:05','6666666666','课程名称6','上课时间6','教学地点6','file/suodaikechengTupian6.jpg,file/suodaikechengTupian7.jpg,file/suodaikechengTupian8.jpg','教师工号6','教师姓名6','2024-05-13 09:56:05');
/*!40000 ALTER TABLE `suodaikecheng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `role` varchar(200) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-05-13 01:56:06','admin','admin','管理员');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-13  9:59:33
