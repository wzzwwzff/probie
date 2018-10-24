package com.app.cq.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Hashtable;

/**
 * 二维码生成工具
 * Created by ZYK on 2018/4/11.
 */
public class BitMatrixUtils {

    private static final int BLACK = -16777216;
    private static final int WHITE = -1;

    private BitMatrixUtils() {
    }

    public static void toMatrix(String text, OutputStream outputStream) throws Exception {
        short width = 120;   //二维码宽度
        short height = 120;   //二维码高度
        String format = "gif";
        Hashtable hints = new Hashtable();
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");   //设置二维码编码格式
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);//设置二维码的容错等级
        hints.put(EncodeHintType.MARGIN, 4);   //设置白边宽度，0-4区间，好像数值越小，白边越大，4：无白边？（不确定，但已解决问题（二维码大小已保持一致））
        BitMatrix bitMatrix = (new MultiFormatWriter()).encode(text, BarcodeFormat.QR_CODE, width, height, hints);
        writeToStream(bitMatrix, format, outputStream);
    }

    public static BufferedImage toBufferedImage(BitMatrix matrix) {
        int width = matrix.getWidth();
        int height = matrix.getHeight();
        BufferedImage image = new BufferedImage(width, height, 1);

        for(int x = 0; x < width; ++x) {
            for(int y = 0; y < height; ++y) {
                image.setRGB(x, y, matrix.get(x, y)?-16777216:-1);
            }
        }

        return image;
    }

    public static void writeToFile(BitMatrix matrix, String format, File file) throws IOException {
        BufferedImage image = toBufferedImage(matrix);
        if(!ImageIO.write(image, format, file)) {
            throw new IOException("Could not write an image of format " + format + " to " + file);
        }
    }

    public static void writeToStream(BitMatrix matrix, String format, OutputStream stream) throws IOException {
        BufferedImage image = toBufferedImage(matrix);
        if(!ImageIO.write(image, format, stream)) {
            throw new IOException("Could not write an image of format " + format);
        }
    }
}
