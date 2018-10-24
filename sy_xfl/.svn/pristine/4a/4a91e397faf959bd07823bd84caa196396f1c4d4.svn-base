package com.app.cq.web.cq;

import com.app.common.service.DataDictService;
import com.app.cq.model.DeskCatalog;
import com.app.cq.model.DeskFile;
import com.app.cq.model.Family;
import com.app.cq.service.DeskCatalogService;
import com.app.cq.service.DeskFileService;
import com.app.cq.utils.GetCurrentUser;
import com.app.cq.utils.UploadInfoUtil;
import com.app.permission.model.User;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.sqds.page.PageInfo;
import com.sqds.spring.UploadInfo;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 桌面文件管理控制层
 * Created by ZYK on 2018/2/28.
 */
@Controller
@RequestMapping("/cq/desk/*")
public class DeskController {

    @Autowired
    private DeskCatalogService deskCatalogService;
    @Autowired
    private DeskFileService deskFileService;
    @Autowired
    private DataDictService dataDictService;

    /**
     * 桌面文件目录列表
     * zyk
     * @param request
     * @param modelMap
     */
    @RequestMapping("deskCatalogList")
    public void deskCatalogList(HttpServletRequest request, ModelMap modelMap){
        PageInfo<DeskCatalog> pageInfo = new PageInfo<>();
        Servlets.initPageInfo(request,pageInfo);
        pageInfo = this.deskCatalogService.getDeskCatalogList(pageInfo);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     * 桌面文件目录创建
     * zyk
     * @param request
     * @param modelMap
     */
    @RequestMapping("deskCatalogForm")
    public void deskCatalogForm(HttpServletRequest request, ModelMap modelMap){
        Integer cataId = ParamUtils.getInt(request,"cataId",0);
        DeskCatalog deskCatalog = this.deskCatalogService.get(cataId);
        if (deskCatalog == null){
            deskCatalog = new DeskCatalog();
        }
        modelMap.addAttribute("deskCatalog",deskCatalog);
    }

    /**
     * 桌面文件目录创建
     * zyk
     * @param request
     */
    @RequestMapping("saveDeskCataLog")
    public synchronized String saveDeskCataLog(HttpServletRequest request){
        Integer cataId = ParamUtils.getInt(request,"cataId",0);
        DeskCatalog deskCatalog = this.deskCatalogService.get(cataId);
        if (deskCatalog == null){
            deskCatalog = new DeskCatalog();
        }
        Servlets.bind(request,deskCatalog);
        this.deskCatalogService.save(deskCatalog);
        return "redirect:deskCatalogList?" +"&"+request.getAttribute("searchParams");
    }

    /**
     * 删除桌面文件目录
     * @param request
     * @return
     */
    @RequestMapping("deleteDeskCataLog")
    @ResponseBody
    public synchronized Map deleteDeskCataLog(HttpServletRequest request){
        Integer cataId = ParamUtils.getInt(request,"cataId",0);
        DeskCatalog deskCatalog = this.deskCatalogService.get(cataId);
        Map map = Maps.newHashMap();
        try{
            this.deskCatalogService.delete(deskCatalog.getId());
            map.put("success","true");
            map.put("message","删除成功！");
        }catch (Exception e){
            map.put("success","false");
            map.put("message","删除失败！");
        }
        return map;
    }

    /**
     * 添加文件界面
     * @param request
     * @param modelMap
     */
    @RequestMapping("deskFileForm")
    public void deskFileForm(HttpServletRequest request,ModelMap modelMap){
        Integer cataId = ParamUtils.getInt(request,"cataId",0);
        DeskCatalog deskCatalog = this.deskCatalogService.get(cataId);
        List<DeskFile> deskFileList = this.deskFileService.getDeskFileByCataId(deskCatalog.getId());
        Map<String,String> fileMap = this.dataDictService.getMapByParentAttributeNameForValue("文件上传配置");
        modelMap.addAttribute("fileMap", fileMap);
        modelMap.addAttribute("deskCatalog",deskCatalog);
        modelMap.addAttribute("deskFileList",deskFileList);
    }

    /**
     * 上传档案文件
     *
     * @param request
     * @return
     */
    @RequestMapping("uploadify")
    @ResponseBody
    public Map uploadify(HttpServletRequest request) {
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmssSSS"); // 定义文件名

        //缩略图宽高
        int width = ParamUtils.getInt(request, "width", 0);
        int height = ParamUtils.getInt(request, "height", 0);
        String deskCatalogName = ParamUtils.getString(request, "deskCatalogName", "无目录文件");

        String path = "/deskFile/" + deskCatalogName;// 路径
        String parameterName = sdf1.format(new Date());// 文件名称
        DecimalFormat decimalFormat = new DecimalFormat("0000");
        parameterName += decimalFormat.format((Math.random() * 10000));

        UploadInfo uploadInfo = UploadInfoUtil.uploadFile(request, path, "Filedata", parameterName, width, height);
        Map<String, String> jsonMap = new HashMap<String, String>();
        jsonMap.put("filePath", uploadInfo.getSaveFilename());
        jsonMap.put("fileName", uploadInfo.getOriginalFilename());
        jsonMap.put("size", uploadInfo.getFileSize() + "");
        return jsonMap;
    }

    /**
     * 保存上传的档案
     * 2018/01/30
     * zyk
     *
     * @param request
     */
    @RequestMapping("saveDeskFile")
    @ResponseBody
    public Map saveDeskFile(HttpServletRequest request) {
        Integer cataId = ParamUtils.getInt(request, "cataId", 0);//家庭id
        String filePath = ParamUtils.getString(request, "filePath", "");// 上传文件路径
        String fileName = ParamUtils.getString(request, "fileName", "");// 上传文件名称
        String suffixes = fileName.substring(fileName.lastIndexOf(".") + 1);

        fileName = fileName.substring(0, fileName.lastIndexOf("."));

        Long size = ParamUtils.getLong(request, "size", 0);
        Map<String, String> map = Maps.newHashMap();
        try {
            DeskFile deskFile = new DeskFile();
            DeskCatalog deskCatalog = this.deskCatalogService.get(cataId);
            deskFile.setDeskCatalog(deskCatalog);
            Date date = new Date();
            //正式
            deskFile.setFileName(fileName);
            deskFile.setFilePath(filePath);
            deskFile.setSuffixes(suffixes);
            deskFile.setFileSize(size);
            deskFile.setUploadDate(date);
            deskFile.setNumber(99);
            User user = GetCurrentUser.getLoginUser(request);
            deskFile.setUploadPerson(user.getRealName());
            this.deskFileService.save(deskFile);
            map.put("result", "1");
        } catch (Exception e) {//保存信息失败，并删除已经上传的文件
            map.put("result", "2");
        }
        return map;
    }

    /**
     * 保存桌面文件的排序号
     * @param request
     * @return
     */
    @RequestMapping("saveNumber")
    @ResponseBody
    public synchronized Map saveNumber(HttpServletRequest request){
        Integer deskFileId = ParamUtils.getInt(request,"deskFileId",0);
        Integer number = ParamUtils.getInt(request,"number",99);
        DeskFile deskFile = this.deskFileService.get(deskFileId);
        Map map = Maps.newHashMap();
        try{
            deskFile.setNumber(number);
            this.deskFileService.save(deskFile);
            map.put("success","true");
            map.put("message","修改成功！");
        }catch (Exception e){
            map.put("success","false");
            map.put("message","修改失败！");
        }
        return map;
    }

    /**
     * 删除桌面文件
     * @param request
     * @return
     */
    @RequestMapping("deleteDeskFile")
    @ResponseBody
    public synchronized Map deleteDeskFile(HttpServletRequest request){
        Integer deskFileId = ParamUtils.getInt(request,"deskFileId",0);
        DeskFile deskFile = this.deskFileService.get(deskFileId);
        Map map = Maps.newHashMap();
        try{
            this.deskFileService.delete(deskFile.getId());
            map.put("success","true");
            map.put("message","删除成功！");
        }catch (Exception e){
            map.put("success","false");
            map.put("message","删除失败！");
        }
        return map;
    }

    /**
     * 系统桌面
     * @param modelMap
     */
    @RequestMapping("dashboard")
    public void dashboard(ModelMap modelMap) {
        PageInfo<DeskCatalog> pageInfo = new PageInfo<DeskCatalog>();
        Map<Integer, List<DeskFile>> resultMap = Maps.newHashMap();
        pageInfo = this.deskCatalogService.getAbleDeskCatalogList(pageInfo);
        if (pageInfo != null) {
            for (DeskCatalog deskCatalog : pageInfo.getResult()) {
                List<DeskFile> list = this.deskFileService.listByFileDeskFileId(deskCatalog.getId());
                resultMap.put(deskCatalog.getId(), list);
            }
        }
        modelMap.addAttribute("pageInfo", pageInfo);
        modelMap.addAttribute("resultMap", resultMap);
    }
}
