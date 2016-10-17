package com.yellowcong.dao;

import java.util.List;

import com.yellowcong.model.SelectQuestion;

public interface SelectQuestionDao extends BaseDao<SelectQuestion>{
	/**
	 * 获取Questions的数目
	 * @return
	 */
	public int getQuestonsCouont();
	/**
	 * 获取问题的所有ID
	 * @return
	 */
	public List<SelectQuestion> getIds();
}
