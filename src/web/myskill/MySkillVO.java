package web.myskill;
/*CREATE TABLE myskill(
		s_no				INT NOT NULL AUTO_INCREMENT,
		s_type			VARCHAR(5) NOT NULL,
		s_name		VARCHAR(20) NOT NULL,
		s_rate				INT NOT NULL,
		s_id					VARCHAR(20),
		PRIMARY KEY(s_no)
	);*/
public class MySkillVO {
	private int s_no;
	private String s_type;
	private int s_java;
	private int s_javascript;
	private int s_jquery;
	private String s_id;
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getS_type() {
		return s_type;
	}
	public void setS_type(String s_type) {
		this.s_type = s_type;
	}
	public int getS_java() {
		return s_java;
	}
	public void setS_java(int s_java) {
		this.s_java = s_java;
	}
	public int getS_javascript() {
		return s_javascript;
	}
	public void setS_javascript(int s_javascript) {
		this.s_javascript = s_javascript;
	}
	public int getS_jquery() {
		return s_jquery;
	}
	public void setS_jquery(int s_jquery) {
		this.s_jquery = s_jquery;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	
}
