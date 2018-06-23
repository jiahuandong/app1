package com.jhd.app.utils;

import java.util.ArrayList;
import java.util.List;

public class PageList {
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		List<Integer> list = new ArrayList<>();
		list.add(1);
		list.add(2);
		list.add(3);
		list.add(4);
		list.add(5);
		list.add(6);
		list.add(7);
		list.add(8);
		list.add(9);
		
		List<Integer> pageList = getPageList(list,2,10);
		System.out.println(pageList);
		System.out.println(getNumList(10,8));
	}
	/**
	 * 分页数据集合
	 * @param list
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public static <T> List<T> getPageList(List<T> list,Integer pageNo,Integer pageSize) {
		if(list.size() <=0 || list.isEmpty()) {
			return list;
		}
		Integer pageIndex = 0;
		if(pageNo != null && pageNo > 0) {
			pageIndex = pageSize * (pageNo-1);
		}
		if(pageIndex > list.size()) {
			return list;
		}
		List<T> pageList = new ArrayList<>();
		pageList = list.subList(pageIndex,list.size() > (pageIndex+pageSize) ? pageIndex+pageSize:list.size());
		
		return pageList;
	}
	/**
	 * 分页页码集合
	 * @param pageTotal
	 * @param pageSize
	 * @param pageNo
	 * @return
	 */
	public static List<Integer> getNumList(Integer pageTotal,Integer pageNo){
		List<Integer> pageNumList = new ArrayList<>();
		int start;
		int end;
		if(pageTotal <= 0) {
			return pageNumList;
		}
		if(pageTotal <= 5) {
			start = 1;
			end = pageTotal;
		}else if(pageNo <= 3){
			start = 1;
			end = 5;
		}else if(pageNo >= pageTotal-2 && pageNo <= pageTotal) {
			start = pageTotal-4;
			end = pageTotal;
		}else if(pageNo > pageTotal){
			start = pageTotal-4;
			end = pageTotal;
		}else {
			start = pageNo - 2;
			end = pageNo + 2;
		}
		for(int i = start; i<= end;i++) {
			pageNumList.add(i);
		}
		return pageNumList;
	}
	
	public static Integer getPageTotal(Integer count,Integer pageSize) {
		return count % pageSize > 0 ? count / pageSize + 1 : count / pageSize ;
	}
}
