<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html,body,.img{
height:100%;
width:100%;
}
.head{
height:100px;
color:white;
font-size:large;
text-align:center;
vertical-align:middle;
}
p{
font-size:50px;
font-family:'SimHei';
font-weight:bold;
line-height:100px;
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
display: inline-block;}
#s_form{

font-family: "Segoe UI",Segoe,Tahoma,Arial,Verdana,sans-serif;
font-size: small;
border-spacing: 0;
border-collapse: collapse;
margin:0px 0px 0 270px;}

.searchboxform{
background-color: #fff;
border-spacing: 0;
border-collapse: collapse;
font: 18px/normal 'Microsoft YaHei',Arial,Helvetica,Sans-Serif;
position: relative;
display: inline-block;
border-radius: 6px;
background-color: #fff;
border: 1px #ccc solid;
padding: 0;
box-shadow: 0 2px 4px rgba(0,0,0,.3);}

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
padding-right: 0px;}

#go_par{

border-spacing: 0;
border-collapse: collapse;
font: 18px/normal 'Microsoft YaHei',Arial,Helvetica,Sans-Serif;

right: 0;
top: 0;
display: inline;}

#form_go{
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

.option-list{
font: 12px/150% Arial,"Microsoft YaHei","宋体",serif;
color: white;
font-family: "Microsoft yahei";
padding: 0;
margin: 0;
width: 100%;
}
#form1{
border-spacing: 0;
border-collapse: collapse;
font: 18px/normal 'Microsoft YaHei',Arial,Helvetica,Sans-Serif;
position: relative;
display: inline-block;
border-radius: 6px;
border: 1px solid transparent;
padding: 0;
box-shadow: 0 2px 4px rgba(0,0,0,.3);
margin:0 0 0 270px;
}
.check{

font: 12px/150% Arial,"Microsoft YaHei","宋体",serif;
font-family: "Microsoft yahei";
padding: 0;
margin: 0;
list-style: none outside none;
display: inline-block;
vertical-align: middle;
height: 26px;
padding-left: 8px;
margin-right: 10px;
margin-top:10px;
margin-bottom: 10px;
color: #fff;
font-size: 14px;}
.areaselect{
color: white;
}
.aa{
color: white;
}
/*
.sc_adv_triangle_down{
font: 13px arial;
list-style: none;
position: relative;
z-index: 10;
top: 1px;
cursor: pointer;
color: #505961;
font-size: 13px;
width: 29px;
height: 32px;
line-height: 32px;
text-align: center;
user-select: none;
transition: left .2s;
left: 512px;
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
*/
</style>

</head>
<body>
<!-- search added by xxxx -->
<div class="img">
    <div class="head">
    <p>iSearch学术</p></div>
    
 <div class="search_control">
<form action="servlet/searchAction"  role="none" id="s_form" class="sw_box" method="post" >
<!-- onsubmit="var id = _ge('hpinsthk').getAttribute('h'); return si_T(id);" -->
<div class="searchboxForm" role="search" data-bm="15">
<input class="searchbox" id="form_q" name="text" title="输入搜索词" type="search" value="" maxlength="100">
<div id="go_par" data-sbtip="搜索网页">
<!--  <input type="submit" class="searchboxSubmit" id="form_go" tabindex="-1" name="go"></div>-->
<input type="submit" class="searchboxButton" id="form_go" tabindex="-1" name="go" ></div>
<!-- method="post/get" onClick="linkto_search()" -->
<span></span>
</div>
 <div class="option-list">
               <!--  <form id="form1" action="loginAction.do" method="post" name="form"> -->  
       
                    <input type="radio"  name="search" class="check" value="1" />普通搜索
                    <input type="radio" name="search" class="check" value="2"/>模糊搜索
                    <input type="radio" name="search" class="check" value="3" />短语搜索
                    <input type="radio" name="search" class="check" value="4"/>通配符搜索
              
 </div> 
<div class="areaselect">
<input type="checkbox" name="area" class="as" value ="abstract">abstract<br>
<input type="checkbox" name="area" class="as" value ="affiliation">affiliation<br>
<input type="checkbox" name="area" class="as" value ="biographic">biographic<br>
<input type="checkbox" name="area" class="as" value ="fulltext">fulltext<br>
<input type="checkbox" name="area" class="as" value ="keywords">keywords<br>
<input type="checkbox" name="area" class="as" value ="reference">reference<br>
<input type="checkbox" name="area" class="as" value ="title">title<br>
</div>
<div class="aa">

地区<input type="text" name="address" class="a"/>
作者<input type="text" name="author" class="a"/>
   </div>
    </form>
</div>
  
 <!--    
    <div class="sc_adv_triangle_down ">
        <span><i class="iconfont"></i></span>
    </div>
    <div id="sc_adv" style="display: block;">
