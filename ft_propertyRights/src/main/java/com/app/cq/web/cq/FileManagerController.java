package com.app.cq.web.cq;

import com.app.cq.utils.UploadInfoUtil;
import com.sqds.exception.SqdsException;
import com.sqds.spring.UploadInfo;
import com.sqds.web.ParamUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 文件管理
 * Created by zn on 2016/4/27.
 */
@Controller
@RequestMapping("/fileUpload/*")
public class FileManagerController {

    /**
     * 下载
     *
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
            FileCopyUtils.copy(is, os);
            //关闭输入流
            is.close();
            //重写输出流
            os.flush();
            //关闭输出流
            os.close();
        } catch (Exception e) {
            throw new SqdsException("找不到需要下载的文件");
        }
    }

    /**
     * 上传
     *
     * @param request
     * @return
     */
    @RequestMapping("uploadify")
    @ResponseBody
    public Map uploadify(HttpServletRequest request) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); // 定义路径,该路径便于文件拷贝
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmssSSS"); // 定义文件名

        //缩略图宽高
        int width = ParamUtils.getInt(request, "width", 0);
        int height = ParamUtils.getInt(request, "height", 0);

        String path = "/uploads/" + sdf.format(new Date());// 路径
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
}
