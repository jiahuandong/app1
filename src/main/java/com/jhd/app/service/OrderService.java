package com.jhd.app.service;

import com.jhd.app.beans.Tables;

import java.util.List;

/**
 * Created by Administrator on 2018/6/23 0023.
 */
public interface OrderService {

    public Integer addTable(Tables tables);

    public List<Tables> getAll(Tables tables);

}
