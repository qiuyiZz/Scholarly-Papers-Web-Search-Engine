package Search;

import java.util.ArrayList;
import java.util.Scanner;


public class Searcher {
	ArrayList<String> pdf_name = new ArrayList<>();
	public Searcher(int a,String n) throws Exception{
		
		

		
	}
	public Searcher(int flag1,String flag,int position,int flag2,String author,int flag3,String other){
		
	}
	public ArrayList<String> getResult(){
		ArrayList<String> result = new ArrayList<>();
		for(int i=0;i<pdf_name.size();i++) {
			result.set(i, pdf_name.get(i));
		}
		return result;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
