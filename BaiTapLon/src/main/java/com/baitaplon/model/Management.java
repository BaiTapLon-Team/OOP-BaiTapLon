package com.baitaplon.model;

import java.sql.SQLException;
import java.util.List;

public interface Management {
    public List getList() throws SQLException;
    public void add(Object object) throws SQLException;
    public void edit(Object object) throws SQLException;
    public void delete(String id) throws SQLException;
    public List find(String args);
    public Object getInfo(String id) throws SQLException;
}
