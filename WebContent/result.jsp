<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="Search.result"%>
    <%@ page import="net.sf.json.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="/SearchEngine/static/css/style.css" rel="stylesheet" type="text/css" />
<link href="/SearchEngine/static/css/result.css" rel="stylesheet" type="text/css" /> -->
<link href="/SearchEngine/static/css/pagination.css" rel="stylesheet" type="text/css"> 
<style type="text/css">
/* body{font-size:84%; color:#333333; line-height:1.4;} */
a{color:#34538b;}
#Searchresult{width:300px; padding:20px; background:#f0f3f9;}
</style>
<script type="text/javascript" src="/SearchEngine/static/js/jquery.min.js"></script>

<script type="text/javascript" src="/SearchEngine/static/pdfjs/build/pdf.js"></script>
<!-- <script type="text/javascript" src="/SearchEngine/static/js/global.js"></script> -->
<script type="text/javascript" src="/SearchEngine/static/js/pagination.js"></script>
<script type="text/javascript">
$(function(){
	//总数目
	var length = $("#hiddenresult .show").length;
	alert(length);
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
<!-- <script type="text/javascript">
 
 
    
 
         
$(function() {
     
           var arrsStr = $("#arrs").val(); //从隐藏域得到json字符串
            
           var arrs = JSON.parse(arrsStr) ; //把json字符串转成json对象
 
           //没有json.js，用 var arrs = null ;eval("arrs"+ arrsStr) 
               
           for(var m = 0; m < arrs.length; m++){
 
                  var arr = arrs[m];
 
                  for(var n = 0; n < arr.length; n++){
 
                       /*  document.write(arr[j] +"<br>"); */
                        alert(arr[n]);
                      }
               }
       
             
     
}
        );
</script>

 -->
</head>
<body>
 <%  

   int num=Integer.parseInt(request.getAttribute("newsNum").toString());
   String array[][]=new String[num][4];
   for(int i = 0;i<num;i++){
	   array[i][0]=request.getAttribute("pdf"+i).toString();
	   array[i][1]=request.getAttribute("title"+i).toString();
	   array[i][2]=request.getAttribute("score"+i).toString();
	   array[i][3]=request.getAttribute("text"+i).toString();
   }
 
  JSONArray objlist = JSONArray.fromObject(array);
 
 %> 

           <%--   <script type="text/javascript">
             var s="<%=num%>";
             alert(s);
             </script> --%>

 <div id="Searchresult">分页初始化完成后这里的内容会被替换。</div>
 <div id="hiddenresult" style="display:none;">

 
 <%-- <%  

               for(int i = 0;i<Integer.parseInt(request.getAttribute("newsNum").toString());i++){
            	   out.println("<div class=\"show\">");
               	
               	out.println("<div class=\"itemHead\">");
            out.println("<a href=\"http:\\\\localhost:8080\\SearchEngine\\pdfjs\\web\\viewer.html?file=http://localhost:8080/SearchEngine/oriPDFs/"+request.getAttribute("pdf"+i)+"\""+"  target=\"_blank\" class=\"title\">");
           
           	
               out.println(request.getAttribute("title"+i));
             
              
               
               
               out.println("<br>");
               out.println("</a>");
           	out.println("</div>");
           	
           	out.println("<div class=\"itemBody\">");
           	out.println(request.getAttribute("score"+i));
           	out.println("<br>");
               out.println(request.getAttribute("text"+i));
               out.println("<br>");
               out.println("</div>");
               } 
            
               
                    %> --%>
	<!-- 列表元素 -->
   <script type="text/javascript">
   var result=[{"flag":1,"macId":"2","mbId":0,"userName":"XXX"},{"flag":1,"macId":"1","mbId":1,"userName":"YYY"}];
<%-- alert(<%=array[1][1]%>); --%>
		var html = "";
	 var num="<%=num%>";
	alert(num);
		<%--  var a=Array();
		<%for(int i=0;i<num ;i++){%>  
		   a[<%=i%>] = new Array();  
		   
	       a[<%=i%>][0] = <%=array[i][0]%>;  
	       a[<%=i%>][1] = <%=array[i][1]%>;  
	       a[<%=i%>][2] = <%=array[i][2]%>;  
	       a[<%=i%>][3] = <%=array[i][3]%>;  
	 <%}%>  
	 alert(a[1][1]);   --%>
		/* for(var i=1; i<num; i++){
			
			/* html += '<dl class="show">'
			+'<dt><a href="http://localhost:8080/SearchEngine/static/pdfjs/web/viewer.html?file=http://localhost:8080/SearchEngine/oriPDFs/'+a[j][0]+' target=\"_blank\" class=\"title\">'+a[j][1]+'</a></dt>' 
			+'<dd>'+a[j][2]+'</dd>'
			+'<dd>'+a[j][3]+'</dd>'
			+'</dl>' ;	
			html += '<dl class="show">'
				+'<dt>标题</dt>' 
				+'<dd></dd>'
				+'<dd></dd>'
				+'</dl>' ;	 */
/* 
	           var arrsStr = $("#arrs").val(); //从隐藏域得到json字符串
	            
	           var arrs = JSON.parse(arrsStr) ; //把json字符串转成json对象
	  */
	           //没有json.js，用 var arrs = null ;eval("arrs"+ arrsStr) 
	           
	               
	           for(var m = 0; m < 100; m++){
	 
	                 /*  var arr = arrs[m]; */
	                  html += '<dl class="show">'
	 
	                  for(var n = 2; n < 4; n++){
	 
	                       /*  document.write(arr[j] +"<br>"); */
	                       /*  alert(arr[n]); */

	          			html +='<dd>'+'标题'+'</dd>' ;       			
	        			
	                      }
	                  html+='</dl>' ;
	               }
	       
		/* } */
		document.getElementById("hiddenresult").innerHTML = html;
	</script> 
</div>
                    <div class="row ">
		<div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
	<div id="" class=""></div>
	</div>
                    <!-- 此表单用来证明一些参数的作用 -->
<form name="paginationoptions" style="display:none "  >
    <p><label for="items_per_page">每页显示的列表数：</label><input type="text" value="5" name="items_per_page" id="items_per_page" class="numeric"/></p>
    <p><label for="num_display_entries">分页链接显示数：</label><input type="text" value="10" name="num_display_entries" id="num_display_entries" class="numeric"/></p>
    <p><label for="num">起始与结束点的数目：</label><input type="text" value="2" name="num_edge_entries" id="num_edge_entries" class="numeric"/></p>
    <p><label for="prev_text">“上一页”标签：</label><input type="text" value="Prev" name="prev_text" id="prev_text"/></p>
    <p><label for="next_text">“下一页”标签：</label><input type="text" value="Next" name="next_text" id="next_text"/></p>
    <input type="button" id="setoptions" value="设置选项" />
</form>
 <input id="arrs" type="hidden" style="display:none "  value ="Dynamic interface between proteins" <%-- <%= objlist%> --%>/>
<%--  <div class="test"><%=result[0].username %></div> --%>
</body>

</html>