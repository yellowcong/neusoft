package com.yellowcong.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yellowcong.dto.QuestionDto;
import com.yellowcong.model.SelectAnswer;
import com.yellowcong.model.SelectQuestion;
import com.yellowcong.service.SelectAnswerServcice;
import com.yellowcong.service.SelectQuestionServcice;
import com.yellowcong.utils.JsonUtils;

@Controller
@RequestMapping("/question")
public class SelectQuestionController {
	
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
	
	/**
	 * 获取数量
	 * @return
	 */
	@RequestMapping(value="/random/{count}",method=RequestMethod.GET)
	public void random(@PathVariable Integer count,HttpServletResponse response){
		
		try {
			List<SelectQuestion> questions =this.quesService .getRandomQuestion(count);
			
			//获取数据的集合
			List<QuestionDto> list = new ArrayList<QuestionDto>();
			
			//循环获取数据
			for(SelectQuestion question:questions){
				//获取到
				List<SelectAnswer> answers = this.ansService.loadByQuestion(question.getId());
				
				//添加
				QuestionDto dto = new QuestionDto();
				dto.setQuestion(question);
				dto.setAnswer(answers);
				
				//添加
				list.add(dto);
			}
			
			
			//往外面写数据
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			String json = JsonUtils.object2Json(list);
			
			//写书记局
			out.write(json);
			out.flush();
			out.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 问题的首页
	 * @return
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(){
		return "question/index";
	}
	
	/**
	 * 问题的首页
	 * @return
	 */
	@RequestMapping(value="/show",method=RequestMethod.GET)
	public String show(){
		return "question/show";
	}
	
	/**
	 * "question":"question",
						"answer":answer.join(","),
						"select":selctAn.join(",")
	 * @param question
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public void add(String question,String answer,String select){
		//System.out.println("问题\t"+question);
		//System.out.println("答案\t"+answer);
		//System.out.println("选中\t"+select);
		
		//获取到数据然后插入到数据库中
		//return "question/show";
		SelectQuestion ques = new SelectQuestion();
		ques.setContent(question);
		ques.setAnswer(select);
		quesService.add(ques);
		
		//然后添加我们的答案
		String[] answers = answer.split(",");
		System.out.println(ques.getId());
		for(String ans:answers){
			//添加问题答案
			SelectAnswer temp = new SelectAnswer();
			temp.setQuestion(this.quesService .load(ques.getId()));
			temp.setContent(ans);
			this.ansService.add(temp);
		}
	}
	
}
