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
    private String id;//������
    private Integer t_number;//����
    private Integer createAt;//������ID
    private Date createDate;//����ʱ��
    private Integer status;//����״̬ 0��δ�ᵥ��1���ѽᵥ
    private Integer isDel;//�Ƿ�ɾ�� 0��δɾ����1����ɾ��
}
