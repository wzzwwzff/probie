package com.app.cq.utils;

import javax.imageio.ImageIO;
import java.util.Arrays;

/**
 * Created by zyk on 2018/02/28
 */
public class FirmImageUtils {


    /**
     * 判断是否为图片
     *
     * @return
     */
    public static boolean yesOrNoImage(String fileName) {

        // ImageIO 支持的图片类型 : [BMP, bmp, jpg, JPG, wbmp, jpeg, png, PNG, JPEG, WBMP, GIF, gif]
        String types = Arrays.toString(ImageIO.getReaderFormatNames());
        String suffix = null;
        // 获取图片后缀
        if (fileName.indexOf(".") > -1) {
            suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
        }
        // 类型和图片后缀全部小写，然后判断后缀是否合法
        if (suffix == null || types.toLowerCase().indexOf(suffix.toLowerCase()) < 0) {
            //log.error("Sorry, the image suffix is illegal. the standard image suffix is {}." + types);
            return false;
        }
        return true;
    }
}
