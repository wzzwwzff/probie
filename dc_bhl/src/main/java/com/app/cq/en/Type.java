package com.app.cq.en;

/**
 * 是否在本址
 * Created by ZYK on 2018/5/8.
 */
public enum Type {

    YES("是、未审核", 1), NO("否、已审核", 2);

    // 成员变量
    private String name;
    private int index;

    // 构造方法
    private Type(String name, int index) {
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
