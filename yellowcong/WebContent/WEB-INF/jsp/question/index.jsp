<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>试题添加</title>
<meta name="viewport" content="width=device-width,inittial-scale=1.0"></meta>
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![end if]-->
<!-- bootstrap 的样式 -->
<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.css"/>
<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/resources/css/yellowcong.easyui.css"/>
<link type="image/x-icon"
		href="<%=request.getContextPath()%>/resources/img/login/logo.jpg"
		rel="shortcut icon" />
		<!-- 字符的样式 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/font/css/font-awesome.css" type="text/css" /> 

<!-- 加载js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.yellowcong.easyui.js"></script>
<!-- 
jquery.yellowcong.easyui.min.js
 -->
 <script type="text/javascript" name="baidu-tc-cerfication" data-appid="8085176" src="http://apps.bdimg.com/cloudaapi/lightapp.js"></script> 
<!-- 加载js -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		var projectName = $("#pathNow").val();
		//定义一个navtop
		$(".my_head").navTop({names:[{href:'#',title:'首页',select:true},
	             				{href:'#',title:'前端开发'},
	            				{href:'#',title:'后端开发'},
	            				{href:'#',title:'云计算'},
	            				{href:'#',title:'大数据'},
	            				{href:'#',title:'虚拟化'},
	            				{href:'#',title:'登录',tips:true},
	            				{href:projectName+'/jianli.jsp',title:'站长>>',tips:true}],
	            		logo:projectName+"/resources/img/login/logo.jpg",
	            		cname:"yellowcongの博客"});
		
		$(".nav_page_left").navPage2({
			
			title:"我的后台",
			//大的菜单名称,多级菜单 name访问的url
			menus:[{name:"题库添加",url:"#",
				//二级子标题 name ,访问的url
				   sub:[]
					},
					{name:"随机考试",url:"#",
						//二级子标题 name ,访问的url
						   sub:[]
				  },
				  {name:"查看我的试卷",url:"#",
						//二级子标题 name ,访问的url
						   sub:[]
				  },
				  {name:"关于",url:"#",
						//二级子标题 name ,访问的url
						   sub:[]
				  },
			]
		});
		
		//脚步数据
	 	
	 	$(".my_foot").psgsFoot({
			
			infos:[
			  [{name:"关于yellowcong",url:"#",title:true},{name:"关于站长",url:"#"},{name:"联系站长",url:"#"},{name:"关于站长",url:"#"},{name:"关于站长",url:"#"}],
			  [{name:"网站服务",url:"#",title:true},{name:"关于站长",url:"#"},{name:"联系站长",url:"#"},{name:"关于站长",url:"#"},{name:"关于站长",url:"#"}],
			  [{name:"网站服务",url:"#",title:true},{name:"关于站长",url:"#"},{name:"联系站长",url:"#"},{name:"关于站长",url:"#"},{name:"关于站长",url:"#"}]
			],
			address:"黑龙江科技大学",
			company:"黑龙江科技大学",
			phone:"18604600631",
			email:"717350389@qq.com",
			codeImg:"/yellowcong/resources/img/qq_code.jpg"
		});
	});
</script>

<!-- 这个是中间数据显示样式 -->
<style type="text/css">
	body{
		
	}
	.nav_page_left{
		float: left;
		margin-top: 20px;
	}
	.nav_pages_right{
		margin-top:20px;
		margin-left: 20px;
		width: 770px;
		float:left;
	}
</style>

