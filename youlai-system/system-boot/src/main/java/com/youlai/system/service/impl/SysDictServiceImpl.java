package com.youlai.system.service.impl;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.youlai.system.converter.DictConverter;
import com.youlai.system.mapper.SysDictMapper;
import com.youlai.system.pojo.entity.SysDict;
import com.youlai.system.pojo.form.DictItemForm;
import com.youlai.system.pojo.query.DictItemPageQuery;
import com.youlai.system.pojo.vo.dict.DictItemPageVO;
import com.youlai.system.service.SysDictService;
import com.youlai.common.web.domain.Option;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;


/**
 * 字典数据项业务实现类
 *
 * @author haoxr
 * @date 2022/6/9
 */
@Service
@RequiredArgsConstructor
public class SysDictServiceImpl extends ServiceImpl<SysDictMapper, SysDict> implements SysDictService {

    private final DictConverter dictConverter;

    /**
     * 字典数据项分页列表
     *
     * @param queryParams
     * @return
     */
    @Override
    public Page<DictItemPageVO> listDictItemPages(DictItemPageQuery queryParams) {
        // 查询参数
        int pageNum = queryParams.getPageNum();
        int pageSize = queryParams.getPageSize();
        String keywords = queryParams.getKeywords();
        String typeCode = queryParams.getTypeCode();

        // 查询数据
        Page<SysDict> dictItemPage = this.page(
                new Page<>(pageNum, pageSize),
                new LambdaQueryWrapper<SysDict>()
                        .like(StrUtil.isNotBlank(keywords), SysDict::getLabel, keywords)
                        .eq(StrUtil.isNotBlank(typeCode), SysDict::getCode, typeCode)
                        .select(SysDict::getId, SysDict::getLabel, SysDict::getValue, SysDict::getStatus)
        );

        // 实体转换
        Page<DictItemPageVO> pageResult = dictConverter.entity2Page(dictItemPage);
        return pageResult;
    }

    /**
     * 字典数据项表单详情
     *
     * @param id 字典数据项ID
     * @return
     */
    @Override
    public DictItemForm getDictItemFormData(Long id) {
        // 获取entity
        SysDict entity = this.getOne(new LambdaQueryWrapper<SysDict>()
                .eq(SysDict::getId, id)
                .select(
                        SysDict::getId,
                        SysDict::getCode,
                        SysDict::getLabel,
                        SysDict::getValue,
                        SysDict::getStatus,
                        SysDict::getSort,
                        SysDict::getDescription
                ));
        Assert.isTrue(entity != null, "字典数据项不存在");

        // 实体转换
        DictItemForm dictItemForm = dictConverter.entity2Form(entity);
        return dictItemForm;
    }

    /**
     * 新增字典数据项
     *
     * @param dictItemForm 字典数据项表单
     * @return
     */
    @Override
    public boolean saveDictItem(DictItemForm dictItemForm) {
        // 实体对象转换 form->entity
        SysDict entity = dictConverter.form2Entity(dictItemForm);
        // 持久化
        boolean result = this.save(entity);
        return result;
    }

    /**
     * 修改字典数据项
     *
     * @param id           字典数据项ID
     * @param dictItemForm 字典数据项表单
     * @return
     */
    @Override
    public boolean updateDictItem(Long id, DictItemForm dictItemForm) {
        SysDict entity = dictConverter.form2Entity(dictItemForm);
        boolean result = this.updateById(entity);
        return result;
    }

    /**
     * 删除字典数据项
     *
     * @param idsStr 字典数据项ID，多个以英文逗号(,)分割
     * @return
     */
    @Override
    public boolean deleteDictItems(String idsStr) {
        Assert.isTrue(StrUtil.isNotBlank(idsStr), "删除数据为空");
        //
        List<Long> ids = Arrays.asList(idsStr.split(","))
                .stream()
                .map(id -> Long.parseLong(id))
                .collect(Collectors.toList());

        // 删除字典数据项
        boolean result = this.removeByIds(ids);
        return result;
    }


    /**
     * 根据字典类型编码获取字典数据项
     *
     * @param typeCode 字典类型编码
     * @return
     */
    @Override
    public List<Option> listDictItemsByTypeCode(String typeCode) {

        // 数据字典项
        List<SysDict> dictItems = this.list(new LambdaQueryWrapper<SysDict>()
                .eq(SysDict::getCode, typeCode)
                .select(SysDict::getValue, SysDict::getLabel)
        );

        // 转换下拉数据
        List<Option> options = Optional.ofNullable(dictItems).orElse(new ArrayList<>())
                .stream()
                .map(dictItem -> new Option(dictItem.getValue(), dictItem.getLabel()))
                .collect(Collectors.toList());

        return options;
    }
}
