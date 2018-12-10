-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: act5
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('11',1,'processes/vacation.bpmn','10',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1515296568080\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"vacationProcess\" isClosed=\"false\" isExecutable=\"true\" name=\"ËØ∑ÂÅáÊµÅÁ®ã\" processType=\"None\">\r\n    <startEvent id=\"startevent1\" name=\"Start\"/>\r\n    <userTask activiti:candidateGroups=\"empGroup\" activiti:exclusive=\"true\" id=\"usertask1\" name=\"Â°´ÂÜôÁî≥ËØ∑\"/>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"exclusivegateway1\" name=\"Exclusive Gateway\"/>\r\n    <userTask activiti:candidateGroups=\"manageGroup\" activiti:exclusive=\"true\" id=\"usertask2\" name=\"ÊÄªÁõëÂÆ°Êâπ\"/>\r\n    <userTask activiti:candidateGroups=\"dirGroup\" activiti:exclusive=\"true\" id=\"usertask3\" name=\"ÁªèÁêÜÂÆ°Êâπ\"/>\r\n    <endEvent id=\"endevent1\" name=\"End\"/>\r\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"/>\r\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"/>\r\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\r\n\r\n				${days <= 3}\r\n\r\n		]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow4\" sourceRef=\"usertask2\" targetRef=\"endevent1\"/>\r\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\r\n\r\n				${days > 3}\r\n\r\n		]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask3\" targetRef=\"endevent1\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"vacationProcess\">\r\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"Shape-startevent1\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"80.0\" y=\"150.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"Shape-usertask1\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"180.0\" y=\"140.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"Shape-exclusivegateway1\" isMarkerVisible=\"false\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"350.0\" y=\"147.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"Shape-usertask2\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"80.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"Shape-usertask3\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"210.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"Shape-endevent1\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"660.0\" y=\"150.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\" sourceElement=\"startevent1\" targetElement=\"usertask1\">\r\n        <omgdi:waypoint x=\"112.0\" y=\"166.0\"/>\r\n        <omgdi:waypoint x=\"180.0\" y=\"167.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\" sourceElement=\"usertask1\" targetElement=\"exclusivegateway1\">\r\n        <omgdi:waypoint x=\"285.0\" y=\"167.5\"/>\r\n        <omgdi:waypoint x=\"350.0\" y=\"163.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\" sourceElement=\"exclusivegateway1\" targetElement=\"usertask2\">\r\n        <omgdi:waypoint x=\"370.0\" y=\"151.0\"/>\r\n        <omgdi:waypoint x=\"370.0\" y=\"107.0\"/>\r\n        <omgdi:waypoint x=\"460.0\" y=\"107.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\" sourceElement=\"usertask2\" targetElement=\"endevent1\">\r\n        <omgdi:waypoint x=\"565.0\" y=\"107.5\"/>\r\n        <omgdi:waypoint x=\"660.0\" y=\"166.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\" sourceElement=\"exclusivegateway1\" targetElement=\"usertask3\">\r\n        <omgdi:waypoint x=\"370.0\" y=\"175.0\"/>\r\n        <omgdi:waypoint x=\"370.0\" y=\"237.0\"/>\r\n        <omgdi:waypoint x=\"460.0\" y=\"237.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\" sourceElement=\"usertask3\" targetElement=\"endevent1\">\r\n        <omgdi:waypoint x=\"565.0\" y=\"237.5\"/>\r\n        <omgdi:waypoint x=\"660.0\" y=\"166.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('12',1,'processes/vacation.vacationProcess.png','10',_binary 'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0ø\0\0\0\0\0\"*^^\0\0\ÌIDATx\⁄\Ì\›l\\’ù/QÑVUU≠VEUµ™™nüV\’jµ\’j’æj\’\rZm˙Ñ∫Mòô\Ã8NMÅî\'@)E\≈-§Ö“®YT˙X(jwª\⁄W^Sû\ÏÑ/Ñˇ4Y i!	&NR(1âù\ﬂw~\Èu4ql«é\«\„±\ÁÛë~\Z{\Ó8v\Œ\‹;˜;g\Œ=g\÷,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®•,\À\Œﬁæ}˚\ŒMõ6e\Î÷≠\À:::TTggg∂q\„∆ÅT´\Ï•\0\05¡∑´´+\Î\È\È\…˙˚˚U\’ﬁΩ{≥\r6§ º¬û\n\0P\—\„+¯6v\0\Ó\Ë\ËË∑ß\0\‘@u2ªbÑ=\0†\"X	ò\¬/\0Ä[UΩowg€üæ7\€\“˘≠c_\«}¬©\00£\¬ÔÅ∑vgõ\◊.\À^x\Ë∫*\Óãm™\00c\¬\Ô\Œ-ø<)¯÷Æ-´T\·\0`\ÊÑﬂó˘Œà\·7∂	®\¬/\0¿å	øõ;\⁄Gø±M@~\0Ñ_%¸\0L∑≥;å~cõÄ*¸\0ÃòªÌ±ï#Ü\ﬂ\ÿ&†\nø\0\03&¸\Ó\ﬂ˝b∂˘\·\Â\'yH˜\≈6U¯\0ò1\·7\Í\’g\Ó?)¸\∆}¬©\00≥\¬o__∂\ÌÒU\'yH˜\≈6U¯\0ò\·7Vp\€˙\ÿFÛ€¨Ú&¸\0L\Ô\€◊óuo[ü˝z\Õ\“É\Ô`\≈c\‚±zÅÖ_\0Äi~O\’€´X¯\0ò1\·w,ΩΩ£ı¨\¬/\0¿¥	øß|K`~\0¶M¯U\¬/\0¿¥2˛¸˝\Âr˘2\·W¯\0hÜõÂµøT*],¸\nø\0\0\Õ~k\Ôp=¡¬Ø\00\√\ÔÒû\‡\Í,¸\nø\0@hoo?S+LJ¯=\ﬁ\√!Ñ_\·\0hÄ\‡;Ü¶jP¬Ø\0L±∂∂∂O¶`6†%N\ﬂ(Å∑∑T*\›8{ˆ\Ï≥\„q¬Ø\0L±\Œ\ŒK!Ì∞ñ®i¯=!Ùj\‰õ˛ºa´^€Ö_\0†^\·˜\‚\÷hâöÑ\ﬂ\Âr˘÷°°w∫Ñ\ﬂ\—\Óõ\Ï\Ì\¬/\0PØ\‡÷ûpèñòP\€\”+¸\nø\0@ÉI°\Ì\Ó\ﬁ~´%&ü+¸\0S,\ﬂS\0~NKø¬Ø\0\Õ~ªRuj	\·W¯~†\¬\Ô\ÊJ•ÚØZB¯~Ö_\0hÜ˚zπ\\æSKø≥Lu&¸@Ñ\ﬂ˝\≈bÒõZ¢π√Ø~†Y\¬\Ô¡T-!¸*\·\0ö!¸Y∞`¡Á¥Ñ´Ñ_\0hÜõï\À\Âs¥Ñ´Ñ_\0ò\—\ÊÃôÛ¡øZB¯U\¬/\0\ÃxïJ\ÂØ\ \ÂÚQ-!¸*\·\0fºb±¯è•R©OKøJ¯Äo˛¸˘KRΩ≠%Ñ_%¸@3Ñ\ﬂoß⁄≠%Ñ_ıáZ≥fç\03Uπ\\æ/Ö\ﬂW¥Ñ´˙≥\ﬁ\ﬁ\ﬁ\Ï\¬/\Ã\“1±≥R©‹¥h—¢?≤\◊¿íNÚˇØT*=°%Ñ_ıázË°á\"¸\ﬁ√Å\‚b\–t˚B±X¸äΩ\0fÄæ\Èˇêñ~\’\…c~S\Ë˝|\nø\ÎRN\«I:^:,\0\”XyHı/ZB¯U£_ñÇ\Ô≈©~ùéó£\Èˆ≠8n.\\¯Q{5\0LØ˚F\\Ù¶%Ñ_5∂\Ÿbpπ\\æ5.M5êjG™ˆŸ≥gümÄ\∆øoóJ•+µÑ´\∆?\’Ykk\Î\«\”1Ù\”Üﬂâ\·t˚_©\ÿ\”†A\≈ïJ\ÂKZ¢>÷≠[\'`\Œ\–y~ã\≈\‚π)\0oàÒ¡©˙“±µ&\›~\∆^\0\r$Æfè%éµD}tuu\Ì\È\È2¥v\Ì⁄µ#Ö\ﬂ˛\ZW_K\·wK™ÒªT˜Ãù;˜#é\0\0òbÈ§ú\nÖhâ˙Xø~˝-6lÿ≥gè∞ŸÄ¡∑≥≥ÛH™µzæ\„\ÿJ¯∂túu\ÁA¯\’T7§˚\œr4\0@ùEOT\\∞£%\Í+Ö´;::z\„\„u\’P\’_\À\‡;T[[\€\'+ï ø¶c\Ó@|\‚íÍôñññí#\0\Í$\Ê+-ïJG¥\‘W\næ_H!xc™#©ã\≈_\nÖø\÷2\00â\“I∑íÍ†ñÄ)sF:/OıR>m\⁄˛ÙÜÙü[[[?¨i\0†ˆ\·˜˙8\Ÿj	òzmmm*ã\ﬂK\·˜\Õúj{£\Ì\Ì\Ìgj\0®ÅtrΩ+&\Ë\◊\–X\ÊÕõ˜\Á\Âr˘\ﬂ\”ÒŸõ\ÍΩTOU*ïπZòYñùΩ}˚ˆùõ6m\ bNNÅ4Fuvvf7nHµ\ ^ZqÒM,◊™%†°è\”/¶˚X>>¯`\n≈ø4=!PS|ª∫∫2sq6^\Ì›ª7ãi¢&Ûä\ÏfíN§\ÎRui	ò\ŒH¡˜\ÍtÃæ\„É\”◊Ω©~x˛˘\Áˇâ¶&$z|\ﬂ\∆¿µòÑûcWú\«R¨ø\–0Ω\nÖ?éaK©zÚ\Â~ì\Í\∆ß\≈Ú£3w˘QNîNñøç+ÀµL_---üä7±\Èx~7º…í\Â¿∏D∞0Ö\ﬂfΩF\È$π\\K¿\ÃP,œèõá\‡w#ß\„¸/¥Pì\€˚vw∂˝\È{≥-ù\ﬂ:VÒu\‹\'ú\nø\”E¨4ïNåk	òYb¯C\næ\◊\Ê\√!b|pOìà\·Z8≠{\‡≠\›\Ÿ\ÊµÀ≤∫ÓÑä˚bõÄ*¸NK\'\«√±“î¶Äô+.àKxe\\ óè~%.úKõ\Œ\–:¿ò\√\Ô\Œ-ø<)¯÷Æ-´T\·∑\—}3UV,£G\Ëöö√ºyÛ˛2˜ˇ7¶LÀßN{,¶R\”2 ¸û2|ΩÙ\»wFø±M@~<¯º\Ô}\Ô{.ù≥3\œ<Û&M\Õ\'\Õ(ó\ÀO\Ê\„É{cQçX\\CÀÄ;lm\Óh1¸\∆6U¯m\‰\‡õ\Í\∆¯&\ﬂe\’\ﬂ\Õ\'\∆\ÁKù\«\Ï/1,\‚\ÕXf9ñ[n‘øyˆ\Ï\ŸgßøÛÜòß<U\Á\ËOïUU˙˝˘\Ã´\Z˘ˇ\¬)dYˆ°µk\◊>∏r\Â\ \ﬁ+V\\{\ÌµYzBè=—≠≠≠\Ÿ5\◊\\ì-[∂\Ïç7ﬁ∏{…í%_\◊b¬Ø\ÀH¡w˜M&eâ\«Ùá)W\Ï\À/î{9\›^>´A\∆«∞çÙ˜lHÅˆê∞;jï\À\Â£\Èˇ≤%\›˛≠gyöx\„ç7Z~Úìüºs\’UWeó]vYv\ÔΩ˜fO<ÒD\÷\››ù:t(á>∂0\√\”O?ù=¿\Ÿ\‚≈ã≥+Æ∏b`\È“•”ì}éV¨m¯ç\ŸF\nø±M@~ßI∫˝MÑ\Z?],ïn\Â„ÉªRÄ<o*˛ñ\Ë\ÈMø{M\nΩ\ŸxB\ÔµIOpKôˆúı\Î\◊\ÔªÚ\ +≥+Vd/æ¯‚±ê;V[∂l\…VÆ\\ô]|Ò\≈Ÿµ\◊^´WßÜ\·w\€c+Gø±M@~ßQt\√,=¿¿0ZZZJ\Âr˘ôè\∆â©˛-\»Oûnê\œ\„/∏\‡ÇøOø˚\–\–ùÅw\ﬂ}˜±\Œ¿›ªw\Ôå\€\Ë|ˆ\Ÿg≥˚\Óª/ª˙\Í´O\n¿)HL¡˛=≥\r&z{øˇ˝\Ôƒìˆ¸Û\œgÒÚ\À/gKñ,\….ΩÙ\“=\ﬁ\Ì\‘&¸\Ó\ﬂ˝b∂˘\·\Â\'yH˜\≈6U¯ùf¡∑:\0ù•F°P8+k˚j>>∏ªR©\‹>gŒúéıﬂà±∏h\«Úÿòá<\Ô£\’¡ı∫\ÎÆ;l\ﬂ{\ÔΩ1\Á†\»QKó.\ZÇcXá7˚ç\‚¿ÅKñ-[ñ\›u\◊]\Ÿ;Ôºì\’Bºä\ÔÚ\À/\€0àâáﬂ®Wüπˇ§˜	ß\¬\Ô4\ræ\’?wtñ``s\Á\Œ˝H\nê˜§˙]\·S[,/\Ìg¢9ûá\“\„ˇ«©Çoı0áÙ≥\Ÿ\Í’´\«záZ≥f\ÕÒk•™zÅΩ\÷Mµ\ËÒç\‡{\€m∑M\Ë	…™U´¢¯w\„˝\ÿA¯R}}Ÿ∂\«Wù<\‰!\›\€T\·wöﬂ°?Ø8•Lˇ&\∆\‰¶0Ÿó*.F€êÇπ\√⁄ó´áåÄ£g8ﬂÅ\Í![∑n≠Iz\Ìµ◊≤NZ\›l\ƒä1æ1\‘!zh\'#¯∫Û\Œ;≥\Ï\–\‚ß~c∑≠è˝`\ƒ1ø±\Õ*o\¬oﬂ∏J˚G≥N}µˆ\–\«å[\nìïrπ¸_1>8›æìn\⁄\⁄\⁄˙Ò\ËtãYÜéΩ˙it˛∏C\’¡7\∆\÷R¸{\’8˛\√BßH\\\‹c|k5\‘a¥!ã/»ó7d¨·∑Ø/\Îﬁ∂>˚ıö•#\ﬂ¡ä\«\ƒcıø\r|_â˜\÷˘\Ì£\ﬂ\·ß8-b+ï\ Ú.w\‰\À*aˆÖ’üF\Á=\»«á:‘™\«w∏\‡!C ûÚ¨\’Ywàw!1£C=\ƒEp1à\‹¯ﬂ±Ö\ﬂSıˆ\Í~0¯\Œ\ {r≥™\Z.\0W\ﬂ¡∫˚ˇ.¿ò-\\∏£±ä\‹(”èmã\0Û¯VèÛç1æì)\∆\0WˇcΩè\Zây|c:≥z∫˘\Êõc\\\Œj≠\Í;ñ\ﬁ\ﬁ\—zÅV\·w¨ÚI\‹;\«˘\∆t§Ä:\\∞≠¿ß\⁄>\»`¢Øk£Œø\Ã\≈X\·\ÍY\∆3Ω\Î\È∫˛˙\ÎO¯<[u+∑\≈ı\ÍıÙ\“K/≈™\'G\\¸v\Í{∫¡w∞V\·w¨b¢¸E8Æû^s™+¢\«\–3;R¿=så¡∑˙˜ò∑\Ëh\„Jl«øé\È\Ã\Í!≤WıJp>Ø_\ÿ˙U\ËûÃã\‹F\“\÷\÷K˛]\‹\Ì<÷ê?÷©Œî;I\·˜úaN\nOçp5ÚXá$Ä˚\«|á`cÄÅÒÑ\ﬂUÛp™∑RˆÿûØ\Z˜ÛÙ˝ùy\œ\ÔÒã\‹Íôâ™¬®T*´<cu∞r\Â\ \ﬁX≤x*\‹q\«c\ÁkíÉ\Ô˜qêù\ÍäN\·W¯mÄ}u§ûëU!xºcqá¿\„	æÉÅ\0\∆\’ÒØ[ß˙+≤\»\‡k\›=˜\‹S\◊,Ù¿ú∞¸±g≠V¨X1\ÀÛMÖ\«¸ΩÙD\Ôlí{dcçòze§,¸\nø\r~è’óø¸\Â˝yh\Ô¯¥3á\ÈÒ\Ì\œ\Ôè5˘\œ~\Ã+8P£◊ΩΩÉØqı\ŒD1ƒ¢™g˙-\œF\\{\ÌµYww˜îÑ\ﬂ}˚ˆ\≈Ù#˝\Õ\–\ŒC\Áå0ú\ÓªU¯~O\”Ò*\ÌGZ*ï˛b¡Çü+\nˇêæø \ÌW¶˚Æ,ãˇT©TnJ∑\ﬂK\ﬂˇs\⁄v|˙êè\ÎLıü1§!\’1˘{|ò~v\ÁX\∆∆ù{\Óπ\Ÿ˚\ﬂˇ˛l\÷ÿá ‘∫\Á˜VØ\ﬁ@\r\œ—á_\ﬂÍùâb\ﬁﬂ™\◊\◊˜<u\–\⁄\⁄zl\Ó›©WR∆ì\›$\Ô*G\n1˝\ \r\¬\ÔÙ©á~8õ¨\‡ôn\ﬂL˜\ÌKıvæo\ƒd\Î˝˘\'GÛ˘*OX(\ÓO?w$‹°¸\Áb)Ò}Ò\Ô\ÂÅˆ∑©^äﬂóˇ\ﬁ\Î\÷O>\Ê\Ìæk\Ô(˚jú˛#˝_ˇlŒú9úUˇ1øqú∏\Ë\rò\‘stΩ3Q¸æ\Í\ﬂ\ÔŸ®\”>ïÜônd`Ñ\ÔÄÚ:íüx˚Ú5π\Ê\'¯\È§ci\ﬂJ_\ÔO∑Ò±≈ûT›©vßz=’´q\‚Oè€öü¸7\ÁÅ\„π<l ÉHLq“ôOp\Â¡Ù3ˇûæˇYóÙıˇN_ﬂùæ^ôææ#Ö\€\”◊∑§jO_/M°·õ±pG™\À\‚\"ætk˙∫ú∂\ÕM_ˇØ1L≥Ún¸{\¬ocW__ﬂ§\œ\Ã\È˛\ÎS]A:uz\Ãy©>A;w<\'Û5a\Ë*H±(\Õ}#’©\Álº\0&=¸NuÚl\‘¡WæÚï©\Ï˘=÷ãU(Œäzkk\Îác2\Ít≤˝DKKÀß“∂Oß˙L\nüO\'\ﬂ/DàåÅ\Îi[)\¬eÑ\ÃÙ˝•\È\Î%©æ!4\¬hz\Ï\Õi\€mR#¨F\œ[z‹èÛﬁ∑ü\ÂÅ\„y¯XìëGÚ\ÔõÚÄÚl∫ˇ˘<,Gpy%˝\ÃoÚ0˝z⁄∂+\Ÿ{Ú–Ω?\∆\ÍƒÖm˘ï•ÇÊÅ®o,%G	øÜ=4¿I\‡H\’>π·¢ã.:\’\ÿ⁄ëfa®\’<ø≠≥\ÃÚ\0\Ë˘•Væ˛ıØOŸòﬂûûû\√\Õ2\Êwîyﬂ™^\ÍY¯~`_\ÌèOF\∆0\«oµÜÈô≠\Â\no+ºZì≈ò\ﬂ&≥|˘Ú˛©ö\Ìa\Ì⁄µ=\Õ0\€C>>th}#ÜH}l#á\ﬂY\√_¨T∑\Ì\¬o}å°ßw¥\‡\Í!\’¡v¥!\r#=N\Íı¶\ﬂl\Õ‰¶õn\⁄1UÛ¸.[∂\Ï\Õfò\Áwp’¨|¸\‰\ÀÒ˝HèmÙ;\⁄}ìΩ]¯ùn&\0\ﬂ=\Î\‘≥\r}ú˘|ÅzÜ_Û¸6ì%Kñ\\∏xÒ\‚)Y\·-ñ7nÜ\ﬁZZZ˛&\Ì\–\€FΩ¬Ø;ÉLt%6¡®âX\‰\".fèãv\”\Ì=)s‹ï_ú~u\\?\Á\Â®J•ÚΩ©Z\·Ì™´Æ≤\¬\€‡£±æt=m⁄¥)Ü<Î≤ø\ÕB¯~gà\”\r∞ﬂú%¯5\√\«z\—˘`\≈PÑzà\ÏU5\‰\·h,1\Ô´\◊Y\ÍÜπ˝ˆ\€\Î\Z~-ZCVk}\·W¯ù±\∆d_†\Ê\‚˙ö±\ﬁR©t`\ÎÎÆªÆ.ΩøKó.≠˛˝[<[ud]r\…%[∂l©K}Ú\…\'˜\Â+úyá#¸\nø3¸Ωı¨±\rÅhù\Â\‚6`í\‰Sêéz\nÖ\¬ˇú7o\ﬁ_V/$¥zı\ÍI\ÕBk÷¨9\·\Ô∏\‡Ç˛\ﬁ3UgW\\q≈≤+Øº2{\Áùw&ı\…>x\‡\—J•r∏zz/Ñ_\·wF;Uè\Ó\‡a¡ò1ñvÑa∑µ*$ø≠••%€∫u\Î§d°\◊^{-ãu™˛éß<KSdÒ\‚\≈\›w\‹q\«dvı§\ﬂ\—Kπj\Ì\È~gô\ÍL¯≠m\0n~`Äö)ó\Àó\Í\≈\·\¬\Ô\–\Ã\‚ì|\Ÿ\„ø\≈<ºµû\◊˜ä+Æ®\Óy>8\¬\nö\‘C\\|ñûê}+WÆúå\0<∞t\È\“Xnxß\'yzÜ_%¸\÷(\0\›e≥¨\‹Líî7.\…Wcç%\€O¯\…!ãL˝b∏üãïd´á?D\0ÆUpÙ¯V\ﬂ¯=Ò˚<[\rÄ-Z\‘Û\›\Ô~7{˜\›wk6\‘\·Ú\À/è\‹v\Z\Á+¸\nøMm∞ßwC:)E;~[ì\0µR(\ŒJØ-+Ú1æ±j€øµ∂∂~8∂≈™ïÉ°6>Åm∂©HøYÄcDåûH\«`åÒ2\‘!˛¯6R\0N;\ÀˆØ}\Ìk/º¬Ñ/nã1æ±£\ÈÒ~Ö_f˝°8^Ù3oÜÅZà◊íXˇO\\Lü\Í˜©æ\›\ﬁ\ﬁ~\Ê\–\«\≈BSå«íGÜ\‡¡Y û˛˘qOg∂lŸ≤ì\∆\Zæçª3]Ω`¡Ç˜ñ/_~$Bx\ﬁÒ<Û\Ã3{cq>´Éã€Ñ_\·ójãè\"\”\„ø\“¿\ÈäE§Rà|\"flHØ)Øßºq\·hèOØ9_œ¨\n1$°zpıPàX	\ÓÈßüŒ∫ªª≥Cá\À>qcz# \«\ m\’XTèÒ5‘°¡ÂÉøΩ∑.X±b\≈¡G}ÙΩ7\ﬂ|Û\Ë\·√áè=\Ÿ\Èv =Ÿá~¯\·}±dq¨‹ñø˚Z≠gG¯~Nz}\ËOØ-\Ái	\‡4^?*)_ºö˜\Ã>ª`¡Ç\œMf™ûbÇıîO¡ß\ﬂ\Œ\÷\Z\À¶\⁄1\Ã;°˛\”\ÎR«í\≈Vn~Ö_Fì^\'\ﬁM\'ØZ£3b®@z\›x+ˇT˘ó.¸hΩ~y\Ãú~ˇs\Èwø7û¿+∑\≈\—\Î\Ï)\·W¯mbq+ã\◊h	`4ÖB\·è\”\Î\≈©¢ì≠7\’¶≤É-~w˙[n\Õ{É˜¶Ø\rªy@\ﬂS©˘Ñ_\·ócJ•Rë∫YK\0\√iii˘Tzçx4ü™¨;Ωf\\©U@¯U\¬Ô¥ïNfØ¶ì\ŸµP≠X,ûü^^\…\«ÛnN¯ZÑ_%¸N{1.ù\ÿ~™%Ä<Ù\∆\‘b{£ß7Ω>t¥µµ}R´Ä´Ñ\ﬂ#ÆzN\'ª_i	h^ÖB\·\Âr˘G\Èı\‡PTzM¯q‹ße@¯U\¬\ÔåS*ï÷ßì\›F-My¸\"ˇkc\ÊÑ~˜•\–˚OZÑ_%¸\Œh\È§˜`L§%†y\ƒ\È∏1\∆Û¶–ª\’bÄ+¸6çt\‚ª/.j\—\–\«˚e\Èx#¶ã)\¬b\Œ\\≠ø\¬o≥ù\Ôå\ÂHµ\ÃLÖB\·¨¸8\Ô\ÕWt¸Y\ÃŸ´eÄ¨[∑N¿~õB•RYûNà=Zfñπs\Á~$\÷t$›æù\œ\Á}ÜñÜ\’\’\’u¥ßßG\»l\–⁄µk◊é~˚\Ì©óNäóß˙ΩñÄô!Ö\›œ¶z:U\Ã\œ˚Z™V≠ú\“˙ı\ÎoŸ∞a\√¿û={Ñ\ÕæùùùGR≠∞ßN\\KKK)ùj	òˆod[S\Ì\»C\ÔS©>£UÄqI\·\Í∆ééé\ﬁ¯x]5TıæµS,\œM\'\…\√Z¶üˆˆˆ3\”Ò{Kk»á7<\√¥\0å†••\ÂSqÂ∑ñÄ\È\„¸Û\œˇì∏p-ﬁ∏∆Öl\Èæ#.l\”2\0p\nq\’w:y∫x¶Åòö,ØˇôOU∂ªX,^™U\0`ú\"¸Œû=˚l-ç©R©\ÃM\«\È∂Xî\"\’1\\I´\0¿iädZ[[?Æ%†\·B\Ô\“Xv8ñéeàß\0PqbçÈë¥LΩ9s\Ê|∞X,˛8óáb&ñtl\ﬁ](>†e\0†v·∑ØR©|IK¿\‘ikk˚d:;S\≈xﬁûT\ﬂ\–*\009\·˜@©T∫XK@˝•c\ÔºT[b<o∫}πX,ûØU\0`r\√oå)º^K@]èª%©∫£ß∑\\.?\Z\”j\0®\œIxw©T∫MK¿\‰äYU\“ÒˆÉtºΩõn˚S˝§≠≠\ÌCZ\0\Í~S.ó§%`“é±?Mµ:..M\«\⁄\Ô\“m{∫˚-\0Ssb~°T*˝\\K@m•†˚∑\È\ÿz.œª=}_\÷*\00ı\·˜ÒòCTK@Õé©Ø¶z=\∆Û¶\–˚D°P¯k≠\0çs¢^XK¿\Èkoo?3G\ﬂ.óÀøO∑GR˝G˙˙-\0\r&Ü<\ƒ\–-\„\◊\⁄\⁄˙\·¸:únﬂ©T*∑\nÖ≥¥\04®∏\ÿ-.z\”ıëe\Ÿ\Ÿ€∑oﬂπi”¶l›∫uYGGájÄ\Í\Ï\Ï\Ã6n\‹8êj\’Xû\«t\Ã|:’¶|Qäù©.±w¿4”ú\≈tgZ¢>\"¯vuue===Yøj†⁄ªwo∂a√ÜÅÑWårº\“\∆\ﬂ\ƒEl©û/ãü∑W¿4\\\ƒBZ¢>¢\«Wm\Ï\0\‹\—\—\—?\‰i;##\ÀR\Ìœß+{Ë¢ã.˙òΩ\0¶°X\⁄8ñ8\÷ıCÑ\Ã∆Æ\œU,@ëÇ\Ó}\È¯\ËKu0+?\\¥h\—Ÿã`\Z´T*_J\'ı>-Q¨\Ã∆Æ’´Wg)\Ï>íè\Á}≥X,^c\œÄ\"\ﬂ\œ\∆\‘LZ¢±\¬o\Ô\€\›\Ÿˆß\ÔÕ∂t~\ÎX\≈\◊qüp:π\’\€€õ}ı´_ç˚\ﬂ\Èç\·\Ì±\00√¥∂∂~<.\ﬁ\—ç~ºµ;€ºvYˆ\¬C◊ùPq_lR\'∑÷¨Yì\ŸS`Üö={ˆ\Ÿ)¸:\Ÿ7P¯›π\Âó\'\ﬂ¡⁄µeµÄZß1ø\0¿\·7.\Ó\—ç~_z\‰;#Ü\ﬂ\ÿ&†\nø\0¿î\À\Â£Û\Ê\Õ˚s-\—\·wsG˚à\·7∂	®\¬/\00±4k\n¿ß%Ñ_%¸@3Ñﬂò√¥†%\Z#¸\∆\Ï#Ö\ﬂ\ÿ&†\nø\0¿\ƒ\¬\Ô\Ô\À\ÂÚeZ¢1\¬\Ô∂\«Vé~cõÄ*¸\0ø=±|´ñhåª˜ã\ŸÊáóü<\‰!\›\€T\·\0òX¯}Ω\\.ﬂ°%\Z#¸FΩ˙\Ã˝\'Öﬂ∏O8~Äâá\ﬂWR˝ãñhê\€◊óm{|\’\…C\“}±M@~Ä	(ïJœï\À\Â_hâ©ø±Ç\€\÷\«~0\‚ò\ﬂ\ÿfï7\·\0òÄ˘Û\ÁoLµNKLa¯\Ì\ÎÀ∫∑≠\œ~Ωf\Èà¡w∞\‚1ÒXΩ¿\¬/\0p\Zä\≈\‚Ø\ \ÂÚìZbj\¬\Ô©z{ıø\0@\rÕü?ˇß•Riãñòö;ñ\ﬁ\ﬁ\—zÅV\·\0á|X.ó_\’S~O7¯ñ¿*¸\0„êÇ\Ô\ÕÛ\Á\œ\Ô\÷S~ï\0\‘Q±Xº&\‡\ﬂiâ”ó\ﬁ<\Ï\À*y¬Ø\0L}pkM’´%&‘ÜY^˚K•\“\≈¬Ø\04®B°\Ârπ_K\‘$¸\÷\ﬁ\·zÇÖ_\·\0ò˙\‡ˆ\ÈT\ÔiâöÜ\ﬂ\„=¡\’!X¯~Ä)6w\Ó‹è§ê6†%&%¸\Ô	é\·¬Ø\0LΩ3\∆\ﬁT\rJ¯~Ä	¿ö\‡Ùçx{K•“ç≥g\œ>;\'¸\nø\0\031¸ûz5r¯Mﬁ∞UØ\Ì\¬/\0¿Ùø\ \ÂÚ≠CC\Ôt	ø£\›7\Ÿ€Ö_\0Ä\È~á\Ì\È~Ö_\0Ä¶%¸\nø\0\0¬Ø+¸\0ø¬Ø\0 ¸\nø\¬/\0Äk™3\·\0@¯U\¬/\0Ä´Ñ_\0\0\·W¯\0@¯~\0~Ö_\0\0Ñ_\·\0@¯U\¬/\0Ä´Ñ_\0\0\·W	ø\0\0¬Ø~\0Ñ_%¸\0øJ¯\0~Ö_\0\0Ñ_\·\0\0\·W¯\0`®u\Î\÷	ò\¬/\0@s\Ë\Í\Í:\⁄\”\”#d6h\Ì⁄µkG\nø˝ˆT\0Ä\ZXø~˝-6lÿ≥gè∞ŸÄ¡∑≥≥ÛH™ˆT\0Ä\ZI\·\Í∆ééé\ﬁ¯x]5Tıæ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@M¸\œ\Ó\Ìf\Êë˜`\0\0\0\0IENDÆB`Ç',1),('2',1,'D:\\workspace\\code\\activiti-demo6-springboot\\target\\classes\\processes\\vacation.bpmn','1',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1515296568080\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"vacationProcess\" isClosed=\"false\" isExecutable=\"true\" name=\"ËØ∑ÂÅáÊµÅÁ®ã\" processType=\"None\">\r\n    <startEvent id=\"startevent1\" name=\"Start\"/>\r\n    <userTask activiti:candidateGroups=\"empGroup\" activiti:exclusive=\"true\" id=\"usertask1\" name=\"Â°´ÂÜôÁî≥ËØ∑\"/>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"exclusivegateway1\" name=\"Exclusive Gateway\"/>\r\n    <userTask activiti:candidateGroups=\"manageGroup\" activiti:exclusive=\"true\" id=\"usertask2\" name=\"ÊÄªÁõëÂÆ°Êâπ\"/>\r\n    <userTask activiti:candidateGroups=\"dirGroup\" activiti:exclusive=\"true\" id=\"usertask3\" name=\"ÁªèÁêÜÂÆ°Êâπ\"/>\r\n    <endEvent id=\"endevent1\" name=\"End\"/>\r\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"/>\r\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"/>\r\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\r\n\r\n				${days <= 3}\r\n\r\n		]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow4\" sourceRef=\"usertask2\" targetRef=\"endevent1\"/>\r\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\r\n\r\n				${days > 3}\r\n\r\n		]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask3\" targetRef=\"endevent1\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"vacationProcess\">\r\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"Shape-startevent1\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"80.0\" y=\"150.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"Shape-usertask1\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"180.0\" y=\"140.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"Shape-exclusivegateway1\" isMarkerVisible=\"false\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"350.0\" y=\"147.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"Shape-usertask2\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"80.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"Shape-usertask3\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"210.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"Shape-endevent1\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"660.0\" y=\"150.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\" sourceElement=\"startevent1\" targetElement=\"usertask1\">\r\n        <omgdi:waypoint x=\"112.0\" y=\"166.0\"/>\r\n        <omgdi:waypoint x=\"180.0\" y=\"167.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\" sourceElement=\"usertask1\" targetElement=\"exclusivegateway1\">\r\n        <omgdi:waypoint x=\"285.0\" y=\"167.5\"/>\r\n        <omgdi:waypoint x=\"350.0\" y=\"163.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\" sourceElement=\"exclusivegateway1\" targetElement=\"usertask2\">\r\n        <omgdi:waypoint x=\"370.0\" y=\"151.0\"/>\r\n        <omgdi:waypoint x=\"370.0\" y=\"107.0\"/>\r\n        <omgdi:waypoint x=\"460.0\" y=\"107.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\" sourceElement=\"usertask2\" targetElement=\"endevent1\">\r\n        <omgdi:waypoint x=\"565.0\" y=\"107.5\"/>\r\n        <omgdi:waypoint x=\"660.0\" y=\"166.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\" sourceElement=\"exclusivegateway1\" targetElement=\"usertask3\">\r\n        <omgdi:waypoint x=\"370.0\" y=\"175.0\"/>\r\n        <omgdi:waypoint x=\"370.0\" y=\"237.0\"/>\r\n        <omgdi:waypoint x=\"460.0\" y=\"237.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\" sourceElement=\"usertask3\" targetElement=\"endevent1\">\r\n        <omgdi:waypoint x=\"565.0\" y=\"237.5\"/>\r\n        <omgdi:waypoint x=\"660.0\" y=\"166.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('3',1,'D:\\workspace\\code\\activiti-demo6-springboot\\target\\classes\\processes\\vacation.vacationProcess.png','1',_binary 'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0ø\0\0\0\0\0\"*^^\0\0\ÌIDATx\⁄\Ì\›l\\’ù/QÑVUU≠VEUµ™™nüV\’jµ\’j’æj\’\rZm˙Ñ∫Mòô\Ã8NMÅî\'@)E\≈-§Ö“®YT˙X(jwª\⁄W^Sû\ÏÑ/Ñˇ4Y i!	&NR(1âù\ﬂw~\Èu4ql«é\«\„±\ÁÛë~\Z{\Ó8v\Œ\‹;˜;g\Œ=g\÷,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®•,\À\Œﬁæ}˚\ŒMõ6e\Î÷≠\À:::TTggg∂q\„∆ÅT´\Ï•\0\05¡∑´´+\Î\È\È\…˙˚˚U\’ﬁΩ{≥\r6§ º¬û\n\0P\—\„+¯6v\0\Ó\Ë\ËË∑ß\0\‘@u2ªbÑ=\0†\"X	ò\¬/\0Ä[UΩowg€üæ7\€\“˘≠c_\«}¬©\00£\¬ÔÅ∑vgõ\◊.\À^x\Ë∫*\Óãm™\00c\¬\Ô\Œ-ø<)¯÷Æ-´T\·\0`\ÊÑﬂó˘Œà\·7∂	®\¬/\0¿å	øõ;\⁄Gø±M@~\0Ñ_%¸\0L∑≥;å~cõÄ*¸\0ÃòªÌ±ï#Ü\ﬂ\ÿ&†\nø\0\03&¸\Ó\ﬂ˝b∂˘\·\Â\'yH˜\≈6U¯\0ò1\·7\Í\’g\Ó?)¸\∆}¬©\00≥\¬o__∂\ÌÒU\'yH˜\≈6U¯\0ò\·7Vp\€˙\ÿFÛ€¨Ú&¸\0L\Ô\€◊óuo[ü˝z\Õ\“É\Ô`\≈c\‚±zÅÖ_\0Äi~O\’€´X¯\0ò1\·w,ΩΩ£ı¨\¬/\0¿¥	øß|K`~\0¶M¯U\¬/\0¿¥2˛¸˝\Âr˘2\·W¯\0hÜõÂµøT*],¸\nø\0\0\Õ~k\Ôp=¡¬Ø\00\√\ÔÒû\‡\Í,¸\nø\0@hoo?S+LJ¯=\ﬁ\√!Ñ_\·\0hÄ\‡;Ü¶jP¬Ø\0L±∂∂∂O¶`6†%N\ﬂ(Å∑∑T*\›8{ˆ\Ï≥\„q¬Ø\0L±\Œ\ŒK!Ì∞ñ®i¯=!Ùj\‰õ˛ºa´^€Ö_\0†^\·˜\‚\÷hâöÑ\ﬂ\Âr˘÷°°w∫Ñ\ﬂ\—\Óõ\Ï\Ì\¬/\0PØ\‡÷ûpèñòP\€\”+¸\nø\0@ÉI°\Ì\Ó\ﬁ~´%&ü+¸\0S,\ﬂS\0~NKø¬Ø\0\Õ~ªRuj	\·W¯~†\¬\Ô\ÊJ•ÚØZB¯~Ö_\0hÜ˚zπ\\æSKø≥Lu&¸@Ñ\ﬂ˝\≈bÒõZ¢π√Ø~†Y\¬\Ô¡T-!¸*\·\0ö!¸Y∞`¡Á¥Ñ´Ñ_\0hÜõï\À\Âs¥Ñ´Ñ_\0ò\—\ÊÃôÛ¡øZB¯U\¬/\0\ÃxïJ\ÂØ\ \ÂÚQ-!¸*\·\0fºb±¯è•R©OKøJ¯Äo˛¸˘KRΩ≠%Ñ_%¸@3Ñ\ﬂoß⁄≠%Ñ_ıáZ≥fç\03Uπ\\æ/Ö\ﬂW¥Ñ´˙≥\ﬁ\ﬁ\ﬁ\Ï\¬/\Ã\“1±≥R©‹¥h—¢?≤\◊¿íNÚˇØT*=°%Ñ_ıázË°á\"¸\ﬁ√Å\‚b\–t˚B±X¸äΩ\0fÄæ\Èˇêñ~\’\…c~S\Ë˝|\nø\ÎRN\«I:^:,\0\”XyHı/ZB¯U£_ñÇ\Ô≈©~ùéó£\Èˆ≠8n.\\¯Q{5\0LØ˚F\\Ù¶%Ñ_5∂\Ÿbpπ\\æ5.M5êjG™ˆŸ≥gümÄ\∆øoóJ•+µÑ´\∆?\’Ykk\Î\«\”1Ù\”Üﬂâ\·t˚_©\ÿ\”†A\≈ïJ\ÂKZ¢>÷≠[\'`\Œ\–y~ã\≈\‚π)\0oàÒ¡©˙“±µ&\›~\∆^\0\r$Æfè%éµD}tuu\Ì\È\È2¥v\Ì⁄µ#Ö\ﬂ˛\ZW_K\·wK™ÒªT˜Ãù;˜#é\0\0òbÈ§ú\nÖhâ˙Xø~˝-6lÿ≥gè∞ŸÄ¡∑≥≥ÛH™µzæ\„\ÿJ¯∂túu\ÁA¯\’T7§˚\œr4\0@ùEOT\\∞£%\Í+Ö´;::z\„\„u\’P\’_\À\‡;T[[\€\'+ï ø¶c\Ó@|\‚íÍôñññí#\0\Í$\Ê+-ïJG¥\‘W\næ_H!xc™#©ã\≈_\nÖø\÷2\00â\“I∑íÍ†ñÄ)sF:/OıR>m\⁄˛ÙÜÙü[[[?¨i\0†ˆ\·˜˙8\Ÿj	òzmmm*ã\ﬂK\·˜\Õúj{£\Ì\Ì\Ìgj\0®ÅtrΩ+&\Ë\◊\–X\ÊÕõ˜\Á\Âr˘\ﬂ\”ÒŸõ\ÍΩTOU*ïπZòYñùΩ}˚ˆùõ6m\ bNNÅ4Fuvvf7nHµ\ ^ZqÒM,◊™%†°è\”/¶˚X>>¯`\n≈ø4=!PS|ª∫∫2sq6^\Ì›ª7ãi¢&Ûä\ÏfíN§\ÎRui	ò\ŒH¡˜\ÍtÃæ\„É\”◊Ω©~x˛˘\Áˇâ¶&$z|\ﬂ\∆¿µòÑûcWú\«R¨ø\–0Ω\nÖ?éaK©zÚ\Â~ì\Í\∆ß\≈Ú£3w˘QNîNñøç+ÀµL_---üä7±\Èx~7º…í\Â¿∏D∞0Ö\ﬂfΩF\È$π\\K¿\ÃP,œèõá\‡w#ß\„¸/¥Pì\€˚vw∂˝\È{≥-ù\ﬂ:VÒu\‹\'ú\nø\”E¨4ïNåk	òYb¯C\næ\◊\Ê\√!b|pOìà\·Z8≠{\‡≠\›\Ÿ\ÊµÀ≤∫ÓÑä˚bõÄ*¸NK\'\«√±“î¶Äô+.àKxe\\ óè~%.úKõ\Œ\–:¿ò\√\Ô\Œ-ø<)¯÷Æ-´T\·∑\—}3UV,£G\Ëöö√ºyÛ˛2˜ˇ7¶LÀßN{,¶R\”2 ¸û2|ΩÙ\»wFø±M@~<¯º\Ô}\Ô{.ù≥3\œ<Û&M\Õ\'\Õ(ó\ÀO\Ê\„É{cQçX\\CÀÄ;lm\Óh1¸\∆6U¯m\‰\‡õ\Í\∆¯&\ﬂe\’\ﬂ\Õ\'\∆\ÁKù\«\Ï/1,\‚\ÕXf9ñ[n‘øyˆ\Ï\ŸgßøÛÜòß<U\Á\ËOïUU˙˝˘\Ã´\Z˘ˇ\¬)dYˆ°µk\◊>∏r\Â\ \ﬁ+V\\{\ÌµYzBè=—≠≠≠\Ÿ5\◊\\ì-[∂\Ïç7ﬁ∏{…í%_\◊b¬Ø\ÀH¡w˜M&eâ\«Ùá)W\Ï\À/î{9\›^>´A\∆«∞çÙ˜lHÅˆê∞;jï\À\Â£\Èˇ≤%\›˛≠gyöx\„ç7Z~Úìüºs\’UWeó]vYv\ÔΩ˜fO<ÒD\÷\››ù:t(á>∂0\√\”O?ù=¿\Ÿ\‚≈ã≥+Æ∏b`\È“•”ì}éV¨m¯ç\ŸF\nø±M@~ßI∫˝MÑ\Z?],ïn\Â„ÉªRÄ<o*˛ñ\Ë\ÈMø{M\nΩ\ŸxB\ÔµIOpKôˆúı\Î\◊\ÔªÚ\ +≥+Vd/æ¯‚±ê;V[∂l\…VÆ\\ô]|Ò\≈Ÿµ\◊^´WßÜ\·w\€c+Gø±M@~ßQt\√,=¿¿0ZZZJ\Âr˘ôè\∆â©˛-\»Oûnê\œ\„/∏\‡ÇøOø˚\–\–ùÅw\ﬂ}˜±\Œ¿›ªw\Ôå\€\Ë|ˆ\Ÿg≥˚\Óª/ª˙\Í´O\n¿)HL¡˛=≥\r&z{øˇ˝\Ôƒìˆ¸Û\œgÒÚ\À/gKñ,\….ΩÙ\“=\ﬁ\Ì\‘&¸\Ó\ﬂ˝b∂˘\·\Â\'yH˜\≈6U¯ùf¡∑:\0ù•F°P8+k˚j>>∏ªR©\‹>gŒúéıﬂà±∏h\«Úÿòá<\Ô£\’¡ı∫\ÎÆ;l\ﬂ{\ÔΩ1\Á†\»QKó.\ZÇcXá7˚ç\‚¿ÅKñ-[ñ\›u\◊]\Ÿ;Ôºì\’Bºä\ÔÚ\À/\€0àâáﬂ®Wüπˇ§˜	ß\¬\Ô4\ræ\’?wtñ``s\Á\Œ˝H\nê˜§˙]\·S[,/\Ìg¢9ûá\“\„ˇ«©Çoı0áÙ≥\Ÿ\Í’´\«záZ≥f\ÕÒk•™zÅΩ\÷Mµ\ËÒç\‡{\€m∑M\Ë	…™U´¢¯w\„˝\ÿA¯R}}Ÿ∂\«Wù<\‰!\›\€T\·wöﬂ°?Ø8•Lˇ&\∆\‰¶0Ÿó*.F€êÇπ\√⁄ó´áåÄ£g8ﬂÅ\Í![∑n≠Iz\Ìµ◊≤NZ\›l\ƒä1æ1\‘!zh\'#¯∫Û\Œ;≥\Ï\–\‚ß~c∑≠è˝`\ƒ1ø±\Õ*o\¬oﬂ∏J˚G≥N}µˆ\–\«å[\nìïrπ¸_1>8›æìn\⁄\⁄\⁄˙Ò\ËtãYÜéΩ˙it˛∏C\’¡7\∆\÷R¸{\’8˛\√BßH\\\‹c|k5\‘a¥!ã/»ó7d¨·∑Ø/\Îﬁ∂>˚ıö•#\ﬂ¡ä\«\ƒcıø\r|_â˜\÷˘\Ì£\ﬂ\·ß8-b+ï\ Ú.w\‰\À*aˆÖ’üF\Á=\»«á:‘™\«w∏\‡!C ûÚ¨\’Ywàw!1£C=\ƒEp1à\‹¯ﬂ±Ö\ﬂSıˆ\Í~0¯\Œ\ {r≥™\Z.\0W\ﬂ¡∫˚ˇ.¿ò-\\∏£±ä\‹(”èmã\0Û¯VèÛç1æì)\∆\0WˇcΩè\Zây|c:≥z∫˘\Êõc\\\Œj≠\Í;ñ\ﬁ\ﬁ\—zÅV\·w¨ÚI\‹;\«˘\∆t§Ä:\\∞≠¿ß\⁄>\»`¢Øk£Œø\Ã\≈X\·\ÍY\∆3Ω\Î\È∫˛˙\ÎO¯<[u+∑\≈ı\ÍıÙ\“K/≈™\'G\\¸v\Í{∫¡w∞V\·w¨b¢¸E8Æû^s™+¢\«\–3;R¿=så¡∑˙˜ò∑\Ëh\„Jl«øé\È\Ã\Í!≤WıJp>Ø_\ÿ˙U\ËûÃã\‹F\“\÷\÷K˛]\‹\Ì<÷ê?÷©Œî;I\·˜úaN\nOçp5ÚXá$Ä˚\«|á`cÄÅÒÑ\ﬂUÛp™∑RˆÿûØ\Z˜ÛÙ˝ùy\œ\ÔÒã\‹Íôâ™¬®T*´<cu∞r\Â\ \ﬁX≤x*\‹q\«c\ÁkíÉ\Ô˜qêù\ÍäN\·W¯mÄ}u§ûëU!xºcqá¿\„	æÉÅ\0\∆\’ÒØ[ß˙+≤\»\‡k\›=˜\‹S\◊,Ù¿ú∞¸±g≠V¨X1\ÀÛMÖ\«¸ΩÙD\Ôlí{dcçòze§,¸\nø\r~è’óø¸\Â˝yh\Ô¯¥3á\ÈÒ\Ì\œ\Ôè5˘\œ~\Ã+8P£◊ΩΩÉØqı\ŒD1ƒ¢™g˙-\œF\\{\ÌµYww˜îÑ\ﬂ}˚ˆ\≈Ù#˝\Õ\–\ŒC\Áå0ú\ÓªU¯~O\”Ò*\ÌGZ*ï˛b¡Çü+\nˇêæø \ÌW¶˚Æ,ãˇT©TnJ∑\ﬂK\ﬂˇs\⁄v|˙êè\ÎLıü1§!\’1˘{|ò~v\ÁX\∆∆ù{\Óπ\Ÿ˚\ﬂˇ˛l\÷ÿá ‘∫\Á˜VØ\ﬁ@\r\œ—á_\ﬂÍùâb\ﬁﬂ™\◊\◊˜<u\–\⁄\⁄zl\Ó›©WR∆ì\›$\Ô*G\n1˝\ \r\¬\ÔÙ©á~8õ¨\‡ôn\ﬂL˜\ÌKıvæo\ƒd\Î˝˘\'GÛ˘*OX(\ÓO?w$‹°¸\Áb)Ò}Ò\Ô\ÂÅˆ∑©^äﬂóˇ\ﬁ\Î\÷O>\Ê\Ìæk\Ô(˚jú˛#˝_ˇlŒú9úUˇ1øqú∏\Ë\rò\‘stΩ3Q¸æ\Í\ﬂ\ÔŸ®\”>ïÜônd`Ñ\ÔÄÚ:íüx˚Ú5π\Ê\'¯\È§ci\ﬂJ_\ÔO∑Ò±≈ûT›©vßz=’´q\‚Oè€öü¸7\ÁÅ\„π<l ÉHLq“ôOp\Â¡Ù3ˇûæˇYóÙıˇN_ﬂùæ^ôææ#Ö\€\”◊∑§jO_/M°·õ±pG™\À\‚\"ætk˙∫ú∂\ÕM_ˇØ1L≥Ún¸{\¬ocW__ﬂ§\œ\Ã\È˛\ÎS]A:uz\Ãy©>A;w<\'Û5a\Ë*H±(\Õ}#’©\Álº\0&=¸NuÚl\‘¡WæÚï©\Ï˘=÷ãU(Œäzkk\Îác2\Ít≤˝DKKÀß“∂Oß˙L\nüO\'\ﬂ/DàåÅ\Îi[)\¬eÑ\ÃÙ˝•\È\Î%©æ!4\¬hz\Ï\Õi\€mR#¨F\œ[z‹èÛﬁ∑ü\ÂÅ\„y¯XìëGÚ\ÔõÚÄÚl∫ˇ˘<,Gpy%˝\ÃoÚ0˝z⁄∂+\Ÿ{Ú–Ω?\∆\ÍƒÖm˘ï•ÇÊÅ®o,%G	øÜ=4¿I\‡H\’>π·¢ã.:\’\ÿ⁄ëfa®\’<ø≠≥\ÃÚ\0\Ë˘•Væ˛ıØOŸòﬂûûû\√\Õ2\Êwîyﬂ™^\ÍY¯~`_\ÌèOF\∆0\«oµÜÈô≠\Â\no+ºZì≈ò\ﬂ&≥|˘Ú˛©ö\Ìa\Ì⁄µ=\Õ0\€C>>th}#ÜH}l#á\ﬂY\√_¨T∑\Ì\¬o}å°ßw¥\‡\Í!\’¡v¥!\r#=N\Íı¶\ﬂl\Õ‰¶õn\⁄1UÛ¸.[∂\Ï\Õfò\Áwp’¨|¸\‰\ÀÒ˝HèmÙ;\⁄}ìΩ]¯ùn&\0\ﬂ=\Î\‘≥\r}ú˘|ÅzÜ_Û¸6ì%Kñ\\∏xÒ\‚)Y\·-ñ7nÜ\ﬁZZZ˛&\Ì\–\€FΩ¬Ø;ÉLt%6¡®âX\‰\".fèãv\”\Ì=)s‹ï_ú~u\\?\Á\Â®J•ÚΩ©Z\·Ì™´Æ≤\¬\€‡£±æt=m⁄¥)Ü<Î≤ø\ÕB¯~gà\”\r∞ﬂú%¯5\√\«z\—˘`\≈PÑzà\ÏU5\‰\·h,1\Ô´\◊Y\ÍÜπ˝ˆ\€\Î\Z~-ZCVk}\·W¯ù±\∆d_†\Ê\‚˙ö±\ﬁR©t`\ÎÎÆªÆ.ΩøKó.≠˛˝[<[ud]r\…%[∂l©K}Ú\…\'˜\Â+úyá#¸\nø3¸Ωı¨±\rÅhù\Â\‚6`í\‰Sêéz\nÖ\¬ˇú7o\ﬁ_V/$¥zı\ÍI\ÕBk÷¨9\·\Ô∏\‡Ç˛\ﬁ3UgW\\q≈≤+Øº2{\Áùw&ı\…>x\‡\—J•r∏zz/Ñ_\·wF;Uè\Ó\‡a¡ò1ñvÑa∑µ*$ø≠••%€∫u\Î§d°\◊^{-ãu™˛éß<KSdÒ\‚\≈\›w\‹q\«dvı§\ﬂ\—Kπj\Ì\È~gô\ÍL¯≠m\0n~`Äö)ó\Àó\Í\≈\·\¬\Ô\–\Ã\‚ì|\Ÿ\„ø\≈<ºµû\◊˜ä+Æ®\Óy>8\¬\nö\‘C\\|ñûê}+WÆúå\0<∞t\È\“Xnxß\'yzÜ_%¸\÷(\0\›e≥¨\‹Líî7.\…Wcç%\€O¯\…!ãL˝b∏üãïd´á?D\0ÆUpÙ¯V\ﬂ¯=Ò˚<[\rÄ-Z\‘Û\›\Ô~7{˜\›wk6\‘\·Ú\À/è\‹v\Z\Á+¸\nøMm∞ßwC:)E;~[ì\0µR(\ŒJØ-+Ú1æ±j€øµ∂∂~8∂≈™ïÉ°6>Åm∂©HøYÄcDåûH\«`åÒ2\‘!˛¯6R\0N;\ÀˆØ}\Ìk/º¬Ñ/nã1æ±£\ÈÒ~Ö_f˝°8^Ù3oÜÅZà◊íXˇO\\Lü\Í˜©æ\›\ﬁ\ﬁ~\Ê\–\«\≈BSå«íGÜ\‡¡Y û˛˘qOg∂lŸ≤ì\∆\Zæçª3]Ω`¡Ç˜ñ/_~$Bx\ﬁÒ<Û\Ã3{cq>´Éã€Ñ_\·ójãè\"\”\„ø\“¿\ÈäE§Rà|\"flHØ)Øßºq\·hèOØ9_œ¨\n1$°zpıPàX	\ÓÈßüŒ∫ªª≥Cá\À>qcz# \«\ m\’XTèÒ5‘°¡ÂÉøΩ∑.X±b\≈¡G}ÙΩ7\ﬂ|Û\Ë\·√áè=\Ÿ\Èv =Ÿá~¯\·}±dq¨‹ñø˚Z≠gG¯~Nz}\ËOØ-\Ái	\‡4^?*)_ºö˜\Ã>ª`¡Ç\œMf™ûbÇıîO¡ß\ﬂ\Œ\÷\Z\À¶\⁄1\Ã;°˛\”\ÎR«í\≈Vn~Ö_Fì^\'\ﬁM\'ØZ£3b®@z\›x+ˇT˘ó.¸hΩ~y\Ãú~ˇs\Èwø7û¿+∑\≈\—\Î\Ï)\·W¯mbq+ã\◊h	`4ÖB\·è\”\Î\≈©¢ì≠7\’¶≤É-~w˙[n\Õ{É˜¶Ø\rªy@\ﬂS©˘Ñ_\·ócJ•Rë∫YK\0\√iii˘Tzçx4ü™¨;Ωf\\©U@¯U\¬Ô¥ïNfØ¶ì\ŸµP≠X,ûü^^\…\«ÛnN¯ZÑ_%¸N{1.ù\ÿ~™%Ä<Ù\∆\‘b{£ß7Ω>t¥µµ}R´Ä´Ñ\ﬂ#ÆzN\'ª_i	h^ÖB\·\Âr˘G\Èı\‡PTzM¯q‹ße@¯U\¬\ÔåS*ï÷ßì\›F-My¸\"ˇkc\ÊÑ~˜•\–˚OZÑ_%¸\Œh\È§˜`L§%†y\ƒ\È∏1\∆Û¶–ª\’bÄ+¸6çt\‚ª/.j\—\–\«˚e\Èx#¶ã)\¬b\Œ\\≠ø\¬o≥ù\Ôå\ÂHµ\ÃLÖB\·¨¸8\Ô\ÕWt¸Y\ÃŸ´eÄ¨[∑N¿~õB•RYûNà=Zfñπs\Á~$\÷t$›æù\œ\Á}ÜñÜ\’\’\’u¥ßßG\»l\–⁄µk◊é~˚\Ì©óNäóß˙ΩñÄô!Ö\›œ¶z:U\Ã\œ˚Z™V≠ú\“˙ı\ÎoŸ∞a\√¿û={Ñ\ÕæùùùGR≠∞ßN\\KKK)ùj	òˆod[S\Ì\»C\ÔS©>£UÄqI\·\Í∆ééé\ﬁ¯x]5TıæµS,\œM\'\…\√Z¶üˆˆˆ3\”Ò{Kk»á7<\√¥\0å†••\ÂSqÂ∑ñÄ\È\„¸Û\œˇì∏p-ﬁ∏∆Öl\Èæ#.l\”2\0p\nq\’w:y∫x¶Åòö,ØˇôOU∂ªX,^™U\0`ú\"¸Œû=˚l-ç©R©\ÃM\«\È∂Xî\"\’1\\I´\0¿iädZ[[?Æ%†\·B\Ô\“Xv8ñéeàß\0PqbçÈë¥LΩ9s\Ê|∞X,˛8óáb&ñtl\ﬁ](>†e\0†v·∑ØR©|IK¿\‘ikk˚d:;S\≈xﬁûT\ﬂ\–*\009\·˜@©T∫XK@˝•c\ÔºT[b<o∫}πX,ûØU\0`r\√oå)º^K@]èª%©∫£ß∑\\.?\Z\”j\0®\œIxw©T∫MK¿\‰äYU\“ÒˆÉtºΩõn˚S˝§≠≠\ÌCZ\0\Í~S.ó§%`“é±?Mµ:..M\«\⁄\Ô\“m{∫˚-\0Ssb~°T*˝\\K@m•†˚∑\È\ÿz.œª=}_\÷*\00ı\·˜ÒòCTK@Õé©Ø¶z=\∆Û¶\–˚D°P¯k≠\0çs¢^XK¿\Èkoo?3G\ﬂ.óÀøO∑GR˝G˙˙-\0\r&Ü<\ƒ\–-\„\◊\⁄\⁄˙\·¸:únﬂ©T*∑\nÖ≥¥\04®∏\ÿ-.z\”ıëe\Ÿ\Ÿ€∑oﬂπi”¶l›∫uYGGájÄ\Í\Ï\Ï\Ã6n\‹8êj\’Xû\«t\Ã|:’¶|Qäù©.±w¿4”ú\≈tgZ¢>\"¯vuue===Yøj†⁄ªwo∂a√ÜÅÑWårº\“\∆\ﬂ\ƒEl©û/ãü∑W¿4\\\ƒBZ¢>¢\«Wm\Ï\0\‹\—\—\—?\‰i;##\ÀR\Ìœß+{Ë¢ã.˙òΩ\0¶°X\⁄8ñ8\÷ıCÑ\Ã∆Æ\œU,@ëÇ\Ó}\È¯\ËKu0+?\\¥h\—Ÿã`\Z´T*_J\'ı>-Q¨\Ã∆Æ’´Wg)\Ï>íè\Á}≥X,^c\œÄ\"\ﬂ\œ\∆\‘LZ¢±\¬o\Ô\€\›\Ÿˆß\ÔÕ∂t~\ÎX\≈\◊qüp:π\’\€€õ}ı´_ç˚\ﬂ\Èç\·\Ì±\00√¥∂∂~<.\ﬁ\—ç~ºµ;€ºvYˆ\¬C◊ùPq_lR\'∑÷¨Yì\ŸS`Üö={ˆ\Ÿ)¸:\Ÿ7P¯›π\Âó\'\ﬂ¡⁄µeµÄZß1ø\0¿\·7.\Ó\—ç~_z\‰;#Ü\ﬂ\ÿ&†\nø\0¿î\À\Â£Û\Ê\Õ˚s-\—\·wsG˚à\·7∂	®\¬/\00±4k\n¿ß%Ñ_%¸@3Ñﬂò√¥†%\Z#¸\∆\Ï#Ö\ﬂ\ÿ&†\nø\0¿\ƒ\¬\Ô\Ô\À\ÂÚeZ¢1\¬\Ô∂\«Vé~cõÄ*¸\0ø=±|´ñhåª˜ã\ŸÊáóü<\‰!\›\€T\·\0òX¯}Ω\\.ﬂ°%\Z#¸FΩ˙\Ã˝\'Öﬂ∏O8~Äâá\ﬂWR˝ãñhê\€◊óm{|\’\…C\“}±M@~Ä	(ïJœï\À\Â_hâ©ø±Ç\€\÷\«~0\‚ò\ﬂ\ÿfï7\·\0òÄ˘Û\ÁoLµNKLa¯\Ì\ÎÀ∫∑≠\œ~Ωf\Èà¡w∞\‚1ÒXΩ¿\¬/\0p\Zä\≈\‚Ø\ \ÂÚìZbj\¬\Ô©z{ıø\0@\rÕü?ˇß•Riãñòö;ñ\ﬁ\ﬁ\—zÅV\·\0á|X.ó_\’S~O7¯ñ¿*¸\0„êÇ\Ô\ÕÛ\Á\œ\Ô\÷S~ï\0\‘Q±Xº&\‡\ﬂiâ”ó\ﬁ<\Ï\À*y¬Ø\0L}pkM’´%&‘ÜY^˚K•\“\≈¬Ø\04®B°\Ârπ_K\‘$¸\÷\ﬁ\·zÇÖ_\·\0ò˙\‡ˆ\ÈT\ÔiâöÜ\ﬂ\„=¡\’!X¯~Ä)6w\Ó‹è§ê6†%&%¸\Ô	é\·¬Ø\0LΩ3\∆\ﬁT\rJ¯~Ä	¿ö\‡Ùçx{K•“ç≥g\œ>;\'¸\nø\0\031¸ûz5r¯Mﬁ∞UØ\Ì\¬/\0¿Ùø\ \ÂÚ≠CC\Ôt	ø£\›7\Ÿ€Ö_\0Ä\È~á\Ì\È~Ö_\0Ä¶%¸\nø\0\0¬Ø+¸\0ø¬Ø\0 ¸\nø\¬/\0Äk™3\·\0@¯U\¬/\0Ä´Ñ_\0\0\·W¯\0@¯~\0~Ö_\0\0Ñ_\·\0@¯U\¬/\0Ä´Ñ_\0\0\·W	ø\0\0¬Ø~\0Ñ_%¸\0øJ¯\0~Ö_\0\0Ñ_\·\0\0\·W¯\0`®u\Î\÷	ò\¬/\0@s\Ë\Í\Í:\⁄\”\”#d6h\Ì⁄µkG\nø˝ˆT\0Ä\ZXø~˝-6lÿ≥gè∞ŸÄ¡∑≥≥ÛH™ˆT\0Ä\ZI\·\Í∆ééé\ﬁ¯x]5Tıæ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@M¸\œ\Ó\Ìf\Êë˜`\0\0\0\0IENDÆB`Ç',1),('5002',1,'D:\\workspace\\code\\activiti6\\target\\classes\\processes\\vacation.bpmn','5001',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1515296568080\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"vacationProcess\" isClosed=\"false\" isExecutable=\"true\" name=\"ËØ∑ÂÅáÊµÅÁ®ã\" processType=\"None\">\r\n    <startEvent id=\"startevent1\" name=\"Start\"/>\r\n    <userTask activiti:candidateGroups=\"empGroup\" activiti:exclusive=\"true\" id=\"usertask1\" name=\"Â°´ÂÜôÁî≥ËØ∑\"/>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"exclusivegateway1\" name=\"Exclusive Gateway\"/>\r\n    <userTask activiti:candidateGroups=\"manageGroup\" activiti:exclusive=\"true\" id=\"usertask2\" name=\"ÊÄªÁõëÂÆ°Êâπ\"/>\r\n    <userTask activiti:candidateGroups=\"dirGroup\" activiti:exclusive=\"true\" id=\"usertask3\" name=\"ÁªèÁêÜÂÆ°Êâπ\"/>\r\n    <endEvent id=\"endevent1\" name=\"End\"/>\r\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"/>\r\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"/>\r\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\r\n\r\n				${days <= 3}\r\n\r\n		]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow4\" sourceRef=\"usertask2\" targetRef=\"endevent1\"/>\r\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\r\n\r\n				${days > 3}\r\n\r\n		]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask3\" targetRef=\"endevent1\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"vacationProcess\">\r\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"Shape-startevent1\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"80.0\" y=\"150.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"Shape-usertask1\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"180.0\" y=\"140.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"Shape-exclusivegateway1\" isMarkerVisible=\"false\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"350.0\" y=\"147.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"Shape-usertask2\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"80.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"Shape-usertask3\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"210.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"Shape-endevent1\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"660.0\" y=\"150.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\" sourceElement=\"startevent1\" targetElement=\"usertask1\">\r\n        <omgdi:waypoint x=\"112.0\" y=\"166.0\"/>\r\n        <omgdi:waypoint x=\"180.0\" y=\"167.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\" sourceElement=\"usertask1\" targetElement=\"exclusivegateway1\">\r\n        <omgdi:waypoint x=\"285.0\" y=\"167.5\"/>\r\n        <omgdi:waypoint x=\"350.0\" y=\"163.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\" sourceElement=\"exclusivegateway1\" targetElement=\"usertask2\">\r\n        <omgdi:waypoint x=\"370.0\" y=\"151.0\"/>\r\n        <omgdi:waypoint x=\"370.0\" y=\"107.0\"/>\r\n        <omgdi:waypoint x=\"460.0\" y=\"107.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\" sourceElement=\"usertask2\" targetElement=\"endevent1\">\r\n        <omgdi:waypoint x=\"565.0\" y=\"107.5\"/>\r\n        <omgdi:waypoint x=\"660.0\" y=\"166.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\" sourceElement=\"exclusivegateway1\" targetElement=\"usertask3\">\r\n        <omgdi:waypoint x=\"370.0\" y=\"175.0\"/>\r\n        <omgdi:waypoint x=\"370.0\" y=\"237.0\"/>\r\n        <omgdi:waypoint x=\"460.0\" y=\"237.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\" sourceElement=\"usertask3\" targetElement=\"endevent1\">\r\n        <omgdi:waypoint x=\"565.0\" y=\"237.5\"/>\r\n        <omgdi:waypoint x=\"660.0\" y=\"166.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('5003',1,'D:\\workspace\\code\\activiti6\\target\\classes\\processes\\vacation.vacationProcess.png','5001',_binary 'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0ø\0\0\0\0\0\"*^^\0\0\ÌIDATx\⁄\Ì\›l\\’ù/QÑVUU≠VEUµ™™nüV\’jµ\’j’æj\’\rZm˙Ñ∫Mòô\Ã8NMÅî\'@)E\≈-§Ö“®YT˙X(jwª\⁄W^Sû\ÏÑ/Ñˇ4Y i!	&NR(1âù\ﬂw~\Èu4ql«é\«\„±\ÁÛë~\Z{\Ó8v\Œ\‹;˜;g\Œ=g\÷,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®•,\À\Œﬁæ}˚\ŒMõ6e\Î÷≠\À:::TTggg∂q\„∆ÅT´\Ï•\0\05¡∑´´+\Î\È\È\…˙˚˚U\’ﬁΩ{≥\r6§ º¬û\n\0P\—\„+¯6v\0\Ó\Ë\ËË∑ß\0\‘@u2ªbÑ=\0†\"X	ò\¬/\0Ä[UΩowg€üæ7\€\“˘≠c_\«}¬©\00£\¬ÔÅ∑vgõ\◊.\À^x\Ë∫*\Óãm™\00c\¬\Ô\Œ-ø<)¯÷Æ-´T\·\0`\ÊÑﬂó˘Œà\·7∂	®\¬/\0¿å	øõ;\⁄Gø±M@~\0Ñ_%¸\0L∑≥;å~cõÄ*¸\0ÃòªÌ±ï#Ü\ﬂ\ÿ&†\nø\0\03&¸\Ó\ﬂ˝b∂˘\·\Â\'yH˜\≈6U¯\0ò1\·7\Í\’g\Ó?)¸\∆}¬©\00≥\¬o__∂\ÌÒU\'yH˜\≈6U¯\0ò\·7Vp\€˙\ÿFÛ€¨Ú&¸\0L\Ô\€◊óuo[ü˝z\Õ\“É\Ô`\≈c\‚±zÅÖ_\0Äi~O\’€´X¯\0ò1\·w,ΩΩ£ı¨\¬/\0¿¥	øß|K`~\0¶M¯U\¬/\0¿¥2˛¸˝\Âr˘2\·W¯\0hÜõÂµøT*],¸\nø\0\0\Õ~k\Ôp=¡¬Ø\00\√\ÔÒû\‡\Í,¸\nø\0@hoo?S+LJ¯=\ﬁ\√!Ñ_\·\0hÄ\‡;Ü¶jP¬Ø\0L±∂∂∂O¶`6†%N\ﬂ(Å∑∑T*\›8{ˆ\Ï≥\„q¬Ø\0L±\Œ\ŒK!Ì∞ñ®i¯=!Ùj\‰õ˛ºa´^€Ö_\0†^\·˜\‚\÷hâöÑ\ﬂ\Âr˘÷°°w∫Ñ\ﬂ\—\Óõ\Ï\Ì\¬/\0PØ\‡÷ûpèñòP\€\”+¸\nø\0@ÉI°\Ì\Ó\ﬁ~´%&ü+¸\0S,\ﬂS\0~NKø¬Ø\0\Õ~ªRuj	\·W¯~†\¬\Ô\ÊJ•ÚØZB¯~Ö_\0hÜ˚zπ\\æSKø≥Lu&¸@Ñ\ﬂ˝\≈bÒõZ¢π√Ø~†Y\¬\Ô¡T-!¸*\·\0ö!¸Y∞`¡Á¥Ñ´Ñ_\0hÜõï\À\Âs¥Ñ´Ñ_\0ò\—\ÊÃôÛ¡øZB¯U\¬/\0\ÃxïJ\ÂØ\ \ÂÚQ-!¸*\·\0fºb±¯è•R©OKøJ¯Äo˛¸˘KRΩ≠%Ñ_%¸@3Ñ\ﬂoß⁄≠%Ñ_ıáZ≥fç\03Uπ\\æ/Ö\ﬂW¥Ñ´˙≥\ﬁ\ﬁ\ﬁ\Ï\¬/\Ã\“1±≥R©‹¥h—¢?≤\◊¿íNÚˇØT*=°%Ñ_ıázË°á\"¸\ﬁ√Å\‚b\–t˚B±X¸äΩ\0fÄæ\Èˇêñ~\’\…c~S\Ë˝|\nø\ÎRN\«I:^:,\0\”XyHı/ZB¯U£_ñÇ\Ô≈©~ùéó£\Èˆ≠8n.\\¯Q{5\0LØ˚F\\Ù¶%Ñ_5∂\Ÿbpπ\\æ5.M5êjG™ˆŸ≥gümÄ\∆øoóJ•+µÑ´\∆?\’Ykk\Î\«\”1Ù\”Üﬂâ\·t˚_©\ÿ\”†A\≈ïJ\ÂKZ¢>÷≠[\'`\Œ\–y~ã\≈\‚π)\0oàÒ¡©˙“±µ&\›~\∆^\0\r$Æfè%éµD}tuu\Ì\È\È2¥v\Ì⁄µ#Ö\ﬂ˛\ZW_K\·wK™ÒªT˜Ãù;˜#é\0\0òbÈ§ú\nÖhâ˙Xø~˝-6lÿ≥gè∞ŸÄ¡∑≥≥ÛH™µzæ\„\ÿJ¯∂túu\ÁA¯\’T7§˚\œr4\0@ùEOT\\∞£%\Í+Ö´;::z\„\„u\’P\’_\À\‡;T[[\€\'+ï ø¶c\Ó@|\‚íÍôñññí#\0\Í$\Ê+-ïJG¥\‘W\næ_H!xc™#©ã\≈_\nÖø\÷2\00â\“I∑íÍ†ñÄ)sF:/OıR>m\⁄˛ÙÜÙü[[[?¨i\0†ˆ\·˜˙8\Ÿj	òzmmm*ã\ﬂK\·˜\Õúj{£\Ì\Ì\Ìgj\0®ÅtrΩ+&\Ë\◊\–X\ÊÕõ˜\Á\Âr˘\ﬂ\”ÒŸõ\ÍΩTOU*ïπZòYñùΩ}˚ˆùõ6m\ bNNÅ4Fuvvf7nHµ\ ^ZqÒM,◊™%†°è\”/¶˚X>>¯`\n≈ø4=!PS|ª∫∫2sq6^\Ì›ª7ãi¢&Ûä\ÏfíN§\ÎRui	ò\ŒH¡˜\ÍtÃæ\„É\”◊Ω©~x˛˘\Áˇâ¶&$z|\ﬂ\∆¿µòÑûcWú\«R¨ø\–0Ω\nÖ?éaK©zÚ\Â~ì\Í\∆ß\≈Ú£3w˘QNîNñøç+ÀµL_---üä7±\Èx~7º…í\Â¿∏D∞0Ö\ﬂfΩF\È$π\\K¿\ÃP,œèõá\‡w#ß\„¸/¥Pì\€˚vw∂˝\È{≥-ù\ﬂ:VÒu\‹\'ú\nø\”E¨4ïNåk	òYb¯C\næ\◊\Ê\√!b|pOìà\·Z8≠{\‡≠\›\Ÿ\ÊµÀ≤∫ÓÑä˚bõÄ*¸NK\'\«√±“î¶Äô+.àKxe\\ óè~%.úKõ\Œ\–:¿ò\√\Ô\Œ-ø<)¯÷Æ-´T\·∑\—}3UV,£G\Ëöö√ºyÛ˛2˜ˇ7¶LÀßN{,¶R\”2 ¸û2|ΩÙ\»wFø±M@~<¯º\Ô}\Ô{.ù≥3\œ<Û&M\Õ\'\Õ(ó\ÀO\Ê\„É{cQçX\\CÀÄ;lm\Óh1¸\∆6U¯m\‰\‡õ\Í\∆¯&\ﬂe\’\ﬂ\Õ\'\∆\ÁKù\«\Ï/1,\‚\ÕXf9ñ[n‘øyˆ\Ï\ŸgßøÛÜòß<U\Á\ËOïUU˙˝˘\Ã´\Z˘ˇ\¬)dYˆ°µk\◊>∏r\Â\ \ﬁ+V\\{\ÌµYzBè=—≠≠≠\Ÿ5\◊\\ì-[∂\Ïç7ﬁ∏{…í%_\◊b¬Ø\ÀH¡w˜M&eâ\«Ùá)W\Ï\À/î{9\›^>´A\∆«∞çÙ˜lHÅˆê∞;jï\À\Â£\Èˇ≤%\›˛≠gyöx\„ç7Z~Úìüºs\’UWeó]vYv\ÔΩ˜fO<ÒD\÷\››ù:t(á>∂0\√\”O?ù=¿\Ÿ\‚≈ã≥+Æ∏b`\È“•”ì}éV¨m¯ç\ŸF\nø±M@~ßI∫˝MÑ\Z?],ïn\Â„ÉªRÄ<o*˛ñ\Ë\ÈMø{M\nΩ\ŸxB\ÔµIOpKôˆúı\Î\◊\ÔªÚ\ +≥+Vd/æ¯‚±ê;V[∂l\…VÆ\\ô]|Ò\≈Ÿµ\◊^´WßÜ\·w\€c+Gø±M@~ßQt\√,=¿¿0ZZZJ\Âr˘ôè\∆â©˛-\»Oûnê\œ\„/∏\‡ÇøOø˚\–\–ùÅw\ﬂ}˜±\Œ¿›ªw\Ôå\€\Ë|ˆ\Ÿg≥˚\Óª/ª˙\Í´O\n¿)HL¡˛=≥\r&z{øˇ˝\Ôƒìˆ¸Û\œgÒÚ\À/gKñ,\….ΩÙ\“=\ﬁ\Ì\‘&¸\Ó\ﬂ˝b∂˘\·\Â\'yH˜\≈6U¯ùf¡∑:\0ù•F°P8+k˚j>>∏ªR©\‹>gŒúéıﬂà±∏h\«Úÿòá<\Ô£\’¡ı∫\ÎÆ;l\ﬂ{\ÔΩ1\Á†\»QKó.\ZÇcXá7˚ç\‚¿ÅKñ-[ñ\›u\◊]\Ÿ;Ôºì\’Bºä\ÔÚ\À/\€0àâáﬂ®Wüπˇ§˜	ß\¬\Ô4\ræ\’?wtñ``s\Á\Œ˝H\nê˜§˙]\·S[,/\Ìg¢9ûá\“\„ˇ«©Çoı0áÙ≥\Ÿ\Í’´\«záZ≥f\ÕÒk•™zÅΩ\÷Mµ\ËÒç\‡{\€m∑M\Ë	…™U´¢¯w\„˝\ÿA¯R}}Ÿ∂\«Wù<\‰!\›\€T\·wöﬂ°?Ø8•Lˇ&\∆\‰¶0Ÿó*.F€êÇπ\√⁄ó´áåÄ£g8ﬂÅ\Í![∑n≠Iz\Ìµ◊≤NZ\›l\ƒä1æ1\‘!zh\'#¯∫Û\Œ;≥\Ï\–\‚ß~c∑≠è˝`\ƒ1ø±\Õ*o\¬oﬂ∏J˚G≥N}µˆ\–\«å[\nìïrπ¸_1>8›æìn\⁄\⁄\⁄˙Ò\ËtãYÜéΩ˙it˛∏C\’¡7\∆\÷R¸{\’8˛\√BßH\\\‹c|k5\‘a¥!ã/»ó7d¨·∑Ø/\Îﬁ∂>˚ıö•#\ﬂ¡ä\«\ƒcıø\r|_â˜\÷˘\Ì£\ﬂ\·ß8-b+ï\ Ú.w\‰\À*aˆÖ’üF\Á=\»«á:‘™\«w∏\‡!C ûÚ¨\’Ywàw!1£C=\ƒEp1à\‹¯ﬂ±Ö\ﬂSıˆ\Í~0¯\Œ\ {r≥™\Z.\0W\ﬂ¡∫˚ˇ.¿ò-\\∏£±ä\‹(”èmã\0Û¯VèÛç1æì)\∆\0WˇcΩè\Zây|c:≥z∫˘\Êõc\\\Œj≠\Í;ñ\ﬁ\ﬁ\—zÅV\·w¨ÚI\‹;\«˘\∆t§Ä:\\∞≠¿ß\⁄>\»`¢Øk£Œø\Ã\≈X\·\ÍY\∆3Ω\Î\È∫˛˙\ÎO¯<[u+∑\≈ı\ÍıÙ\“K/≈™\'G\\¸v\Í{∫¡w∞V\·w¨b¢¸E8Æû^s™+¢\«\–3;R¿=så¡∑˙˜ò∑\Ëh\„Jl«øé\È\Ã\Í!≤WıJp>Ø_\ÿ˙U\ËûÃã\‹F\“\÷\÷K˛]\‹\Ì<÷ê?÷©Œî;I\·˜úaN\nOçp5ÚXá$Ä˚\«|á`cÄÅÒÑ\ﬂUÛp™∑RˆÿûØ\Z˜ÛÙ˝ùy\œ\ÔÒã\‹Íôâ™¬®T*´<cu∞r\Â\ \ﬁX≤x*\‹q\«c\ÁkíÉ\Ô˜qêù\ÍäN\·W¯mÄ}u§ûëU!xºcqá¿\„	æÉÅ\0\∆\’ÒØ[ß˙+≤\»\‡k\›=˜\‹S\◊,Ù¿ú∞¸±g≠V¨X1\ÀÛMÖ\«¸ΩÙD\Ôlí{dcçòze§,¸\nø\r~è’óø¸\Â˝yh\Ô¯¥3á\ÈÒ\Ì\œ\Ôè5˘\œ~\Ã+8P£◊ΩΩÉØqı\ŒD1ƒ¢™g˙-\œF\\{\ÌµYww˜îÑ\ﬂ}˚ˆ\≈Ù#˝\Õ\–\ŒC\Áå0ú\ÓªU¯~O\”Ò*\ÌGZ*ï˛b¡Çü+\nˇêæø \ÌW¶˚Æ,ãˇT©TnJ∑\ﬂK\ﬂˇs\⁄v|˙êè\ÎLıü1§!\’1˘{|ò~v\ÁX\∆∆ù{\Óπ\Ÿ˚\ﬂˇ˛l\÷ÿá ‘∫\Á˜VØ\ﬁ@\r\œ—á_\ﬂÍùâb\ﬁﬂ™\◊\◊˜<u\–\⁄\⁄zl\Ó›©WR∆ì\›$\Ô*G\n1˝\ \r\¬\ÔÙ©á~8õ¨\‡ôn\ﬂL˜\ÌKıvæo\ƒd\Î˝˘\'GÛ˘*OX(\ÓO?w$‹°¸\Áb)Ò}Ò\Ô\ÂÅˆ∑©^äﬂóˇ\ﬁ\Î\÷O>\Ê\Ìæk\Ô(˚jú˛#˝_ˇlŒú9úUˇ1øqú∏\Ë\rò\‘stΩ3Q¸æ\Í\ﬂ\ÔŸ®\”>ïÜônd`Ñ\ÔÄÚ:íüx˚Ú5π\Ê\'¯\È§ci\ﬂJ_\ÔO∑Ò±≈ûT›©vßz=’´q\‚Oè€öü¸7\ÁÅ\„π<l ÉHLq“ôOp\Â¡Ù3ˇûæˇYóÙıˇN_ﬂùæ^ôææ#Ö\€\”◊∑§jO_/M°·õ±pG™\À\‚\"ætk˙∫ú∂\ÕM_ˇØ1L≥Ún¸{\¬ocW__ﬂ§\œ\Ã\È˛\ÎS]A:uz\Ãy©>A;w<\'Û5a\Ë*H±(\Õ}#’©\Álº\0&=¸NuÚl\‘¡WæÚï©\Ï˘=÷ãU(Œäzkk\Îác2\Ít≤˝DKKÀß“∂Oß˙L\nüO\'\ﬂ/DàåÅ\Îi[)\¬eÑ\ÃÙ˝•\È\Î%©æ!4\¬hz\Ï\Õi\€mR#¨F\œ[z‹èÛﬁ∑ü\ÂÅ\„y¯XìëGÚ\ÔõÚÄÚl∫ˇ˘<,Gpy%˝\ÃoÚ0˝z⁄∂+\Ÿ{Ú–Ω?\∆\ÍƒÖm˘ï•ÇÊÅ®o,%G	øÜ=4¿I\‡H\’>π·¢ã.:\’\ÿ⁄ëfa®\’<ø≠≥\ÃÚ\0\Ë˘•Væ˛ıØOŸòﬂûûû\√\Õ2\Êwîyﬂ™^\ÍY¯~`_\ÌèOF\∆0\«oµÜÈô≠\Â\no+ºZì≈ò\ﬂ&≥|˘Ú˛©ö\Ìa\Ì⁄µ=\Õ0\€C>>th}#ÜH}l#á\ﬂY\√_¨T∑\Ì\¬o}å°ßw¥\‡\Í!\’¡v¥!\r#=N\Íı¶\ﬂl\Õ‰¶õn\⁄1UÛ¸.[∂\Ï\Õfò\Áwp’¨|¸\‰\ÀÒ˝HèmÙ;\⁄}ìΩ]¯ùn&\0\ﬂ=\Î\‘≥\r}ú˘|ÅzÜ_Û¸6ì%Kñ\\∏xÒ\‚)Y\·-ñ7nÜ\ﬁZZZ˛&\Ì\–\€FΩ¬Ø;ÉLt%6¡®âX\‰\".fèãv\”\Ì=)s‹ï_ú~u\\?\Á\Â®J•ÚΩ©Z\·Ì™´Æ≤\¬\€‡£±æt=m⁄¥)Ü<Î≤ø\ÕB¯~gà\”\r∞ﬂú%¯5\√\«z\—˘`\≈PÑzà\ÏU5\‰\·h,1\Ô´\◊Y\ÍÜπ˝ˆ\€\Î\Z~-ZCVk}\·W¯ù±\∆d_†\Ê\‚˙ö±\ﬁR©t`\ÎÎÆªÆ.ΩøKó.≠˛˝[<[ud]r\…%[∂l©K}Ú\…\'˜\Â+úyá#¸\nø3¸Ωı¨±\rÅhù\Â\‚6`í\‰Sêéz\nÖ\¬ˇú7o\ﬁ_V/$¥zı\ÍI\ÕBk÷¨9\·\Ô∏\‡Ç˛\ﬁ3UgW\\q≈≤+Øº2{\Áùw&ı\…>x\‡\—J•r∏zz/Ñ_\·wF;Uè\Ó\‡a¡ò1ñvÑa∑µ*$ø≠••%€∫u\Î§d°\◊^{-ãu™˛éß<KSdÒ\‚\≈\›w\‹q\«dvı§\ﬂ\—Kπj\Ì\È~gô\ÍL¯≠m\0n~`Äö)ó\Àó\Í\≈\·\¬\Ô\–\Ã\‚ì|\Ÿ\„ø\≈<ºµû\◊˜ä+Æ®\Óy>8\¬\nö\‘C\\|ñûê}+WÆúå\0<∞t\È\“Xnxß\'yzÜ_%¸\÷(\0\›e≥¨\‹Líî7.\…Wcç%\€O¯\…!ãL˝b∏üãïd´á?D\0ÆUpÙ¯V\ﬂ¯=Ò˚<[\rÄ-Z\‘Û\›\Ô~7{˜\›wk6\‘\·Ú\À/è\‹v\Z\Á+¸\nøMm∞ßwC:)E;~[ì\0µR(\ŒJØ-+Ú1æ±j€øµ∂∂~8∂≈™ïÉ°6>Åm∂©HøYÄcDåûH\«`åÒ2\‘!˛¯6R\0N;\ÀˆØ}\Ìk/º¬Ñ/nã1æ±£\ÈÒ~Ö_f˝°8^Ù3oÜÅZà◊íXˇO\\Lü\Í˜©æ\›\ﬁ\ﬁ~\Ê\–\«\≈BSå«íGÜ\‡¡Y û˛˘qOg∂lŸ≤ì\∆\Zæçª3]Ω`¡Ç˜ñ/_~$Bx\ﬁÒ<Û\Ã3{cq>´Éã€Ñ_\·ójãè\"\”\„ø\“¿\ÈäE§Rà|\"flHØ)Øßºq\·hèOØ9_œ¨\n1$°zpıPàX	\ÓÈßüŒ∫ªª≥Cá\À>qcz# \«\ m\’XTèÒ5‘°¡ÂÉøΩ∑.X±b\≈¡G}ÙΩ7\ﬂ|Û\Ë\·√áè=\Ÿ\Èv =Ÿá~¯\·}±dq¨‹ñø˚Z≠gG¯~Nz}\ËOØ-\Ái	\‡4^?*)_ºö˜\Ã>ª`¡Ç\œMf™ûbÇıîO¡ß\ﬂ\Œ\÷\Z\À¶\⁄1\Ã;°˛\”\ÎR«í\≈Vn~Ö_Fì^\'\ﬁM\'ØZ£3b®@z\›x+ˇT˘ó.¸hΩ~y\Ãú~ˇs\Èwø7û¿+∑\≈\—\Î\Ï)\·W¯mbq+ã\◊h	`4ÖB\·è\”\Î\≈©¢ì≠7\’¶≤É-~w˙[n\Õ{É˜¶Ø\rªy@\ﬂS©˘Ñ_\·ócJ•Rë∫YK\0\√iii˘Tzçx4ü™¨;Ωf\\©U@¯U\¬Ô¥ïNfØ¶ì\ŸµP≠X,ûü^^\…\«ÛnN¯ZÑ_%¸N{1.ù\ÿ~™%Ä<Ù\∆\‘b{£ß7Ω>t¥µµ}R´Ä´Ñ\ﬂ#ÆzN\'ª_i	h^ÖB\·\Âr˘G\Èı\‡PTzM¯q‹ße@¯U\¬\ÔåS*ï÷ßì\›F-My¸\"ˇkc\ÊÑ~˜•\–˚OZÑ_%¸\Œh\È§˜`L§%†y\ƒ\È∏1\∆Û¶–ª\’bÄ+¸6çt\‚ª/.j\—\–\«˚e\Èx#¶ã)\¬b\Œ\\≠ø\¬o≥ù\Ôå\ÂHµ\ÃLÖB\·¨¸8\Ô\ÕWt¸Y\ÃŸ´eÄ¨[∑N¿~õB•RYûNà=Zfñπs\Á~$\÷t$›æù\œ\Á}ÜñÜ\’\’\’u¥ßßG\»l\–⁄µk◊é~˚\Ì©óNäóß˙ΩñÄô!Ö\›œ¶z:U\Ã\œ˚Z™V≠ú\“˙ı\ÎoŸ∞a\√¿û={Ñ\ÕæùùùGR≠∞ßN\\KKK)ùj	òˆod[S\Ì\»C\ÔS©>£UÄqI\·\Í∆ééé\ﬁ¯x]5TıæµS,\œM\'\…\√Z¶üˆˆˆ3\”Ò{Kk»á7<\√¥\0å†••\ÂSqÂ∑ñÄ\È\„¸Û\œˇì∏p-ﬁ∏∆Öl\Èæ#.l\”2\0p\nq\’w:y∫x¶Åòö,ØˇôOU∂ªX,^™U\0`ú\"¸Œû=˚l-ç©R©\ÃM\«\È∂Xî\"\’1\\I´\0¿iädZ[[?Æ%†\·B\Ô\“Xv8ñéeàß\0PqbçÈë¥LΩ9s\Ê|∞X,˛8óáb&ñtl\ﬁ](>†e\0†v·∑ØR©|IK¿\‘ikk˚d:;S\≈xﬁûT\ﬂ\–*\009\·˜@©T∫XK@˝•c\ÔºT[b<o∫}πX,ûØU\0`r\√oå)º^K@]èª%©∫£ß∑\\.?\Z\”j\0®\œIxw©T∫MK¿\‰äYU\“ÒˆÉtºΩõn˚S˝§≠≠\ÌCZ\0\Í~S.ó§%`“é±?Mµ:..M\«\⁄\Ô\“m{∫˚-\0Ssb~°T*˝\\K@m•†˚∑\È\ÿz.œª=}_\÷*\00ı\·˜ÒòCTK@Õé©Ø¶z=\∆Û¶\–˚D°P¯k≠\0çs¢^XK¿\Èkoo?3G\ﬂ.óÀøO∑GR˝G˙˙-\0\r&Ü<\ƒ\–-\„\◊\⁄\⁄˙\·¸:únﬂ©T*∑\nÖ≥¥\04®∏\ÿ-.z\”ıëe\Ÿ\Ÿ€∑oﬂπi”¶l›∫uYGGájÄ\Í\Ï\Ï\Ã6n\‹8êj\’Xû\«t\Ã|:’¶|Qäù©.±w¿4”ú\≈tgZ¢>\"¯vuue===Yøj†⁄ªwo∂a√ÜÅÑWårº\“\∆\ﬂ\ƒEl©û/ãü∑W¿4\\\ƒBZ¢>¢\«Wm\Ï\0\‹\—\—\—?\‰i;##\ÀR\Ìœß+{Ë¢ã.˙òΩ\0¶°X\⁄8ñ8\÷ıCÑ\Ã∆Æ\œU,@ëÇ\Ó}\È¯\ËKu0+?\\¥h\—Ÿã`\Z´T*_J\'ı>-Q¨\Ã∆Æ’´Wg)\Ï>íè\Á}≥X,^c\œÄ\"\ﬂ\œ\∆\‘LZ¢±\¬o\Ô\€\›\Ÿˆß\ÔÕ∂t~\ÎX\≈\◊qüp:π\’\€€õ}ı´_ç˚\ﬂ\Èç\·\Ì±\00√¥∂∂~<.\ﬁ\—ç~ºµ;€ºvYˆ\¬C◊ùPq_lR\'∑÷¨Yì\ŸS`Üö={ˆ\Ÿ)¸:\Ÿ7P¯›π\Âó\'\ﬂ¡⁄µeµÄZß1ø\0¿\·7.\Ó\—ç~_z\‰;#Ü\ﬂ\ÿ&†\nø\0¿î\À\Â£Û\Ê\Õ˚s-\—\·wsG˚à\·7∂	®\¬/\00±4k\n¿ß%Ñ_%¸@3Ñﬂò√¥†%\Z#¸\∆\Ï#Ö\ﬂ\ÿ&†\nø\0¿\ƒ\¬\Ô\Ô\À\ÂÚeZ¢1\¬\Ô∂\«Vé~cõÄ*¸\0ø=±|´ñhåª˜ã\ŸÊáóü<\‰!\›\€T\·\0òX¯}Ω\\.ﬂ°%\Z#¸FΩ˙\Ã˝\'Öﬂ∏O8~Äâá\ﬂWR˝ãñhê\€◊óm{|\’\…C\“}±M@~Ä	(ïJœï\À\Â_hâ©ø±Ç\€\÷\«~0\‚ò\ﬂ\ÿfï7\·\0òÄ˘Û\ÁoLµNKLa¯\Ì\ÎÀ∫∑≠\œ~Ωf\Èà¡w∞\‚1ÒXΩ¿\¬/\0p\Zä\≈\‚Ø\ \ÂÚìZbj\¬\Ô©z{ıø\0@\rÕü?ˇß•Riãñòö;ñ\ﬁ\ﬁ\—zÅV\·\0á|X.ó_\’S~O7¯ñ¿*¸\0„êÇ\Ô\ÕÛ\Á\œ\Ô\÷S~ï\0\‘Q±Xº&\‡\ﬂiâ”ó\ﬁ<\Ï\À*y¬Ø\0L}pkM’´%&‘ÜY^˚K•\“\≈¬Ø\04®B°\Ârπ_K\‘$¸\÷\ﬁ\·zÇÖ_\·\0ò˙\‡ˆ\ÈT\ÔiâöÜ\ﬂ\„=¡\’!X¯~Ä)6w\Ó‹è§ê6†%&%¸\Ô	é\·¬Ø\0LΩ3\∆\ﬁT\rJ¯~Ä	¿ö\‡Ùçx{K•“ç≥g\œ>;\'¸\nø\0\031¸ûz5r¯Mﬁ∞UØ\Ì\¬/\0¿Ùø\ \ÂÚ≠CC\Ôt	ø£\›7\Ÿ€Ö_\0Ä\È~á\Ì\È~Ö_\0Ä¶%¸\nø\0\0¬Ø+¸\0ø¬Ø\0 ¸\nø\¬/\0Äk™3\·\0@¯U\¬/\0Ä´Ñ_\0\0\·W¯\0@¯~\0~Ö_\0\0Ñ_\·\0@¯U\¬/\0Ä´Ñ_\0\0\·W	ø\0\0¬Ø~\0Ñ_%¸\0øJ¯\0~Ö_\0\0Ñ_\·\0\0\·W¯\0`®u\Î\÷	ò\¬/\0@s\Ë\Í\Í:\⁄\”\”#d6h\Ì⁄µkG\nø˝ˆT\0Ä\ZXø~˝-6lÿ≥gè∞ŸÄ¡∑≥≥ÛH™ˆT\0Ä\ZI\·\Í∆ééé\ﬁ¯x]5Tıæ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@M¸\œ\Ó\Ìf\Êë˜`\0\0\0\0IENDÆB`Ç',1);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count','false',1),('next.dbid','7501',4),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
INSERT INTO `act_hi_actinst` VALUES ('17','vacationProcess:2:13','15','16','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-12-10 15:24:42.831','2018-12-10 15:24:42.832',1,NULL,''),('18','vacationProcess:2:13','15','16','usertask1','19',NULL,'Â°´ÂÜôÁî≥ËØ∑','userTask',NULL,'2018-12-10 15:24:42.833','2018-12-10 15:24:42.905',72,NULL,''),('2508','vacationProcess:2:13','31','33','endevent1',NULL,NULL,'End','endEvent',NULL,'2018-12-10 16:41:35.963','2018-12-10 16:41:35.963',0,NULL,''),('2512','vacationProcess:2:13','2509','2511','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-12-10 16:43:10.620','2018-12-10 16:43:10.620',0,NULL,''),('2513','vacationProcess:2:13','2509','2511','usertask1','2514',NULL,'Â°´ÂÜôÁî≥ËØ∑','userTask','empa','2018-12-10 16:43:10.620','2018-12-10 16:43:10.688',68,NULL,''),('2522','vacationProcess:2:13','2509','2511','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2018-12-10 16:43:10.688','2018-12-10 16:43:10.688',0,NULL,''),('2523','vacationProcess:2:13','2509','2511','usertask3','2524',NULL,'ÁªèÁêÜÂÆ°Êâπ','userTask','dira','2018-12-10 16:43:10.688','2018-12-10 17:01:02.465',1071777,NULL,''),('2533','vacationProcess:2:13','2509','2511','endevent1',NULL,NULL,'End','endEvent',NULL,'2018-12-10 17:01:02.465','2018-12-10 17:01:02.465',0,NULL,''),('27','vacationProcess:2:13','15','16','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2018-12-10 15:24:42.905','2018-12-10 15:24:42.913',8,NULL,''),('28','vacationProcess:2:13','15','16','usertask2','29',NULL,'ÊÄªÁõëÂÆ°Êâπ','userTask','manageb','2018-12-10 15:24:42.913','2018-12-10 15:29:17.489',274576,NULL,''),('34','vacationProcess:2:13','31','33','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-12-10 15:27:55.673','2018-12-10 15:27:55.673',0,NULL,''),('35','vacationProcess:2:13','31','33','usertask1','36',NULL,'Â°´ÂÜôÁî≥ËØ∑','userTask','empb','2018-12-10 15:27:55.673','2018-12-10 15:27:55.726',53,NULL,''),('44','vacationProcess:2:13','31','33','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2018-12-10 15:27:55.726','2018-12-10 15:27:55.726',0,NULL,''),('45','vacationProcess:2:13','31','33','usertask2','46',NULL,'ÊÄªÁõëÂÆ°Êâπ','userTask','manageb','2018-12-10 15:27:55.727','2018-12-10 16:41:35.963',4420236,NULL,''),('5008','vacationProcess:3:5004','5005','5007','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-12-10 18:00:39.689','2018-12-10 18:00:39.689',0,NULL,''),('5009','vacationProcess:3:5004','5005','5007','usertask1','5010',NULL,'Â°´ÂÜôÁî≥ËØ∑','userTask','empa','2018-12-10 18:00:39.706','2018-12-10 18:00:39.769',63,NULL,''),('5018','vacationProcess:3:5004','5005','5007','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2018-12-10 18:00:39.769','2018-12-10 18:00:39.784',15,NULL,''),('5019','vacationProcess:3:5004','5005','5007','usertask2','5020',NULL,'ÊÄªÁõëÂÆ°Êâπ','userTask',NULL,'2018-12-10 18:00:39.784',NULL,NULL,NULL,''),('55','vacationProcess:2:13','15','16','endevent1',NULL,NULL,'End','endEvent',NULL,'2018-12-10 15:29:17.489','2018-12-10 15:29:17.489',0,NULL,'');
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
INSERT INTO `act_hi_detail` VALUES ('22','VariableUpdate','15','15',NULL,'18','applyUser','null',0,'2018-12-10 15:24:42.896',NULL,NULL,NULL,NULL,NULL),('24','VariableUpdate','15','15',NULL,'18','days','integer',0,'2018-12-10 15:24:42.899',NULL,NULL,1,'1',NULL),('2503','VariableUpdate','31','31',NULL,'45','result','string',0,'2018-12-10 16:41:35.947',NULL,NULL,NULL,'ÂÆ°Ê†∏ÈÄöËøá',NULL),('2505','VariableUpdate','31','31',NULL,'45','auditTime','date',0,'2018-12-10 16:41:35.947',NULL,NULL,1544431295911,NULL,NULL),('2507','VariableUpdate','31','31',NULL,'45','auditor','string',0,'2018-12-10 16:41:35.947',NULL,NULL,NULL,'manageb',NULL),('2517','VariableUpdate','2509','2509',NULL,'2513','applyUser','string',0,'2018-12-10 16:43:10.673',NULL,NULL,NULL,'empa',NULL),('2519','VariableUpdate','2509','2509',NULL,'2513','days','integer',0,'2018-12-10 16:43:10.688',NULL,NULL,4,'4',NULL),('2521','VariableUpdate','2509','2509',NULL,'2513','reason','string',0,'2018-12-10 16:43:10.688',NULL,NULL,NULL,'ÊúâÁ¥ßÊÄ•‰∫ãÊÉÖ',NULL),('2528','VariableUpdate','2509','2509',NULL,'2523','result','string',0,'2018-12-10 17:01:02.461',NULL,NULL,NULL,'ÂÆ°Ê†∏ÊãíÁªù',NULL),('2530','VariableUpdate','2509','2509',NULL,'2523','auditTime','date',0,'2018-12-10 17:01:02.461',NULL,NULL,1544432462436,NULL,NULL),('2532','VariableUpdate','2509','2509',NULL,'2523','auditor','string',0,'2018-12-10 17:01:02.462',NULL,NULL,NULL,'dira',NULL),('26','VariableUpdate','15','15',NULL,'18','reason','string',0,'2018-12-10 15:24:42.899',NULL,NULL,NULL,'ÊúâÁ¥ßÊÄ•‰∫ãÊÉÖ',NULL),('39','VariableUpdate','31','31',NULL,'35','applyUser','string',0,'2018-12-10 15:27:55.721',NULL,NULL,NULL,'empb',NULL),('41','VariableUpdate','31','31',NULL,'35','days','integer',0,'2018-12-10 15:27:55.721',NULL,NULL,1,'1',NULL),('43','VariableUpdate','31','31',NULL,'35','reason','string',0,'2018-12-10 15:27:55.721',NULL,NULL,NULL,'ÊúâÁ¥ßÊÄ•‰∫ãÊÉÖ',NULL),('50','VariableUpdate','15','15',NULL,'28','result','string',0,'2018-12-10 15:29:17.484',NULL,NULL,NULL,'ÂÆ°Ê†∏ÊãíÁªù',NULL),('5013','VariableUpdate','5005','5005',NULL,'5009','applyUser','string',0,'2018-12-10 18:00:39.769',NULL,NULL,NULL,'empa',NULL),('5015','VariableUpdate','5005','5005',NULL,'5009','days','integer',0,'2018-12-10 18:00:39.769',NULL,NULL,1,'1',NULL),('5017','VariableUpdate','5005','5005',NULL,'5009','reason','string',0,'2018-12-10 18:00:39.769',NULL,NULL,NULL,'ÊúâÁ¥ßÊÄ•‰∫ãÊÉÖ',NULL),('52','VariableUpdate','15','15',NULL,'28','auditTime','date',0,'2018-12-10 15:29:17.486',NULL,NULL,1544426957456,NULL,NULL),('54','VariableUpdate','15','15',NULL,'28','auditor','string',0,'2018-12-10 15:29:17.486',NULL,NULL,NULL,'manageb',NULL);
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
INSERT INTO `act_hi_identitylink` VALUES ('20','empGroup','candidate',NULL,'19',NULL),('2501',NULL,'participant','manageb',NULL,'31'),('2510',NULL,'starter','empa',NULL,'2509'),('2515','empGroup','candidate',NULL,'2514',NULL),('2525','dirGroup','candidate',NULL,'2524',NULL),('2526',NULL,'participant','dira',NULL,'2509'),('30','manageGroup','candidate',NULL,'29',NULL),('32',NULL,'starter','empb',NULL,'31'),('37','empGroup','candidate',NULL,'36',NULL),('47','manageGroup','candidate',NULL,'46',NULL),('48',NULL,'participant','manageb',NULL,'15'),('5006',NULL,'starter','empa',NULL,'5005'),('5011','empGroup','candidate',NULL,'5010',NULL),('5021','manageGroup','candidate',NULL,'5020',NULL);
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
INSERT INTO `act_hi_procinst` VALUES ('15','15',NULL,'vacationProcess:2:13','2018-12-10 15:24:42.828','2018-12-10 15:29:17.504',274676,NULL,'startevent1','endevent1',NULL,NULL,'',NULL),('2509','2509',NULL,'vacationProcess:2:13','2018-12-10 16:43:10.620','2018-12-10 17:01:02.474',1071854,'empa','startevent1','endevent1',NULL,NULL,'',NULL),('31','31',NULL,'vacationProcess:2:13','2018-12-10 15:27:55.673','2018-12-10 16:41:35.979',4420306,'empb','startevent1','endevent1',NULL,NULL,'',NULL),('5005','5005',NULL,'vacationProcess:3:5004','2018-12-10 18:00:39.689',NULL,NULL,'empa','startevent1',NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
INSERT INTO `act_hi_taskinst` VALUES ('19','vacationProcess:2:13','usertask1','15','16','Â°´ÂÜôÁî≥ËØ∑',NULL,NULL,NULL,NULL,'2018-12-10 15:24:42.845',NULL,'2018-12-10 15:24:42.903',58,NULL,50,NULL,NULL,NULL,''),('2514','vacationProcess:2:13','usertask1','2509','2511','Â°´ÂÜôÁî≥ËØ∑',NULL,NULL,NULL,'empa','2018-12-10 16:43:10.641','2018-12-10 16:43:10.673','2018-12-10 16:43:10.688',47,NULL,50,NULL,NULL,NULL,''),('2524','vacationProcess:2:13','usertask3','2509','2511','ÁªèÁêÜÂÆ°Êâπ',NULL,NULL,NULL,'dira','2018-12-10 16:43:10.688','2018-12-10 17:01:02.436','2018-12-10 17:01:02.464',1071776,NULL,50,NULL,NULL,NULL,''),('29','vacationProcess:2:13','usertask2','15','16','ÊÄªÁõëÂÆ°Êâπ',NULL,NULL,NULL,'manageb','2018-12-10 15:24:42.914','2018-12-10 15:29:17.458','2018-12-10 15:29:17.488',274574,NULL,50,NULL,NULL,NULL,''),('36','vacationProcess:2:13','usertask1','31','33','Â°´ÂÜôÁî≥ËØ∑',NULL,NULL,NULL,'empb','2018-12-10 15:27:55.673','2018-12-10 15:27:55.706','2018-12-10 15:27:55.724',51,NULL,50,NULL,NULL,NULL,''),('46','vacationProcess:2:13','usertask2','31','33','ÊÄªÁõëÂÆ°Êâπ',NULL,NULL,NULL,'manageb','2018-12-10 15:27:55.727','2018-12-10 16:41:35.915','2018-12-10 16:41:35.947',4420220,NULL,50,NULL,NULL,NULL,''),('5010','vacationProcess:3:5004','usertask1','5005','5007','Â°´ÂÜôÁî≥ËØ∑',NULL,NULL,NULL,'empa','2018-12-10 18:00:39.722','2018-12-10 18:00:39.738','2018-12-10 18:00:39.769',47,NULL,50,NULL,NULL,NULL,''),('5020','vacationProcess:3:5004','usertask2','5005','5007','ÊÄªÁõëÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2018-12-10 18:00:39.784',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` VALUES ('21','15','15',NULL,'applyUser','null',0,NULL,NULL,NULL,NULL,NULL,'2018-12-10 15:24:42.896','2018-12-10 15:24:42.896'),('23','15','15',NULL,'days','integer',0,NULL,NULL,1,'1',NULL,'2018-12-10 15:24:42.899','2018-12-10 15:24:42.899'),('25','15','15',NULL,'reason','string',0,NULL,NULL,NULL,'ÊúâÁ¥ßÊÄ•‰∫ãÊÉÖ',NULL,'2018-12-10 15:24:42.899','2018-12-10 15:24:42.899'),('2502','31','31',NULL,'result','string',0,NULL,NULL,NULL,'ÂÆ°Ê†∏ÈÄöËøá',NULL,'2018-12-10 16:41:35.947','2018-12-10 16:41:35.947'),('2504','31','31',NULL,'auditTime','date',0,NULL,NULL,1544431295911,NULL,NULL,'2018-12-10 16:41:35.947','2018-12-10 16:41:35.947'),('2506','31','31',NULL,'auditor','string',0,NULL,NULL,NULL,'manageb',NULL,'2018-12-10 16:41:35.947','2018-12-10 16:41:35.947'),('2516','2509','2509',NULL,'applyUser','string',0,NULL,NULL,NULL,'empa',NULL,'2018-12-10 16:43:10.673','2018-12-10 16:43:10.673'),('2518','2509','2509',NULL,'days','integer',0,NULL,NULL,4,'4',NULL,'2018-12-10 16:43:10.688','2018-12-10 16:43:10.688'),('2520','2509','2509',NULL,'reason','string',0,NULL,NULL,NULL,'ÊúâÁ¥ßÊÄ•‰∫ãÊÉÖ',NULL,'2018-12-10 16:43:10.688','2018-12-10 16:43:10.688'),('2527','2509','2509',NULL,'result','string',0,NULL,NULL,NULL,'ÂÆ°Ê†∏ÊãíÁªù',NULL,'2018-12-10 17:01:02.461','2018-12-10 17:01:02.461'),('2529','2509','2509',NULL,'auditTime','date',0,NULL,NULL,1544432462436,NULL,NULL,'2018-12-10 17:01:02.461','2018-12-10 17:01:02.461'),('2531','2509','2509',NULL,'auditor','string',0,NULL,NULL,NULL,'dira',NULL,'2018-12-10 17:01:02.462','2018-12-10 17:01:02.462'),('38','31','31',NULL,'applyUser','string',0,NULL,NULL,NULL,'empb',NULL,'2018-12-10 15:27:55.721','2018-12-10 15:27:55.721'),('40','31','31',NULL,'days','integer',0,NULL,NULL,1,'1',NULL,'2018-12-10 15:27:55.721','2018-12-10 15:27:55.721'),('42','31','31',NULL,'reason','string',0,NULL,NULL,NULL,'ÊúâÁ¥ßÊÄ•‰∫ãÊÉÖ',NULL,'2018-12-10 15:27:55.721','2018-12-10 15:27:55.721'),('49','15','15',NULL,'result','string',0,NULL,NULL,NULL,'ÂÆ°Ê†∏ÊãíÁªù',NULL,'2018-12-10 15:29:17.484','2018-12-10 15:29:17.484'),('5012','5005','5005',NULL,'applyUser','string',0,NULL,NULL,NULL,'empa',NULL,'2018-12-10 18:00:39.769','2018-12-10 18:00:39.769'),('5014','5005','5005',NULL,'days','integer',0,NULL,NULL,1,'1',NULL,'2018-12-10 18:00:39.769','2018-12-10 18:00:39.769'),('5016','5005','5005',NULL,'reason','string',0,NULL,NULL,NULL,'ÊúâÁ¥ßÊÄ•‰∫ãÊÉÖ',NULL,'2018-12-10 18:00:39.769','2018-12-10 18:00:39.769'),('51','15','15',NULL,'auditTime','date',0,NULL,NULL,1544426957456,NULL,NULL,'2018-12-10 15:29:17.486','2018-12-10 15:29:17.486'),('53','15','15',NULL,'auditor','string',0,NULL,NULL,NULL,'manageb',NULL,'2018-12-10 15:29:17.486','2018-12-10 15:29:17.486');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
INSERT INTO `act_id_group` VALUES ('dirGroup',1,'ÊÄªÁõëÁªÑ',NULL),('empGroup',1,'ÂëòÂ∑•ÁªÑ',NULL),('manageGroup',1,'ÁªèÁêÜÁªÑ',NULL);
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
INSERT INTO `act_id_membership` VALUES ('dira','dirGroup'),('empa','empGroup'),('empb','empGroup'),('managea','manageGroup'),('manageb','manageGroup');
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
INSERT INTO `act_id_user` VALUES ('dira',1,NULL,NULL,NULL,'123456',NULL),('empa',1,NULL,NULL,NULL,'123456',NULL),('empb',1,NULL,NULL,NULL,'123456',NULL),('managea',1,NULL,NULL,NULL,'123456',NULL),('manageb',1,NULL,NULL,NULL,'123456',NULL);
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('1','SpringAutoDeployment',NULL,NULL,'','2018-12-10 07:23:22.674',NULL),('10',NULL,NULL,NULL,'','2018-12-10 07:23:23.256',NULL),('5001','SpringAutoDeployment',NULL,NULL,'','2018-12-10 09:59:59.039',NULL);
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('vacationProcess:1:4',1,'http://www.activiti.org/test','ËØ∑ÂÅáÊµÅÁ®ã','vacationProcess',1,'1','D:\\workspace\\code\\activiti-demo6-springboot\\target\\classes\\processes\\vacation.bpmn','D:\\workspace\\code\\activiti-demo6-springboot\\target\\classes\\processes\\vacation.vacationProcess.png',NULL,0,1,1,'',NULL),('vacationProcess:2:13',1,'http://www.activiti.org/test','ËØ∑ÂÅáÊµÅÁ®ã','vacationProcess',2,'10','processes/vacation.bpmn','processes/vacation.vacationProcess.png',NULL,0,1,1,'',NULL),('vacationProcess:3:5004',1,'http://www.activiti.org/test','ËØ∑ÂÅáÊµÅÁ®ã','vacationProcess',3,'5001','D:\\workspace\\code\\activiti6\\target\\classes\\processes\\vacation.bpmn','D:\\workspace\\code\\activiti6\\target\\classes\\processes\\vacation.vacationProcess.png',NULL,0,1,1,'',NULL);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
INSERT INTO `act_ru_execution` VALUES ('5005',1,'5005',NULL,NULL,'vacationProcess:3:5004',NULL,'5005',NULL,1,0,1,0,0,1,NULL,'',NULL,'2018-12-10 18:00:39.689','empa',NULL,0,0,0,0,0,0,0,0,0),('5007',2,'5005',NULL,'5005','vacationProcess:3:5004',NULL,'5005','usertask2',1,0,0,0,0,1,NULL,'',NULL,'2018-12-10 18:00:39.689',NULL,NULL,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
INSERT INTO `act_ru_identitylink` VALUES ('14',1,'empGroup','candidate',NULL,NULL,NULL,'vacationProcess:2:13'),('5006',1,NULL,'starter','empa',NULL,'5005',NULL),('5021',1,'manageGroup','candidate',NULL,'5020',NULL,NULL);
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
INSERT INTO `act_ru_task` VALUES ('5020',1,'5007','5005','vacationProcess:3:5004','ÊÄªÁõëÂÆ°Êâπ',NULL,NULL,'usertask2',NULL,NULL,NULL,50,'2018-12-10 10:00:39.784',NULL,NULL,1,'',NULL,NULL);
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
INSERT INTO `act_ru_variable` VALUES ('5012',1,'string','applyUser','5005','5005',NULL,NULL,NULL,NULL,'empa',NULL),('5014',1,'integer','days','5005','5005',NULL,NULL,NULL,1,'1',NULL),('5016',1,'string','reason','5005','5005',NULL,NULL,NULL,NULL,'ÊúâÁ¥ßÊÄ•‰∫ãÊÉÖ',NULL);
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'act5'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-10 18:17:37
