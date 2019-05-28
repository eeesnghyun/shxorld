package web.admin;

/*CREATE TABLE useri(
		u_no				INT NOT NULL AUTO_INCREMENT,
		u_type			VARCHAR(1) NOT NULL,
		u_id				VARCHAR(20),
		u_passwd		VARCHAR(20),
		u_name			VARCHAR(20),
		u_tel				VARCHAR(15),
		u_mail			VARCHAR(50),	
		u_date 			TIMESTAMP DEFAULT NOW(),
		u_file 			VARCHAR(20),
		u_filesize	INT DEFAULT 0,
		u_ip				VARCHAR(30),
		u_useyn			VARCHAR(1) DEFAULT 'Y',
		PRIMARY KEY(u_no)
	);*/
public class AdminVO {
	private int u_no;
	private String u_type;
	private String u_id;
	private String u_passwd;
	private String u_name;
	private String u_tel;
	private String u_mail;
	private String u_date;
	private String u_file;
	private int u_filesize;
	private String u_ip;
	private String u_useyn;
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getU_type() {
		return u_type;
	}
	public void setU_type(String u_type) {
		this.u_type = u_type;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_passwd() {
		return u_passwd;
	}
	public void setU_passwd(String u_passwd) {
		this.u_passwd = u_passwd;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_tel() {
		return u_tel;
	}
	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}
	public String getU_mail() {
		return u_mail;
	}
	public void setU_mail(String u_mail) {
		this.u_mail = u_mail;
	}
	public String getU_date() {
		return u_date;
	}
	public void setU_date(String u_date) {
		this.u_date = u_date;
	}
	public String getU_file() {
		return u_file;
	}
	public void setU_file(String u_file) {
		this.u_file = u_file;
	}
	public int getU_filesize() {
		return u_filesize;
	}
	public void setU_filesize(int u_filesize) {
		this.u_filesize = u_filesize;
	}
	public String getU_ip() {
		return u_ip;
	}
	public void setU_ip(String u_ip) {
		this.u_ip = u_ip;
	}
	public String getU_useyn() {
		return u_useyn;
	}
	public void setU_useyn(String u_useyn) {
		this.u_useyn = u_useyn;
	}
	
	
}
