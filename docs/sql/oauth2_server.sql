/*
 Navicat Premium Data Transfer

 Source Server         : root.youlai.tech
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : www.youlai.tech:3306
 Source Schema         : oauth2_server

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 12/10/2022 00:05:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth2_authorization
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_authorization`;
CREATE TABLE oauth2_authorization (
                                      id varchar(100) NOT NULL,
                                      registered_client_id varchar(100) NOT NULL,
                                      principal_name varchar(200) NOT NULL,
                                      authorization_grant_type varchar(100) NOT NULL,
                                      authorized_scopes varchar(1000) DEFAULT NULL,
                                      attributes blob DEFAULT NULL,
                                      state varchar(500) DEFAULT NULL,
                                      authorization_code_value blob DEFAULT NULL,
                                      authorization_code_issued_at timestamp DEFAULT NULL,
                                      authorization_code_expires_at timestamp DEFAULT NULL,
                                      authorization_code_metadata blob DEFAULT NULL,
                                      access_token_value blob DEFAULT NULL,
                                      access_token_issued_at timestamp DEFAULT NULL,
                                      access_token_expires_at timestamp DEFAULT NULL,
                                      access_token_metadata blob DEFAULT NULL,
                                      access_token_type varchar(100) DEFAULT NULL,
                                      access_token_scopes varchar(1000) DEFAULT NULL,
                                      oidc_id_token_value blob DEFAULT NULL,
                                      oidc_id_token_issued_at timestamp DEFAULT NULL,
                                      oidc_id_token_expires_at timestamp DEFAULT NULL,
                                      oidc_id_token_metadata blob DEFAULT NULL,
                                      refresh_token_value blob DEFAULT NULL,
                                      refresh_token_issued_at timestamp DEFAULT NULL,
                                      refresh_token_expires_at timestamp DEFAULT NULL,
                                      refresh_token_metadata blob DEFAULT NULL,
                                      user_code_value blob DEFAULT NULL,
                                      user_code_issued_at timestamp DEFAULT NULL,
                                      user_code_expires_at timestamp DEFAULT NULL,
                                      user_code_metadata blob DEFAULT NULL,
                                      device_code_value blob DEFAULT NULL,
                                      device_code_issued_at timestamp DEFAULT NULL,
                                      device_code_expires_at timestamp DEFAULT NULL,
                                      device_code_metadata blob DEFAULT NULL,
                                      PRIMARY KEY (id)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '令牌发放记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oauth2_authorization
-- ----------------------------

-- ----------------------------
-- Table structure for oauth2_authorization_consent
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_authorization_consent`;
CREATE TABLE oauth2_authorization_consent (
              registered_client_id varchar(100) NOT NULL,
              principal_name varchar(200) NOT NULL,
              authorities varchar(1000) NOT NULL,
              PRIMARY KEY (registered_client_id, principal_name)
);

-- ----------------------------
-- Records of oauth2_authorization_consent
-- ----------------------------

-- ----------------------------
-- Table structure for oauth2_registered_client
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_registered_client`;
CREATE TABLE oauth2_registered_client (
          id varchar(100) NOT NULL,
          client_id varchar(100) NOT NULL,
          client_id_issued_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
          client_secret varchar(200) DEFAULT NULL,
          client_secret_expires_at timestamp DEFAULT NULL,
          client_name varchar(200) NOT NULL,
          client_authentication_methods varchar(1000) NOT NULL,
          authorization_grant_types varchar(1000) NOT NULL,
          redirect_uris varchar(1000) DEFAULT NULL,
          post_logout_redirect_uris varchar(1000) DEFAULT NULL,
          scopes varchar(1000) NOT NULL,
          client_settings varchar(2000) NOT NULL,
          token_settings varchar(2000) NOT NULL,
          PRIMARY KEY (id)
);

-- ----------------------------
-- Records of oauth2_registered_client
-- ----------------------------
INSERT INTO `oauth2_registered_client` VALUES ('e6b05ef8-3d41-4482-ae5f-c613016e477e', 'vue3-element-admin', '2022-09-06 19:57:49', '{noop}secret', NULL, 'e6b05ef8-3d41-4482-ae5f-c613016e477e', 'client_secret_post,client_secret_basic', 'refresh_token,client_credentials,authorization_code,captcha,password', 'http://127.0.0.1:9999/login/oauth2/code/gateway-client-authorization-code,http://127.0.0.1:9999/authorized', 'openid,profile,message.read,message.write', '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.client.require-proof-key\":false,\"settings.client.require-authorization-consent\":true}', '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.token.reuse-refresh-tokens\":true,\"settings.token.id-token-signature-algorithm\":[\"org.springframework.security.oauth2.jose.jws.SignatureAlgorithm\",\"RS256\"],\"settings.token.access-token-time-to-live\":[\"java.time.Duration\",300.000000000],\"settings.token.access-token-format\":{\"@class\":\"org.springframework.security.oauth2.core.OAuth2TokenFormat\",\"value\":\"self-contained\"},\"settings.token.refresh-token-time-to-live\":[\"java.time.Duration\",3600.000000000]}');

SET FOREIGN_KEY_CHECKS = 1;
