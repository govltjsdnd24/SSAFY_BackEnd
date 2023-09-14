package edu.vo;

public class Board {
	private String articleNo;
	private String hit;
	private String registerTime;
	private String username;
	private String subject;
	private String content;

	public Board(String articleNo,String username, String subject, String content,String hit,String registerTime) {
		this.articleNo=articleNo;
		this.username = username;
		this.subject = subject;
		this.content = content;
		this.hit = hit;
		this.registerTime=registerTime;
	}
	
	@Override
	public String toString() {
		return "Board [articleNo=" + articleNo + ", hit=" + hit + ", registerTime=" + registerTime + ", username="
				+ username + ", subject=" + subject + ", content=" + content + "]";
	}

	public String getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(String articleNo) {
		this.articleNo = articleNo;
	}
	public String getHit() {
		return hit;
	}
	public void setHit(String hit) {
		this.hit = hit;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	

}
