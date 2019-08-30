package com.baitaplon.model;

import java.util.List;

public interface Management {
    public List getList();
    public void add(Object object);
    public void edit(Object object);
    public void delete(String id);
    public List find(String args);
    public Object getInfo(String id);
}
