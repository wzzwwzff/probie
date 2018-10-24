package com.app.cq.utils;

import java.sql.Connection;
import java.sql.SQLException;

public class Test {
    public static void main(String[] args){
        System.out.println("aa");
        DBUtil db = new DBUtil();
        try {
            Connection conn = db.DBU();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
