package Search;

import java.io.File;
import java.io.StringReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.search.FuzzyQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.PhraseQuery;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.WildcardQuery;
import org.apache.lucene.search.highlight.Fragmenter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.search.highlight.SimpleSpanFragmenter;
import org.apache.lucene.store.FSDirectory;

public class allsearch {
	 //指定域*搜索类型
	public static Map<Integer, result> search(String text,String[] txtdic,int search) throws Exception{
		Map<Integer, result> map = new HashMap<Integer, result>();
		FSDirectory directory=FSDirectory.open(new File("/Users/zhangqiuyi/Desktop/allpaper_index").toPath());

		IndexReader indexReader=DirectoryReader.open(directory);
		IndexSearcher indexSearcher=new IndexSearcher(indexReader);
		MyStopAnalyzer mystop=new MyStopAnalyzer();
		List<String> termarray=mystop.inputarray(text, mystop);
		String []terms=termarray.toArray(new String[termarray.size()]);
		
		if(search==4) {//通配符查询
			directory=FSDirectory.open(new File("/Users/zhangqiuyi/Desktop/wildcardQuery_index").toPath());
			terms=text.split(" ");	
		}
		
		String  title_row ="."; 
		String ab_row=".";
	    String  title_worked= ".";
	    String ab_worked=".";
	    int termarray_length=terms.length;
	    
	    if(search==3) {//短语查询
	    	termarray_length=1;
	    }
	    
	    for(int t=0;t<termarray_length;t++) {//查询里的每个词
			String term=terms[t];
			System.out.println(term);
	        for(int j=0;j<txtdic.length;j++) {//每个域
		        org.apache.lucene.index.Term tt = new org.apache.lucene.index.Term(txtdic[j],term);
		        Query query=new TermQuery(tt);
		        if(search==2) {
		        	query=new FuzzyQuery(tt);
		        }else if(search==3) {
		        	query=new PhraseQuery(10,txtdic[j],terms);
		        }else if(search==4) {
		        	query=new WildcardQuery(tt);
		        }
	        	TopDocs topDocs=indexSearcher.search(query, 100);
	    		ScoreDoc[] scoreDocs=topDocs.scoreDocs;	
	            QueryScorer scorer=new QueryScorer(query);  
//	            int highlength=100;
//	            if(txtdic[j]=="title") {
//	            	highlength=1000;
//	            }
	            
	            //怎么实现取标题长，取别的内容短
	            Fragmenter fragmenter=new SimpleSpanFragmenter(scorer,1000);  
	            SimpleHTMLFormatter simpleHTMLFormatter=new SimpleHTMLFormatter("<b><font_color=\'red\'>","</font></b>");   
	            Highlighter highlighter=new Highlighter(simpleHTMLFormatter, scorer);  
	            highlighter.setTextFragmenter(fragmenter); 
	            
	            Fragmenter fragmenter1=new SimpleSpanFragmenter(scorer,100);  
	            SimpleHTMLFormatter simpleHTMLFormatter1=new SimpleHTMLFormatter("<b><font_color=\'red\'>","</font></b>");   
	            Highlighter highlighter1=new Highlighter(simpleHTMLFormatter1, scorer);  
	            highlighter1.setTextFragmenter(fragmenter1); 
	            
//	            System.out.println(scoreDocs.length);
	    		for (ScoreDoc doc:scoreDocs) {//击中的每个文档
	    			int docId=doc.doc;
	            	Document document=indexSearcher.doc(docId); 
	            	String pdf=document.get("pdf");
	            	float docscore=doc.score; 
	                title_row = document.get("title"); 
	//		        title_worked=title_worked; 有可能关键词不在
	                ab_row=document.get(txtdic[j]);
	                try {
	                TokenStream tokenStream=mystop.tokenStream("", new StringReader(title_row)); 
	                title_worked= highlighter.getBestFragment(tokenStream,title_row);//有可能为null
	                }catch(java.lang.IllegalArgumentException e) {
	                	title_worked=title_row;
	                }
//	                System.out.println("row "+title_row);
//	                System.out.println("worked "+title_worked);
//	                System.out.println();
//	                System.out.println(title_worked);
	                try {
		                TokenStream tokenStream=mystop.tokenStream("", new StringReader(ab_row));
		                ab_worked=highlighter1.getBestFragment(tokenStream,ab_row);//有可能为null
		                }catch(java.lang.IllegalArgumentException e) {
		                	ab_worked=ab_row;
		                }
	              
	                if(map.containsKey(docId)) {//该文章已存在
	    				docscore+=map.get(docId).score;
	    				text=map.get(docId).text+" "+ab_worked;
    
	    		
	    				int flag=map.get(docId).flag;//0的话title未处理
	    				result r;
	    				if(title_worked!=null) {//关键词在标题里
	    					if(flag==0) {//之前标题未处理，则替换
	    					}else {
	//		    				title_worked=map.get(docId).title+" "+title_worked;
	    						String [] s1a=title_worked.split(" ");//这次的
	    						String [] s2a=map.get(docId).title.split(" ");//之前的
//	    						System.out.println(s1a.length+" "+s2a.length);
//	    						System.out.println(pdf);
//	    						System.out.println(map.get(docId).pdf);
//	    						System.out.println(title_worked);
//	    						System.out.println(title_row);
//	    						System.out.println(map.get(docId).title);
	    						title_worked="";
	    						for(int i=0;i<s1a.length;i++) {
	    							if(s1a[i].length()<s2a[i].length()) {
	    								title_worked=title_worked+s2a[i]+" ";
	    							}else {
	    								title_worked=title_worked+s1a[i]+" ";
	    							}
	    						}
	    					}
	    					r=new result(pdf,title_worked,text,docscore,1);
	    				}else {//关键词不在标题里
	    					title_worked=map.get(docId).title;//仍使用原来标题（不管是否处理过）,flag也不变
	    					r=new result(pdf,title_worked,text,docscore,flag);
	    				}
	    				map.put(docId, r);
	                }else {//该文章还不存在
		    			result r;
		    			if(title_worked==null) {
		    				title_worked=title_row;
		    				r=new result(pdf,title_worked,ab_worked,docscore,0);
		   				}else {
		   					r=new result(pdf,title_worked,ab_worked,docscore,1);
		   				}
		    			map.put(docId, r);
    				}
		    	}
	        }		
		}
	 
        return map;
	}
	
	
	public static Map<Integer, result> advancedsearch(String[]flagtext,String []txtdic,int search) throws Exception{

		String text=flagtext[0];
		String author=flagtext[1];
		String address=flagtext[2];
		boolean flag_query=(text!="");
		boolean flag_au=(author!="");
		boolean flag_ad=(address!="");
		Map<Integer, result> map_field=new HashMap<Integer,result>();
		Map<Integer, result> map_au=new HashMap<Integer,result>();
		Map<Integer, result> map_ad=new HashMap<Integer,result>();
		
		if(flag_query) {
			map_field=search(text,txtdic,search);
		}
		if(flag_au) {
			map_au=search(author,new String[] {"authors"},1);
		}
	    if(flag_ad) {
	    	map_ad=search(address,new String[] {"address"},1);
	    }
		
		Map<Integer, result> m1=new HashMap<Integer,result>();
		Map<Integer, result> map=new HashMap<Integer,result>();

		if(flag_au) {
			if(flag_ad) {
				m1=map_intersection(map_au,map_ad);
				if(flag_query) {
					map=map_intersection(m1,map_field);
				}else {
					map=m1;
				}
			}else if(flag_query) {
				map=map_intersection(map_au,map_field);
			}else {
				map=map_au;
			}
		}else {
			if(flag_ad) {
				if(flag_query) {
					map=map_intersection(map_ad,map_field);
				}else {
					map=map_ad;
				}
			}else if(flag_query) {
				map=map_field;
			}else {
			}
		}
		
	   return map;
	}
	
	public static Map<Integer, result> map_intersection(Map<Integer, result> m1,Map<Integer, result> m2){
		//m1比m2少效率更高，求交集
		Map<Integer, result> map=new HashMap<Integer, result>();
		java.util.Iterator it = m1.entrySet().iterator();
        while(it.hasNext()){
             java.util.Map.Entry entry = (java.util.Map.Entry)it.next();
             if(m2.containsKey(entry.getKey())){//m1与m2有共同的key
            	 result r1=(result) entry.getValue();
            	 result r2=m2.get(entry.getKey());
            	 String pdf=r1.pdf;
            	 String title=r2.title;
            	 String text=r1.text+r2.text;//摘要
                 double score=r1.score+r2.score;
            	 result r=new result(pdf,title,text,score,1);
//            	 float score=(float)m2.get(entry.getKey())+(float)entry.getValue();
            	 map.put((Integer)entry.getKey(), r);
             }
        }
		return map;
	}
		
}
