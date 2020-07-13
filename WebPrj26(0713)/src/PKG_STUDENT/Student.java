package PKG_STUDENT;

public class Student {

	private String stu_id;
	private String stu_name;
	private String stu_tel;
	
	public Student() {
		
	}

	public Student(String stu_id, String stu_name, String stu_tel) {
		this.stu_id = stu_id;
		this.stu_name = stu_name;
		this.stu_tel = stu_tel;
	}

	public String getStu_id() {
		return stu_id;
	}

	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}

	public String getStu_name() {
		return stu_name;
	}

	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}

	public String getStu_tel() {
		return stu_tel;
	}

	public void setStu_tel(String stu_tel) {
		this.stu_tel = stu_tel;
	}
	
	
	
	
	
	
}
