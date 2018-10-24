package com.app.cq.utils;

import com.sqds.spring.UploadInfo;
import com.sqds.utils.StringUtils;
import com.sqds.web.ParamUtils;
import com.sqds.web.Servlets;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

public class UploadUtils {
    public static UploadInfo uploadFile(HttpServletRequest request, String uploadDir, String parameterName, String saveFileName){
        String fileDeleteFlag = ParamUtils.getString(request, "_"+parameterName, "");
        String oldFileUrl = ParamUtils.getString(request, "_old_"+parameterName, "");

        UploadInfo uploadInfo;

        if(StringUtils.isNotEmpty(fileDeleteFlag)) {
            //TODO 删除原上传文件
            String path = request.getSession().getServletContext().getRealPath("/");
            File file = new File(path + oldFileUrl);
            if (file.isFile() && file.exists()) {
                file.delete();
            }
            uploadInfo = Servlets.uploadFile(request, uploadDir, parameterName, saveFileName);
        }else{
            if (oldFileUrl.equals("")){
                uploadInfo = Servlets.uploadFile(request, uploadDir, parameterName, saveFileName);
            } else {
                uploadInfo = Servlets.uploadFile(request, uploadDir, parameterName, saveFileName);
                uploadInfo.setSaveFilename(oldFileUrl);
            }
        }

        return uploadInfo;
    }
}
