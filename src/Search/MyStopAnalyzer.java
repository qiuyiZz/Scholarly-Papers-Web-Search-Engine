package Search;

import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.CharArraySet;
//import org.apache.lucene.analysis.LetterTokenizer;
import org.apache.lucene.analysis.LowerCaseFilter;
//import org.apache.lucene.analysis.StopAnalyzer;
import org.apache.lucene.analysis.StopFilter;
import org.apache.lucene.analysis.TokenFilter;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.core.LetterTokenizer;
import org.apache.lucene.analysis.core.StopAnalyzer;
import org.apache.lucene.analysis.en.PorterStemFilter;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.analysis.tokenattributes.OffsetAttribute;
import org.apache.lucene.analysis.tokenattributes.PositionIncrementAttribute;
import org.apache.lucene.util.Version;


    
public class MyStopAnalyzer extends Analyzer {
        private CharArraySet stopWordsSet;//自己要屏蔽的一些单词
     String[] stopword= {
       "a","about","after","again","against","ain","all","am","an", "and", "any","are","aren", "as", "at", 
       "be","because","been","before","being","between","both","but", "by","can","couldn",
       "d","did","didn","do","does","doing","don","doesn","down","during", "each","from",
             "few","for","from","further",
             "had","hadn","has","hasn","have","haven","having","he","her","here","hers","herself","him",
             "himself","his","how","i","is","isn","if", 
             "in", "into", "is", "it","its","itself","just",
             "ll","m","ma","me","might","mightn","more","most","mustn","my","myself",
             "needn","no", "not","nor","now",
             "o", "of","off", "on","once","only","or","other","our","ours","ourselves","out","own","over",
             "re",
             "s","same","shan","she","should","shouldn","so","some","such",  
             "t","that","than", "the","them","themselves","they", "their","theirs", "then", "there", "these","this", 
             "they", "this","those","through","to","too",
             "up","under","until",
             "was","wasn","we","were","weren","what","where","when","which","while","who","whom","why",
             "will", "with","won","wouldn","ve","very" ,"y","you","your","yours","yourself","yourselves",
      }; 

        public  MyStopAnalyzer() {
                //将String数组转换为<span style="font-family: Arial, Helvetica, 
//           sans-serif;">CharArraySet</span>
                stopWordsSet  = StopFilter.makeStopSet(stopword, true);  //CharArraySet
        }
 
        @Override
        protected TokenStreamComponents createComponents(String arg0) {
                //创建一个分词器
                LetterTokenizer letterTokenizer = new LetterTokenizer();  
              
                //创建一系列分词过滤器
                LowerCaseFilter lowerCaseFilter = new LowerCaseFilter(letterTokenizer);
                StopFilter stopFilter = new StopFilter(lowerCaseFilter, stopWordsSet);
                TokenFilter stemFilter = new PorterStemFilter(stopFilter);
                
                //TokenStream包装类  
                return new TokenStreamComponents(letterTokenizer, stemFilter);
        }
        
//        public static void displayToken(String str,Analyzer a){            
//            try {
//                TokenStream tokenStream = a.tokenStream("", new  StringReader(str));
//                tokenStream = new PorterStemFilter(tokenStream);
//                OffsetAttribute offset = tokenStream.addAttribute(OffsetAttribute.class);
//                CharTermAttribute cta = tokenStream.addAttribute(CharTermAttribute.class);
//                tokenStream.reset();
//                while(tokenStream.incrementToken()){
//                 System.out.println(cta+"   "+offset.startOffset()+"   "+offset.endOffset()); 
//                }
//                System.out.println("\n");                   
//            } catch (IOException e) {
//                    // TODO Auto-generated catch block
//                    e.printStackTrace();
//            }
//         
//        }
        public static List<String> inputarray(String str,Analyzer a){
         List<String> array=new ArrayList<String>();
            try {
                TokenStream tokenStream = a.tokenStream("content", new  StringReader(str));
                CharTermAttribute cta = tokenStream.addAttribute(CharTermAttribute.class);
                tokenStream.reset();
                while(tokenStream.incrementToken()){
                 array.add(cta+"");
                }
                tokenStream.end(); 
                tokenStream.close();           
            } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
            }
         return array;
        }
     
        
}