<!-- 多选题的显示风格 -->
<style type="text/css">
	
	.question_title {
		border: 1px solid #dbdbdb;
		padding-left: 20px;
		padding-top: 10px;
		padding-bottom: 10px;
		
	}
	.question_title {
		text-align: center;
	}
	
	.question{
		margin-top:10px;
		border: 1px solid #dbdbdb;
		padding-left: 20px;
		padding-top: 10px;
	}
	
	.question a {
		text-decoration: none;
	}
	
	/*设定问题的显示风格*/
	.question ul{
		padding-top:20px;
	   margin-left:0px;
	   padding-left:0px;
	   list-style: none;
	   
	}
	.question .title{
	  
	   font-size: 14px;
	    padding-bottom:5px;
	}
	
	.question .title input{
		margin-left: 20px;
		width: 650px;
		margin-top: -30px;
	}
	
	.question .answer{
		padding-left: 10px;
		font-size: 13px;
		margin-top:10px;
		height:40px;
		vertical-align: middle;
	}
	
	.sel_question .deleteRow{
		float:right;
		margin-top: -35px;
		margin-right: 10px;
		display: none;
		
	}
	.question .answer .answer_input{
		width:620px;
		margin-top:-25px;
		margin-left: 40px;
	}
	.question .answer span{
		margin-left:10px;
		height: 25px;
	}
	
	.submit_content {
		margin-top: 10px;
		margin-bottom: 10px;
		
	}
	
	.question_input_type input{
		margin-top:-10px;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		
		var hasFocus = false
		//每个题目删除的方法
		function showDeleteSpan(){
			$(".title").hover(
					function(){
					$(this).find(".deleteRow").show();
				}
			,function(){
					$(this).find(".deleteRow").hide();
				}
			); 
		}
		
		//删除行的操作
		function deleteRow(){
			//行删除的操作
			$(".delRowBtn").click(function(){			
				if($(this).parent().parent().html().indexOf("qusTitle") >0){
					$(this).parent().parent().parent().remove();
				}else{	
					$(this).parent().parent().remove();
				}
				return false;
			});
		}
		
		//显示删除行的span
		function showDeleteAnswerSpan(){
			//选项里面的
			$(".answer").hover(function(){
					$(this).find(".deleteRow").show();
				}
				,function(){
					$(this).find(".deleteRow").hide();
				}
			);
		}
		
		//添加选择的行
		function addSelectRows(){
			//添加行的操作
			$(".sel_question .add_option_btn").click(function(){
				//console.log($(this).parent().parent().parent().html());
				
				//添加的类容是和前面的一样
				if($(this).parent().parent().parent().html().indexOf("radio") >0){
					var name = $(this).parent().parent().parent().find("input:radio:first").attr("name");
					$(this).parent().parent().prepend("<li class=\"answer\"><input type=\"radio\" name='"+name+"'><span><input type=\"text\" class=\"form-control answer_input\"  placeholder=\"请输入答案内容\"/></span><span class=\"deleteRow\"><a href=\"#\" class=\"btn btn-danger delRowBtn\">删除 </a></span></input></li>");
				}else{
					var name = $(this).parent().parent().parent().find("input:checkbox:first").attr("name");
					$(this).parent().parent().prepend("<li class=\"answer\"><input type=\"checkbox\" name='"+name+"'><span><input type=\"text\" class=\"form-control answer_input\"  placeholder=\"请输入答案内容\"/></span></input><span class=\"deleteRow\"><a href=\"#\"  class=\"btn btn-danger delRowBtn\">删除 </a></span></li>");
				}
				$(this).parent().parent().prepend();
				
				//添加显示可一的情况
				$(".answer").hover(function(){
						$(this).find(".deleteRow").show();
					}
					,function(){
						$(this).find(".deleteRow").hide();
					}
				);
				//显示删除行的span
				showDeleteAnswerSpan();
				
				//删除行的操作
				deleteRow();
				
				return false;
			});
		}
		
		
		
		//窗口初始化操作
		function initForm(){
			showDeleteSpan();
			
			deleteRow();
			
			showDeleteAnswerSpan();
			
			addSelectRows();
		}
		
		//初始化Form的js
		initForm();
		
		//添加Rows
		$("#sigSel").click(function(){
			 
			var name = new Date().getTime()+"_name";
		
			//var name ="xxx"
			$(".sel_question:last").parent().append(
					"<ul class=\"sel_question\">"+
					"<li class=\"title \">"+($(".sel_question").size()+1)+". <input type=\"text\" class=\"form-control qusTitle\"   placeholder=\"请输入题目名称\"/><span class=\"deleteRow\"><a href=\"#\"  class=\"btn btn-danger delRowBtn\">删除 </a></span></li>"+
					"<li class=\"answer\"><input type=\"radio\" checked=\"true\" name='"+name+"'><span><input type=\"text\" class=\"form-control answer_input\"  placeholder=\"请输入答案内容\"/></span></input><span></span><span class=\"deleteRow\"><a href=\"#\"  class=\"btn btn-danger delRowBtn\">删除 </a></span></li>"+
					"<li  class=\"answer\"><input type=\"radio\" name='"+name+"'><span><input type=\"text\" class=\"form-control answer_input\"  placeholder=\"请输入答案内容\"/></span><span class=\"deleteRow\"><a href=\"#\"  class=\"btn btn-danger delRowBtn\">删除 </a></span></input></li>"+
					"<li class=\"answer\"><input type=\"radio\" name='"+name+"'><span><input type=\"text\" class=\"form-control answer_input\"  placeholder=\"请输入答案内容\"/></span><span class=\"deleteRow\"><a href=\"#\"  class=\"btn btn-danger delRowBtn\">删除 </a></span></input></li>"+
					"<li class=\"answer\"><input type=\"radio\" name='"+name+"'><span><input type=\"text\" class=\"form-control answer_input\"  placeholder=\"请输入答案内容\"/></span><span class=\"deleteRow\"><a href=\"#\" class=\"btn btn-danger delRowBtn\">删除 </a></span></input></li>"+
					"<div class=\"submit_content\">"+
					"<center><a href= \"#\" class=\"btn btn-primary add_option_btn\" >添加选项</a></center>"+
					"</div>"+
					"</ul>"
					
			);
			
			initForm();
			return false;
			
		});
		
		
		
		//mulSel
		$("#mulSel").click(function(){
			var name = new Date().getTime()+"_name";
			
			$(".sel_question:last").parent().append(
					"<ul class=\"sel_question\" >"+
					"<li class=\"title\">"+($(".sel_question").size()+1)+". <input type=\"text\" class=\"form-control qusTitle\"   placeholder=\"请输入题目名称\"/><span class=\"deleteRow\"><a href=\"#\"  class=\"btn btn-danger delRowBtn\">删除 </a></span></li>"+
					"<li class=\"answer\"><input type=\"checkbox\"  name='"+name+"'><span><input type=\"text\" class=\"form-control answer_input\" type=\"checkbox\"  placeholder=\"请输入答案内容\"/></span><span class=\"deleteRow\"><a href=\"#\"  class=\"btn btn-danger delRowBtn\">删除 </a></span></lable></li>"+
					"<li  class=\"answer\"><input type=\"checkbox\" name='"+name+"' ><span><input type=\"text\" class=\"form-control answer_input\"  placeholder=\"请输入答案内容\"/></span><span class=\"deleteRow\"><a href=\"#\"  class=\"btn btn-danger delRowBtn\">删除 </a></span></input></li>"+
					"<li class=\"answer\"><input type=\"checkbox\" name='"+name+"'><span><input type=\"text\" class=\"form-control answer_input\"  placeholder=\"请输入答案内容\"/></span></input><span class=\"deleteRow\"><a href=\"#\"  class=\"btn btn-danger delRowBtn\">删除 </a></span></li>"+
					"<li class=\"answer\"><input type=\"checkbox\" name='"+name+"'><span><input type=\"text\" class=\"form-control answer_input\"  placeholder=\"请输入答案内容\"/></span></input><span class=\"deleteRow\"><a href=\"#\"  class=\"btn btn-danger delRowBtn\">删除 </a></span></li>"+
					"<div class=\"submit_content\">"+
					"<center><a href= \"#\" class=\"btn btn-primary add_option_btn\" >添加选项</a></center>"+
					"</div>"+
					"</ul>"
			);
			
			initForm();
			
			return false;
			
		});
		
		//点击添加的问题
		$("#question_sub").click(function(){
			//console.log("xx");
			//console.log($(".sel_question").html());
			$.each($(".sel_question"),function(key,val){
				//console.log($(val).html());
				//通过post 提交数据
				
				//一个题目，一个题目的提交
				//获取题目
				var question =$(val).find("li:first").find("input:text").val();
				
				//多个问题
				//var result = new Array()
				//答案
				var answer=new Array()
				var selctAn = new Array();
				//console.log("答案的个数："+$(val).find(".answer").size());
				var index  = 0
				$.each($(val).find(".answer"),function(i,rows){
					
					//console.log($(rows).html());
					//选中的数据
					var anStr = $(rows).find(".answer_input").val();
					if($(rows).find("input:radio").is(':checked')){
						selctAn[index] = anStr
					}
					
					if($(rows).find("input:checkbox").is(':checked')){
						selctAn[index] = anStr
						//console.log("序号"+index);
						index = index+1;
					}
				
					//获取答案
					answer[i] = anStr 
				})
				//答案和数据
				console.log(answer.join(","));
				console.log(selctAn.join(","));
				console.log("url"+$("#pathNow").val()+"/question/add");
				
				$.post($("#pathNow").val()+"/question/add",
						{
						"question":question,
						"answer":answer.join(","),
						"select":selctAn.join(",")
						},function(result){
						
				});
				answer = null;
				selctAn = null;
				//timu 
				//xuan xiang 
				//daan
			})
			return false;
		});
	});
