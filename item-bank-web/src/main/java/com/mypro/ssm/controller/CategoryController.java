package com.mypro.ssm.controller;

import com.mypro.ssm.BusinessException;
import com.mypro.ssm.common.Result;
import com.mypro.ssm.po.Category;
import com.mypro.ssm.service.CategoryService;
import com.mypro.ssm.vo.TreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import sun.reflect.generics.tree.Tree;

import java.util.List;

@Controller
@RequestMapping("category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("show_list")
    public String editList() {
        return "category-list";
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    public Result add(Category category) {
        categoryService.insertSelective(category);
        return Result.success();
    }

    @RequestMapping(value = "{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Result update(@PathVariable Long id, @RequestBody Category category) {
        category.setId(id);
        categoryService.update(category);
        return Result.success();
    }

    @RequestMapping(value = "{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Result del(@PathVariable Long id) {
        categoryService.deleteById(id);
        return Result.success();
    }

    @RequestMapping(value = "{id}", method = RequestMethod.GET)
    @ResponseBody
    public Result getJson(@PathVariable Long id, Model model) {
        categoryService.findById(id);
        return Result.success();
    }

    @RequestMapping("tree")
    @ResponseBody
    public Result<List<TreeNode>> listTree() {
        List<TreeNode> categoryies = categoryService.tree();
        for (TreeNode t : categoryies) {
            t.setIcon("icon-th");
        }
        return Result.success(categoryies);
    }

    @RequestMapping("{id}/children")
    @ResponseBody
    public Result children(@PathVariable Long id) {
        List<Category> children = categoryService.findChildren(id);
        return Result.success(children);
    }
}
