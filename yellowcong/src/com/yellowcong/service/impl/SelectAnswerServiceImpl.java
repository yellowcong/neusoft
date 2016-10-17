package com.yellowcong.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yellowcong.dao.SelectAnswerDao;
import com.yellowcong.model.SelectAnswer;
import com.yellowcong.model.User;
import com.yellowcong.service.SelectAnswerServcice;

@Service("selectAnswerService")
public class SelectAnswerServiceImpl implements SelectAnswerServcice{
	
	private SelectAnswerDao dao ;
	
	@Resource(name="selectAnswerDao")
	public void setDao(SelectAnswerDao dao) {
		this.dao = dao;
	}

	@Override
	public SelectAnswer add(SelectAnswer answer) {
		
		return this.dao.add(answer);
	}

	@Override
	public void delete(int id) {
		
		this.dao.delete(id);
	}

	@Override
	public SelectAnswer loadByContent(String content,int questionId) {
		Object [] arrs = {content,questionId};
		return (SelectAnswer)this.dao.executeQuery("from SelectAnswer where content = ? and question.id = ?",arrs);
		
	}

	@Override
	public List<SelectAnswer> loadByQuestion(int qId) {
		// TODO Auto-generated method stub
		Object obj = qId;
		
		List<SelectAnswer> answers = this.dao.list("from SelectAnswer where question.id = ?",obj);
		List<SelectAnswer> temp = new ArrayList<SelectAnswer>();
		
		//获取随机数，打乱顺序
		int [] ids = this.shuffle(answers.size());
		for(int id:ids){
			temp.add(answers.get(id));
		}
		
		//返回结果
		return temp;
	}
	
	/**
	 * 获取排序后的问题
	 * @param n
	 * @return 
	 * @return
	 */
	private int[] shuffle(int size){ 
		int [] x = new int[size];
		for(int index=0;index<size;index++){
			x[index] = index;
		}
		
        List list = new ArrayList();  
        for(int i = 0;i < x.length;i++){  
            System.out.print(x[i]+", ");  
            list.add(x[i]);  
        }  
        System.out.println();  
          
        Collections.shuffle(list);  
          
        Iterator ite = list.iterator();  
        int [] temp = new int[size];
        int index = 0;
        while(ite.hasNext()){ 
        	temp[index] = Integer.parseInt(ite.next().toString());
        	index = index+1;
        }  
        return temp;
    } 
	

}
