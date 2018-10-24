package com.app.cq.utils;

public class UploadPathUtil {

    /**
     * 获得上传文件的根目录
     *
     * @return
     */
    public static String getUploadPathRoot() {
//        DataDictService dataDictService = (DataDictService) SpringUtils.getWebApplicationContext(Servlets.getRequest()).getBean("dataDictService");
        String realPath = "";
//        Map<String, String> map = dataDictService.getMapByParentAttributeNameForName("文件路径");
//        String path = map.get("rootPath");
//        if (!path.equals("/")) {//不等于“/”，使用配置路径
//            return path;
//        } else {//否则，使用系统默认路径(根目录)
        return System.getProperty("rootPath");
//        }
    }
}
