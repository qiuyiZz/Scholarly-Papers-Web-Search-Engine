package Search;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Webpage {
	public static void main(String[] args) throws Exception {
		/**
		   默认搜索是全部域的标准搜索
		  高级搜索：
		                      文本内容、作者名、地址
		                      域的范围，查询种类
		 * 
		 */
		String []alltxtdic= {"abstract","address","affiliation","authors",
        		"biographic","fulltext","keywords","reference","title"};
		
		int search=2;//普通模糊短语通配符
		String[] flagtext= {"dna","klingberg",""};
		String [] txtdic= {"abstract","title"};
//		String[] flagtext= {"","",""};
//		String [] txtdic= {};
		
		
		
		String text="dna";
		String author=flagtext[1];
		String address=flagtext[2];
		boolean flag_query=(flagtext[0]!="");
		boolean flag_au=(author!="");
		boolean flag_ad=(address!="");

		boolean flag_advance=flag_query||flag_au||flag_ad;
		
		Map<Integer, result> map=new HashMap<Integer, result>();
		if(flag_advance) {
			System.out.println("高级搜索：");
			map=allsearch.advancedsearch(flagtext, txtdic, search);
		}else {
			System.out.println("普通搜索：");
			map=allsearch.search(text, alltxtdic, 1);//普通查询
		}
		
		int size=map.size();
	    result [] r_array=new result[size];
		java.util.Iterator it = map.entrySet().iterator();
		int i=0;
        while(it.hasNext()){
             java.util.Map.Entry entry = (java.util.Map.Entry)it.next();
             result r=(result)entry.getValue();
             r.title=r.title.replaceAll("<b><font_color='red'>", "<b><font color='red'>");
             r_array[i]=r;
             i++;
//           System.out.println(r.tostring());
        }
        System.out.println("***********************************");
        java.util.Arrays.sort(r_array);
        System.out.println(size+" "+i);
    	System.out.println(r_array.length);
    	int page=10;
		for(int j=0;j<r_array.length;j++) {
    			
			if(j==page) {
				System.out.println("获取更多");
				Scanner input2=new Scanner(System.in);
				int next=input2.nextInt();
				page+=10;
			}
			System.out.println(j+" "+r_array[j].tostring());
		}
	}
			
}
//and the lessons <b><font color='red'>learned</font></b>. Section 2 will describe the process of designing the case scenario, preparing  
//accessedMultidisciplinary <b><font color='red'>learning</font></b> using mock trials
//G Kessler R Simpson J Fry International Journal of Electronic Security and Digital Forensics  Multidisciplinary <b><font color='red'>Learning</font></b> Using Mock Trials  started to employ a <b><font color='red'>mock</font></b> trial to bring students from these three disciplines together. The event  (à la an episode of , Champlain College has started to employ a <b><font color='red'>mock</font></b> trial event that involves C&DF Criminal justice education digital forensics education <b><font color='red'>mock</font></b> trial paralegal education   
//accessedMultidisciplinary learning using <b><font color='red'>mock</font></b> trials
//G Kessler R Simpson J Fry International Journal of Electronic Security and Digital Forensics  Multidisciplinary Learning Using <b><font color='red'>Mock</font></b> Trials
