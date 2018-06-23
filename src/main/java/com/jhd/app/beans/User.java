package com.jhd.app.beans;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {
	private Integer id;
	private String loginAccount;
	private String passWord;
	private String userName;
	private Date createAt;
	private Date modifyAt;
	private Integer isDel;
}
