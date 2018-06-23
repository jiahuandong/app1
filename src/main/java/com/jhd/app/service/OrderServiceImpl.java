package com.jhd.app.service;

import com.jhd.app.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/6/23 0023.
 */
@Service
public class OrderServiceImpl {
    @Autowired
    private OrderMapper ordermapper;
}
