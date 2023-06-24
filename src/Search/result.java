package Search;

public class result implements Comparable<result> {

	public String pdf;
	public String title;
	public String text;//摘要
	public double score;
	public int flag=0;//tilte是否高亮处理过
	public result(String pdf,String title,String text,double d,int flag) {
		this.pdf=pdf;
		this.title=title;
		this.text=text;
		this.score=d;
		this.flag=flag;
	}
	
	public String tostring() {
		return pdf+"\n"+title+"\n"+score+"\n"+text;
	}

	public String getPdf() {
		return pdf;
	}

	public String getTitle() {
		return title;
	}

	public double getScore() {
		return score;
	}

	public String getText() {
		return text;
	}
	
	public int compareTo(result a) {
		if(this.score-a.score<0) {
			return 1;
		}else if(this.score-a.score>0) {
			return -1;
		}else {
			return 0;
		}
	}
	}
