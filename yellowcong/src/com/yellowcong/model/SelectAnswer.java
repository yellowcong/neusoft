package com.yellowcong.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 选择题的问题的答案
 * @author yellowcong
 * @date 2015年12月27日
 */
@Entity
@Table(name="neusoft_selAnswer")
public class SelectAnswer {
	
	private int id ;
	
	/**
	 * 问题的内容
	 */
	private String content;
	
	/**
	 * 回答所对应的问题 
	 */
	private SelectQuestion question;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@ManyToOne
	@JoinColumn(name="question_id")
	public SelectQuestion getQuestion() {
		return question;
	}

	public void setQuestion(SelectQuestion question) {
		this.question = question;
	}
	
}
