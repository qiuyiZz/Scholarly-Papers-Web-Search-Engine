<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iSearch学术_home</title>
<style type="text/css">

	html,body,.img{
		height:100%;
		width:100%;
		border: 0;
		border-collapse: collapse;
		border-spacing: 0px;
		list-style: none;
		margin: 0;
		padding: 0;
		text-align:center
	}
	.head{
		height:150px;
		color:white;
		font-size:large;
		text-align:center;
		vertical-align:middle;
	}
	p{
		font-size:70px;
		font-family:'SimHei';
		font-weight:bold;
		line-height:150px;
	}
	.img{
		overflow:hidden;
		background-image:url('header.png');
		background-size:cover;
		background-repeat:no-repeat;
	}
	.search_control{
		font-family: "Segoe UI",Segoe,Tahoma,Arial,Verdana,sans-serif;
		font-size: small;
		border-spacing: 0;
		border-collapse: collapse;
		position: relative;
		display: inline-block;
	}
	#s_form{
		background-color: #fff;
		font-family: "Segoe UI",Segoe,Tahoma,Arial,Verdana,sans-serif;
		font-size: small;
		border-spacing: 0;
		border-collapse: collapse;
	}
	.searchboxform{
		border-spacing: 0;
		border-collapse: collapse;
		font: 18px/normal 'Microsoft YaHei',Arial,Helvetica,Sans-Serif;
		position: relative;
		display: inline-block;
		border-radius: 6px;
		background-color: #fff;
		border: 1px #ccc solid;
		padding: 0;
		box-shadow: 0 2px 4px rgba(0,0,0,.3);
	}
	
	.searchbox{
		border-spacing: 0;
		border-collapse: collapse;
		border-radius: 0;
		font: inherit;
		border: 0;
		padding: 0 0px 0 0;
		max-height: 40px;
		outline: none;
		-webkit-appearance: none;
		border-color: #ccc;
		box-sizing: content-box;
		position: relative;
		height: 40px;
		font-size: 16px;
		background-color: #fff;
		margin:0px 5px 0 1px;
		width: 550px;
		border-right: 0;
		padding-right: 0px;
	}
	.searchbox2{
		font: inherit;
		padding: 0;
		max-height: 40px;
		outline: none;
		-webkit-appearance: none;
		border-color: #dedede;
		box-sizing: content-box;
		position: relative;
		height: 30px;
		font-size: 16px;
		background-color: #fff;
		margin:0px 5px 0 1px;
		width: 550px;
		border-color:rgb(238,238,238
		);
	}
	#go_par{
		
		border-spacing: 0;
		border-collapse: collapse;
		font: 18px/normal 'Microsoft YaHei',Arial,Helvetica,Sans-Serif;
		
		right: 0;
		top: 0;
		display: inline;
	}
	.searchboxButton{
		border-spacing: 0;
		border-collapse: collapse;
		border-radius: 0;
		font: inherit;
		font-size: 100%;
		text-indent: -99em;
		position: static;
		right: 0;
		top: 0;
		cursor: pointer;
		height: 40px;
		width: 40px;
		border: 0px solid transparent;
		background-color: #fff;
		/*background-position: -169px -63px;*/
		overflow: hidden;
		vertical-align: top;
		background-image: url('search.png');
		background-size:cover;
		background-repeat:no-repeat;
	}
	.searchboxButton2{
		border-spacing: 0;
		border-collapse: collapse;
		border-radius: 0;
		font: inherit;
		font-size: 100%;
		text-indent: -99em;
		position: static;
		right: 0;
		top: 0;
		cursor: pointer;
		height: 40px;
		width: 40px;
		border: 0px solid transparent;
		background-color: #fff;
		/*background-position: -169px -63px;*/
		overflow: hidden;
		vertical-align: top;
		background-image: url('search.png');
		background-size:cover;
		background-repeat:no-repeat;
	}
	
	
	select{
		float:right;
		height:40px;
		width:85px;
		font-size:15px;
	}
	.sc_adv_frm{
		font: 13px arial;
		list-style: none;
		text-align: left;
		padding-top: 15px;
		background: #fff;
		color: #505961;
		font-size: 14px;
		position: absolute;
		top: 35px;
		border: 1px solid #f5f5f5;
		z-index: 300;
		box-shadow: 0 2px 4px rgba(0,0,0,.2);
		left: 0;
		border-color: #d8d8d8;
		width: 540px;
		display: block;
	}
	.iconfont {
		color: #dedede;
	    font-family: iconfont !important;
	    font-size: 16px;
	    font-style: normal;
	    -webkit-font-smoothing: antialiased;
	    -moz-osx-font-smoothing: grayscale;
	}
	.bu{
		font-size:15px;
		font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;
		color:#d8d8d8;
		line-height: 32px;
		background-color:white;
		border:none;
		
	}
	#sc_adv {
	    display: none;
	    width:610px;
	    padding: 10px;
	    background: #fff;
	    font-size: 14px;
	    position: absolute;
	    top: 35px;
	    left: 0px;
	    border: 1px solid #f5f5f5;
	    *border:1px solid #d8d8d8: ;
	    z-index: 300;
	    *zoom:1: ;
	}
	.check{
		padding: 0;
		list-style: none outside none;
		display: inline-block;
		vertical-align: middle;
		height: 26px;
		margin: 5px 5px 5px 15px;
	}
	.checktext{
		font-size: 16px;
		color: #777;
		margin: 15px 15px 5px 15px;
	}
	.checktext2{
		width:150px;
		vertical-align:middle;
		font-size: 16px;
		color: #777;
		margin: 5px 15px 5px 30px;
	}
	.sc_adv_hatr{
	    line-height: 24px;
	    height: 24px;
	    z-index: 10;
	    margin-top: 10px;
	    margin-bottom: 10px;
	    font-size: 0px;
	    list-style: none;
	    text-align: left;
	    font: 15px arial;
	}
	.sc_adv_label {
		font-weight:bold;
	    width: 175px;
	    text-align: right;
	    display: inline-block;
	    padding-right: 15px;
	    color: #777;
	}
	.sc_adv_txin{
	    line-height: 22px;
	    width: 200px;
	    padding: 0 10px;
	    color: #505961;
	    font-size: 15px;
	}
	
