package com.app.cq.en;

/**
 * 认购协议签约状态
 * Created by jmdf on 2018/9/5.
 */
public enum SignStatus {
    UNSIGN("未签约", 1), SIGN("已签约", 2);

    // 成员变量
    private String name;
    private int index;

    // 构造方法
    private SignStatus(String name, int index) {
        this.name = name;
        this.index = index;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
}
