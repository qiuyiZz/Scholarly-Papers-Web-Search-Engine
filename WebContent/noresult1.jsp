<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>iSearch学术_Result</title>
 <link href="/SearchEngine/static/css/style.css" rel="stylesheet" type="text/css" />
<link href="/SearchEngine/static/css/result.css" rel="stylesheet" type="text/css" /> 


<style type="text/css">
		html, body, h1, h2, h3, h4, h5, h6, p, img, ol, ul, li, form, table, tr, th, td {
		    border: 0;
		    border-collapse: collapse;
		    border-spacing: 0px;
		    list-style: none;
		    margin: 0;
		    padding: 0;
		    font: 20px/normal Arial,Helvetica;
		}
		body{
		    min-width: 1089px;
		}
		body{
			/* overflow:hidden; */
			background-image:url('/SearchEngine/header2.png');
			background-attachment: fixed;
			background-size:cover;
			background-repeat:no-repeat;
			overflow:scorll;
		}
		a:link,a:visited{
			 text-decoration:none;  /*超链接无下划线*/
		}
		a{color:#34538b;}
         #Searchresult{width:1000px; padding:20px 20px 20px 50px; background:#f0f3f9;} 
		#container{
			margin:5px 30px;
		    padding:5px 30px;
		}
		#head{
			height:100px;
			color:white;
			font-size:large;
			text-align:left;
			vertical-align:middle;
			margin-left:20px;
		}
		.back{
			font-size:50px;
			font-family:'SimHei';
			font-weight:bold;
			line-height:100px;
			position:relative;
		}
		#b_content {
			line-height: 18px;
		    clear: both;
		    min-height: 316px;
		    padding: 41px 0 20px 0;
		    background-color:white;
		    color: #666;
		}
		main{
			display: inline;
		}
		#b_tween{
			margin-top: -22px;
			font-size: 12px;
			height: 30px;
			padding-left: 20px;
		}
		.b_results {
		    width: 648px;
		    display: inline-block;
		}
		.b_results .result_Item{
			margin-bottom:20px;
		}
		/*搜索内容主体*/
		.b_results .result_ItemText{margin-bottom:5px;line-height:18px;width:90%;}
		.b_results .result_ItemFlag{color:#008000;}
		.b_results .result_ItemFlag .info{margin-right:10px;}

		.b_results .result_ItemHead{
			margin-bottom:5px;color:#767676;
		}
		.b_results .result_ItemHead a.title{font-size:16px;color:#0080cc;text-decoration:underline;}
		.b_results .result_ItemHead .result_ItemScore{color:#008000;font-size:12px;
		font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;
		color:#d8d8d8;}
		
		/*翻页*/
		#nextPage{
		    font: 14px arial;
		    white-space: nowrap;
		    padding: 0 0 0 228px;
		    text-align: center;
		    background: #fff;
		    word-wrap: break-word;
		    word-break: break-word;	
		}
		#nextPage a, #nextPage strong {
		    display: inline-block;
		    vertical-align: text-bottom;
		    height: 60px;
		    text-align: center;
		    line-height: 34px;
		    text-decoration: none;
		    overflow: hidden;
		    margin-right: 9px;
		    background: #fff;
		}
		
		footer{
		    background: #333;
		    line-height: 1.5;
		    width: 100%;
		    color: #fff;
		    position: relative;
		    vertical-align: top;
		    width: 100%;
			margin: 0 auto;
			display: inline-block;
		}
		h4{
			font-size:25px;	
			margin-bottom: 10px;
		}
		p{
			font-size:18px;	
			font-family:"宋体";
			line-height: 2.2;
		}
		.foot{
			background: black;
			text-align:center;
		}
	</style>
<script type="text/javascript" src="/SearchEngine/static/js/jquery.min.js"></script>

<!-- <script type="text/javascript" src="/SearchEngine/static/js/global.js"></script> -->


	

</head>
<body>


<div id="container">
	<!--标题 返回主页 -->
	<div id="head">
	    <a class="back" title="返回主页" alt="打开主页" href="/SearchEngine/index1.jsp" style="color:white">iSearch学术</a>
    </div>
    
    <!-- 展示内容 -->
	<div id="b_content">
		<main aria-label="搜索结果">
			
			
			
			<span class="info">未找到相关内容</span>
		
		</main>
		

 
	</div>
	
	<!-- 页脚 小组成员 -->
	<footer>
		<div class="footcon">
			<br/>
			<br/>
			<h4>&nbsp;&nbsp;关于我们</h4>
			<br/>
			<p>&nbsp;&nbsp;小组成员</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信息管理17 高瑶</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信息管理17 张秋怡</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信息管理17 马琛</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计算机科学17 汪浩</p>
			<br/>
			<p class="foot">----信息组织检索 2019 冬----</p>
		</div>
	</footer>
</div>
 

</body>

</html>