</style>

</head>
<body>
	<!-- search added by xxxx -->
	<div class="img">
	    <div class="head">
	    	<p>iSearch学术</p>
	    </div>
	    
	 	<div class="search_control">
			<form action="servlet/searchAction"  role="none" id="s_form" class="sw_box" method="post" >
				<div class="searchboxForm" role="search">
					<input class="searchbox" id="form_q" name="text" title="输入搜索词" type="search" value="" maxlength="100">
					<input type="button" class="bu" value="高级搜索" onClick="display('sc_adv')"/>
					<div id="go_par" data-sbtip="搜索网页">
						<input type="submit" class="searchboxButton" id="form_go" tabindex="-1" name="go"/>
					</div>
				<div id="sc_adv" style="display:none;">
		    		<label class="checktext"><input type="radio" name="search" class="check" id="or"  value="1" checked/>普通查询</label>
		            <label class="checktext"><input type="radio" name="search" class="check" id="fuzzy"  value="2"/>模糊查询</label>
		            <label class="checktext"><input type="radio" name="search" class="check" id="phrase"  value="3"/>短语查询</label>
		            <label class="checktext"><input type="radio" name="search" class="check" id="wildcard" value="4"/>通配符查询</label>
		    		<div class="sc_adv_hatr">
		    			<span class="sc_adv_label">作者</span>
		    			<span>
		    				<input class="sc_adv_txin" type="search" maxlength="50" placeholder="请输入作者名字" value="" name="author">
		    			</span>
		    		</div>
		    		<div class="sc_adv_hatr">
		    			<span class="sc_adv_label">地址</span>
		    			<span>
		    				<input class="sc_adv_txin" type="search" maxlength="50" placeholder="请输入文章发表地址" value="" name="address" >
		    			</span>
		    		</div>
		    		<label class="checktext2"><input type="checkbox"  name="area" class="check" id="abstract" value="abstract"/>abstract</label>
		            <label class="checktext2"><input type="checkbox" name="area" class="check" id="affiliation"  value="affiliation"/>affiliation</label>
		            <label class="checktext2"><input type="checkbox" name="area" class="check" id="biographic"  value="biographic"/>biographic</label>
		            <label class="checktext2"><input type="checkbox" name="area" class="check" id="fulltext" value="fulltext"/>fulltext</label>
		            <label class="checktext2"><input type="checkbox" name="area" class="check" id="keywords" value="keywords"/>keywords</label>
		            <label class="checktext2"><input type="checkbox" name="area" class="check" id="reference" value="reference"/>reference</label>
		            <label class="checktext2"><input type="checkbox" name="area" class="check" id="title" value="title"/>title</label>
		   		 </div>
				</div>
		    </form>
		    
		</div>
		
	<script>  
	
		function display(id){
			var traget=document.getElementById(id);
			if(traget.style.display=="none"){
				traget.style.display="block";
				}else{
					traget.style.display="none";
			}
		}
	</script>
</body>
</html>