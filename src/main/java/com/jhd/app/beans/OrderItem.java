package com.jhd.app.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * Created by Administrator on 2018/6/23 0023.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItem {

    private Integer id;
    private String orderId;
    private Integer productId;
    private Integer count;
    private String comment;
    private Date createDate;
    private Integer isDel;
}
