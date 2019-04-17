package BEAN;

public class Question {
	private int idQuest;
	private String questname;
	private String a;
	private String b;
	private String c;
	private String d;
	private String answer;
	private String type;
	private int number;
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public Question() {}
	
	public String getQuestname() {
		return questname;
	}

	public void setQuestname(String questname) {
		this.questname = questname;
	}
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	public int getID() {
		return idQuest;
	}

	public int setID(int id) {
		return this.idQuest = id;
	}
	
	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}


	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}
	public String getC() {
		return c;
	}

	public void setC(String c) {
		this.c = c;
	}
	public String getD() {
		return d;
	}

	public void setD(String d) {
		this.d = d;
	}
	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
}
