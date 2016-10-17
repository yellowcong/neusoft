package com.yellowcong.dto;

import java.util.List;

import com.yellowcong.model.SelectAnswer;
import com.yellowcong.model.SelectQuestion;
/**
 * 获取所有的数据
 * @author yellowcong
 * @date 2016年10月16日
 *
 */
public class QuestionDto {
	
	private SelectQuestion question;
	
	private List<SelectAnswer> answer;

	public SelectQuestion getQuestion() {
		return question;
	}

	public void setQuestion(SelectQuestion question) {
		this.question = question;
	}

	public List<SelectAnswer> getAnswer() {
		return answer;
	}

	public void setAnswer(List<SelectAnswer> answer) {
		this.answer = answer;
	}
 }
