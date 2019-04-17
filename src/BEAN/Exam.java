package BEAN;

public class Exam {

	private Integer idTest;
	private Integer timeLimit;
	private Integer numberQuestion;
	private Integer idClass;
	private String username;
	
	public Exam() {}
	
	public Integer getID() {
		return idTest;
	}

	public void setID(Integer id) {
		this.idTest = id;
	}

	public Integer getTime() {
		return timeLimit;
	}

	public void setTime(Integer time) {
		this.timeLimit = time;
	}


	public Integer getSocauhoi() {
		return numberQuestion;
	}

	public void setSocauhoi(Integer fullname) {
		this.numberQuestion = fullname;
	}
	public Integer getIDClass() {
		return idClass;
	}

	public void setIDClass(Integer idClass) {
		this.idClass = idClass;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}