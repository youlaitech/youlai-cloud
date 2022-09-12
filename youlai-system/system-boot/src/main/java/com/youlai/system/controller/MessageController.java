package com.youlai.system.controller;

import com.youlai.common.result.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 部门控制器
 *
 * @author haoxr
 * @date 2020/11/6
 */
@Api(tags = "部门接口")
@RestController
@RequestMapping("/")
@RequiredArgsConstructor
public class MessageController {


    @ApiOperation(value = "获取部门列表")
    @GetMapping("/messages")
    public Result messages() {
        return Result.success("messages");
    }

}
