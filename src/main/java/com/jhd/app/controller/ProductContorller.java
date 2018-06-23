package com.jhd.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhd.app.beans.Product;
import com.jhd.app.constants.MYCONSTANTS;
import com.jhd.app.service.ProductService;
import com.jhd.app.utils.PageList;

@Controller
public class ProductContorller extends BaseController {
	
	@Autowired
	private ProductService productService;
	
	/**
	 * 跳转到产品分类页
	 * @return
	 */
	@RequestMapping("/proClass")
	public Object toProClass() {
		return "product_class";
	}
	/**
	 * 添加产品分类
	 * @param params
	 * @return
	 */
	@RequestMapping("/addProClass")
	@ResponseBody
	public Object addProductClass(@RequestBody Map<String,String> params) {
		start();
		try {
			Integer result = productService.addProductClass(params);
			if(result > 0) {
				success(MYCONSTANTS.ADDPROCLASS);
			}else {
				error(MYCONSTANTS.ADDPROCLASSERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
			error(MYCONSTANTS.ADDPROCLASSERROR);
		}
		return end();
	}
	
	/**
	 * 添加产品
	 * @param product
	 * @return
	 */
	@RequestMapping(value="/addProduct",method=RequestMethod.POST)
	@ResponseBody
	public Object addProduct(@RequestBody Product product) {
		start();
		
		try {
			Integer addProduct = productService.addProduct(product);
			if(addProduct > 0) {
				success(MYCONSTANTS.ADDPRODUCT);
			}else {
				error(MYCONSTANTS.ADDPRODUCTERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
			error(MYCONSTANTS.ADDPRODUCTERROR);
		}
		return end();
	}
	
	/**
	 * 获取产品分类列表
	 * @return
	 */
	@RequestMapping(value="/proClassList",method=RequestMethod.POST)
	@ResponseBody
	public Object productClassList(){
		
		start();
		try {
			List<Map<String, Object>> proClassList = productService.proClassList();
			if(proClassList.isEmpty() || proClassList.size() == 0) {
				error(MYCONSTANTS.SELECTPORCLASSLISTERROR);
			}else {
				param("proClassList", proClassList);
				success(MYCONSTANTS.SELECTPORCLASSLIST);
			}
		} catch (Exception e) {
			e.printStackTrace();
			error(MYCONSTANTS.SELECTPORCLASSLISTERROR);
		}
		return end();
	}
	
	/**
	 * 获取产品列表
	 * @return
	 */
	@RequestMapping(value="/productList",method=RequestMethod.POST)
	@ResponseBody
	public Object productList(@RequestBody Map<String,String>params){
		start();
		try {
			List<Map<String,Object>> productList = productService.productList(params);
			if(productList.isEmpty() || productList.size() == 0) {
				error(MYCONSTANTS.SELECTPORDUCTLISTERROR);
			}else {
//				Integer pageNo = Integer.parseInt(params.get("pageNo"));
//				Integer pageSize = Integer.parseInt(params.get("pageSize"));
//				List<Map<String, Object>> pageList = PageList.getPageList(productList, pageNo, pageSize);
//				List<Integer> numList = PageList.getNumList(PageList.getPageTotal(productList.size(), pageSize), pageNo);
				param("productList",productList);
//				param("numList",numList);
//				param("pageNo",pageNo);
//				param("totalPage",PageList.getPageTotal(productList.size(), pageSize));
//				param("totalCount",productList.size());
				success(MYCONSTANTS.SELECTPORDUCTLIST);
			}
		} catch (Exception e) {
			e.printStackTrace();
			error(MYCONSTANTS.SELECTPORDUCTLISTERROR);
		}
		
		return end();
	}
	
	/**
	 * 获取产品列表
	 * @return
	 */
	@RequestMapping(value="/searchPro",method=RequestMethod.POST)
	@ResponseBody
	public Object searchProList(Product product){
		start();
		try {
			Map<String,String>params = new HashMap<>();
			if(product.getName() != null && product.getName() !="") {
				params.put("name", "%"+product.getName()+"%");
			}
			if(product.getProClassId() != null && product.getProClassId() >= 0) {
				params.put("proClassId", product.getProClassId().toString());
			}
			List<Map<String,Object>> productList = productService.productList(params);
			if(productList.isEmpty() || productList.size() == 0) {
				error(MYCONSTANTS.SELECTPORDUCTLISTERROR);
			}else {
				param("productList",productList);
				success(MYCONSTANTS.SELECTPORDUCTLIST);
			}
		} catch (Exception e) {
			e.printStackTrace();
			error(MYCONSTANTS.SELECTPORDUCTLISTERROR);
		}
		
		return end();
	}
	
	/**
	 * 修改产品信息
	 * @param product
	 * @return
	 */
	@RequestMapping(value="/updateProduct",method=RequestMethod.POST)
	@ResponseBody
	public Object updateProduct(@RequestBody Product product) {
		start();
		if(product == null) {
			error(MYCONSTANTS.NULL);
		}else{
			try {
				Integer result = productService.updateProduct(product);
				if(result == 0) {
					error(MYCONSTANTS.UPDATEPRODUCTERROR);
				}
				success(MYCONSTANTS.UPDATEPRODUCT);
			} catch (Exception e) {
				e.printStackTrace();
				error(MYCONSTANTS.UPDATEPRODUCTERROR);
			}
		}
		return end();
	}
	/**
	 * 修改产品分类
	 * @param product
	 * @return
	 */
	@RequestMapping(value="/updateProClass",method=RequestMethod.POST)
	@ResponseBody
	public Object updateProductClass(@RequestBody Map<String,String> map) {
		start();
		if(map.size() == 0 || map.isEmpty()) {
			error(MYCONSTANTS.NULL);
		}else{
			try {
				Integer result = productService.updateProductClass(map);
				if(result == 0) {
					error(MYCONSTANTS.UPDATEPRODUCTCLASSERROR);
				}
				success(MYCONSTANTS.UPDATEPRODUCTCLASS);
			} catch (Exception e) {
				e.printStackTrace();
				error(MYCONSTANTS.UPDATEPRODUCTCLASSERROR);
			}
		}
		return end();
	}
	
	
	/**
	 * 删除产品
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delProduct",method=RequestMethod.POST)
	@ResponseBody
	public Object deleteProduct(@RequestBody Product product) {
		start();
		if(product == null) {
			error(MYCONSTANTS.NULL);
		}else {
			try {
				Integer result = productService.deleteProduct(product.getId());
				if(result == 0 ) {
					error(MYCONSTANTS.DELPRODUCTERROR);
				}
				success(MYCONSTANTS.DELPRODUCT);
			} catch (Exception e) {
				e.printStackTrace();
				error(MYCONSTANTS.DELPRODUCTERROR);
			}
			
		}
		return end();
	}
	
	
	/**
	 * 删除产品分类
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delProClass",method=RequestMethod.POST)
	@ResponseBody
	public Object deleteProClass(@RequestBody Integer id) {
		start();
		if(id == null) {
			error(MYCONSTANTS.NULL);
		}else {
			try {
				Integer result = productService.deleteProClass(id);
				if(result == 0 ) {
					error(MYCONSTANTS.DELPROCLASSERROR);
				}
				success(MYCONSTANTS.DELPROCLASS);
			} catch (Exception e) {
				e.printStackTrace();
				error(MYCONSTANTS.DELPROCLASSERROR);
			}
			
		}
		return end();
	}
	
}
