package com.app.cq.web.cq.dataBackDown;

import com.app.common.service.DataDictService;
import com.app.cq.model.DBBackInfo;
import com.app.cq.service.DataBackDownService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sqds.exception.SqdsException;
import com.sqds.page.PageInfo;
import com.sqds.utils.DateUtils;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 数据库备份控制层
 * Created by zyk on 2017/4/26.
 */
@Controller
@RequestMapping("/dataBackDown/*")
public class DataBackDownController {

    @Resource
    private DataDictService dataDictService;
    @Resource
    private DataBackDownService dataBackDownService;

    @Value("#{configProperties[\'jdbc.databaseName\']}")
    private String databaseName;

    /**
     * 数据库存放路径
     *
     * @return
     */
    private String getDefaultDownAddress() {
        Map<String, String> map = dataDictService.getMapByParentAttributeNameForName("系统配置");
        return map.get("数据库下载路径");
    }

    /**
     * 数据库列表
     *
     * @param request
     * @param model
     */
    @RequestMapping("list")
    public void list(HttpServletRequest request, ModelMap model) {
        String downUrl = getDefaultDownAddress();
        List<DBBackInfo> list = Lists.newArrayList();
        File file = new File(downUrl);

        PageInfo<DBBackInfo> pageInfo = new PageInfo<DBBackInfo>();
        Servlets.initPageInfo(request, pageInfo);

        int startIndex = (pageInfo.getPageNo() - 1) * pageInfo.getPageSize();
        int endIndex = startIndex + pageInfo.getPageSize() - 1;

        String startDate = ParamUtils.getString(request, "startDate", "");
        String endDate = ParamUtils.getString(request, "endDate", "");
        Calendar startCalendar = null;
        if (Strings.isNotEmpty(startDate)) {
            startCalendar = Calendar.getInstance();
            startCalendar.setTime(DateUtils.string2date(startDate));
        }

        Calendar endCalendar = null;
        if (Strings.isNotEmpty(endDate)) {
            endCalendar = Calendar.getInstance();
            endCalendar.setTime(DateUtils.string2date(endDate));
        }

        if (file.exists()) {
            File[] fileArray = file.listFiles();
            for (File item : fileArray) {
                Date date = new Timestamp(item.lastModified());
                Calendar ca = Calendar.getInstance();
                ca.setTime(DateUtils.string2date(DateUtils.date2string(date)));
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                boolean bl = true;
                if (startCalendar != null || endCalendar != null) {
                    if ((startCalendar != null && ca.compareTo(startCalendar) >= 0) ||
                            (endCalendar != null && ca.compareTo(endCalendar) <= 0)) {
                        bl = true;
                    } else {
                        bl = false;
                    }
                }
                if (bl) {
                    DBBackInfo dbBackInfo = new DBBackInfo();
                    dbBackInfo.setFileName(item.getName());
                    dbBackInfo.setFilePath(item.getAbsolutePath());
                    dbBackInfo.setFileSize(item.length());
                    dbBackInfo.setFileDate(date);
                    list.add(dbBackInfo);
                }
            }
            Collections.reverse(list);
            pageInfo.setTotalCount(list.size());
            int index = -1;
            List<DBBackInfo> newList = Lists.newArrayList();
            for (DBBackInfo dbBackInfo : list) {
                index++;
                if (index >= startIndex && index <= endIndex) {
                    newList.add(dbBackInfo);
                }
            }
            pageInfo.setResult(newList);
        } else {
            pageInfo.setTotalCount(0);
        }

        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("pageInfo", pageInfo);
    }

    /**
     * 数据库备份
     *
     * @param request
     * @return
     */
    @RequestMapping("backDataBase")
    @ResponseBody
    public Map backDataBase(HttpServletRequest request) {
        this.dataBackDownService.backup(getDefaultDownAddress(), databaseName);
        Map<String, String> resultMap = Maps.newHashMap();
        resultMap.put("success", "0000");
        return resultMap;
    }

    /**
     * 下载数据库
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("downloadFile")
    public void downloadFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String url = ParamUtils.getString(request, "url", "");
        String name = ParamUtils.getString(request, "name", "");
        name = URLDecoder.decode(name, "utf-8");
        //设置为下载application/x-download
        response.setContentType("application/x-download");
        try {
            //下载文件时显示的文件保存名称
            String filedisplay = URLEncoder.encode(name, "utf-8");
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filedisplay));
            String file = url;
            InputStream is = new FileInputStream(new File(file));
            OutputStream os = response.getOutputStream();
            try {
                FileCopyUtils.copy(is, os);
            } catch (Exception e) {

            } finally {
                //关闭输入流
                is.close();
                //重写输出流
                os.flush();
                //关闭输出流
                os.close();
            }
        } catch (Exception e) {
            throw new SqdsException("找不到需要下载的文件");
        }
    }
}
