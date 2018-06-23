package com.jhd.app.service;

import java.util.List;
import java.util.Map;

import com.jhd.app.beans.Product;

public interface ProductService {

	Integer addProductClass(Map<String, String> params);
	
	Integer addProduct(Product product);
	
	List<Map<String,Object>> productList(Map<String, String> map);
	
	List<Map<String,Object>> proClassList();

	Integer updateProduct(Product product);

	Integer deleteProduct(Integer id);

	Integer deleteProClass(Integer id);

	Integer updateProductClass(Map<String, String> map);
	
}
