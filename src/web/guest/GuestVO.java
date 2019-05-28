package web.guest;
/*CREATE TABLE guest(
		g_no				  INT NOT NULL,
		g_show				VARCHAR(1) DEFAULT 'Y',
		g_name				VARCHAR(20),
		g_content			TEXT,
		g_password 		VARCHAR(20),
		g_ymd					TIMESTAMP,
		PRIMARY KEY(g_no)
	);*/
public class GuestVO {
	private int g_no;
	private String g_show;
	private String g_name;
	private String g_content;
	private String g_password;
	private String g_ymd;
	private String g_img;
	private String g_ip;	
	
	public String getG_ip() {
		return g_ip;
	}
	public void setG_ip(String g_ip) {
		this.g_ip = g_ip;
	}
	public String getG_img() {
		return g_img;
	}
	public void setG_img(String g_img) {
		this.g_img = g_img;
	}
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	public String getG_show() {
		return g_show;
	}
	public void setG_show(String g_show) {
		this.g_show = g_show;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getG_content() {
		return g_content;
	}
	public void setG_content(String g_content) {
		this.g_content = g_content;
	}
	public String getG_password() {
		return g_password;
	}
	public void setG_password(String g_password) {
		this.g_password = g_password;
	}
	public String getG_ymd() {
		return g_ymd;
	}
	public void setG_ymd(String g_ymd) {
		this.g_ymd = g_ymd;
	}
		
}
