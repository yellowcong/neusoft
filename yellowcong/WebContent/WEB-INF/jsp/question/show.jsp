<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>开始考试</title>
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
	/*设定问题的显示风格*/
	.question ul{
	   margin-left:0px;
	   padding-left:0px;
	   list-style: none;
	   
	}
	.question .title{
	  
	   font-size: 14px;
	    padding-bottom:5px;
	}
	
	.question .answer{
		padding-left: 10px;
		font-size: 13px;
		height:25px;
		vertical-align: middle;
	}
	
	.question .answer span{
		margin-left:10px;
		height: 25px;
	}
	
	.submit_content {
		margin-top: 10px;
		margin-bottom: 10px;
		
	}
	
	.nav_pages_right a{
		text-decoration: none;
	}
	
</style>
<script type="text/javascript">
$(function(){
	$("#showQuestoin").click(function(){
		var count = $(".question_title").find("input:text").val();
		//console.log(count);
		//获取数据
		$.get($("#pathNow").val()+"/question/random/"+count,function(result){
			//console.log(result);
			var obj = JSON.parse(result); 
			console.log(obj);
			//添加题目
			$.each(obj,function(key,val){
				
				//题目名称
				var question = val.question.content;
				
				var answers =val.answer;
				//结果
				$.each(answers,function(i,answer){
					console.log();
				});
			}); 
		});
		//question
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
	<div class="question_title"><div>Neusfot第一次试验</div></div>
	<div class="question_title" style="margin-top:20px;"><div><input class="form-control" name="question" type="text"/><a href="#" id="showQuestoin" class="btn  btn-primary" >随机抽题</a></div></div>
	<div class="question">
		<ul class="sel_question">
			<li class="title">1. 你是SB吗</li>
			<li class="answer"><input type="radio" name="title1"><span>A.xxxxx</span></input></li>
			<li  class="answer"><input type="radio" name="title1"><span>B.xxxxx</span></input></li>
			<li class="answer"><input type="radio" name="title1"><span>C.xxxxx</span></input></li>
		</ul>
		<ul class="sel_question">
			<li class="title">1. 你是SB吗</li>
			<li class="answer"><input type="radio" name="title2"><span>A.xxxxx</span></input></li>
			<li  class="answer"><input type="radio" name="title2"><span>B.xxxxx</span></input></li>
			<li class="answer"><input type="radio" name="title2"><span>C.xxxxx</span></input></li>
		</ul>
		<ul class="sel_question">
			<li class="title">1. 你是SB吗</li>
			<li class="answer"><input type="checkbox"><span>A.xxxxx</span></input></li>
			<li  class="answer"><input type="checkbox"><span>B.xxxxx</span></input></li>
			<li class="answer"><input type="checkbox"><span>C.xxxxx</span></input></li>
			<li class="answer"><input type="checkbox"><span>C.xxxxx</span></input></li>
		</ul>
		
		
	</div>
	
	<div class="submit_content">
		<center><input class="btn btn-primary submit_btn" type="button"  value="提交试卷"/></center>
	</div>
</div>

</div>
<div class="my_foot"></div>
</body>
</html>
