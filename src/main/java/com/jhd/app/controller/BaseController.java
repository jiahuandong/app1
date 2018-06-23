package com.jhd.app.controller;

import java.util.HashMap;
import java.util.Map;

public class BaseController {
	private ThreadLocal<Map<String, Object>> datas = new ThreadLocal<Map<String, Object>>();

	protected void start() {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		datas.set(resultMap);
	}

	protected Object end() {
		Map<String, Object> resultMap = datas.get();
		datas.remove();
		return resultMap;
	}

	protected void success() {
		Map<String, Object> resultMap = datas.get();
		resultMap.put("success", true);
	}
	
	protected void success(String msg) {
		Map<String, Object> resultMap = datas.get();
		resultMap.put("success", true);
		resultMap.put("message", msg);
	}

	protected void param(String key, Object val) {
		Map<String, Object> resultMap = datas.get();
		resultMap.put(key, val);
	}

	protected void error() {
		Map<String, Object> resultMap = datas.get();
		resultMap.put("success", false);
	}
	
	protected void error(String msg) {
		Map<String, Object> resultMap = datas.get();
		resultMap.put("success", false);
		resultMap.put("message", msg);
	}
}
