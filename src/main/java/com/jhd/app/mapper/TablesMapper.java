package com.jhd.app.mapper;

import com.jhd.app.beans.Tables;

/**
 * Created by Administrator on 2018/6/23 0023.
 */
public interface TablesMapper {
    public void addTable(Tables tables);
    public int updateTable(Tables tables);
    public int delTable(Tables tables);
}
