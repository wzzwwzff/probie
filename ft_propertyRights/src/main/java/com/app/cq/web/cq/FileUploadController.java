package com.app.cq.web.cq;


import com.app.common.model.DataDict;
import com.app.common.service.DataDictService;
import com.app.cq.exception.Precondition;
import com.app.cq.model.*;
import com.app.cq.service.*;
import com.app.cq.utils.GetCurrentUser;
import com.app.cq.utils.UploadPathUtil;
import com.app.cq.vo.Response;
import com.app.permission.model.User;
import com.app.permission.utils.UserSession;
import com.google.common.collect.Maps;
import com.sqds.exception.SqdsException;
import com.sqds.page.PageInfo;
import com.sqds.web.ParamUtils;
import com.sqds.utils.StringUtils;
import com.sqds.web.Servlets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * Created by jmdf on 2018/8/9.
 */
@Controller
@RequestMapping("/cq/file/*")
public class FileUploadController {

    @Autowired
    private FamilyController familyController;
    @Autowired
    private FamilyService familyService;
    @Autowired
    private DataDictService dataDictService;
    @Autowired
    private FileUploadService fileUploadService;
    @Autowired
    private ProjectController projectController;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private ProjectPaperService projectPaperService;
    @Autowired
    private ContractController contractController;
    @Autowired
    private ContractService contractService;
    /**
     * 电子影像资料上传
     * @param httpServletRequest
     * @param modelMap
     */
    @RequestMapping("fileList")
    public void fileList(HttpServletRequest httpServletRequest, ModelMap modelMap){
        this.familyController.searchList(httpServletRequest,modelMap);
    }

    /**
     * 电子影像资料上报列表
     * @param httpServletRequest
     * @param modelMap
     */
    @RequestMapping("fileCheckList")
    public void fileCheckList(HttpServletRequest httpServletRequest,ModelMap modelMap){
        this.familyController.searchList(httpServletRequest,modelMap);
    }

    /**
     * 影像资料上传
     * @param httpServletRequest
     * @param modelMap
     */
    @RequestMapping("fileUpload")
    public void fileUpload(HttpServletRequest httpServletRequest,ModelMap modelMap){
        commonFunctionFile(httpServletRequest,modelMap);
    }

    /**
     * 影像资料上报
     * @param httpServletRequest
     * @param modelMap
     */
    @RequestMapping("fileCheckUpload")
    public void fileCheckUpload(HttpServletRequest httpServletRequest,ModelMap modelMap){
        commonFunctionFile(httpServletRequest,modelMap);
    }

    public void commonFunctionFile(HttpServletRequest request, ModelMap modelMap) {
        String uuid = ParamUtils.getString(request, "uuid", "");
        Precondition.checkSqdsArguement(StringUtils.isNotEmpty(uuid), "该数据不存在，请刷新重试！");
        Family family = familyService.get(Integer.parseInt(uuid));
        Precondition.checkSqdsArguement(family != null, "该数据不存在，请刷新重试！");
        modelMap.addAttribute("family", family);
        Map<String, List<String>> resultMap = Maps.newHashMap();
        List<DataDict> dataDictListCQ = dataDictService.getDataDictList("影像资料");
        List<String> cqList = new ArrayList<String>();
//        Map<String, String> companyMap = dataDictService.getMapByParentAttributeNameForName("公司类型");
        Map<String, List<String>> shMap = Maps.newHashMap();
        //得到所有文件类型的字符串

        shMap = this.fileUploadService.getShNumberAll(uuid);
        String fileType = null;
        List<String> shNumber = null;
        //必须实例化
        for (DataDict dataDict : dataDictListCQ) {
            fileType = dataDict.getAttributeValue();
            cqList.add(fileType);
        }

        resultMap.put("01", cqList);

        modelMap.addAttribute("resultMap", resultMap);

        String companyType = ParamUtils.getString(request, "companyType", "");
        modelMap.addAttribute("companyType", companyType);

        String typeCheck = ParamUtils.getString(request, "typeCheck", "");
        modelMap.addAttribute("typeCheck", typeCheck);

        //显示总数/已审核的map
        modelMap.addAttribute("shMap", shMap);
    }

