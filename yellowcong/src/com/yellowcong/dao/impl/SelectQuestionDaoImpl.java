package com.yellowcong.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yellowcong.dao.SelectQuestionDao;
import com.yellowcong.model.SelectQuestion;

/**
 * 
 * @author yellowcong
 * @date 2016年10月16日
 *
 */
@Repository("selectQuestionDao")
public class SelectQuestionDaoImpl extends BaseDaoImpl<SelectQuestion> implements SelectQuestionDao{
	/**
	 * 获取Questions的数目
	 * @return
	 */
	public int getQuestonsCouont(){
		return Integer.parseInt(this.getSession().createSQLQuery("select count(*) from neusoft_selQuestion").uniqueResult().toString());
	}

	@Override
	public List<SelectQuestion> getIds() {
		// TODO Auto-generated method stub
		return this.getSession().createQuery("select new SelectQuestion(id) from SelectQuestion").list();
		
	}
	
	
}
