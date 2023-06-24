<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  <%@ page import="Search.result"%>
<%--     <%@ page import="net.sf.json.*"%> --%>
     <%@ page import=" com.alibaba.fastjson.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>iSearch学术_Result</title>
<!-- <link href="/SearchEngine/static/css/style.css" rel="stylesheet" type="text/css" />
<link href="/SearchEngine/static/css/result.css" rel="stylesheet" type="text/css" /> -->
<link href="/SearchEngine/static/css/pagination.css" rel="stylesheet" type="text/css"> 

<style type="text/css">
		html, body, h1, h2, h3, h4, h5, h6, p, img, ol, ul, li, form, table, tr, th, td {
		    border: 0;
		    border-collapse: collapse;
		    border-spacing: 0px;
		    list-style: none;
		    margin: 0;
		    padding: 0;
		    font: 13px/normal Arial,Helvetica;
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
         #Searchresult{width:1300px; padding:20px 20px 20px 50px; background:#f0f3f9;} 
		#container{
			margin:5px 30px;
		    padding:5px 30px;
		    width:1400px;
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
		 .result_ItemScore{color:#008000;font-size:12px;
		font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;
		color:#8B8B7A;}
		
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
		.change{
		color:white;
		padding-left: 60px;
		}
		.rtext{
	width:90%;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
	
		}
	</style>
<script type="text/javascript" src="/SearchEngine/static/js/jquery.min.js"></script>

<script type="text/javascript" src="/SearchEngine/static/pdfjs/build/pdf.js"></script>
<!-- <script type="text/javascript" src="/SearchEngine/static/js/global.js"></script> -->
<!-- <script type="text/javascript" src="/SearchEngine/static/js/pagination.js"></script> -->
<script type="text/javascript" src="/SearchEngine/static/js/jquery.pagination.js"></script>
<script type="text/javascript">
$(function(){
	//总数目
	var length = $("#hiddenresult .show").length;
	/* alert(length); */
	//从表单获取分页元素参数
	var optInit = getOptionsFromForm();
	$("#Pagination").pagination(length, optInit);
	
	// 按钮事件
	$("#setoptions").click(function(){
		var opt = getOptionsFromForm();
		// 重新创建分页参数
		$("#Pagination").pagination(length, opt);
	}); 	
	//-----------------------------------
	function getOptionsFromForm(){
		var opt = {callback: pageselectCallback};
		// 从文本域中收集参数 - 这些空间名与参数名相对应
		$("input:text").each(function(){
			opt[this.name] = this.className.match(/numeric/) ? parseInt(this.value) : this.value;
		});
		//避免demo重引入HTML
		var htmlspecialchars ={ "&":"&amp;", "<":"&lt;", ">":"&gt;", '"':"&quot;"}
		$.each(htmlspecialchars, function(k,v){
			opt.prev_text = opt.prev_text.replace(k,v);
			opt.next_text = opt.next_text.replace(k,v);
		})
		return opt;
	}
	//-------------------------------
	function pageselectCallback(page_index, jq){
		// 从表单获取每页的显示的列表项数目
		var items_per_page = $("#items_per_page").val();
		var max_elem = Math.min((page_index+1) * items_per_page, length);
		
		$("#Searchresult").html("");
		// 获取加载元素
		for(var i=page_index*items_per_page;i<max_elem;i++){
			$("#Searchresult").append($("#hiddenresult .show:eq("+i+")").clone());
		}
		//阻止单击事件
		return false;
	}
});
</script>
	

</head>
<body>
 <%  

   int num=Integer.parseInt(request.getAttribute("newsNum").toString());
   String jsonStringrr=request.getAttribute("array").toString();
  /*  System.out.println( jsonStringrr); */
 
 
 %> 
<div id="container">
	<!--标题 返回主页 -->
	<div id="head">
	    <a class="back" title="返回主页" alt="打开主页" href="/SearchEngine/index1.jsp" style="color:white">iSearch学术</a>
    </div>
    
    <!-- 展示内容 -->
	<div id="b_content">
		<main aria-label="搜索结果">
			<div id="b_tween">
				<!-- 返回查到结果数量及时间等 -->
				<span class="info">找到约&nbsp;<span class="totalResult"><%=request.getAttribute("newsNum") %></span>&nbsp;条结果</span>
			</div>
			<div class="b_results" id="Searchresult">
			
			
			</div>
		</main>
		<div id="hiddenresult" style="display:none;">
		<script type="text/javascript">
  
<%-- alert(<%=array[1][1]%>); --%>
		var html = "";
	 var num="<%=num%>";
	/* alert(num); */
	
var data=<%=jsonStringrr%>;
	
    for(var m = 0; m < num; m++){

          /*  var arr = arrs[m]; */
           html += '<dl class="show">'
        	   +'<dt><a href="http://localhost:8080/SearchEngine/static/pdfjs/web/viewer.html?file=http://localhost:8080/SearchEngine/oriPDFs/'+data[m].pdf+'"target=\"_blank\" class=\"title\">'+data[m].title+'</a></dt>' 
        	   +'<dd><div class="rtext">'+data[m].text+'</div></dd>'
           +'<dd class="result_ItemScore">'+data[m].score+'</dd>'
			
			+'</dl>' ;	

       
        }

/* } */
document.getElementById("hiddenresult").innerHTML = html;
</script> 
</div>
         <div class="row ">
<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
<div id="" class=""></div>
</div>
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
			<p class="foot">----信息组织检索----</p>
		</div>
	</footer>
</div>
                    <!-- 此表单用来证明一些参数的作用 -->
<form name="paginationoptions" class="change" >
    <p><label for="items_per_page">每页显示的列表数：</label><input type="text" value="10" name="items_per_page" id="items_per_page" class="numeric"/></p>
    <p><label for="num_display_entries">分页链接显示数：</label><input type="text" value="10" name="num_display_entries" id="num_display_entries" class="numeric"/></p>
   <div class="hidden" style="display:none">
     <p><label for="num">起始与结束点的数目：</label><input type="text" value="2" name="num_edge_entries" id="num_edge_entries" class="numeric"/></p>
    <p><label for="prev_text">“上一页”标签：</label><input type="text" value="Prev" name="prev_text" id="prev_text"/></p>
    <p><label for="next_text">“下一页”标签：</label><input type="text" value="Next" name="next_text" id="next_text"/></p> </div>
    <input type="button" id="setoptions" value="设置" />
</form>

</body>
</html>