    /**
     * 得到上传列表
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("right")
    public void right(HttpServletRequest request, ModelMap modelMap) {
        String uuid = ParamUtils.getString(request, "uuid", "");
        String fileType = ParamUtils.getString(request, "fileType", "");
        Family family = this.familyService.get(Integer.parseInt(uuid));
        Precondition.checkAjaxArguement(StringUtils.isNotEmpty(uuid) && StringUtils.isNotEmpty(fileType), "0001", "该数据不存在！");
        List<FileInfo> fileInfoList = fileUploadService.getFileInfoListForInCheck(uuid, fileType);
        modelMap.addAttribute("family", family);
        modelMap.addAttribute("fileType", fileType);
        modelMap.addAttribute("fileInfoList", fileInfoList);
        String typeCheck = ParamUtils.getString(request, "typeCheck", "");
        modelMap.addAttribute("typeCheck", typeCheck);
        modelMap.addAttribute("department", GetCurrentUser.getLoginUser(request).getDepartment().getDepartmentCode());
        modelMap.addAttribute("user", GetCurrentUser.getLoginUser(request));

        //删除文件列表
        List<FileInfo> fileInfoListBack = fileUploadService.getFileInfoListBack(uuid, fileType);
        modelMap.addAttribute("fileInfoListBack", fileInfoListBack);
    }

    /**
     * 得到影像资料上报上传列表
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("checkRight")
    public void checkRight(HttpServletRequest request, ModelMap modelMap) {
        String uuid = ParamUtils.getString(request, "uuid", "");
        String fileType = ParamUtils.getString(request, "fileType", "");
        Family family = this.familyService.get(Integer.parseInt(uuid));
        Precondition.checkAjaxArguement(StringUtils.isNotEmpty(uuid) && StringUtils.isNotEmpty(fileType), "0001", "该数据不存在！");
        List<FileInfo> fileInfoList = fileUploadService.getFileInfoListForInCheck(uuid, fileType);
        modelMap.addAttribute("family", family);
        modelMap.addAttribute("fileType", fileType);
        modelMap.addAttribute("fileInfoList", fileInfoList);
        String typeCheck = ParamUtils.getString(request, "typeCheck", "");
        modelMap.addAttribute("typeCheck", typeCheck);
        modelMap.addAttribute("department", GetCurrentUser.getLoginUser(request).getDepartment().getDepartmentCode());
        modelMap.addAttribute("user", GetCurrentUser.getLoginUser(request));

        //删除文件列表
        List<FileInfo> fileInfoListBack = fileUploadService.getFileInfoListBack(uuid, fileType);
        modelMap.addAttribute("fileInfoListBack", fileInfoListBack);
    }

    /**
     * 得到上报数量的map
     *
     * @param request
     */
    @RequestMapping("shMap")
    @ResponseBody
    public Map shMap(HttpServletRequest request) {
        String uuid = ParamUtils.getString(request, "uuid", "");
        String fileType = ParamUtils.getString(request, "fileType", "");
        Precondition.checkAjaxArguement(StringUtils.isNotEmpty(uuid) && StringUtils.isNotEmpty(fileType), "0001", "该数据不存在！");
        //shMap
        List<String> shList = this.fileUploadService.getShNumber(uuid, fileType);
        Map<String, List<String>> resultMap = Maps.newHashMap();
        resultMap.put("result", shList);
        return resultMap;
    }

