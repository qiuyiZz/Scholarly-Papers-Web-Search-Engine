package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import Search.Searcher;
import Search.allsearch;
import Search.result;

import java.util.*;

/**
 * Servlet implementation class searchAction
 */
@WebServlet("/searchAction")
public class searchAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
//		 System.out.println("进入");
		String []alltxtdic= {"abstract","address","affiliation","authors",
        		"biographic","fulltext","keywords","reference","title"};
		Map<Integer, result> map=new HashMap<Integer, result>();
		   
		   String text=request.getParameter("text");
		
			   String s=request.getParameter("search");//获取单选框值
		   System.out.println(s);
			  
			   //精确搜索
			   int search = Integer.parseInt(s);
			   
			   String[] txtdic = request.getParameterValues("area");
			
			   if(search==1&txtdic==null)//普通搜索
				try {
					map=allsearch.search(text, alltxtdic, 1);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			   else {
//			   for(int k=0;k<txtdic.length;k++)
//	       System.out.println(txtdic[k]);

				   if(text=="") {
					  
						   txtdic=alltxtdic;
					   }
			   String address = request.getParameter("address");
		       String author = request.getParameter("author");
		       String[] flagtext=new String[3];
	           flagtext[0]=text;
	           flagtext[1]=author;
	           flagtext[2]=address;
	          
	           try {
				map=allsearch.advancedsearch(flagtext, txtdic, search);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 
			   }
		  

		   
	   	int size=map.size();
	   	System.out.println(size+"");
	    result [] r_array=new result[size];
		java.util.Iterator it = map.entrySet().iterator();
		int i=0;
        while(it.hasNext()){
             java.util.Map.Entry entry = (java.util.Map.Entry)it.next();
             result r=(result)entry.getValue()  ;
             if(r.text!=null) {
            	 r.title=r.title.replaceAll("<b><font_color=\'red\'>", "<b><font color=\'red\'>");
                 r.text=r.text.replaceAll("<b><font_color=\'red\'>", "<b><font color=\'red\'>");
//                 if(r.text.length()>500) {
//                     int length=r.text.indexOf("</font></b>",450);
//                     if(r.text.length()>500||(length>0||length<50)) {
//                      if(r.text.length()<length+20) {
//                       r.text=r.text;
//                      }else {
//                       r.text=r.text.substring(0,length+20);
//                      }
//                     
//                     }else if(r.text.length()>500){
//                      r.text=r.text.substring(0,520);
//                      
//                 }
//          
             }
             

             r_array[i]=r;
             i++;
//           System.out.println(r.tostring());
        }
       
	        if(size==0){
				request.setAttribute("noResult","没有找到相关内容");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/noresult1.jsp");
		        dispatcher.forward(request, response);
			}else{
				
				 java.util.Arrays.sort(r_array);
			        String jsonStringrr = JSON.toJSONString(r_array);
				int totalnum = size;
				
				request.setAttribute("newsNum",""+totalnum);				
				request.setAttribute("array",jsonStringrr);
				
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/result1.jsp");
		        dispatcher.forward(request, response);
			}
		   }
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	public void destroy() {
		super.destroy();
	}
}
