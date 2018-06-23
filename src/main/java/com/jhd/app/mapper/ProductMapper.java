package com.jhd.app.mapper;

import java.util.List;
import java.util.Map;

import com.jhd.app.beans.Product;

public interface ProductMapper {

	Integer addProductClass(Map<String, String> params);
	
	Integer addProduct(Product product);
	
	List<Map<String,Object>> productList(Map<String, String> map);
	
	List<Map<String,Object>> proClassList();

	Integer deleteProClass(Integer id);

	Integer deleteProduct(Integer id);

	Integer updateProduct(Product product);

	Integer updateProductClass(Map<String, String> map);

}