    /**
     * 保存上传的附件
     *
     * @param request
     */
    @RequestMapping("saveFileItem")
    @ResponseBody
    public Map saveFileItem(HttpServletRequest request) {
        String result = "";
        User currentUser = UserSession.getUserFromSession(request);
        String person = currentUser.getUsername();
        String familyUuid = ParamUtils.getString(request, "familyUuid", "");//家庭id
        String fileType = ParamUtils.getString(request, "fileType", "");//文件类别
//        String fileType = "0101";
        String filePath = ParamUtils.getString(request, "filePath", "");// 上传文件路径
        String fileName = ParamUtils.getString(request, "fileName", "");// 上传文件名称
        String suffixes = fileName.substring(fileName.lastIndexOf(".") + 1);

        fileName = fileName.substring(0, fileName.lastIndexOf("."));

        BigDecimal size = ParamUtils.getDecimal(request, "size", 0);
        try {

            FileInfo fileInfo1 = new FileInfo();

            Family family = familyService.get(Integer.parseInt(familyUuid));
            fileInfo1.setFamily(family);

            //正式
            fileInfo1.setFileName(fileName);
            fileInfo1.setFilePath(filePath);
            fileInfo1.setSuffixes(suffixes);
            fileInfo1.setFileSize(size);
            Date date = new Date();
            fileInfo1.setUploadDate(date);
            SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
            String numStr = format.format(date);
            fileInfo1.setSortBy(Long.valueOf(numStr));
            fileInfo1.setUploadPerson(person);
            fileInfo1.setUserId(String.valueOf(currentUser.getId()));
            fileInfo1.setFileType(fileType);
            fileInfo1.setDelStatus(1);

            this.fileUploadService.save(fileInfo1);
            result = "1";

        } catch (Exception e) {//保存信息失败，并删除已经上传的文件
            result = "2";
        }
        Map<String, String> map = new HashMap<String, String>();
        map.put("result", "1");
        return map;
    }

    /**
     * 删除单个文件
     *
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("deleteFileInfo")
    @ResponseBody
    public Response deleteFileInfo(HttpServletRequest request, ModelMap modelMap) {
        String fileInfoUuid = ParamUtils.getString(request, "uuid", "");
        FileInfo fileInfo = fileUploadService.get(Integer.parseInt(fileInfoUuid));
        Precondition.checkAjaxArguement(StringUtils.isNotEmpty(fileInfoUuid) && fileInfo != null, "0001", "删除失败，请重试！");
        this.fileUploadService.deleteFileOne(fileInfoUuid);
        return new Response();
    }

    /**
     * 批量下载
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("batchDownFile")
    @ResponseBody
    public void batchDownFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String ids = ParamUtils.getString(request, "ids", "");//入户表id
        List<FileInfo> list = this.fileUploadService.listByIds(ids);
        if (list == null || list.size() == 0) {
            throw new SqdsException("找不到下载的文件");
        }
        byte[] buffer = new byte[1024];
        // 准备下载的文件
        File[] file1 = new File[list.size()];
        String[] nameArray = new String[list.size()];
        int index = 0;
        for (FileInfo f : list) {
            String path = UploadPathUtil.getUploadPathRoot() + f.getFilePath();
            File fl = new File(path);
            if (fl.isFile() && fl.exists()) {
                file1[index] = new File(path);
//                nameArray[index] = f.getFileName();
                nameArray[index] = f.getFilePath().substring(f.getFilePath().lastIndexOf("/") + 1);
            }
            index++;
        }
        // 生成的ZIP文件名
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        String strName = format.format(new Date()) + ".zip";
        String strZipName = UploadPathUtil.getUploadPathRoot() + "/" + strName;
        try {
            File file = new File(strZipName);

            if (file.isFile() && file.exists()) {
                file.delete();
            }
        } catch (Exception e) {
        }
        ZipOutputStream out = new ZipOutputStream(new FileOutputStream(strZipName));
//        out.setEncoding("gbk");
        for (int i = 0; i < file1.length; i++) {
            if (file1[i] == null) {
                continue;
            }
            FileInputStream fis = new FileInputStream(file1[i]);
            out.putNextEntry(new ZipEntry(nameArray[i]));
            int len;

            // 读入需要下载的文件的内容，打包到zip文件

            while ((len = fis.read(buffer)) > 0) {
                out.write(buffer, 0, len);
            }
            out.closeEntry();
            fis.close();
        }
        out.close();
        // 文件下载
        response.setContentType("application/x-download;charset=UTF-8");
//        response.setContentType("application/json;charset=UTF-8");//防止数据传递乱码
        try {
            String filedisplay = URLEncoder.encode(strName, "utf-8");
            response.addHeader("Content-Disposition", "attachment;filename="
                    + new String(filedisplay));

            String file = strZipName;

            InputStream is = new FileInputStream(new File(file));
            OutputStream os = response.getOutputStream();
            FileCopyUtils.copy(is, os);
            is.close();
            os.flush();
            os.close();
        } catch (Exception e) {

        } finally {
            // 下载完成后，删除zip压缩包
            try {
                File file = new File(strZipName);
                if (file.exists()) {
                    file.delete();
                }
            } catch (Exception e) {
                // e.printStackTrace();
            }
        }
    }

    /**
     * 批量上报所选图片
     *
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("fileBatchCheck")
    @ResponseBody
    public Response fileBatchCheck(HttpServletRequest request, ModelMap modelMap) {
        String fileInfoIds = ParamUtils.getString(request, "fileInfoIds", "");
        Precondition.checkAjaxArguement(StringUtils.isNotEmpty(fileInfoIds), "0001", "上报失败，请重试！");
        this.fileUploadService.fileBatchCheckOne(fileInfoIds, request);
        return new Response();
    }
    /**
     * 批量删除所选图片
     *
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("fileBatchDel")
    @ResponseBody
    public Response fileBatchDel(HttpServletRequest request, ModelMap modelMap) {
        String fileInfoIds = ParamUtils.getString(request, "fileInfoIds","0");
        fileUploadService.fileBatchDel(fileInfoIds);
        return new Response();
    }

    /**
     * 项目列表
     * @param httpServletRequest
     * @param modelMap
     */
    @RequestMapping("project/list")
    public void list(HttpServletRequest httpServletRequest, ModelMap modelMap){
        this.projectController.projectList(httpServletRequest,modelMap);
    }

