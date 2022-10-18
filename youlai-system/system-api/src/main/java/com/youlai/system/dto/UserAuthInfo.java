package com.youlai.system.dto;

import lombok.Data;

import java.util.Set;

@Data
public class UserAuthInfo {

    /**
     * 扩展字段：用户ID
     */
    private Long userId;


    /**
     * 扩展字段：部门ID
     */
    private Long deptId;


    private String username;

    private String password;

    private Integer status;


    private Set<String> roles;


}
