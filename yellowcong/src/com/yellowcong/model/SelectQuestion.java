package com.yellowcong.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Index;

/**
 * 选择题
 * @author yellowcong
 * @date 2016年10月16日
 */
@Entity
@Table(name="neusoft_selQuestion")
public class SelectQuestion {
	
	private int id ;
	
	/**
	 * 题目的名称
	 */
	private String content;
	
	/**
	 * 答案,存的是答案的ID,通过逗号（,）分割
	 */
	private String answer;

	public SelectQuestion() {
		super();
	}

	public SelectQuestion(int id) {
		super();
		this.id = id;
	}

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Index(name="content")
	@Column(name="content")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name="answer")
	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
