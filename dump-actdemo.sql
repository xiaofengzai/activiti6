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
INSERT INTO `act_ge_bytearray` VALUES ('11',1,'processes/vacation.bpmn','10',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1515296568080\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"vacationProcess\" isClosed=\"false\" isExecutable=\"true\" name=\"请假流程\" processType=\"None\">\r\n    <startEvent id=\"startevent1\" name=\"Start\"/>\r\n    <userTask activiti:candidateGroups=\"empGroup\" activiti:exclusive=\"true\" id=\"usertask1\" name=\"填写申请\"/>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"exclusivegateway1\" name=\"Exclusive Gateway\"/>\r\n    <userTask activiti:candidateGroups=\"manageGroup\" activiti:exclusive=\"true\" id=\"usertask2\" name=\"总监审批\"/>\r\n    <userTask activiti:candidateGroups=\"dirGroup\" activiti:exclusive=\"true\" id=\"usertask3\" name=\"经理审批\"/>\r\n    <endEvent id=\"endevent1\" name=\"End\"/>\r\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"/>\r\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"/>\r\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\r\n\r\n				${days <= 3}\r\n\r\n		]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow4\" sourceRef=\"usertask2\" targetRef=\"endevent1\"/>\r\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\r\n\r\n				${days > 3}\r\n\r\n		]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask3\" targetRef=\"endevent1\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"vacationProcess\">\r\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"Shape-startevent1\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"80.0\" y=\"150.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"Shape-usertask1\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"180.0\" y=\"140.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"Shape-exclusivegateway1\" isMarkerVisible=\"false\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"350.0\" y=\"147.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"Shape-usertask2\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"80.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"Shape-usertask3\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"210.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"Shape-endevent1\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"660.0\" y=\"150.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\" sourceElement=\"startevent1\" targetElement=\"usertask1\">\r\n        <omgdi:waypoint x=\"112.0\" y=\"166.0\"/>\r\n        <omgdi:waypoint x=\"180.0\" y=\"167.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\" sourceElement=\"usertask1\" targetElement=\"exclusivegateway1\">\r\n        <omgdi:waypoint x=\"285.0\" y=\"167.5\"/>\r\n        <omgdi:waypoint x=\"350.0\" y=\"163.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\" sourceElement=\"exclusivegateway1\" targetElement=\"usertask2\">\r\n        <omgdi:waypoint x=\"370.0\" y=\"151.0\"/>\r\n        <omgdi:waypoint x=\"370.0\" y=\"107.0\"/>\r\n        <omgdi:waypoint x=\"460.0\" y=\"107.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\" sourceElement=\"usertask2\" targetElement=\"endevent1\">\r\n        <omgdi:waypoint x=\"565.0\" y=\"107.5\"/>\r\n        <omgdi:waypoint x=\"660.0\" y=\"166.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\" sourceElement=\"exclusivegateway1\" targetElement=\"usertask3\">\r\n        <omgdi:waypoint x=\"370.0\" y=\"175.0\"/>\r\n        <omgdi:waypoint x=\"370.0\" y=\"237.0\"/>\r\n        <omgdi:waypoint x=\"460.0\" y=\"237.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\" sourceElement=\"usertask3\" targetElement=\"endevent1\">\r\n        <omgdi:waypoint x=\"565.0\" y=\"237.5\"/>\r\n        <omgdi:waypoint x=\"660.0\" y=\"166.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('12',1,'processes/vacation.vacationProcess.png','10',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0\"*^^\0\0\�IDATx\�\�\�l\\՝/�Q�VUU�VEU���n�V\�j�\�jվj\�\rZm���M��\�8NM���\'@)E\�-��ҨYT�X(jw�\�W^S�\�/��4Y i!	&NR(1��\�w~\�u4qlǎ\�\�\��~\Z{\�8v\�\�;�;g\�=g\�,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��,\�\�޾}�\�M�6e\�֭\�:::TTggg�q\�ƁT�\�\0\05����+\�\�\�\����U\�޽{�\r6� �\n\0P\�\�+�6v\0\�\�\�跧\0\�@u2�b�=\0�\"X	�\�/\0��[U�owg۟�7\�\���c_\�}©�\00�\�vg�\�.\�^x\�*\�m��\00c\�\�\�-�<)�֮-�T\�\0`\�ߗ�Έ\�7�	�\�/\0��	��;\�G��M@~\0�_%�\0L���;�~c��*�\0̘��#�\�\�&�\n�\0\03&�\�\��b��\�\�\'yH�\�6U�\0�1\�7\�\�g\�?)�\�}©�\00�\�o__�\��U\'yH�\�6U�\0�\�7Vp\��\�F�۬�&�\0L\��\�חuo[��z\�\��\�`\�c\�z��_\0�i~O\�۫X�\0�1\�w,�����\�/\0��	��|K`~\0�M�U\�/\0��2���\�r�2\�W�\0h��嵿T*],�\n�\0\0\�~k\�p=�¯�\00\�\��\�\�,�\n�\0@hoo?S+LJ�=\�\�!�_\�\0h�\�;��jP¯�\0L����O�`6�%N\�(���T*\�8{�\�\�q¯�\0L�\�\�K!��i�=!�j\����a�^ۅ_\0�^\��\�\�h���\�\�r�֡�w��\�\�\�\�\�\�/\0P�\�֞p���P\�\�+�\n�\0@�I�\�\�\�~�%&��+�\0S,\�S\0~NK�¯�\0\�~�Ruj	\�W�~�\�\�\�J��ZB�~�_\0h���z�\\�SK��Lu&�@�\��\�b�Z��ï~�Y\�\��T-!�*\�\0�!�Y�`�約�_\0h��\�\�s���_\0�\�\�̙���ZB�U\�/\0\�x�J\�\�\��Q-!�*\�\0f�b����R�OK�J��o���KR��%�_%�@3�\�o�ڭ%�_��Z�f��\03U�\\�/�\�W�����\�\�\�\�\�/\�\�1��R�ܴhѢ?�\���N���T*=�%�_��z衇\"�\�Á\�b\�t�B�X���\0f��\����~\�\�c~S\��|\n�\�RN\�I:^:,\0\�XyH�/ZB�U�_�\�ũ~����\���8n.\\�Q{5\0L���F\\��%�_5�\�bp�\\�5.M5�jG��ٳg�m�\��o�J�+���\�?\�Ykk\�\�\�1�\��߉\�t�_�\�\��A\��J\�KZ�>֭[\'`\�\�y~�\�\�)\0o�����ұ�&\�~\�^\0\r$�f�%��D}tuu\�\�\�2�v\�ڵ#�\��\ZW_K\�wK��T�̝;�#�\0\0�b餜\n�h��X�~�-6lسg��ـ�����H��z�\�\�J��t�u\�A�\�T7��\�r4\0@�EOT\\��%\�+��;::z\�\�u\�P\�_\�\�;T[[\�\'+�ʿ�c\�@|\�Ꙗ���#\0\�$\�+-�JG�\�W\n�_H!xc�#��\�_\n��\�2\00�\�I��ꠖ�)sF:/O�R>m\�����[[[?�i\0��\���8\�j	�zmmm*�\�K\��\��j{�\�\�\�gj\0��tr�+&\�\�\�X\�͛�\�\�r�\�\��ٛ\�TOU*��Z�Y���}����6m\�bNN�4Fuvvf7nH�\�^Zq�M,ת%���\�/���X>>�`\nſ4=!PS|���2sq6^\�ݻ7�i�&�\�f�N�\�Rui	�\�H��\�t̾\�\�׽�~x��\����&$z|\�\������cW�\�R��\�0�\n�?�aK�z�\�~�\�\��\��3w�QN�N���+˵L_---��7�\�x~7�ɒ\���D�0�\�f�F\�$�\\K�\�P,Ϗ�\�w#�\��/�P��\��vw��\�{�-�\�:V�u\�\'�\n�\�E�4�N�k	�Yb�C\n�\�\�\�!b|pO��\�Z8��{\�\�\�\�˲��b��*�NK\'\�ñҔ���+.�Kxe\\ ��~%.�K�\�\�:��\�\�\�-�<)�֮-�T\�\�}3UV,�G\���üy��2��7�L˧N{,�R\�2 ��2|��\�wF��M@~<��\�}\�{.��3\�<�&M\�\'\�(�\�O\�\�{cQ�X\\Cˀ�;lm\�h1�\�6U�m\�\��\�\��&\�e\�\�\�\'\�\�K�\�\�/1,\�\�Xf9�[nԿy�\�\�g��󆘧<U\�\�O�UU���\��\Z��\�)dY���k\�>�r\�\�\�+V\\{\�YzB�=ѭ��\�5\�\\�-[�\���7޸{ɒ%_\�b¯�\�H�w�M&e�\��)W\�\�/�{9\�^>�A\�ǰ���lH���;j�\�\�\���%\���gy�x\�7Z~򓟼s\�UWe�]vYv\��fO<�D\�\�ݝ:t(�>�0\�\�O?�=��\�\�ŋ�+��b`\�ҥӓ}�V�m��\�F\n��M@~�I���M�\Z?],�n\�・R�<o*��\�\�M�{M\n�\�xB\��IOpK����\�\�\��\�+�+Vd/��ⱐ;V[�l\�V�\\�]|�\�ٵ\�^�W��\�w\�c+G��M@~�Q�t\�,=��0ZZZJ\�r���\����-\�O�n�\�\�/�\���O��\�\���w\�}��\��ݻw\��\�\�|�\�g��\�/��\�O\n�)HL��=�\r&z{���\�ē���\�g��\�/gK�,\�.��\�=\�\�\�&�\�\��b��\�\�\'yH�\�6U��f��:\0��F�P8+k�j>>��R�\�>gΜ��߈��h\��ؘ�<\�\����\�;l\�{\�1\�\�QK�.\Z�cX�7��\���K�-[�\�u\�]\�;３\�B��\��\�/\�0���ߨW������	�\�\�4\r�\�?wt�``s\�\��H\n����]\�S[,/\�g�9��\�\��ǩ�o�0���\�\�ի\�z�Z�f\��k��z��\�M�\��\�{\�m�M\�	ɪU���w\��\�A�R}}ٶ\�W�<\�!\�\�T\�w�ߡ?�8�L�&\�\�0ٗ*.Fې��\�ڗ�����g8߁\�![�n�Iz\�ײNZ\�l\��1�1\�!zh\'#���\�;�\�\�\�~c����`\�1��\�*o\�o߸J�G�N}��\�\��[\n��r��_1>8ݾ�n\�\�\���\�t�Y����it��C\��7\��\�R�{\�8�\�B�H\\\�c|k5\�a�!�/ȗ7d�ᷯ/\�޶>����#\���\�\�c��\r|_��\��\��\�\��8-b+�\��.w\�\�*a��՟F\�=\�Ǉ:Ԫ\�w�\�!C ��\�Yw�w!1�C=\�Ep1�\��߱�\�S��\�~0�\�\�{r��\Z.\0W\�����.��-\\�𣱊\�(ӏm�\0��V��1��)\�\0W�c��\Z�y|c:�z��\�c\\\�j�\��;�\�\�\�z�V\�w��I\�;\��\�t��:\\����\�>\�`��k�ο\�\�X\�\�Y\�3�\�\���\�O�<[u+�\��\���\�K/Ū\'G\\�v\��{��w�V\�w�b��E8��^s�+�\�\�3;R�=s�������\�h\�Jlǿ�\�\�\�!�W�Jp>�_\��U\�̋\�F\�\�\�K�]\�\�<֐?֩Δ�;I\���aN\nO�p5�X�$��\�|�`c���\�U�p��R�؞�\Z�����y\�\��\�ꙉ�¨T*�<cu�r\�\�\�X�x*\�q\�c\�k��\��q��\�N\�W�m�}u���U!x�cq��\�	���\0\�\���[��+�\�\�k\�=�\�S\�,������g�V�X1\��M�\����D\�l��{d�c��ze�,�\n�\r~�՗��\��yh\���3�\��\�\�\��5�\�~\�+8P�׽���q�\�D1Ģ�g�-\�F\\{\�Yww���\�}��\��#�\�\�\�C\��0�\�U�~O\��*\�GZ*��b���+\n���� \�W���,��T�TnJ�\�K\��s\�v|���\�L��1�!\�1�{|�~v\�X\�Ɲ{\�\��\���l\�؇ Ժ\��V�\�@\r\�ч_\�ꝉb\�ߪ\�\��<u\�\�\�zl\�ݩWRƓ\�$\�*G\n1�\�\r\�\����~8��\��n\�L�\�K�v�o\�d\���\'G��*OX(\�O?w$ܡ�\�b)�}�\�\����^�ߗ�\�\�\�O>\�\�k\�(�j��#�_�lΜ9�U�1�q��\�\r�\�st�3Q��\�\�\�٨\�>���nd`��\��:��x��5�\�\'�\�ci\�J_\�O��ŞTݩv�z=իq\�O�ۚ��7\�\�<lʃHLqҙOp\���3����Y����N_ߝ�^���#�\�\�׷�jO_/M�ᛱpG�\�\�\"�tk����\�M_��1L��n�{\�ocW__ߤ\�\�\��\�S]A:uz\�y�>A;w<\'�5a\�*H�(\�}#թ\�l�\0&=�Nu�l\��W��\��=֋U(Ίzkk\�c2\�t��DKK˧ҶO��L\n�O\'\�/D���\�i[)\�e�\����\�\�%��!4\�hz\�\�i\�mR#�F\�[z܏�޷�\�\�y�X��G�\���l���<,Gpy%�\�o�0�zڶ+\�{�н?\�\�ąm����恨o,%G	��=4�I\�H\�>�ᢋ.:\�\�ڑfa�\�<���\��\0\���V����O٘ߞ��\�\�2\�w�yߪ^\�Y�~`_\�OF\�0\�o��陭\�\no+�Z�Ř\�&�|�����\�a\�ڵ=\�0\�C>>th�}#�H}l#�\�Y\�_�T�\�\�o}���w�\�\�!\��v�!\r#=N�\���\�l\�䦛n\�1U��.[�\�\�f�\�wpլ|�\�\���H�m��;\�}��]��n&\0\�=\�\��\r}��|�z�_��6�%K�\\�x�\�)Y\�-�7n�\�ZZZ�&\�\�\�F�¯�;�Lt%6���X\�\".f��v\�\�=)sܕ_�~u\\?\�\�J��Z\����\�\�ࣱ�t=mڴ)�<벿\�B�~g�\�\r�ߜ%�5\�\�z\��`\�P�z�\�U5\�\�h,1\��\�Y\����\�\�\Z~-ZCVk}\�W���\�d_�\�\����\�R�t`�\�뮻�.��K�.���[<[ud]r\�%[�l�K�}�\�\'�\�+�y�#�\n�3�����\r�h�\�\�6`�\�S��z\n�\���7o\�_V/$�z�\�I\�Bk֬9\�\�\���\�3UgW\\qŲ+��2{\�w&�\�>x�\�\�J�r�zz/�_\�wF;U�\�\�a��1�v��a��*$�𭥥%ۺu\�d�\�^{-�u����<KSd�\�\�\�w\�q\�dv��\�\�K�j\�\�~g�\�L��m\0n~`��)�\��\�\�\�\�\�\�\�\��|\�\��\�<���\���+��\�y>8\�\n�\�C\\|���}+W���\0<�t\�\�Xnx�\'yz�_%�\�(\0\�e��\�L��7.\�Wc�%\�O�\�!�L�b����d��?D\0�Up��V\��=��<[\r�-Z\��\�\�~7{�\�wk6\�\��\�/�\�v\Z\�+�\n�Mm��wC:)E;~[�\0�R(\�J�-+�1��jۿ���~8�Ū���6>�m��H�Y�cD��H\�`��2\�!��6R\0N;\���}\�k/��/n�1���\��~�_f��8^�3o��Z�גX�O\\L�\����\�\�\�~\�\�\�\�BS�ǒG�\��Y ���qOg�lٲ�\�\Z���3]�`����/_~$B�x\��<�\�3{cq>���ۄ_\�j��\"\�\�\��\�E�R�|\"flH�)���q\�h�O�9_Ϭ\n1$�zp�P�X	\�駟κ���C�\�>qcz# \�\�m\�XT��5ԡ�僿��.X�b\��G}��7\�|�\�\�Ç�=\�\�v =ه~�\�}�dq�ܖ��Z�gG�~Nz}\�O�-\�i	\�4^?*)_���\�>�`��\�Mf��b���O��\�\�\�\Z\��\�1\�;��\�\�Rǒ\�Vn~�_F�^\'\�M\'�Z�3b�@z\�x+�T��.�h�~y\��~�s\�w�7��+�\�\�\�\�)\�W�mbq+�\�h	`4�B\�\�\�\�����7\����-~w�[n\�{����\r�y@\�S���_\�cJ�R��YK\0\�iii�Tz�x4���;�f\\�U@�U\�ﴕNf���\��P�X,��^^\�\��nN�Z�_%�N{1.�\�~�%�<�\�\�b{��7�>t���}R���\�#�zN\'�_i	h^�B\�\�r�G\��\�PTzM�qܧe@�U\�\�S*�֧�\�F-My�\"�kc\�~��\��OZ�_%�\�h\��`L�%�y\�\�1\��л\�b��+�6�t\�/.j\�\�\��e\�x#��)\�b\�\\��\�o��\�\�H�\�L�B\��8\�\�Wt�Y\�٫e��[�N�~�B�RY�N�=Zf��s\�~$\�t$ݾ�\�\�}���\�\�\�u���G\�l\�ڵk׎~�\��N��������!�\�Ϧz:U\�\��Z�V��\���\�oٰa\���={�\�����GR���N\\KKK)�j	��od[S\�\�C\�S�>�U�qI\�\�Ǝ��\��x]5T���S,\�M\'\�\�Z�����3\��{Kkȇ7<\��\0����\�Sq巖�\�\���\����p-޸ƅl\��#.l\�2\0p\nq\�w:y�x����,���OU��X,^�U\0`�\"�Ξ=�l-��R�\�M\�\�X�\"\�1\\I�\0�i�dZ[[?�%�\�B\�\�Xv8��e��\0Pqb�鑴L�9s\�|�X,�8��b&�tl\�](>�e\0�vᷯR�|IK�\�ikk�d:;S\�xޞT\�\�*\009\��@�T�XK@��c\�T[b<o�}�X,��U\0`r\�o�)�^K@]��%�����\\.?\Z\�j\0�\�Ixw�T�MK�\�YU\����t���n�S����\�CZ\0\�~S.��%`Ҏ�?M�:..M\�\�\�\�m{��-\0Ssb~�T*�\\K@m����\�\�z.ϻ=}_\�*\00�\���CTK@͎���z=\��\��D�P�k�\0�s�^XK�\�koo?3G\�.�˿O�GR�G��-\0\r&�<\�\�-\�\�\�\��\��:�nߩT*�\n���\04��\�-.z\���e\�\�۷o߹iӦlݺuYGG�j�\�\�\�\�6n\�8�j\�X�\�t\�|:զ|Q���.�w�4Ӝ\�tgZ�>\"�vuue===Y�j�ڻwo�aÆ��W�r�\�\�\�\�El��/���W�4\\\�BZ�>�\�W�m\�\0\�\�\�\�?\�i;##\�R\�ϧ+{袋.���\0��X\�8�8\��C�\�Ʈ\�U,@��\�}\��\�Ku0+?\\�h\�ً`\Z�T*_J\'�>-Q�\�ƮիWg)\�>��\�}�X,^c\��\"\�\�\�\�LZ��\�o\�\�\�\���\�Ͷt~\�X\�\�q�p:�\�\�ۛ}��_���\�\�\�\�\00ô��~<.\�\��~��;ۼvY�\�CםPq_lR\'�֬Y�\�S`��={�\�)�:\�7P�ݹ\�\'\��ڵe��Z�1�\0�\�7.\�\��~_z\�;#�\�\�&�\n�\0��\�\��\�\��s-\�\�wsG��\�7�	�\�/\00�4k\n��%�_%�@3�ߘô�%\Z#�\�\�#�\�\�&�\n�\0�\�\�\�\�\�\��eZ�1\�\�\�V�~c��*�\0�=�|��h����\�懗�<\�!\�\�T\�\0�X�}�\\.ߡ%\Z#�F��\��\'�߸O8~���\�WR���h��\�חm{|\�\�C\�}�M@~�	(�Jϕ\�\�_h�����\�\�\�~0\�\�\�f�7\�\0����\�oL�NKLa�\�\�˺��\�~�f\��w�\�1�X��\�/\0p\Z�\�\�\�\��Zbj\�\�z{��\0@\r͟?���Ri�����;�\�\�\�z�V\�\0�|X.�_\�S~O7���*�\0㐂\�\��\�\�\�\�S~��\0\�Q�X�&\�\�i�ӗ\�<\�\�*y¯�\0L}pkMի%&ԆY^�K�\�\�¯�\04�B��\�r�_K\�$�\�\�\�z��_\�\0��\��\�T\�i���\�\�=�\�!X�~�)6w\�܏��6�%&%�\�	�\�¯�\0L�3\�\�T\rJ�~�	��\��x{K�ҍ�g\�>;\'�\n�\0\031��z5r�MްU�\�\�/\0���\�\��CC\�t	��\�7\�ۅ_\0�\�~�\�\�~�_\0��%�\n�\0\0¯�+�\0�¯�\0 �\n�\�/\0��k�3\�\0@�U\�/\0��_\0\0\�W�\0@�~\0~�_\0\0�_\�\0@�U\�/\0��_\0\0\�W	�\0\0¯~\0�_%�\0�J�\0~�_\0\0�_\�\0\0\�W�\0`�u\�\�	�\�/\0@s\�\�\�:\�\�\�#d6h\�ڵkG\n���T\0�\ZX�~�-6lسg��ـ�����H��T\0�\ZI\�\�Ǝ��\��x]5T��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@M�\�\�\�f\��`\0\0\0\0IEND�B`�',1),('2',1,'D:\\workspace\\code\\activiti-demo6-springboot\\target\\classes\\processes\\vacation.bpmn','1',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1515296568080\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"vacationProcess\" isClosed=\"false\" isExecutable=\"true\" name=\"请假流程\" processType=\"None\">\r\n    <startEvent id=\"startevent1\" name=\"Start\"/>\r\n    <userTask activiti:candidateGroups=\"empGroup\" activiti:exclusive=\"true\" id=\"usertask1\" name=\"填写申请\"/>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"exclusivegateway1\" name=\"Exclusive Gateway\"/>\r\n    <userTask activiti:candidateGroups=\"manageGroup\" activiti:exclusive=\"true\" id=\"usertask2\" name=\"总监审批\"/>\r\n    <userTask activiti:candidateGroups=\"dirGroup\" activiti:exclusive=\"true\" id=\"usertask3\" name=\"经理审批\"/>\r\n    <endEvent id=\"endevent1\" name=\"End\"/>\r\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"/>\r\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"/>\r\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\r\n\r\n				${days <= 3}\r\n\r\n		]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow4\" sourceRef=\"usertask2\" targetRef=\"endevent1\"/>\r\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\r\n\r\n				${days > 3}\r\n\r\n		]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask3\" targetRef=\"endevent1\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"vacationProcess\">\r\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"Shape-startevent1\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"80.0\" y=\"150.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"Shape-usertask1\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"180.0\" y=\"140.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"Shape-exclusivegateway1\" isMarkerVisible=\"false\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"350.0\" y=\"147.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"Shape-usertask2\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"80.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"Shape-usertask3\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"210.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"Shape-endevent1\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"660.0\" y=\"150.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\" sourceElement=\"startevent1\" targetElement=\"usertask1\">\r\n        <omgdi:waypoint x=\"112.0\" y=\"166.0\"/>\r\n        <omgdi:waypoint x=\"180.0\" y=\"167.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\" sourceElement=\"usertask1\" targetElement=\"exclusivegateway1\">\r\n        <omgdi:waypoint x=\"285.0\" y=\"167.5\"/>\r\n        <omgdi:waypoint x=\"350.0\" y=\"163.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\" sourceElement=\"exclusivegateway1\" targetElement=\"usertask2\">\r\n        <omgdi:waypoint x=\"370.0\" y=\"151.0\"/>\r\n        <omgdi:waypoint x=\"370.0\" y=\"107.0\"/>\r\n        <omgdi:waypoint x=\"460.0\" y=\"107.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\" sourceElement=\"usertask2\" targetElement=\"endevent1\">\r\n        <omgdi:waypoint x=\"565.0\" y=\"107.5\"/>\r\n        <omgdi:waypoint x=\"660.0\" y=\"166.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\" sourceElement=\"exclusivegateway1\" targetElement=\"usertask3\">\r\n        <omgdi:waypoint x=\"370.0\" y=\"175.0\"/>\r\n        <omgdi:waypoint x=\"370.0\" y=\"237.0\"/>\r\n        <omgdi:waypoint x=\"460.0\" y=\"237.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\" sourceElement=\"usertask3\" targetElement=\"endevent1\">\r\n        <omgdi:waypoint x=\"565.0\" y=\"237.5\"/>\r\n        <omgdi:waypoint x=\"660.0\" y=\"166.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('3',1,'D:\\workspace\\code\\activiti-demo6-springboot\\target\\classes\\processes\\vacation.vacationProcess.png','1',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0\"*^^\0\0\�IDATx\�\�\�l\\՝/�Q�VUU�VEU���n�V\�j�\�jվj\�\rZm���M��\�8NM���\'@)E\�-��ҨYT�X(jw�\�W^S�\�/��4Y i!	&NR(1��\�w~\�u4qlǎ\�\�\��~\Z{\�8v\�\�;�;g\�=g\�,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��,\�\�޾}�\�M�6e\�֭\�:::TTggg�q\�ƁT�\�\0\05����+\�\�\�\����U\�޽{�\r6� �\n\0P\�\�+�6v\0\�\�\�跧\0\�@u2�b�=\0�\"X	�\�/\0��[U�owg۟�7\�\���c_\�}©�\00�\�vg�\�.\�^x\�*\�m��\00c\�\�\�-�<)�֮-�T\�\0`\�ߗ�Έ\�7�	�\�/\0��	��;\�G��M@~\0�_%�\0L���;�~c��*�\0̘��#�\�\�&�\n�\0\03&�\�\��b��\�\�\'yH�\�6U�\0�1\�7\�\�g\�?)�\�}©�\00�\�o__�\��U\'yH�\�6U�\0�\�7Vp\��\�F�۬�&�\0L\��\�חuo[��z\�\��\�`\�c\�z��_\0�i~O\�۫X�\0�1\�w,�����\�/\0��	��|K`~\0�M�U\�/\0��2���\�r�2\�W�\0h��嵿T*],�\n�\0\0\�~k\�p=�¯�\00\�\��\�\�,�\n�\0@hoo?S+LJ�=\�\�!�_\�\0h�\�;��jP¯�\0L����O�`6�%N\�(���T*\�8{�\�\�q¯�\0L�\�\�K!��i�=!�j\����a�^ۅ_\0�^\��\�\�h���\�\�r�֡�w��\�\�\�\�\�\�/\0P�\�֞p���P\�\�+�\n�\0@�I�\�\�\�~�%&��+�\0S,\�S\0~NK�¯�\0\�~�Ruj	\�W�~�\�\�\�J��ZB�~�_\0h���z�\\�SK��Lu&�@�\��\�b�Z��ï~�Y\�\��T-!�*\�\0�!�Y�`�約�_\0h��\�\�s���_\0�\�\�̙���ZB�U\�/\0\�x�J\�\�\��Q-!�*\�\0f�b����R�OK�J��o���KR��%�_%�@3�\�o�ڭ%�_��Z�f��\03U�\\�/�\�W�����\�\�\�\�\�/\�\�1��R�ܴhѢ?�\���N���T*=�%�_��z衇\"�\�Á\�b\�t�B�X���\0f��\����~\�\�c~S\��|\n�\�RN\�I:^:,\0\�XyH�/ZB�U�_�\�ũ~����\���8n.\\�Q{5\0L���F\\��%�_5�\�bp�\\�5.M5�jG��ٳg�m�\��o�J�+���\�?\�Ykk\�\�\�1�\��߉\�t�_�\�\��A\��J\�KZ�>֭[\'`\�\�y~�\�\�)\0o�����ұ�&\�~\�^\0\r$�f�%��D}tuu\�\�\�2�v\�ڵ#�\��\ZW_K\�wK��T�̝;�#�\0\0�b餜\n�h��X�~�-6lسg��ـ�����H��z�\�\�J��t�u\�A�\�T7��\�r4\0@�EOT\\��%\�+��;::z\�\�u\�P\�_\�\�;T[[\�\'+�ʿ�c\�@|\�Ꙗ���#\0\�$\�+-�JG�\�W\n�_H!xc�#��\�_\n��\�2\00�\�I��ꠖ�)sF:/O�R>m\�����[[[?�i\0��\���8\�j	�zmmm*�\�K\��\��j{�\�\�\�gj\0��tr�+&\�\�\�X\�͛�\�\�r�\�\��ٛ\�TOU*��Z�Y���}����6m\�bNN�4Fuvvf7nH�\�^Zq�M,ת%���\�/���X>>�`\nſ4=!PS|���2sq6^\�ݻ7�i�&�\�f�N�\�Rui	�\�H��\�t̾\�\�׽�~x��\����&$z|\�\������cW�\�R��\�0�\n�?�aK�z�\�~�\�\��\��3w�QN�N���+˵L_---��7�\�x~7�ɒ\���D�0�\�f�F\�$�\\K�\�P,Ϗ�\�w#�\��/�P��\��vw��\�{�-�\�:V�u\�\'�\n�\�E�4�N�k	�Yb�C\n�\�\�\�!b|pO��\�Z8��{\�\�\�\�˲��b��*�NK\'\�ñҔ���+.�Kxe\\ ��~%.�K�\�\�:��\�\�\�-�<)�֮-�T\�\�}3UV,�G\���üy��2��7�L˧N{,�R\�2 ��2|��\�wF��M@~<��\�}\�{.��3\�<�&M\�\'\�(�\�O\�\�{cQ�X\\Cˀ�;lm\�h1�\�6U�m\�\��\�\��&\�e\�\�\�\'\�\�K�\�\�/1,\�\�Xf9�[nԿy�\�\�g��󆘧<U\�\�O�UU���\��\Z��\�)dY���k\�>�r\�\�\�+V\\{\�YzB�=ѭ��\�5\�\\�-[�\���7޸{ɒ%_\�b¯�\�H�w�M&e�\��)W\�\�/�{9\�^>�A\�ǰ���lH���;j�\�\�\���%\���gy�x\�7Z~򓟼s\�UWe�]vYv\��fO<�D\�\�ݝ:t(�>�0\�\�O?�=��\�\�ŋ�+��b`\�ҥӓ}�V�m��\�F\n��M@~�I���M�\Z?],�n\�・R�<o*��\�\�M�{M\n�\�xB\��IOpK����\�\�\��\�+�+Vd/��ⱐ;V[�l\�V�\\�]|�\�ٵ\�^�W��\�w\�c+G��M@~�Q�t\�,=��0ZZZJ\�r���\����-\�O�n�\�\�/�\���O��\�\���w\�}��\��ݻw\��\�\�|�\�g��\�/��\�O\n�)HL��=�\r&z{���\�ē���\�g��\�/gK�,\�.��\�=\�\�\�&�\�\��b��\�\�\'yH�\�6U��f��:\0��F�P8+k�j>>��R�\�>gΜ��߈��h\��ؘ�<\�\����\�;l\�{\�1\�\�QK�.\Z�cX�7��\���K�-[�\�u\�]\�;３\�B��\��\�/\�0���ߨW������	�\�\�4\r�\�?wt�``s\�\��H\n����]\�S[,/\�g�9��\�\��ǩ�o�0���\�\�ի\�z�Z�f\��k��z��\�M�\��\�{\�m�M\�	ɪU���w\��\�A�R}}ٶ\�W�<\�!\�\�T\�w�ߡ?�8�L�&\�\�0ٗ*.Fې��\�ڗ�����g8߁\�![�n�Iz\�ײNZ\�l\��1�1\�!zh\'#���\�;�\�\�\�~c����`\�1��\�*o\�o߸J�G�N}��\�\��[\n��r��_1>8ݾ�n\�\�\���\�t�Y����it��C\��7\��\�R�{\�8�\�B�H\\\�c|k5\�a�!�/ȗ7d�ᷯ/\�޶>����#\���\�\�c��\r|_��\��\��\�\��8-b+�\��.w\�\�*a��՟F\�=\�Ǉ:Ԫ\�w�\�!C ��\�Yw�w!1�C=\�Ep1�\��߱�\�S��\�~0�\�\�{r��\Z.\0W\�����.��-\\�𣱊\�(ӏm�\0��V��1��)\�\0W�c��\Z�y|c:�z��\�c\\\�j�\��;�\�\�\�z�V\�w��I\�;\��\�t��:\\����\�>\�`��k�ο\�\�X\�\�Y\�3�\�\���\�O�<[u+�\��\���\�K/Ū\'G\\�v\��{��w�V\�w�b��E8��^s�+�\�\�3;R�=s�������\�h\�Jlǿ�\�\�\�!�W�Jp>�_\��U\�̋\�F\�\�\�K�]\�\�<֐?֩Δ�;I\���aN\nO�p5�X�$��\�|�`c���\�U�p��R�؞�\Z�����y\�\��\�ꙉ�¨T*�<cu�r\�\�\�X�x*\�q\�c\�k��\��q��\�N\�W�m�}u���U!x�cq��\�	���\0\�\���[��+�\�\�k\�=�\�S\�,������g�V�X1\��M�\����D\�l��{d�c��ze�,�\n�\r~�՗��\��yh\���3�\��\�\�\��5�\�~\�+8P�׽���q�\�D1Ģ�g�-\�F\\{\�Yww���\�}��\��#�\�\�\�C\��0�\�U�~O\��*\�GZ*��b���+\n���� \�W���,��T�TnJ�\�K\��s\�v|���\�L��1�!\�1�{|�~v\�X\�Ɲ{\�\��\���l\�؇ Ժ\��V�\�@\r\�ч_\�ꝉb\�ߪ\�\��<u\�\�\�zl\�ݩWRƓ\�$\�*G\n1�\�\r\�\����~8��\��n\�L�\�K�v�o\�d\���\'G��*OX(\�O?w$ܡ�\�b)�}�\�\����^�ߗ�\�\�\�O>\�\�k\�(�j��#�_�lΜ9�U�1�q��\�\r�\�st�3Q��\�\�\�٨\�>���nd`��\��:��x��5�\�\'�\�ci\�J_\�O��ŞTݩv�z=իq\�O�ۚ��7\�\�<lʃHLqҙOp\���3����Y����N_ߝ�^���#�\�\�׷�jO_/M�ᛱpG�\�\�\"�tk����\�M_��1L��n�{\�ocW__ߤ\�\�\��\�S]A:uz\�y�>A;w<\'�5a\�*H�(\�}#թ\�l�\0&=�Nu�l\��W��\��=֋U(Ίzkk\�c2\�t��DKK˧ҶO��L\n�O\'\�/D���\�i[)\�e�\����\�\�%��!4\�hz\�\�i\�mR#�F\�[z܏�޷�\�\�y�X��G�\���l���<,Gpy%�\�o�0�zڶ+\�{�н?\�\�ąm����恨o,%G	��=4�I\�H\�>�ᢋ.:\�\�ڑfa�\�<���\��\0\���V����O٘ߞ��\�\�2\�w�yߪ^\�Y�~`_\�OF\�0\�o��陭\�\no+�Z�Ř\�&�|�����\�a\�ڵ=\�0\�C>>th�}#�H}l#�\�Y\�_�T�\�\�o}���w�\�\�!\��v�!\r#=N�\���\�l\�䦛n\�1U��.[�\�\�f�\�wpլ|�\�\���H�m��;\�}��]��n&\0\�=\�\��\r}��|�z�_��6�%K�\\�x�\�)Y\�-�7n�\�ZZZ�&\�\�\�F�¯�;�Lt%6���X\�\".f��v\�\�=)sܕ_�~u\\?\�\�J��Z\����\�\�ࣱ�t=mڴ)�<벿\�B�~g�\�\r�ߜ%�5\�\�z\��`\�P�z�\�U5\�\�h,1\��\�Y\����\�\�\Z~-ZCVk}\�W���\�d_�\�\����\�R�t`�\�뮻�.��K�.���[<[ud]r\�%[�l�K�}�\�\'�\�+�y�#�\n�3�����\r�h�\�\�6`�\�S��z\n�\���7o\�_V/$�z�\�I\�Bk֬9\�\�\���\�3UgW\\qŲ+��2{\�w&�\�>x�\�\�J�r�zz/�_\�wF;U�\�\�a��1�v��a��*$�𭥥%ۺu\�d�\�^{-�u����<KSd�\�\�\�w\�q\�dv��\�\�K�j\�\�~g�\�L��m\0n~`��)�\��\�\�\�\�\�\�\�\��|\�\��\�<���\���+��\�y>8\�\n�\�C\\|���}+W���\0<�t\�\�Xnx�\'yz�_%�\�(\0\�e��\�L��7.\�Wc�%\�O�\�!�L�b����d��?D\0�Up��V\��=��<[\r�-Z\��\�\�~7{�\�wk6\�\��\�/�\�v\Z\�+�\n�Mm��wC:)E;~[�\0�R(\�J�-+�1��jۿ���~8�Ū���6>�m��H�Y�cD��H\�`��2\�!��6R\0N;\���}\�k/��/n�1���\��~�_f��8^�3o��Z�גX�O\\L�\����\�\�\�~\�\�\�\�BS�ǒG�\��Y ���qOg�lٲ�\�\Z���3]�`����/_~$B�x\��<�\�3{cq>���ۄ_\�j��\"\�\�\��\�E�R�|\"flH�)���q\�h�O�9_Ϭ\n1$�zp�P�X	\�駟κ���C�\�>qcz# \�\�m\�XT��5ԡ�僿��.X�b\��G}��7\�|�\�\�Ç�=\�\�v =ه~�\�}�dq�ܖ��Z�gG�~Nz}\�O�-\�i	\�4^?*)_���\�>�`��\�Mf��b���O��\�\�\�\Z\��\�1\�;��\�\�Rǒ\�Vn~�_F�^\'\�M\'�Z�3b�@z\�x+�T��.�h�~y\��~�s\�w�7��+�\�\�\�\�)\�W�mbq+�\�h	`4�B\�\�\�\�����7\����-~w�[n\�{����\r�y@\�S���_\�cJ�R��YK\0\�iii�Tz�x4���;�f\\�U@�U\�ﴕNf���\��P�X,��^^\�\��nN�Z�_%�N{1.�\�~�%�<�\�\�b{��7�>t���}R���\�#�zN\'�_i	h^�B\�\�r�G\��\�PTzM�qܧe@�U\�\�S*�֧�\�F-My�\"�kc\�~��\��OZ�_%�\�h\��`L�%�y\�\�1\��л\�b��+�6�t\�/.j\�\�\��e\�x#��)\�b\�\\��\�o��\�\�H�\�L�B\��8\�\�Wt�Y\�٫e��[�N�~�B�RY�N�=Zf��s\�~$\�t$ݾ�\�\�}���\�\�\�u���G\�l\�ڵk׎~�\��N��������!�\�Ϧz:U\�\��Z�V��\���\�oٰa\���={�\�����GR���N\\KKK)�j	��od[S\�\�C\�S�>�U�qI\�\�Ǝ��\��x]5T���S,\�M\'\�\�Z�����3\��{Kkȇ7<\��\0����\�Sq巖�\�\���\����p-޸ƅl\��#.l\�2\0p\nq\�w:y�x����,���OU��X,^�U\0`�\"�Ξ=�l-��R�\�M\�\�X�\"\�1\\I�\0�i�dZ[[?�%�\�B\�\�Xv8��e��\0Pqb�鑴L�9s\�|�X,�8��b&�tl\�](>�e\0�vᷯR�|IK�\�ikk�d:;S\�xޞT\�\�*\009\��@�T�XK@��c\�T[b<o�}�X,��U\0`r\�o�)�^K@]��%�����\\.?\Z\�j\0�\�Ixw�T�MK�\�YU\����t���n�S����\�CZ\0\�~S.��%`Ҏ�?M�:..M\�\�\�\�m{��-\0Ssb~�T*�\\K@m����\�\�z.ϻ=}_\�*\00�\���CTK@͎���z=\��\��D�P�k�\0�s�^XK�\�koo?3G\�.�˿O�GR�G��-\0\r&�<\�\�-\�\�\�\��\��:�nߩT*�\n���\04��\�-.z\���e\�\�۷o߹iӦlݺuYGG�j�\�\�\�\�6n\�8�j\�X�\�t\�|:զ|Q���.�w�4Ӝ\�tgZ�>\"�vuue===Y�j�ڻwo�aÆ��W�r�\�\�\�\�El��/���W�4\\\�BZ�>�\�W�m\�\0\�\�\�\�?\�i;##\�R\�ϧ+{袋.���\0��X\�8�8\��C�\�Ʈ\�U,@��\�}\��\�Ku0+?\\�h\�ً`\Z�T*_J\'�>-Q�\�ƮիWg)\�>��\�}�X,^c\��\"\�\�\�\�LZ��\�o\�\�\�\���\�Ͷt~\�X\�\�q�p:�\�\�ۛ}��_���\�\�\�\�\00ô��~<.\�\��~��;ۼvY�\�CםPq_lR\'�֬Y�\�S`��={�\�)�:\�7P�ݹ\�\'\��ڵe��Z�1�\0�\�7.\�\��~_z\�;#�\�\�&�\n�\0��\�\��\�\��s-\�\�wsG��\�7�	�\�/\00�4k\n��%�_%�@3�ߘô�%\Z#�\�\�#�\�\�&�\n�\0�\�\�\�\�\�\��eZ�1\�\�\�V�~c��*�\0�=�|��h����\�懗�<\�!\�\�T\�\0�X�}�\\.ߡ%\Z#�F��\��\'�߸O8~���\�WR���h��\�חm{|\�\�C\�}�M@~�	(�Jϕ\�\�_h�����\�\�\�~0\�\�\�f�7\�\0����\�oL�NKLa�\�\�˺��\�~�f\��w�\�1�X��\�/\0p\Z�\�\�\�\��Zbj\�\�z{��\0@\r͟?���Ri�����;�\�\�\�z�V\�\0�|X.�_\�S~O7���*�\0㐂\�\��\�\�\�\�S~��\0\�Q�X�&\�\�i�ӗ\�<\�\�*y¯�\0L}pkMի%&ԆY^�K�\�\�¯�\04�B��\�r�_K\�$�\�\�\�z��_\�\0��\��\�T\�i���\�\�=�\�!X�~�)6w\�܏��6�%&%�\�	�\�¯�\0L�3\�\�T\rJ�~�	��\��x{K�ҍ�g\�>;\'�\n�\0\031��z5r�MްU�\�\�/\0���\�\��CC\�t	��\�7\�ۅ_\0�\�~�\�\�~�_\0��%�\n�\0\0¯�+�\0�¯�\0 �\n�\�/\0��k�3\�\0@�U\�/\0��_\0\0\�W�\0@�~\0~�_\0\0�_\�\0@�U\�/\0��_\0\0\�W	�\0\0¯~\0�_%�\0�J�\0~�_\0\0�_\�\0\0\�W�\0`�u\�\�	�\�/\0@s\�\�\�:\�\�\�#d6h\�ڵkG\n���T\0�\ZX�~�-6lسg��ـ�����H��T\0�\ZI\�\�Ǝ��\��x]5T��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@M�\�\�\�f\��`\0\0\0\0IEND�B`�',1),('5002',1,'D:\\workspace\\code\\activiti6\\target\\classes\\processes\\vacation.bpmn','5001',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:tns=\"http://www.activiti.org/test\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" id=\"m1515296568080\" name=\"\" targetNamespace=\"http://www.activiti.org/test\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\">\r\n  <process id=\"vacationProcess\" isClosed=\"false\" isExecutable=\"true\" name=\"请假流程\" processType=\"None\">\r\n    <startEvent id=\"startevent1\" name=\"Start\"/>\r\n    <userTask activiti:candidateGroups=\"empGroup\" activiti:exclusive=\"true\" id=\"usertask1\" name=\"填写申请\"/>\r\n    <exclusiveGateway gatewayDirection=\"Unspecified\" id=\"exclusivegateway1\" name=\"Exclusive Gateway\"/>\r\n    <userTask activiti:candidateGroups=\"manageGroup\" activiti:exclusive=\"true\" id=\"usertask2\" name=\"总监审批\"/>\r\n    <userTask activiti:candidateGroups=\"dirGroup\" activiti:exclusive=\"true\" id=\"usertask3\" name=\"经理审批\"/>\r\n    <endEvent id=\"endevent1\" name=\"End\"/>\r\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"/>\r\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"exclusivegateway1\"/>\r\n    <sequenceFlow id=\"flow3\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\r\n\r\n				${days <= 3}\r\n\r\n		]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow4\" sourceRef=\"usertask2\" targetRef=\"endevent1\"/>\r\n    <sequenceFlow id=\"flow5\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[\r\n\r\n				${days > 3}\r\n\r\n		]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow6\" sourceRef=\"usertask3\" targetRef=\"endevent1\"/>\r\n  </process>\r\n  <bpmndi:BPMNDiagram documentation=\"background=#3C3F41;count=1;horizontalcount=1;orientation=0;width=842.4;height=1195.2;imageableWidth=832.4;imageableHeight=1185.2;imageableX=5.0;imageableY=5.0\" id=\"Diagram-_1\" name=\"New Diagram\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"vacationProcess\">\r\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"Shape-startevent1\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"80.0\" y=\"150.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"Shape-usertask1\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"180.0\" y=\"140.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"Shape-exclusivegateway1\" isMarkerVisible=\"false\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"350.0\" y=\"147.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"Shape-usertask2\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"80.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"Shape-usertask3\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"460.0\" y=\"210.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"Shape-endevent1\">\r\n        <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"660.0\" y=\"150.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"32.0\" width=\"32.0\" x=\"0.0\" y=\"0.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\" sourceElement=\"startevent1\" targetElement=\"usertask1\">\r\n        <omgdi:waypoint x=\"112.0\" y=\"166.0\"/>\r\n        <omgdi:waypoint x=\"180.0\" y=\"167.5\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\" sourceElement=\"usertask1\" targetElement=\"exclusivegateway1\">\r\n        <omgdi:waypoint x=\"285.0\" y=\"167.5\"/>\r\n        <omgdi:waypoint x=\"350.0\" y=\"163.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\" sourceElement=\"exclusivegateway1\" targetElement=\"usertask2\">\r\n        <omgdi:waypoint x=\"370.0\" y=\"151.0\"/>\r\n        <omgdi:waypoint x=\"370.0\" y=\"107.0\"/>\r\n        <omgdi:waypoint x=\"460.0\" y=\"107.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\" sourceElement=\"usertask2\" targetElement=\"endevent1\">\r\n        <omgdi:waypoint x=\"565.0\" y=\"107.5\"/>\r\n        <omgdi:waypoint x=\"660.0\" y=\"166.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\" sourceElement=\"exclusivegateway1\" targetElement=\"usertask3\">\r\n        <omgdi:waypoint x=\"370.0\" y=\"175.0\"/>\r\n        <omgdi:waypoint x=\"370.0\" y=\"237.0\"/>\r\n        <omgdi:waypoint x=\"460.0\" y=\"237.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\" sourceElement=\"usertask3\" targetElement=\"endevent1\">\r\n        <omgdi:waypoint x=\"565.0\" y=\"237.5\"/>\r\n        <omgdi:waypoint x=\"660.0\" y=\"166.0\"/>\r\n        <bpmndi:BPMNLabel>\r\n          <omgdc:Bounds height=\"-1.0\" width=\"-1.0\" x=\"-1.0\" y=\"-1.0\"/>\r\n        </bpmndi:BPMNLabel>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('5003',1,'D:\\workspace\\code\\activiti6\\target\\classes\\processes\\vacation.vacationProcess.png','5001',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0\"*^^\0\0\�IDATx\�\�\�l\\՝/�Q�VUU�VEU���n�V\�j�\�jվj\�\rZm���M��\�8NM���\'@)E\�-��ҨYT�X(jw�\�W^S�\�/��4Y i!	&NR(1��\�w~\�u4qlǎ\�\�\��~\Z{\�8v\�\�;�;g\�=g\�,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��,\�\�޾}�\�M�6e\�֭\�:::TTggg�q\�ƁT�\�\0\05����+\�\�\�\����U\�޽{�\r6� �\n\0P\�\�+�6v\0\�\�\�跧\0\�@u2�b�=\0�\"X	�\�/\0��[U�owg۟�7\�\���c_\�}©�\00�\�vg�\�.\�^x\�*\�m��\00c\�\�\�-�<)�֮-�T\�\0`\�ߗ�Έ\�7�	�\�/\0��	��;\�G��M@~\0�_%�\0L���;�~c��*�\0̘��#�\�\�&�\n�\0\03&�\�\��b��\�\�\'yH�\�6U�\0�1\�7\�\�g\�?)�\�}©�\00�\�o__�\��U\'yH�\�6U�\0�\�7Vp\��\�F�۬�&�\0L\��\�חuo[��z\�\��\�`\�c\�z��_\0�i~O\�۫X�\0�1\�w,�����\�/\0��	��|K`~\0�M�U\�/\0��2���\�r�2\�W�\0h��嵿T*],�\n�\0\0\�~k\�p=�¯�\00\�\��\�\�,�\n�\0@hoo?S+LJ�=\�\�!�_\�\0h�\�;��jP¯�\0L����O�`6�%N\�(���T*\�8{�\�\�q¯�\0L�\�\�K!��i�=!�j\����a�^ۅ_\0�^\��\�\�h���\�\�r�֡�w��\�\�\�\�\�\�/\0P�\�֞p���P\�\�+�\n�\0@�I�\�\�\�~�%&��+�\0S,\�S\0~NK�¯�\0\�~�Ruj	\�W�~�\�\�\�J��ZB�~�_\0h���z�\\�SK��Lu&�@�\��\�b�Z��ï~�Y\�\��T-!�*\�\0�!�Y�`�約�_\0h��\�\�s���_\0�\�\�̙���ZB�U\�/\0\�x�J\�\�\��Q-!�*\�\0f�b����R�OK�J��o���KR��%�_%�@3�\�o�ڭ%�_��Z�f��\03U�\\�/�\�W�����\�\�\�\�\�/\�\�1��R�ܴhѢ?�\���N���T*=�%�_��z衇\"�\�Á\�b\�t�B�X���\0f��\����~\�\�c~S\��|\n�\�RN\�I:^:,\0\�XyH�/ZB�U�_�\�ũ~����\���8n.\\�Q{5\0L���F\\��%�_5�\�bp�\\�5.M5�jG��ٳg�m�\��o�J�+���\�?\�Ykk\�\�\�1�\��߉\�t�_�\�\��A\��J\�KZ�>֭[\'`\�\�y~�\�\�)\0o�����ұ�&\�~\�^\0\r$�f�%��D}tuu\�\�\�2�v\�ڵ#�\��\ZW_K\�wK��T�̝;�#�\0\0�b餜\n�h��X�~�-6lسg��ـ�����H��z�\�\�J��t�u\�A�\�T7��\�r4\0@�EOT\\��%\�+��;::z\�\�u\�P\�_\�\�;T[[\�\'+�ʿ�c\�@|\�Ꙗ���#\0\�$\�+-�JG�\�W\n�_H!xc�#��\�_\n��\�2\00�\�I��ꠖ�)sF:/O�R>m\�����[[[?�i\0��\���8\�j	�zmmm*�\�K\��\��j{�\�\�\�gj\0��tr�+&\�\�\�X\�͛�\�\�r�\�\��ٛ\�TOU*��Z�Y���}����6m\�bNN�4Fuvvf7nH�\�^Zq�M,ת%���\�/���X>>�`\nſ4=!PS|���2sq6^\�ݻ7�i�&�\�f�N�\�Rui	�\�H��\�t̾\�\�׽�~x��\����&$z|\�\������cW�\�R��\�0�\n�?�aK�z�\�~�\�\��\��3w�QN�N���+˵L_---��7�\�x~7�ɒ\���D�0�\�f�F\�$�\\K�\�P,Ϗ�\�w#�\��/�P��\��vw��\�{�-�\�:V�u\�\'�\n�\�E�4�N�k	�Yb�C\n�\�\�\�!b|pO��\�Z8��{\�\�\�\�˲��b��*�NK\'\�ñҔ���+.�Kxe\\ ��~%.�K�\�\�:��\�\�\�-�<)�֮-�T\�\�}3UV,�G\���üy��2��7�L˧N{,�R\�2 ��2|��\�wF��M@~<��\�}\�{.��3\�<�&M\�\'\�(�\�O\�\�{cQ�X\\Cˀ�;lm\�h1�\�6U�m\�\��\�\��&\�e\�\�\�\'\�\�K�\�\�/1,\�\�Xf9�[nԿy�\�\�g��󆘧<U\�\�O�UU���\��\Z��\�)dY���k\�>�r\�\�\�+V\\{\�YzB�=ѭ��\�5\�\\�-[�\���7޸{ɒ%_\�b¯�\�H�w�M&e�\��)W\�\�/�{9\�^>�A\�ǰ���lH���;j�\�\�\���%\���gy�x\�7Z~򓟼s\�UWe�]vYv\��fO<�D\�\�ݝ:t(�>�0\�\�O?�=��\�\�ŋ�+��b`\�ҥӓ}�V�m��\�F\n��M@~�I���M�\Z?],�n\�・R�<o*��\�\�M�{M\n�\�xB\��IOpK����\�\�\��\�+�+Vd/��ⱐ;V[�l\�V�\\�]|�\�ٵ\�^�W��\�w\�c+G��M@~�Q�t\�,=��0ZZZJ\�r���\����-\�O�n�\�\�/�\���O��\�\���w\�}��\��ݻw\��\�\�|�\�g��\�/��\�O\n�)HL��=�\r&z{���\�ē���\�g��\�/gK�,\�.��\�=\�\�\�&�\�\��b��\�\�\'yH�\�6U��f��:\0��F�P8+k�j>>��R�\�>gΜ��߈��h\��ؘ�<\�\����\�;l\�{\�1\�\�QK�.\Z�cX�7��\���K�-[�\�u\�]\�;３\�B��\��\�/\�0���ߨW������	�\�\�4\r�\�?wt�``s\�\��H\n����]\�S[,/\�g�9��\�\��ǩ�o�0���\�\�ի\�z�Z�f\��k��z��\�M�\��\�{\�m�M\�	ɪU���w\��\�A�R}}ٶ\�W�<\�!\�\�T\�w�ߡ?�8�L�&\�\�0ٗ*.Fې��\�ڗ�����g8߁\�![�n�Iz\�ײNZ\�l\��1�1\�!zh\'#���\�;�\�\�\�~c����`\�1��\�*o\�o߸J�G�N}��\�\��[\n��r��_1>8ݾ�n\�\�\���\�t�Y����it��C\��7\��\�R�{\�8�\�B�H\\\�c|k5\�a�!�/ȗ7d�ᷯ/\�޶>����#\���\�\�c��\r|_��\��\��\�\��8-b+�\��.w\�\�*a��՟F\�=\�Ǉ:Ԫ\�w�\�!C ��\�Yw�w!1�C=\�Ep1�\��߱�\�S��\�~0�\�\�{r��\Z.\0W\�����.��-\\�𣱊\�(ӏm�\0��V��1��)\�\0W�c��\Z�y|c:�z��\�c\\\�j�\��;�\�\�\�z�V\�w��I\�;\��\�t��:\\����\�>\�`��k�ο\�\�X\�\�Y\�3�\�\���\�O�<[u+�\��\���\�K/Ū\'G\\�v\��{��w�V\�w�b��E8��^s�+�\�\�3;R�=s�������\�h\�Jlǿ�\�\�\�!�W�Jp>�_\��U\�̋\�F\�\�\�K�]\�\�<֐?֩Δ�;I\���aN\nO�p5�X�$��\�|�`c���\�U�p��R�؞�\Z�����y\�\��\�ꙉ�¨T*�<cu�r\�\�\�X�x*\�q\�c\�k��\��q��\�N\�W�m�}u���U!x�cq��\�	���\0\�\���[��+�\�\�k\�=�\�S\�,������g�V�X1\��M�\����D\�l��{d�c��ze�,�\n�\r~�՗��\��yh\���3�\��\�\�\��5�\�~\�+8P�׽���q�\�D1Ģ�g�-\�F\\{\�Yww���\�}��\��#�\�\�\�C\��0�\�U�~O\��*\�GZ*��b���+\n���� \�W���,��T�TnJ�\�K\��s\�v|���\�L��1�!\�1�{|�~v\�X\�Ɲ{\�\��\���l\�؇ Ժ\��V�\�@\r\�ч_\�ꝉb\�ߪ\�\��<u\�\�\�zl\�ݩWRƓ\�$\�*G\n1�\�\r\�\����~8��\��n\�L�\�K�v�o\�d\���\'G��*OX(\�O?w$ܡ�\�b)�}�\�\����^�ߗ�\�\�\�O>\�\�k\�(�j��#�_�lΜ9�U�1�q��\�\r�\�st�3Q��\�\�\�٨\�>���nd`��\��:��x��5�\�\'�\�ci\�J_\�O��ŞTݩv�z=իq\�O�ۚ��7\�\�<lʃHLqҙOp\���3����Y����N_ߝ�^���#�\�\�׷�jO_/M�ᛱpG�\�\�\"�tk����\�M_��1L��n�{\�ocW__ߤ\�\�\��\�S]A:uz\�y�>A;w<\'�5a\�*H�(\�}#թ\�l�\0&=�Nu�l\��W��\��=֋U(Ίzkk\�c2\�t��DKK˧ҶO��L\n�O\'\�/D���\�i[)\�e�\����\�\�%��!4\�hz\�\�i\�mR#�F\�[z܏�޷�\�\�y�X��G�\���l���<,Gpy%�\�o�0�zڶ+\�{�н?\�\�ąm����恨o,%G	��=4�I\�H\�>�ᢋ.:\�\�ڑfa�\�<���\��\0\���V����O٘ߞ��\�\�2\�w�yߪ^\�Y�~`_\�OF\�0\�o��陭\�\no+�Z�Ř\�&�|�����\�a\�ڵ=\�0\�C>>th�}#�H}l#�\�Y\�_�T�\�\�o}���w�\�\�!\��v�!\r#=N�\���\�l\�䦛n\�1U��.[�\�\�f�\�wpլ|�\�\���H�m��;\�}��]��n&\0\�=\�\��\r}��|�z�_��6�%K�\\�x�\�)Y\�-�7n�\�ZZZ�&\�\�\�F�¯�;�Lt%6���X\�\".f��v\�\�=)sܕ_�~u\\?\�\�J��Z\����\�\�ࣱ�t=mڴ)�<벿\�B�~g�\�\r�ߜ%�5\�\�z\��`\�P�z�\�U5\�\�h,1\��\�Y\����\�\�\Z~-ZCVk}\�W���\�d_�\�\����\�R�t`�\�뮻�.��K�.���[<[ud]r\�%[�l�K�}�\�\'�\�+�y�#�\n�3�����\r�h�\�\�6`�\�S��z\n�\���7o\�_V/$�z�\�I\�Bk֬9\�\�\���\�3UgW\\qŲ+��2{\�w&�\�>x�\�\�J�r�zz/�_\�wF;U�\�\�a��1�v��a��*$�𭥥%ۺu\�d�\�^{-�u����<KSd�\�\�\�w\�q\�dv��\�\�K�j\�\�~g�\�L��m\0n~`��)�\��\�\�\�\�\�\�\�\��|\�\��\�<���\���+��\�y>8\�\n�\�C\\|���}+W���\0<�t\�\�Xnx�\'yz�_%�\�(\0\�e��\�L��7.\�Wc�%\�O�\�!�L�b����d��?D\0�Up��V\��=��<[\r�-Z\��\�\�~7{�\�wk6\�\��\�/�\�v\Z\�+�\n�Mm��wC:)E;~[�\0�R(\�J�-+�1��jۿ���~8�Ū���6>�m��H�Y�cD��H\�`��2\�!��6R\0N;\���}\�k/��/n�1���\��~�_f��8^�3o��Z�גX�O\\L�\����\�\�\�~\�\�\�\�BS�ǒG�\��Y ���qOg�lٲ�\�\Z���3]�`����/_~$B�x\��<�\�3{cq>���ۄ_\�j��\"\�\�\��\�E�R�|\"flH�)���q\�h�O�9_Ϭ\n1$�zp�P�X	\�駟κ���C�\�>qcz# \�\�m\�XT��5ԡ�僿��.X�b\��G}��7\�|�\�\�Ç�=\�\�v =ه~�\�}�dq�ܖ��Z�gG�~Nz}\�O�-\�i	\�4^?*)_���\�>�`��\�Mf��b���O��\�\�\�\Z\��\�1\�;��\�\�Rǒ\�Vn~�_F�^\'\�M\'�Z�3b�@z\�x+�T��.�h�~y\��~�s\�w�7��+�\�\�\�\�)\�W�mbq+�\�h	`4�B\�\�\�\�����7\����-~w�[n\�{����\r�y@\�S���_\�cJ�R��YK\0\�iii�Tz�x4���;�f\\�U@�U\�ﴕNf���\��P�X,��^^\�\��nN�Z�_%�N{1.�\�~�%�<�\�\�b{��7�>t���}R���\�#�zN\'�_i	h^�B\�\�r�G\��\�PTzM�qܧe@�U\�\�S*�֧�\�F-My�\"�kc\�~��\��OZ�_%�\�h\��`L�%�y\�\�1\��л\�b��+�6�t\�/.j\�\�\��e\�x#��)\�b\�\\��\�o��\�\�H�\�L�B\��8\�\�Wt�Y\�٫e��[�N�~�B�RY�N�=Zf��s\�~$\�t$ݾ�\�\�}���\�\�\�u���G\�l\�ڵk׎~�\��N��������!�\�Ϧz:U\�\��Z�V��\���\�oٰa\���={�\�����GR���N\\KKK)�j	��od[S\�\�C\�S�>�U�qI\�\�Ǝ��\��x]5T���S,\�M\'\�\�Z�����3\��{Kkȇ7<\��\0����\�Sq巖�\�\���\����p-޸ƅl\��#.l\�2\0p\nq\�w:y�x����,���OU��X,^�U\0`�\"�Ξ=�l-��R�\�M\�\�X�\"\�1\\I�\0�i�dZ[[?�%�\�B\�\�Xv8��e��\0Pqb�鑴L�9s\�|�X,�8��b&�tl\�](>�e\0�vᷯR�|IK�\�ikk�d:;S\�xޞT\�\�*\009\��@�T�XK@��c\�T[b<o�}�X,��U\0`r\�o�)�^K@]��%�����\\.?\Z\�j\0�\�Ixw�T�MK�\�YU\����t���n�S����\�CZ\0\�~S.��%`Ҏ�?M�:..M\�\�\�\�m{��-\0Ssb~�T*�\\K@m����\�\�z.ϻ=}_\�*\00�\���CTK@͎���z=\��\��D�P�k�\0�s�^XK�\�koo?3G\�.�˿O�GR�G��-\0\r&�<\�\�-\�\�\�\��\��:�nߩT*�\n���\04��\�-.z\���e\�\�۷o߹iӦlݺuYGG�j�\�\�\�\�6n\�8�j\�X�\�t\�|:զ|Q���.�w�4Ӝ\�tgZ�>\"�vuue===Y�j�ڻwo�aÆ��W�r�\�\�\�\�El��/���W�4\\\�BZ�>�\�W�m\�\0\�\�\�\�?\�i;##\�R\�ϧ+{袋.���\0��X\�8�8\��C�\�Ʈ\�U,@��\�}\��\�Ku0+?\\�h\�ً`\Z�T*_J\'�>-Q�\�ƮիWg)\�>��\�}�X,^c\��\"\�\�\�\�LZ��\�o\�\�\�\���\�Ͷt~\�X\�\�q�p:�\�\�ۛ}��_���\�\�\�\�\00ô��~<.\�\��~��;ۼvY�\�CםPq_lR\'�֬Y�\�S`��={�\�)�:\�7P�ݹ\�\'\��ڵe��Z�1�\0�\�7.\�\��~_z\�;#�\�\�&�\n�\0��\�\��\�\��s-\�\�wsG��\�7�	�\�/\00�4k\n��%�_%�@3�ߘô�%\Z#�\�\�#�\�\�&�\n�\0�\�\�\�\�\�\��eZ�1\�\�\�V�~c��*�\0�=�|��h����\�懗�<\�!\�\�T\�\0�X�}�\\.ߡ%\Z#�F��\��\'�߸O8~���\�WR���h��\�חm{|\�\�C\�}�M@~�	(�Jϕ\�\�_h�����\�\�\�~0\�\�\�f�7\�\0����\�oL�NKLa�\�\�˺��\�~�f\��w�\�1�X��\�/\0p\Z�\�\�\�\��Zbj\�\�z{��\0@\r͟?���Ri�����;�\�\�\�z�V\�\0�|X.�_\�S~O7���*�\0㐂\�\��\�\�\�\�S~��\0\�Q�X�&\�\�i�ӗ\�<\�\�*y¯�\0L}pkMի%&ԆY^�K�\�\�¯�\04�B��\�r�_K\�$�\�\�\�z��_\�\0��\��\�T\�i���\�\�=�\�!X�~�)6w\�܏��6�%&%�\�	�\�¯�\0L�3\�\�T\rJ�~�	��\��x{K�ҍ�g\�>;\'�\n�\0\031��z5r�MްU�\�\�/\0���\�\��CC\�t	��\�7\�ۅ_\0�\�~�\�\�~�_\0��%�\n�\0\0¯�+�\0�¯�\0 �\n�\�/\0��k�3\�\0@�U\�/\0��_\0\0\�W�\0@�~\0~�_\0\0�_\�\0@�U\�/\0��_\0\0\�W	�\0\0¯~\0�_%�\0�J�\0~�_\0\0�_\�\0\0\�W�\0`�u\�\�	�\�/\0@s\�\�\�:\�\�\�#d6h\�ڵkG\n���T\0�\ZX�~�-6lسg��ـ�����H��T\0�\ZI\�\�Ǝ��\��x]5T��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@M�\�\�\�f\��`\0\0\0\0IEND�B`�',1);
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
INSERT INTO `act_hi_actinst` VALUES ('17','vacationProcess:2:13','15','16','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-12-10 15:24:42.831','2018-12-10 15:24:42.832',1,NULL,''),('18','vacationProcess:2:13','15','16','usertask1','19',NULL,'填写申请','userTask',NULL,'2018-12-10 15:24:42.833','2018-12-10 15:24:42.905',72,NULL,''),('2508','vacationProcess:2:13','31','33','endevent1',NULL,NULL,'End','endEvent',NULL,'2018-12-10 16:41:35.963','2018-12-10 16:41:35.963',0,NULL,''),('2512','vacationProcess:2:13','2509','2511','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-12-10 16:43:10.620','2018-12-10 16:43:10.620',0,NULL,''),('2513','vacationProcess:2:13','2509','2511','usertask1','2514',NULL,'填写申请','userTask','empa','2018-12-10 16:43:10.620','2018-12-10 16:43:10.688',68,NULL,''),('2522','vacationProcess:2:13','2509','2511','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2018-12-10 16:43:10.688','2018-12-10 16:43:10.688',0,NULL,''),('2523','vacationProcess:2:13','2509','2511','usertask3','2524',NULL,'经理审批','userTask','dira','2018-12-10 16:43:10.688','2018-12-10 17:01:02.465',1071777,NULL,''),('2533','vacationProcess:2:13','2509','2511','endevent1',NULL,NULL,'End','endEvent',NULL,'2018-12-10 17:01:02.465','2018-12-10 17:01:02.465',0,NULL,''),('27','vacationProcess:2:13','15','16','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2018-12-10 15:24:42.905','2018-12-10 15:24:42.913',8,NULL,''),('28','vacationProcess:2:13','15','16','usertask2','29',NULL,'总监审批','userTask','manageb','2018-12-10 15:24:42.913','2018-12-10 15:29:17.489',274576,NULL,''),('34','vacationProcess:2:13','31','33','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-12-10 15:27:55.673','2018-12-10 15:27:55.673',0,NULL,''),('35','vacationProcess:2:13','31','33','usertask1','36',NULL,'填写申请','userTask','empb','2018-12-10 15:27:55.673','2018-12-10 15:27:55.726',53,NULL,''),('44','vacationProcess:2:13','31','33','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2018-12-10 15:27:55.726','2018-12-10 15:27:55.726',0,NULL,''),('45','vacationProcess:2:13','31','33','usertask2','46',NULL,'总监审批','userTask','manageb','2018-12-10 15:27:55.727','2018-12-10 16:41:35.963',4420236,NULL,''),('5008','vacationProcess:3:5004','5005','5007','startevent1',NULL,NULL,'Start','startEvent',NULL,'2018-12-10 18:00:39.689','2018-12-10 18:00:39.689',0,NULL,''),('5009','vacationProcess:3:5004','5005','5007','usertask1','5010',NULL,'填写申请','userTask','empa','2018-12-10 18:00:39.706','2018-12-10 18:00:39.769',63,NULL,''),('5018','vacationProcess:3:5004','5005','5007','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2018-12-10 18:00:39.769','2018-12-10 18:00:39.784',15,NULL,''),('5019','vacationProcess:3:5004','5005','5007','usertask2','5020',NULL,'总监审批','userTask',NULL,'2018-12-10 18:00:39.784',NULL,NULL,NULL,''),('55','vacationProcess:2:13','15','16','endevent1',NULL,NULL,'End','endEvent',NULL,'2018-12-10 15:29:17.489','2018-12-10 15:29:17.489',0,NULL,'');
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
INSERT INTO `act_hi_detail` VALUES ('22','VariableUpdate','15','15',NULL,'18','applyUser','null',0,'2018-12-10 15:24:42.896',NULL,NULL,NULL,NULL,NULL),('24','VariableUpdate','15','15',NULL,'18','days','integer',0,'2018-12-10 15:24:42.899',NULL,NULL,1,'1',NULL),('2503','VariableUpdate','31','31',NULL,'45','result','string',0,'2018-12-10 16:41:35.947',NULL,NULL,NULL,'审核通过',NULL),('2505','VariableUpdate','31','31',NULL,'45','auditTime','date',0,'2018-12-10 16:41:35.947',NULL,NULL,1544431295911,NULL,NULL),('2507','VariableUpdate','31','31',NULL,'45','auditor','string',0,'2018-12-10 16:41:35.947',NULL,NULL,NULL,'manageb',NULL),('2517','VariableUpdate','2509','2509',NULL,'2513','applyUser','string',0,'2018-12-10 16:43:10.673',NULL,NULL,NULL,'empa',NULL),('2519','VariableUpdate','2509','2509',NULL,'2513','days','integer',0,'2018-12-10 16:43:10.688',NULL,NULL,4,'4',NULL),('2521','VariableUpdate','2509','2509',NULL,'2513','reason','string',0,'2018-12-10 16:43:10.688',NULL,NULL,NULL,'有紧急事情',NULL),('2528','VariableUpdate','2509','2509',NULL,'2523','result','string',0,'2018-12-10 17:01:02.461',NULL,NULL,NULL,'审核拒绝',NULL),('2530','VariableUpdate','2509','2509',NULL,'2523','auditTime','date',0,'2018-12-10 17:01:02.461',NULL,NULL,1544432462436,NULL,NULL),('2532','VariableUpdate','2509','2509',NULL,'2523','auditor','string',0,'2018-12-10 17:01:02.462',NULL,NULL,NULL,'dira',NULL),('26','VariableUpdate','15','15',NULL,'18','reason','string',0,'2018-12-10 15:24:42.899',NULL,NULL,NULL,'有紧急事情',NULL),('39','VariableUpdate','31','31',NULL,'35','applyUser','string',0,'2018-12-10 15:27:55.721',NULL,NULL,NULL,'empb',NULL),('41','VariableUpdate','31','31',NULL,'35','days','integer',0,'2018-12-10 15:27:55.721',NULL,NULL,1,'1',NULL),('43','VariableUpdate','31','31',NULL,'35','reason','string',0,'2018-12-10 15:27:55.721',NULL,NULL,NULL,'有紧急事情',NULL),('50','VariableUpdate','15','15',NULL,'28','result','string',0,'2018-12-10 15:29:17.484',NULL,NULL,NULL,'审核拒绝',NULL),('5013','VariableUpdate','5005','5005',NULL,'5009','applyUser','string',0,'2018-12-10 18:00:39.769',NULL,NULL,NULL,'empa',NULL),('5015','VariableUpdate','5005','5005',NULL,'5009','days','integer',0,'2018-12-10 18:00:39.769',NULL,NULL,1,'1',NULL),('5017','VariableUpdate','5005','5005',NULL,'5009','reason','string',0,'2018-12-10 18:00:39.769',NULL,NULL,NULL,'有紧急事情',NULL),('52','VariableUpdate','15','15',NULL,'28','auditTime','date',0,'2018-12-10 15:29:17.486',NULL,NULL,1544426957456,NULL,NULL),('54','VariableUpdate','15','15',NULL,'28','auditor','string',0,'2018-12-10 15:29:17.486',NULL,NULL,NULL,'manageb',NULL);
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
INSERT INTO `act_hi_taskinst` VALUES ('19','vacationProcess:2:13','usertask1','15','16','填写申请',NULL,NULL,NULL,NULL,'2018-12-10 15:24:42.845',NULL,'2018-12-10 15:24:42.903',58,NULL,50,NULL,NULL,NULL,''),('2514','vacationProcess:2:13','usertask1','2509','2511','填写申请',NULL,NULL,NULL,'empa','2018-12-10 16:43:10.641','2018-12-10 16:43:10.673','2018-12-10 16:43:10.688',47,NULL,50,NULL,NULL,NULL,''),('2524','vacationProcess:2:13','usertask3','2509','2511','经理审批',NULL,NULL,NULL,'dira','2018-12-10 16:43:10.688','2018-12-10 17:01:02.436','2018-12-10 17:01:02.464',1071776,NULL,50,NULL,NULL,NULL,''),('29','vacationProcess:2:13','usertask2','15','16','总监审批',NULL,NULL,NULL,'manageb','2018-12-10 15:24:42.914','2018-12-10 15:29:17.458','2018-12-10 15:29:17.488',274574,NULL,50,NULL,NULL,NULL,''),('36','vacationProcess:2:13','usertask1','31','33','填写申请',NULL,NULL,NULL,'empb','2018-12-10 15:27:55.673','2018-12-10 15:27:55.706','2018-12-10 15:27:55.724',51,NULL,50,NULL,NULL,NULL,''),('46','vacationProcess:2:13','usertask2','31','33','总监审批',NULL,NULL,NULL,'manageb','2018-12-10 15:27:55.727','2018-12-10 16:41:35.915','2018-12-10 16:41:35.947',4420220,NULL,50,NULL,NULL,NULL,''),('5010','vacationProcess:3:5004','usertask1','5005','5007','填写申请',NULL,NULL,NULL,'empa','2018-12-10 18:00:39.722','2018-12-10 18:00:39.738','2018-12-10 18:00:39.769',47,NULL,50,NULL,NULL,NULL,''),('5020','vacationProcess:3:5004','usertask2','5005','5007','总监审批',NULL,NULL,NULL,NULL,'2018-12-10 18:00:39.784',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'');
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
INSERT INTO `act_hi_varinst` VALUES ('21','15','15',NULL,'applyUser','null',0,NULL,NULL,NULL,NULL,NULL,'2018-12-10 15:24:42.896','2018-12-10 15:24:42.896'),('23','15','15',NULL,'days','integer',0,NULL,NULL,1,'1',NULL,'2018-12-10 15:24:42.899','2018-12-10 15:24:42.899'),('25','15','15',NULL,'reason','string',0,NULL,NULL,NULL,'有紧急事情',NULL,'2018-12-10 15:24:42.899','2018-12-10 15:24:42.899'),('2502','31','31',NULL,'result','string',0,NULL,NULL,NULL,'审核通过',NULL,'2018-12-10 16:41:35.947','2018-12-10 16:41:35.947'),('2504','31','31',NULL,'auditTime','date',0,NULL,NULL,1544431295911,NULL,NULL,'2018-12-10 16:41:35.947','2018-12-10 16:41:35.947'),('2506','31','31',NULL,'auditor','string',0,NULL,NULL,NULL,'manageb',NULL,'2018-12-10 16:41:35.947','2018-12-10 16:41:35.947'),('2516','2509','2509',NULL,'applyUser','string',0,NULL,NULL,NULL,'empa',NULL,'2018-12-10 16:43:10.673','2018-12-10 16:43:10.673'),('2518','2509','2509',NULL,'days','integer',0,NULL,NULL,4,'4',NULL,'2018-12-10 16:43:10.688','2018-12-10 16:43:10.688'),('2520','2509','2509',NULL,'reason','string',0,NULL,NULL,NULL,'有紧急事情',NULL,'2018-12-10 16:43:10.688','2018-12-10 16:43:10.688'),('2527','2509','2509',NULL,'result','string',0,NULL,NULL,NULL,'审核拒绝',NULL,'2018-12-10 17:01:02.461','2018-12-10 17:01:02.461'),('2529','2509','2509',NULL,'auditTime','date',0,NULL,NULL,1544432462436,NULL,NULL,'2018-12-10 17:01:02.461','2018-12-10 17:01:02.461'),('2531','2509','2509',NULL,'auditor','string',0,NULL,NULL,NULL,'dira',NULL,'2018-12-10 17:01:02.462','2018-12-10 17:01:02.462'),('38','31','31',NULL,'applyUser','string',0,NULL,NULL,NULL,'empb',NULL,'2018-12-10 15:27:55.721','2018-12-10 15:27:55.721'),('40','31','31',NULL,'days','integer',0,NULL,NULL,1,'1',NULL,'2018-12-10 15:27:55.721','2018-12-10 15:27:55.721'),('42','31','31',NULL,'reason','string',0,NULL,NULL,NULL,'有紧急事情',NULL,'2018-12-10 15:27:55.721','2018-12-10 15:27:55.721'),('49','15','15',NULL,'result','string',0,NULL,NULL,NULL,'审核拒绝',NULL,'2018-12-10 15:29:17.484','2018-12-10 15:29:17.484'),('5012','5005','5005',NULL,'applyUser','string',0,NULL,NULL,NULL,'empa',NULL,'2018-12-10 18:00:39.769','2018-12-10 18:00:39.769'),('5014','5005','5005',NULL,'days','integer',0,NULL,NULL,1,'1',NULL,'2018-12-10 18:00:39.769','2018-12-10 18:00:39.769'),('5016','5005','5005',NULL,'reason','string',0,NULL,NULL,NULL,'有紧急事情',NULL,'2018-12-10 18:00:39.769','2018-12-10 18:00:39.769'),('51','15','15',NULL,'auditTime','date',0,NULL,NULL,1544426957456,NULL,NULL,'2018-12-10 15:29:17.486','2018-12-10 15:29:17.486'),('53','15','15',NULL,'auditor','string',0,NULL,NULL,NULL,'manageb',NULL,'2018-12-10 15:29:17.486','2018-12-10 15:29:17.486');
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
INSERT INTO `act_id_group` VALUES ('dirGroup',1,'总监组',NULL),('empGroup',1,'员工组',NULL),('manageGroup',1,'经理组',NULL);
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
INSERT INTO `act_re_procdef` VALUES ('vacationProcess:1:4',1,'http://www.activiti.org/test','请假流程','vacationProcess',1,'1','D:\\workspace\\code\\activiti-demo6-springboot\\target\\classes\\processes\\vacation.bpmn','D:\\workspace\\code\\activiti-demo6-springboot\\target\\classes\\processes\\vacation.vacationProcess.png',NULL,0,1,1,'',NULL),('vacationProcess:2:13',1,'http://www.activiti.org/test','请假流程','vacationProcess',2,'10','processes/vacation.bpmn','processes/vacation.vacationProcess.png',NULL,0,1,1,'',NULL),('vacationProcess:3:5004',1,'http://www.activiti.org/test','请假流程','vacationProcess',3,'5001','D:\\workspace\\code\\activiti6\\target\\classes\\processes\\vacation.bpmn','D:\\workspace\\code\\activiti6\\target\\classes\\processes\\vacation.vacationProcess.png',NULL,0,1,1,'',NULL);
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
INSERT INTO `act_ru_task` VALUES ('5020',1,'5007','5005','vacationProcess:3:5004','总监审批',NULL,NULL,'usertask2',NULL,NULL,NULL,50,'2018-12-10 10:00:39.784',NULL,NULL,1,'',NULL,NULL);
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
INSERT INTO `act_ru_variable` VALUES ('5012',1,'string','applyUser','5005','5005',NULL,NULL,NULL,NULL,'empa',NULL),('5014',1,'integer','days','5005','5005',NULL,NULL,NULL,1,'1',NULL),('5016',1,'string','reason','5005','5005',NULL,NULL,NULL,NULL,'有紧急事情',NULL);
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