<form action="/s" id="sc_adv_frm">
    <div class="sc_adv_hatr">
        <span class="sc_adv_label">包含全部检索词</span>
        <span><input type="text" placeholder="" data-type="all" data-name="" class="sc_adv_keyword_ipt sc-input sc_adv_keyword1" maxlength="100" value=""></span>
    </div>
    <div class="sc_adv_hatr">
        <span class="sc_adv_label">包含精确检索词</span>
        <span><input type="text" placeholder="多个检索词以逗号，分隔" data-type="precise" data-name="" class="sc_adv_keyword_ipt sc-input sc_adv_keyword2" maxlength="100" value=""></span>
    </div>
    <div class="sc_adv_hatr">
        <span class="sc_adv_label">包含至少一个检索词</span>
        <span><input type="text" placeholder="多个检索词以逗号，分隔" data-type="or" data-name="" class="sc_adv_keyword_ipt sc-input" maxlength="100" value=""></span>
    </div>
    <div class="sc_adv_hatr">
        <span class="sc_adv_label">不包含检索词</span>
        <span><input type="text" placeholder="多个检索词以逗号，分隔" data-type="not" data-name="" class="sc_adv_keyword_ipt sc-input" maxlength="100" value=""></span>
    </div>
    <div class="sc_adv_hatr" style="margin-bottom:23px;">
        <span class="sc_adv_label">出现检索词的位置</span>
        <span class="sc_adv_keyword_pos">
            <div class="sc_adv_dropdown_btn">
                <span class="sc_adv_dropdown_text">
                                    <a href="javascript:;" data-name="">文章任何位置</a>
                                </span>
                <i class="c-icon c-icon-arrow-down-gray"></i>
                <div class="sc_adv_dropdown_group sc_adv_dropdown_group1 sc_adv_dropgroup_title" data-index="1" style="display: none;">
                                    <a href="javascript:;" data-name="intitle">位于文章标题</a>
                                </div>
            </div>
        </span>
    </div>
    <div class="sc_adv_hatr">
        <span class="sc_adv_label">作者</span>
        <span><input type="text" placeholder="请输入作者名字" data-name="author" class="sc_adv_txin sc-input sc_adv_author" maxlength="50" value=""></span>
    </div>
    <div class="sc_adv_hatr">
        <span class="sc_adv_label">出版物</span>
        <span class="sc_adv_jour_conf">
            <span class="sc_adv_dropdown_btn">
                <span class="sc_adv_dropdown_text">
                                        <a href="javascript:;" data-name="journal" data-holder="请输入期刊名称">期刊</a>
                                    </span>
                <i class="c-icon c-icon-arrow-down-gray"></i>
                <div class="sc_adv_dropdown_group sc_adv_dropgroup_pub" data-index="2" style="display: none;">
                                        <a href="javascript:;" data-name="conference" data-holder="请输入会议名称">会议</a>
                                    </div>
            </span>
            <input type="text" placeholder="请输入期刊名称" data-name="journal" class="sc-input sc_adv_txin sc_adv_pubipt" maxlength="100" value="">
        </span>
    </div>
    <div class="sc_adv_hatr">
        <span class="sc_adv_label">发表时间</span>
        <span class="sc_adv_year">
        <input type="text" data-nolog="1" pattern="[0-9]*" size="4" placeholder="年" maxlength="4" name="" class="sc-input sc-input-xmini sc_adv_input_ylo" value="">&nbsp;-&nbsp;<input type="text" data-nolog="1" pattern="[0-9]*" size="4" placeholder="年" maxlength="4" name="" class="sc-input sc-input-xmini sc_adv_input_yhi" value="">
        </span>
    </div>
    <div class="sc_adv_hatr">
        <span class="sc_adv_label">语言检索范围</span>
        <span class="sc_adv_dropdown_btn">
            <span class="sc_adv_dropdown_text sc_adv_lang_sel">
                <a href="javascript:;" data-id="0">不限</a>
            </span>
            <i class="c-icon c-icon-arrow-down-gray"></i>
            <div class="sc_adv_dropdown_group sc_adv_dropgroup_lang" style="display: none;">
                                <a href="javascript:;" data-id="0" class="sc_adv_lang_hide">不限</a>
                                <a href="javascript:;" data-id="1">英文</a>
                                <a href="javascript:;" data-id="2">中文</a>
                            </div>
        </span>
    </div>
    <span class="sc_adv_wd_hidden"></span>
    <input type="hidden" name="tn" value="SE_baiduxueshu_c1gjeupa">
        <input type="hidden" name="bs" value="">
    <input type="hidden" name="ie" value="utf-8">
    <input type="hidden" name="sc_f_para" value="sc_tasktype={firstAdvancedSearch}">
    <input type="hidden" name="sc_from" value="">
    <input type="hidden" name="sc_as_para" value="">
    <span class="sc_adv_sub s_btn_wr"><input type="submit" value="搜索" class="sc_adv_sub_btn s_btn"></span>
</form>
   

<!--  <select name="cars" id="select_id">
                             <option value="title" selected="selected">标题</option>
                             <option value="author">作者</option>
                             <option value="keyword">关键字</option>
                             <option value="fulltext">全面检索</option>
                        </select>
 -->    

           
            
    <p></p>  
   
                   
          </div>
          <script>  
/*function linkto_search(){   
   var keyname = document.getElementById("inp_search").value;
   var selectValue=$("#select_id").val();  //获取Select选择的value
   if(document.getElementById("inp_search").value == "" || document.getElementById("inp_search").value == null){
       window.location.href="Errorpage.jsp"; 
   }
   else{//&& srchtype != null && srchtype != ""
       window.location.href="search.jsp?srchtype="+selectValue+"&keyword="+keyname; 
   }
} 

function linkto_search(){
    var els = document.getElementsByName("aa");
 for (var i = els.length; i--;){
            var el = els[i]
     if (el.checked){
         alert(el.getAttribute("id"))
     }
 }
}

document.querySelector("#sc_adv_frm")*/
function check(){
    var val = $("#form_q").val();
    if(val==null||val==''){
        alert("内容不能为空!");
        return false;
    }
    return true;
}
</script>
</body>
</html>