package com.jhd.app.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhd.app.beans.Product;
import com.jhd.app.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;

	@Override
	public Integer addProductClass(Map<String, String> params) {
		return productMapper.addProductClass(params);
	}

	@Override
	public Integer addProduct(Product product) {
		return productMapper.addProduct(product);
	}

	@Override
	public List<Map<String,Object>> productList(Map<String, String> map) {
		return productMapper.productList(map);
	}

	@Override
	public List<Map<String, Object>> proClassList() {
		return productMapper.proClassList();
	}

	@Override
	public Integer updateProduct(Product product) {
		return productMapper.updateProduct(product);
	}

	@Override
	public Integer deleteProduct(Integer id) {
		return productMapper.deleteProduct(id);
	}

	@Override
	public Integer deleteProClass(Integer id) {
		return productMapper.deleteProClass(id);
	}

	@Override
	public Integer updateProductClass(Map<String, String> map) {
		return productMapper.updateProductClass(map);
	}

}