</script>
</head>
<body>
<input type="hidden" id="pathNow" value="<%=request.getContextPath()%>"/>	
<!-- 这个是我们的首页导航栏目 -->
<div class="my_head"></div>
<div class="container">
	<div class="nav_page_demo">
	</div>
<div class="nav_page_left"></div>
	
<div class="nav_pages_right">
	<div class="question_title"><div>Neusfot试题添加</div></div>
	<div class="question">
		<form >
		<ul class="sel_question">
			<li class="title ">1. <input type="text" class="form-control qusTitle"   placeholder="请输入题目名称"/><span class="deleteRow"><a href="#"  class="btn btn-danger delRowBtn">删除 </a></span></li>
			<li class="answer"><input type="radio" checked="true" name="title1"><span><input type="text" class="form-control answer_input"  placeholder="请输入答案内容"/></span></input><span></span><span class="deleteRow"><a href="#"  class="btn btn-danger delRowBtn">删除 </a></span></li>
			<li  class="answer"><input type="radio" name="title1"><span><input type="text" class="form-control answer_input"  placeholder="请输入答案内容"/></span><span class="deleteRow"><a href="#"  class="btn btn-danger delRowBtn">删除 </a></span></input></li>
			<li class="answer"><input type="radio" name="title1"><span><input type="text" class="form-control answer_input"  placeholder="请输入答案内容"/></span><span class="deleteRow"><a href="#"  class="btn btn-danger delRowBtn">删除 </a></span></input></li>
			<li class="answer"><input type="radio" name="title1"><span><input type="text" class="form-control answer_input"  placeholder="请输入答案内容"/></span><span class="deleteRow"><a href="#" class="btn btn-danger delRowBtn">删除 </a></span></input></li>
			<div class="submit_content">
			<center><a href= "#" class="btn btn-primary add_option_btn" >添加选项</a></center>
			</div>
		</ul>
		<ul class="sel_question" >
			<li class="title">2. <input type="text" class="form-control qusTitle"   placeholder="请输入题目名称"/><span class="deleteRow"><a href="#"  class="btn btn-danger delRowBtn">删除 </a></span></li>
			<li class="answer"><input type="checkbox" checked="true"><span><input type="text" class="form-control answer_input" type="checkbox"  placeholder="请输入答案内容"/></span><span class="deleteRow"><a href="#"  class="btn btn-danger delRowBtn">删除 </a></span></lable></li>
			<li  class="answer"><input type="checkbox" checked="true"><span><input type="text" class="form-control answer_input"  placeholder="请输入答案内容"/></span><span class="deleteRow"><a href="#"  class="btn btn-danger delRowBtn">删除 </a></span></input></li>
			<li class="answer"><input type="checkbox"><span><input type="text" class="form-control answer_input"  placeholder="请输入答案内容"/></span></input><span class="deleteRow"><a href="#"  class="btn btn-danger delRowBtn">删除 </a></span></li>
			<li class="answer"><input type="checkbox"><span><input type="text" class="form-control answer_input"  placeholder="请输入答案内容"/></span></input><span class="deleteRow"><a href="#"  class="btn btn-danger delRowBtn">删除 </a></span></li>
			<div class="submit_content">
			<center><a href= "#" class="btn btn-primary add_option_btn" >添加选项</a></center>
			</div>
		</ul>
		
		
		</form>
		
		<!--单选和多选的添加 -->
		<div class="submit_content question_input_type">
		<center><input class="btn btn-info submit_btn" type="button" id="sigSel" value="单选试题"/><span style="font-size:20px;">/</span>
				<input class="btn btn-primary btn-success" type="button" id="mulSel" value="多选试题"/>
		</center>
		</div>
	
	</div>
	
	<div class="submit_content">
		<center><input class="btn btn-primary submit_btn" type="button" id="question_sub"  value="添加题目"/></center>
	</div>
	<form role="form">
  

</form>
</div>

</div>
<div class="my_foot"></div>
</body>
</html>
