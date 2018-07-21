package com.jhd.app.service;

import com.jhd.app.beans.Tables;
import com.jhd.app.mapper.OrderMapper;
import com.jhd.app.mapper.TablesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/6/23 0023.
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper ordermapper;

    @Autowired
    private TablesMapper tablesMapper;


    @Override
    public Integer addTable(Tables tables) {
        return tablesMapper.addTable(tables);
    }

    @Override
    public List<Tables> getAll(Tables tables) {
        return tablesMapper.getAll(tables);
    }
}
