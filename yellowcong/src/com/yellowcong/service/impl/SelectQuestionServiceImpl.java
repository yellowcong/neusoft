package com.yellowcong.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yellowcong.dao.SelectQuestionDao;
import com.yellowcong.model.SelectQuestion;
import com.yellowcong.service.SelectQuestionServcice;

@Service("selectQuestionService")
public class SelectQuestionServiceImpl implements SelectQuestionServcice{
	
	private SelectQuestionDao dao ;
	
	@Resource(name="selectQuestionDao")
	public void setDao(SelectQuestionDao dao) {
		this.dao = dao;
	}

	@Override
	public SelectQuestion add(SelectQuestion question) {
		this.dao.add(question);
		return question;
	}

	@Override
	public void update(SelectQuestion question) {
		this.dao.update(question);
	}

	@Override
	public SelectQuestion load(int id) {
		return this.dao.load(id);
	}

	@Override
	public List<SelectQuestion> getRandomQuestion(int count) {
		//System.out.println(this.dao.getQuestonsCouont());
		if (count >this.dao.getQuestonsCouont()){
			throw new  RuntimeException("超过了最大的题目数");
		}
		
		//然后获取到ID ，然后随机生成数据
		List<SelectQuestion> ques = this.dao.getIds();
		int [] ids = new int[ques.size()];
		int index = 0 ;
		for(SelectQuestion que:ques){
			ids[index] = que.getId();
			index =index+1;
		}
		
		int [] newIds = this.randomCommon(0, ids.length, count);
		
		List<SelectQuestion>  result= new ArrayList<SelectQuestion>();
		for(int id:newIds){
			result.add(this.load(ids[id-1]));
		}
		
		return result;
	}	
	 
	
	/** 
	 * 随机指定范围内N个不重复的数 
	 * 最简单最基本的方法 
	 * @param min 指定范围最小值 
	 * @param max 指定范围最大值 
	 * @param n 随机数个数 
	 */  
	private int[] randomCommon(int min, int max, int n){
		max = max+1;
	    if (n > (max - min + 1) || max < min) {  
	           return null;  
	       }  
	    int[] result = new int[n];  
	    int count = 0;  
	    while(count < n) {  
	        int num = (int) (Math.random() * (max - min)) + min;  
	        boolean flag = true;  
	        for (int j = 0; j < n; j++) {  
	            if(num == result[j]){  
	                flag = false;  
	                break;  
	            }  
	        }  
	        if(flag){  
	            result[count] = num;  
	            count++;  
	        }  
	    }  
	    return result;  
	}  

}
