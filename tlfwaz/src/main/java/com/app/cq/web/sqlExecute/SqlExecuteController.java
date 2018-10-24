package com.app.cq.web.sqlExecute;

import com.app.cq.model.SqlExecuteInfo;
import com.app.cq.service.SqlExecuteInfoService;
import com.google.common.base.Preconditions;
import com.sqds.page.PageInfo;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 执行sql语句
 * Created by zyk on 2017/4/26.
 */
@Controller
@RequestMapping("/SQLExecute/*")
public class SqlExecuteController {

    @Autowired
    private SqlExecuteInfoService sqlExecuteInfoService;

    @RequestMapping("list")
    public void list(HttpServletRequest request, Model model) {
        PageInfo<SqlExecuteInfo> pageInfo = new PageInfo<SqlExecuteInfo>();
        Servlets.initPageInfo(request, pageInfo);
        pageInfo = this.sqlExecuteInfoService.list(pageInfo);
        model.addAttribute("pageInfo", pageInfo);
    }

    @RequestMapping("sql")
    public void sql(HttpServletRequest request, Model model) {
        int id = ParamUtils.getInt(request, "id", 0);
        SqlExecuteInfo sqlExecuteInfo = this.sqlExecuteInfoService.get(id);
        if (sqlExecuteInfo == null) {
            sqlExecuteInfo = new SqlExecuteInfo();
        }
        model.addAttribute("sqlExecuteInfo", sqlExecuteInfo);
    }

    @RequestMapping("save")
    public String save(HttpServletRequest request, Model model) {
        int id = ParamUtils.getInt(request, "id", 0);
        SqlExecuteInfo sqlExecuteInfo = this.sqlExecuteInfoService.get(id);
        if (sqlExecuteInfo == null) {
            sqlExecuteInfo = new SqlExecuteInfo();
        }
        Servlets.bind(request, sqlExecuteInfo);
        this.sqlExecuteInfoService.save(sqlExecuteInfo);
        return "redirect:list";
    }

    /**
     * 执行结果
     *
     * @param request
     * @param model
     */
    @RequestMapping("result")
    public void result(HttpServletRequest request, Model model) {

        int id = ParamUtils.getInt(request, "id", 0);
        SqlExecuteInfo sqlExecuteInfo = this.sqlExecuteInfoService.get(id);
        //验证
        Preconditions.checkArgument(sqlExecuteInfo != null && sqlExecuteInfo.getId() != null, "异常操作，请返回重试！");
        model.addAttribute("sqlExecuteInfo", sqlExecuteInfo);
        List<Map> listMap = this.sqlExecuteInfoService.executeXSQL(sqlExecuteInfo);
        model.addAttribute("listMap", listMap);
    }

    /**
     * 执行结果(导出excel)
     *
     * @param request
     * @param model
     */
    @RequestMapping("resultExcel")
    public void resultExcel(HttpServletRequest request, Model model) {
        this.result(request, model);
    }
}
