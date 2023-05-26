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

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 用户角色编码集合
     */
    private Set<String> roles;

    /**
     * 数据权限范围
     */
    private Integer dataScope;


}