    /**
     * 项目资料上传列表
     * @param httpServletRequest
     * @param modelMap
     */
    @RequestMapping("project/projectUploadList")
    public void projectUploadList(HttpServletRequest httpServletRequest, ModelMap modelMap){
        PageInfo<ProjectFile> pageInfo = new PageInfo<ProjectFile>();
        Servlets.initPageInfo(httpServletRequest,pageInfo);

        Integer projectId = ParamUtils.getInt(httpServletRequest, "projectId", 0);
        Project project = this.projectService.get(projectId);
        pageInfo = this.projectPaperService.getProjectPaperByid(pageInfo,projectId);

        modelMap.addAttribute("project", project);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     * 项目资料上传新建文件夹保存
     * @param httpServletRequest
     * @param modelMap
     */
    @RequestMapping("project/projectFileSave")
    public String projectFileSave(HttpServletRequest httpServletRequest, ModelMap modelMap, RedirectAttributes attributes){
        Integer proFileId = ParamUtils.getInt(httpServletRequest, "proFileId", 0);
        Integer projectId = ParamUtils.getInt(httpServletRequest, "projectId", 0);
        ProjectFile projectFile = projectPaperService.get(proFileId);
        if (projectFile == null) {
            projectFile = new ProjectFile();
            projectFile.setProject(projectService.get(projectId));
            projectFile.setType(1);
        }
        projectFile.setUploadPerson(UserSession.getUserFromSession(httpServletRequest).getUsername()); //创建人
        Servlets.bind(httpServletRequest,projectFile);
        this.projectPaperService.save(projectFile);
        attributes.addAttribute("projectId",projectId);
        return "redirect:projectUploadList?" + httpServletRequest.getAttribute("searchParams");
    }

    /**
     * 删除项目上传文件
     *
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("project/deleteProjectInfo")
    @ResponseBody
    public Response deleteProjectInfo(HttpServletRequest request, ModelMap modelMap) {
        String fileInfoUuid = ParamUtils.getString(request, "uuid", "");
        ProjectFile fileInfo = projectPaperService.get(Integer.parseInt(fileInfoUuid));
        Precondition.checkAjaxArguement(StringUtils.isNotEmpty(fileInfoUuid) && fileInfo != null, "0001", "删除失败，请重试！");
        this.projectPaperService.deleteProandConFile(fileInfoUuid);
        return new Response();
    }
    /**
     * 项目创建文件夹
     * @param httpServletRequest
     * @param modelMap
     */
    @RequestMapping("project/setUpPaper")
    public void setUpPaper(HttpServletRequest httpServletRequest, ModelMap modelMap){
        Integer proFileId = ParamUtils.getInt(httpServletRequest, "proFileId", 0);
        Integer projectId = ParamUtils.getInt(httpServletRequest, "projectId", 0);
        ProjectFile projectFile = projectPaperService.get(proFileId);
        if (projectFile == null) {
            projectFile = new ProjectFile();
            projectFile.setProject(projectService.get(projectId));
        }
        projectFile.setUploadDate(new Date()); //创建时间
        modelMap.addAttribute("projectId", projectId);
        modelMap.addAttribute("projectFile", projectFile);
    }

    /**
     * 项目删除文件夹
     * @param request
     * @return
     */
    @RequestMapping("project/deleteData")
    @ResponseBody
    public Map<String, String> deleteData(HttpServletRequest request) {
        Integer fileId = ParamUtils.getInt(request, "fileId", 0);
        Map<String, String> map = new HashMap<String, String>();
        List<ProjectFile> fileInfoList = projectPaperService.getFileInfoListForInCheck(fileId);
        if(fileInfoList.size() > 0){
            map.put("message", "该文件夹包含多个文件不能被删除");
            return map;
        }
        projectPaperService.delete(fileId);
        map.put("success", "true");
        map.put("message", "删除成功");
        return map;
    }

    /**
     * 得到项目上传列表
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("project/projectRight")
    public void projectRight(HttpServletRequest request, ModelMap modelMap) {
        Integer fileid = ParamUtils.getInt(request, "fileid", 0);
        String fileType = "0101";

        ProjectFile family = this.projectPaperService.get(fileid);
        List<ProjectFile> fileInfoList = projectPaperService.getFileInfoListForInCheck(fileid);

        modelMap.addAttribute("family", family);
        modelMap.addAttribute("fileInfoList", fileInfoList);
        modelMap.addAttribute("fileType", fileType);
        String typeCheck = ParamUtils.getString(request, "typeCheck", "");
        modelMap.addAttribute("typeCheck", typeCheck);
        modelMap.addAttribute("department", GetCurrentUser.getLoginUser(request).getDepartment().getDepartmentCode());
        modelMap.addAttribute("user", GetCurrentUser.getLoginUser(request));

        /*//删除文件列表
        List<ProjectFile> fileInfoListBack = projectPaperService.getFileInfoListBack(fileid);
        modelMap.addAttribute("fileInfoListBack", fileInfoListBack);*/
    }

