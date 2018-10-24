package com.app.cq.utils;

import com.sqds.spring.UploadInfo;
import com.sqds.utils.ImageUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class UploadInfoUtil {
    /**
     * 上传文件
     *
     * @param request
     * @param uploadDir       上传文件路径
     * @param parameterName   表单域名称
     * @param saveFileName    上传另存为文件名称，不含扩展名
     * @param thumbnailWidth  缩略图宽度
     * @param thumbnailHeight 缩略图高度
     * @return
     */
    public static UploadInfo uploadFile(HttpServletRequest request, String uploadDir, String parameterName, String saveFileName, int thumbnailWidth, int thumbnailHeight) {
        String fileRelativePath = "";
        UploadInfo uploadInfo = new UploadInfo();
        String realPath = UploadPathUtil.getUploadPathRoot() + "/" + uploadDir;
        MultipartHttpServletRequest multipartRequest = null;
        try {
            multipartRequest = (MultipartHttpServletRequest) request;
        } catch (ClassCastException e) {
            return uploadInfo;
        }
        File file = new File(realPath);
        try {
            if (!file.exists()) {
                file.mkdirs();
            }
            //得到提交的文件
            MultipartFile multipartFile = multipartRequest.getFile(parameterName);
            //判断是否有这个文件
            if (StringUtils.isNotEmpty(multipartFile.getOriginalFilename())) {
                String fileName = multipartFile.getOriginalFilename();
                String extName = "";
                if (fileName.lastIndexOf(".") != -1) {
                    extName = fileName.substring(fileName.lastIndexOf("."));
                }
                String fileRealPath = file + File.separator + saveFileName + extName;
                File file1 = new File(fileRealPath);
                multipartFile.transferTo(file1);
                fileRelativePath = uploadDir + "/" + saveFileName + extName;

//                ImageUtils.doThumb(file1, 1920);//压缩高质量图片为普通图片(上传的图片MB过大，可以压缩)

                //图片生成缩略图
                if (thumbnailWidth == 0 || thumbnailHeight == 0) {
                    thumbnailWidth = 100;
                    thumbnailHeight = 150;
                }
                //如果文件是图片，则生成缩略图
                if (FirmImageUtils.yesOrNoImage(fileName)) {
                    ImageUtils.doThumbNewFile(file1, thumbnailWidth, "s_");//生成缩略图
                }
                uploadInfo.setFileSize(multipartFile.getSize());
                uploadInfo.setOriginalFilename(fileName);
                uploadInfo.setSaveFilename(fileRelativePath);
                uploadInfo.setContentType(multipartFile.getContentType());
            }
        } catch (IOException e) {
        }
        return uploadInfo;
    }
}
