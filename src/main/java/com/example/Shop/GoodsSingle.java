package com.example.Shop;

import java.util.Date;

public class GoodsSingle {
    private String id;
    private String name;						//保存商品名称
    private float price;						//保存商品价格
    private int num;							//保存商品购买数量
    private int remainnum;                      //库存量
    private String url;
    private Date date;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getNum() {
        return num;
    }
    public void setNum(int num) {
        this.num = num;
    }
    public float getPrice() {
        return price;
    }
    public void setPrice(float price) {
        this.price = price;
    }

    public int getRemainnum() {
        return remainnum;
    }

    public void setRemainnum(int remainnum) {
        this.remainnum = remainnum;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