    /**
     * 保存上传的项目附件
     *
     * @param request
     */
    @RequestMapping("project/saveProjectFile")
    @ResponseBody
    public Map saveProjectFile(HttpServletRequest request) {
        String result = "";
        User currentUser = UserSession.getUserFromSession(request);
        String person = currentUser.getUsername();
        Integer projectId = ParamUtils.getInt(request, "familyUuid", 0);//文件夹id
        String fileType = ParamUtils.getString(request, "fileType", "");//文件类别
//        String fileType = "0101";
        String filePath = ParamUtils.getString(request, "filePath", "");// 上传文件路径
        String fileName = ParamUtils.getString(request, "fileName", "");// 上传文件名称
        String suffixes = fileName.substring(fileName.lastIndexOf(".") + 1);

        fileName = fileName.substring(0, fileName.lastIndexOf("."));

        BigDecimal size = ParamUtils.getDecimal(request, "size", 0);
        try {

            ProjectFile fileInfo1 = new ProjectFile();

            //正式
            fileInfo1.setFileName(fileName);
            fileInfo1.setFilePath(filePath);
            fileInfo1.setParent(projectPaperService.get(projectId));
//            fileInfo1.setSuffixes(suffixes);
            fileInfo1.setFileSize(String.valueOf(size));
            Date date = new Date();
            fileInfo1.setUploadDate(date);
            /*SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
            String numStr = format.format(date);
            fileInfo1.setSortBy(Long.valueOf(numStr));*/
            fileInfo1.setUploadPerson(person);
            fileInfo1.setType(2);

            this.projectPaperService.save(fileInfo1);
            result = "1";

        } catch (Exception e) {//保存信息失败，并删除已经上传的文件
            result = "2";
        }
        Map<String, String> map = new HashMap<String, String>();
        map.put("result", "1");
        return map;
    }

