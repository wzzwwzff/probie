package com.app.cq.web.cq;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 导出Excel通用方法
 * Created by zyk on 2017/4/24.
 */
@Controller
@RequestMapping("/cq/common/export/*")
public class ExportController {

    /**
     * 导出excel
     *
     * @param fileName  文件名称
     * @param title     标题
     * @param theads 列表头名称
     * @param dataList  显示内容
     */
    @RequestMapping("excel")
    public void excel(@ModelAttribute("fileName") String fileName, @ModelAttribute("title") String title, @ModelAttribute("theads") String[] theads, @ModelAttribute("dataList") List dataList, ModelMap model) {
        model.addAttribute("fileName", fileName);
        model.addAttribute("title", title);
        model.addAttribute("theads", theads);
        model.addAttribute("dataList", dataList);
    }
}
