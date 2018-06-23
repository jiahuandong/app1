package com.jhd.app.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * Created by Administrator on 2018/6/23 0023.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private String id;//订单号
    private Integer t_number;//桌号
    private Integer createAt;//创建者ID
    private Date createDate;//创建时间
    private Integer status;//订单状态 0：未结单，1：已结单
    private Integer isDel;//是否删除 0：未删除，1：已删除
}