    /**
     * 项目资料批量下载
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("project/downProjectFile")
    @ResponseBody
    public void downProjectFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String ids = ParamUtils.getString(request, "ids", "");//入户表id
        List<ProjectFile> list = this.projectPaperService.listByIds(ids);
        if (list == null || list.size() == 0) {
            throw new SqdsException("找不到下载的文件");
        }
        byte[] buffer = new byte[1024];
        // 准备下载的文件
        File[] file1 = new File[list.size()];
        String[] nameArray = new String[list.size()];
        int index = 0;
        for (ProjectFile f : list) {
            String path = UploadPathUtil.getUploadPathRoot() + f.getFilePath();
            File fl = new File(path);
            if (fl.isFile() && fl.exists()) {
                file1[index] = new File(path);
//                nameArray[index] = f.getFileName();
                nameArray[index] = f.getFilePath().substring(f.getFilePath().lastIndexOf("/") + 1);
            }
            index++;
        }
        // 生成的ZIP文件名
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        String strName = format.format(new Date()) + ".zip";
        String strZipName = UploadPathUtil.getUploadPathRoot() + "/" + strName;
        try {
            File file = new File(strZipName);

            if (file.isFile() && file.exists()) {
                file.delete();
            }
        } catch (Exception e) {
        }
        ZipOutputStream out = new ZipOutputStream(new FileOutputStream(strZipName));
//        out.setEncoding("gbk");
        for (int i = 0; i < file1.length; i++) {
            if (file1[i] == null) {
                continue;
            }
            FileInputStream fis = new FileInputStream(file1[i]);
            out.putNextEntry(new ZipEntry(nameArray[i]));
            int len;

            // 读入需要下载的文件的内容，打包到zip文件

            while ((len = fis.read(buffer)) > 0) {
                out.write(buffer, 0, len);
            }
            out.closeEntry();
            fis.close();
        }
        out.close();
        // 文件下载
        response.setContentType("application/x-download;charset=UTF-8");
//        response.setContentType("application/json;charset=UTF-8");//防止数据传递乱码
        try {
            String filedisplay = URLEncoder.encode(strName, "utf-8");
            response.addHeader("Content-Disposition", "attachment;filename="
                    + new String(filedisplay));

            String file = strZipName;

            InputStream is = new FileInputStream(new File(file));
            OutputStream os = response.getOutputStream();
            FileCopyUtils.copy(is, os);
            is.close();
            os.flush();
            os.close();
        } catch (Exception e) {

        } finally {
            // 下载完成后，删除zip压缩包
            try {
                File file = new File(strZipName);
                if (file.exists()) {
                    file.delete();
                }
            } catch (Exception e) {
                // e.printStackTrace();
            }
        }
    }
    /**
     * 合同列表
     * @param httpServletRequest
     * @param modelMap
     */
    @RequestMapping("contract/contractlist")
    public void contractlist(HttpServletRequest httpServletRequest, ModelMap modelMap){
        this.contractController.list(httpServletRequest,modelMap);
    }

    /**
     * 合同资料上传列表
     * @param httpServletRequest
     * @param modelMap
     */
    @RequestMapping("contract/contractUploadList")
    public void contractUploadList(HttpServletRequest httpServletRequest, ModelMap modelMap){
        PageInfo<ProjectFile> pageInfo = new PageInfo<ProjectFile>();
        Servlets.initPageInfo(httpServletRequest,pageInfo);

        Integer contractId = ParamUtils.getInt(httpServletRequest, "contractId", 0);
        Contract project = this.contractService.get(contractId);
        pageInfo = this.projectPaperService.getContractPaperByid(pageInfo,contractId);

        modelMap.addAttribute("project", project);
        modelMap.addAttribute("pageInfo",pageInfo);
    }

