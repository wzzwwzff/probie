package com.app.cq.utils;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * 连接Mysql工具类
 * @date 2018/7/2
 */
public class DBUtil {

    private static Connection conn=null;
    private static Properties prop=new Properties();
    /**
     * 读取配置文件内容
     */
    static {
        try {
            FileInputStream in = new FileInputStream("src/main/resources/application.properties");
            prop.load(in);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 取得连接
     */
    public static Connection DBU() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(prop.getProperty("Mysql-url"),prop.getProperty("Mysql-username"),prop.getProperty("Mysql-password"));
        return conn;
    }

    public static void close(Connection connection, Statement statement) throws SQLException {
        if (connection != null){
            connection.close();
        }
        if (statement != null){
            statement.close();
        }
    }
}
