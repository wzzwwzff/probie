package com.app.xuexin;

import com.app.xuexin.util.HttpClientUtil;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test {

    public static void main(String[] args) throws IOException, InterruptedException {

        for(int i=0;i<100;i++) {
            String html = HttpClientUtil.getWebPage("https://www.chsi.com.cn/xlcx/bg.do?vcode=361813514380");



            if(html.indexOf("请输入验证码以继续当前操作") > 0){
//                System.out.println(html);
                String regex = "(?is)name='capachatok'.*?value='(.*?)'.*?cap=(.*?)'";
                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(html);

                if(matcher.find()){
                    System.out.println("#########");
                    String capachatok = matcher.group(1);
                    String cap = matcher.group(2);
                    System.out.println(capachatok);
                    System.out.println(cap);
                    System.out.println("@@@@@");

                    String html1 = HttpClientUtil.getWebPage("https://www.chsi.com.cn/capachaimg.jpg?cap="+cap);

                    Thread.sleep(1000);
                    String html2 = HttpClientUtil.getWebPage("https://www.chsi.com.cn/xlcx/yzm.do?capachatok="+capachatok+"&cap="+cap);
                    System.out.println(html2);
                    System.out.println("=====================");

                    Thread.sleep(2000);
                }

//                Thread.sleep(5000);
//                return;
            }else {

                System.out.println(html);
            }

            System.out.println("-------------------------"+i);
            Thread.sleep(1000);

        }
    }
}
