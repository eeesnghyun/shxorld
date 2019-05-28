package web.project_br;
/*CREATE TABLE project_br(
	pb_no				INT NOT NULL AUTO_INCREMENT,
	pb_title			VARCHAR(30),
	pb_content		VARCHAR(4000),
	pb_tool			VARCHAR(100),
	pb_os				VARCHAR(100),
	pb_server		VARCHAR(100),
	pb_db				VARCHAR(100),
	pb_skill			VARCHAR(100),				
	pb_user			VARCHAR(20) NOT NULL,
	pb_ymd 			TIMESTAMP DEFAULT NOW(),
	pb_img 			VARCHAR(50),
	PRIMARY KEY(pb_no)
);*/
public class ProjectBrVO {
	private int pb_no;
	private String pb_title;
	private String pb_content;
	private String pb_tool;
	private String pb_os;
	private String pb_server;
	private String pb_db;
	private String pb_skill;	
	private String pb_user;
	private String pb_ymd;
	private String pb_img;
	
	public int getPb_no() {
		return pb_no;
	}
	public void setPb_no(int pb_no) {
		this.pb_no = pb_no;
	}
	public String getPb_title() {
		return pb_title;
	}
	public void setPb_title(String pb_title) {
		this.pb_title = pb_title;
	}
	public String getPb_content() {
		return pb_content;
	}
	public void setPb_content(String pb_content) {
		this.pb_content = pb_content;
	}
	public String getPb_tool() {
		return pb_tool;
	}
	public void setPb_tool(String pb_tool) {
		this.pb_tool = pb_tool;
	}
	public String getPb_os() {
		return pb_os;
	}
	public void setPb_os(String pb_os) {
		this.pb_os = pb_os;
	}
	public String getPb_server() {
		return pb_server;
	}
	public void setPb_server(String pb_server) {
		this.pb_server = pb_server;
	}
	public String getPb_db() {
		return pb_db;
	}
	public void setPb_db(String pb_db) {
		this.pb_db = pb_db;
	}
	public String getPb_skill() {
		return pb_skill;
	}
	public void setPb_skill(String pb_skill) {
		this.pb_skill = pb_skill;
	}
	public String getPb_user() {
		return pb_user;
	}
	public void setPb_user(String pb_user) {
		this.pb_user = pb_user;
	}
	public String getPb_ymd() {
		return pb_ymd;
	}
	public void setPb_ymd(String pb_ymd) {
		this.pb_ymd = pb_ymd;
	}
	public String getPb_img() {
		return pb_img;
	}
	public void setPb_img(String pb_img) {
		this.pb_img = pb_img;
	}
	
		
}
