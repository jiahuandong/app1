package com.jhd.app.mapper;

import com.jhd.app.beans.Tables;

import java.util.List;

/**
 * Created by Administrator on 2018/6/23 0023.
 */
public interface TablesMapper {
    public List<Tables> getAll(Tables tables);
    public int addTable(Tables tables);
    public int updateTable(Tables tables);
    public int delTable(Tables tables);
}