    /**
     * 合同资料上传新建文件夹保存
     * @param httpServletRequest
     * @param modelMap
     */
    @RequestMapping("contract/contractFileSave")
    public String contractFileSave(HttpServletRequest httpServletRequest, ModelMap modelMap, RedirectAttributes attributes){
        Integer proFileId = ParamUtils.getInt(httpServletRequest, "proFileId", 0);
        Integer unitId = ParamUtils.getInt(httpServletRequest, "unitId", 0);
        ProjectFile projectFile = projectPaperService.get(proFileId);
        if (projectFile == null) {
            projectFile = new ProjectFile();
            projectFile.setContract(contractService.get(unitId));
            projectFile.setType(1);
        }
        projectFile.setUploadPerson(UserSession.getUserFromSession(httpServletRequest).getUsername()); //创建人
        Servlets.bind(httpServletRequest,projectFile);
        this.projectPaperService.save(projectFile);
        attributes.addAttribute("contractId",unitId);
        return "redirect:contractUploadList?" + httpServletRequest.getAttribute("searchParams");
    }
    /**
     * 合同创建文件夹
     * @param httpServletRequest
     * @param modelMap
     */
    @RequestMapping("contract/setUpcontractPaper")
    public void setUpcontractPaper(HttpServletRequest httpServletRequest, ModelMap modelMap){
        Integer proFileId = ParamUtils.getInt(httpServletRequest, "proFileId", 0);
        Integer contractId = ParamUtils.getInt(httpServletRequest, "contractId", 0);
        ProjectFile projectFile = projectPaperService.get(proFileId);
        if (projectFile == null) {
            projectFile = new ProjectFile();
            projectFile.setContract(contractService.get(contractId));
        }
        projectFile.setUploadDate(new Date()); //创建时间
        modelMap.addAttribute("contractId", contractId);
        modelMap.addAttribute("projectFile", projectFile);
    }

    /**
     * 合同删除文件夹
     * @param request
     * @return
     */
    @RequestMapping("contract/deleteContractData")
    @ResponseBody
    public Map<String, String> deleteContractData(HttpServletRequest request) {
        int fileId = ParamUtils.getInt(request, "fileId", 0);
        Map<String, String> map = new HashMap<String, String>();
        List<ProjectFile> fileInfoList = projectPaperService.getFileInfoListForInCheck(fileId);
        if(fileInfoList.size()> 0){
            map.put("message", "该文件夹包含多个文件不能被删除");
            return map;
        }
        projectPaperService.delete(fileId);
        map.put("success", "true");
        map.put("message", "删除成功");
        return map;
    }

    /**
     * 得到合同上传列表
     *
     * @param request
     * @param modelMap
     */
    @RequestMapping("contract/contractRight")
    public void contractRight(HttpServletRequest request, ModelMap modelMap) {
        Integer fileid = ParamUtils.getInt(request, "fileid", 0);
        String fileType = "0102";
        ProjectFile family = this.projectPaperService.get(fileid);
        List<ProjectFile> fileInfoList = projectPaperService.getFileInfoListForInCheck(fileid);
        modelMap.addAttribute("family", family);
        modelMap.addAttribute("fileType", fileType);
        modelMap.addAttribute("fileInfoList", fileInfoList);
        String typeCheck = ParamUtils.getString(request, "typeCheck", "");
        modelMap.addAttribute("typeCheck", typeCheck);
        modelMap.addAttribute("department", GetCurrentUser.getLoginUser(request).getDepartment().getDepartmentCode());
        modelMap.addAttribute("user", GetCurrentUser.getLoginUser(request));

        //删除文件列表
        /*List<ProjectFile> fileInfoListBack = projectPaperService.getFileInfoListBack(fileid);
        modelMap.addAttribute("fileInfoListBack", fileInfoListBack);*/
    }

