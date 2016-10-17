package com.yellowcong.service;

import java.util.List;

import com.yellowcong.model.SelectQuestion;

/**
 * 选择题的接口
 * @author yellowcong
 * @date 2016年10月16日
 *
 */
public interface SelectQuestionServcice {
	
	/**
	 * 添加问题
	 * @param question
	 */
	public SelectQuestion add(SelectQuestion question);
	
	/**
	 * 更新问题
	 * @param question
	 */
	public void update(SelectQuestion question);
	
	/**
	 * 加载问题
	 * @param question
	 */
	public SelectQuestion load(int id );

	/**
	 * 随机的获取我们的题目
	 * @param count
	 * @return
	 */
	public List<SelectQuestion> getRandomQuestion(int count);
}
