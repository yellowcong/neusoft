package com.yellowcong.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.orm.hibernate3.support.OpenSessionInViewInterceptor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.yellowcong.model.JsonResult;
import com.yellowcong.model.Pager;
import com.yellowcong.model.User;
import com.yellowcong.utils.JsonUtils;
import com.yellowcong.utils.StringUtil;

public class BaseAction<T> {
	
	
	/**
	 * 写json到客户端的公共方法 ,将数据写到Datagrid中
	 * @param response 
	 * @param obj 可以是对象 也可以List集合  
	 */
	public void writeJson(HttpServletResponse response,Object obj){
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			String json = "";
			//如果是 数组 就 调用List集合的方法，如果是对象就直接调用对象的方法
			if(obj.getClass().getName().startsWith("java.util")){
				List<T> list = (List<T>) obj;
				json = JsonUtils.list2DatagridJson(list);
			}else{
				json = JsonUtils.object2Json(obj);
			}
			
			out.write(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 写出Pager 翻页的数据
	 * @param response 
	 * @param obj 可以是对象 也可以List集合
	 */
	public void writePagerJson(HttpServletResponse response,Pager<T> pager){
		try {
			
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			//如果是 数组 就 调用List集合的方法，如果是对象就直接调用对象的方法
			DataGrid<T> grid = new DataGrid<T>();
			grid.setRows(pager.getData());
			grid.setTotal(pager.getRowCount());
			//将Datagrid写 出去
			out.write(JsonUtils.object2Json(grid));
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 将我们的List 写成下拉菜单栏目
	 * @param response
	 * @param list
	 */
	public void write2Box(HttpServletResponse response,List<T> list){
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			//如果是 数组 就 调用List集合的方法，如果是对象就直接调用对象的方法
			//将Datagrid写 出去
			out.write(JsonUtils.object2Json(list));
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public User getLoginUser(HttpServletRequest request){
		User user = (User) request.getSession().getAttribute("loginUser");
		return user;
		
	}
	
	public boolean isAdmin(HttpServletRequest request){
		boolean flag = false;
		User user = (User) request.getSession().getAttribute("loginUser");
		if(user.getRole().getId() ==  36){
			flag = true;
		}
		return flag;
	}
}
