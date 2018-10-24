package com.app.cq.en;

/**
 * 数据操作类型
 * Created by jmdf on 2018/9/6.
 */
public enum DataPhase {

    SET("基础数据", 1), CHOOSEHOUSE("选房", 2),SIGN("签订认购协议",3), GFPERSON("变更购房人",4),FINANCE("财务结算",5);

    // 成员变量
    private String name;
    private int index;

    // 构造方法
    private DataPhase(String name, int index) {
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
