package com.app.cq.web.cq;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by ZYK on 2018/2/4.
 */
@Controller
@RequestMapping("/cq/excel/*")
public class ExcelController {

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
