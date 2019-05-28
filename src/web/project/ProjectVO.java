package web.project;
/*CREATE TABLE project(
		p_no				INT NOT NULL AUTO_INCREMENT,
		p_type			VARCHAR(20) NOT NULL,
		p_title			VARCHAR(30),
		p_content		TEXT,
		p_cnt				INT DEFAULT 0,
		p_user			VARCHAR(20) NOT NULL,
		p_ymd 			TIMESTAMP DEFAULT NOW(),
		p_git  		  VARCHAR(100),
		p_img 			VARCHAR(50),
		p_show			VARCHAR(1) DEFAULT 'Y' NOT NULL,
		PRIMARY KEY(p_no)
	);*/
public class ProjectVO {
	private int p_no;
	private String p_type;
	private String p_title;
	private String p_content;
	private int p_cnt;
	private String p_user;
	private String p_ymd;
	private String p_git;
	private String p_img;
	private String p_show;
	private String p_brief;
	private int rnum;	
	
	public String getP_brief() {
		return p_brief;
	}
	public void setP_brief(String p_brief) {
		this.p_brief = p_brief;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public int getP_cnt() {
		return p_cnt;
	}
	public void setP_cnt(int p_cnt) {
		this.p_cnt = p_cnt;
	}
	public String getP_user() {
		return p_user;
	}
	public void setP_user(String p_user) {
		this.p_user = p_user;
	}
	public String getP_ymd() {
		return p_ymd;
	}
	public void setP_ymd(String p_ymd) {
		this.p_ymd = p_ymd;
	}
	public String getP_git() {
		return p_git;
	}
	public void setP_git(String p_git) {
		this.p_git = p_git;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getP_show() {
		return p_show;
	}
	public void setP_show(String p_show) {
		this.p_show = p_show;
	}
		
}
