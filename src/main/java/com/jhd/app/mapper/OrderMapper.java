package com.jhd.app.mapper;

import com.jhd.app.beans.Order;
import com.jhd.app.beans.OrderItem;

/**
 * Created by Administrator on 2018/6/23 0023.
 */
public interface OrderMapper {
    public void addOrder(Order order);
    public void addOrderItem(OrderItem orderItem);
}
