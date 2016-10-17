package com.yellowcong.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yellowcong.model.SelectAnswer;
import com.yellowcong.model.SelectQuestion;
import com.yellowcong.service.SelectAnswerServcice;
import com.yellowcong.service.SelectQuestionServcice;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:ApplicationContext.xml")
public class QuestionTest {
	private SelectQuestionServcice quesService;
	private SelectAnswerServcice ansService;
	
	
	@Resource(name="selectAnswerService")
	public void setAnsService(SelectAnswerServcice ansService) {
		this.ansService = ansService;
	}

	@Resource(name="selectQuestionService")
	public void setQuesService(SelectQuestionServcice quesService) {
		this.quesService = quesService;
	}
	
	@Test
	public void add(){
		SelectAnswer temp = new SelectAnswer();
		temp.setQuestion(this.quesService .load(5));
		temp.setContent("xxx");
		
		this.ansService.add(temp);
	}
	
	@Test
	public void testLoad(){
		SelectAnswer  ans = this.ansService.loadByContent("选中正确答案多选2",12);
		System.out.println(ans.getId());
		
	}
	@Test
	public void testStrS(){
		List<SelectQuestion> ques = this.quesService.getRandomQuestion(4);
		for(SelectQuestion que:ques){
			System.out.println(que.getId());
		}
	}
	@Test
	public void testStr2(){
		List<SelectAnswer> ans = this.ansService.loadByQuestion(12);
		for(SelectAnswer an :ans){
			System.out.println(an.getContent()+""+an.getQuestion().getId());
		}
	}
	@Test
	public void testGetCount(){
		List<SelectQuestion> result = this.quesService .getRandomQuestion(4);
		//.out.println(result.size());
		//System.out.println(result.get(0).getId());
		for(SelectQuestion ques :result){
			System.out.println(ques.getId());
		}
	}
	@Test
	public void testStr(){
		int[] date = randomCommon(0,5,4);
		//System.out.println();
		for (int i : date) {  
	        System.out.println(i);  
	    }  
	}
	/** 
	 * 随机指定范围内N个不重复的数 
	 * 最简单最基本的方法 
	 * @param min 指定范围最小值 
	 * @param max 指定范围最大值 
	 * @param n 随机数个数 
	 */  
	private int[] randomCommon(int min, int max, int n){  
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
