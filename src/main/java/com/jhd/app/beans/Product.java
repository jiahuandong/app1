package com.jhd.app.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Product {
	private Integer id;
	private String name;
	private String price;
	private String model;
	private String comment;
	private Integer proClassId;
	private Date createAt;
	private Integer status;
	private Integer isDel;
}
