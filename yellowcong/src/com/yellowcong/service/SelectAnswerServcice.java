package com.yellowcong.service;

import java.util.List;

import com.yellowcong.model.SelectAnswer;
import com.yellowcong.model.User;

/**
 * 选择题答案的接口
 * @author yellowcong
 * @date 2016年10月16日
 *
 */
public interface SelectAnswerServcice {
	/**
	 * 添加对象
	 * @param user
	 * @return
	 */
	public SelectAnswer add(SelectAnswer selectAnswer);
	/**
	 * 通过id来删除数据
	 * @param id
	 */
	public void delete(int id);
	
	/**
	 * 通过名称来加载我们的数据
	 * @param content
	 * @return
	 */
	public SelectAnswer loadByContent(String content,int questionId);
	
	/**
	 * 通过question 的id来加载数据
	 * @param qId
	 * @return
	 */
	public List<SelectAnswer> loadByQuestion(int qId);
}