    /**
     * 保存上传的合同附件
     *
     * @param request
     */
    @RequestMapping("contract/saveContractFile")
    @ResponseBody
    public Map saveContractFile(HttpServletRequest request) {
        String result = "";
        User currentUser = UserSession.getUserFromSession(request);
        String person = currentUser.getUsername();
        Integer contractId = ParamUtils.getInt(request, "familyUuid", 0);//文件夹id
        String fileType = ParamUtils.getString(request, "fileType", "");//文件类别
//        String fileType = "0101";
        String filePath = ParamUtils.getString(request, "filePath", "");// 上传文件路径
        String fileName = ParamUtils.getString(request, "fileName", "");// 上传文件名称
        String suffixes = fileName.substring(fileName.lastIndexOf(".") + 1);

        fileName = fileName.substring(0, fileName.lastIndexOf("."));

        BigDecimal size = ParamUtils.getDecimal(request, "size", 0);
        try {

            ProjectFile fileInfo1 = new ProjectFile();

            //正式
            fileInfo1.setFileName(fileName);
            fileInfo1.setFilePath(filePath);
            fileInfo1.setParent(projectPaperService.get(contractId));
//            fileInfo1.setSuffixes(suffixes);
            fileInfo1.setFileSize(String.valueOf(size));
            Date date = new Date();
            fileInfo1.setUploadDate(date);
            /*SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
            String numStr = format.format(date);
            fileInfo1.setSortBy(Long.valueOf(numStr));*/
            fileInfo1.setUploadPerson(person);
//            fileInfo1.setUserId(String.valueOf(currentUser.getId()));
            fileInfo1.setType(2);

            this.projectPaperService.save(fileInfo1);
            result = "1";

        } catch (Exception e) {//保存信息失败，并删除已经上传的文件
            result = "2";
        }
        Map<String, String> map = new HashMap<String, String>();
        map.put("result", "1");
        return map;
    }

    /**
     * 合同资料批量下载
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("contract/downContractFile")
    @ResponseBody
    public void downContractFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String ids = ParamUtils.getString(request, "ids", "");//入户表id
        List<ProjectFile> list = this.projectPaperService.listByIds(ids);
        if (list == null || list.size() == 0) {
            throw new SqdsException("找不到下载的文件");
        }
        byte[] buffer = new byte[1024];
        // 准备下载的文件
        File[] file1 = new File[list.size()];
        String[] nameArray = new String[list.size()];
        int index = 0;
        for (ProjectFile f : list) {
            String path = UploadPathUtil.getUploadPathRoot() + f.getFilePath();
            File fl = new File(path);
            if (fl.isFile() && fl.exists()) {
                file1[index] = new File(path);
//                nameArray[index] = f.getFileName();
                nameArray[index] = f.getFilePath().substring(f.getFilePath().lastIndexOf("/") + 1);
            }
            index++;
        }
        // 生成的ZIP文件名
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        String strName = format.format(new Date()) + ".zip";
        String strZipName = UploadPathUtil.getUploadPathRoot() + "/" + strName;
        try {
            File file = new File(strZipName);

            if (file.isFile() && file.exists()) {
                file.delete();
            }
        } catch (Exception e) {
        }
        ZipOutputStream out = new ZipOutputStream(new FileOutputStream(strZipName));
//        out.setEncoding("gbk");
        for (int i = 0; i < file1.length; i++) {
            if (file1[i] == null) {
                continue;
            }
            FileInputStream fis = new FileInputStream(file1[i]);
            out.putNextEntry(new ZipEntry(nameArray[i]));
            int len;

            // 读入需要下载的文件的内容，打包到zip文件

            while ((len = fis.read(buffer)) > 0) {
                out.write(buffer, 0, len);
            }
            out.closeEntry();
            fis.close();
        }
        out.close();
        // 文件下载
        response.setContentType("application/x-download;charset=UTF-8");
//        response.setContentType("application/json;charset=UTF-8");//防止数据传递乱码
        try {
            String filedisplay = URLEncoder.encode(strName, "utf-8");
            response.addHeader("Content-Disposition", "attachment;filename="
                    + new String(filedisplay));

            String file = strZipName;

            InputStream is = new FileInputStream(new File(file));
            OutputStream os = response.getOutputStream();
            FileCopyUtils.copy(is, os);
            is.close();
            os.flush();
            os.close();
        } catch (Exception e) {

        } finally {
            // 下载完成后，删除zip压缩包
            try {
                File file = new File(strZipName);
                if (file.exists()) {
                    file.delete();
                }
            } catch (Exception e) {
                // e.printStackTrace();
            }
        }
    }
}
