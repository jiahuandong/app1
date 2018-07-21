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
public class Tables {
    private Integer id;
    private Integer tNumber;
    private Integer status;
    private Integer tableClassId;
    private String tableClass;
    private Date createAt;
    private Integer peopleNum;
    private Integer isDel;
}
