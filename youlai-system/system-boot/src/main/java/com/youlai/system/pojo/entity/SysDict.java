package com.youlai.system.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.youlai.common.base.BaseEntity;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class SysDict extends BaseEntity {

    @TableId(type= IdType.AUTO)
    private Long id;

    private String code;

    private Long parentId;

    private String label;

    private String value;

    private Integer sort;

    private Integer status;

    private Integer defaulted;

    private String description;

}
