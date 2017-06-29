package com.my.vo;

public class RepBoard {
   private int repboard_no;
   private int parent_no;
   private String email;
   private String subject;
   private String content;   //내용
   private String password;
   private String image_url;
   private String date;
   private int views;
   private String nickname;
   private int grp;
   
   
   public RepBoard() {
      super();
   }

   public RepBoard(int repboard_no, int parent_no, String subject, String content, String password, String image_url) {   //글을 검색해서 반환할때 사용하는 생성자
      super();
      this.repboard_no = repboard_no;
      this.parent_no = parent_no;
      this.subject = subject;
      this.content = content;   
      this.password = password;   //답글
      this.image_url = image_url;
   }
/**
 * 답글 쓰기 메소드 
 * @param parent_no
 * @param subject
 * @param content
 * @param password
 */
   public RepBoard(int parent_no, String subject, String content, String password) {   //답글쓰기할때 사용할 생성자
      super();
      this.parent_no = parent_no;
      this.subject = subject;
      this.content = content;
      this.password = password;   //새글쓰기
   }

   /**
    * 글쓰기 메소드 
    * parent_no는 null
    * @param subject
    * @param content
    * @param password
    * @param email
    * @param image_url
    */
   public RepBoard(String subject, String content, String password, String email, String image_url) {   //글쓰기할때 필요한 생성자
      super();
      this.subject = subject;
      this.content = content;
      this.password = password;
      this.email = email;
      this.image_url = image_url;
   }

   public RepBoard(String subject, String content, int repboard_no ){
	   this.subject = subject;
	   this.content = content;
	   this.repboard_no = repboard_no;
   }
   
   
   public int getGrp() {
	return grp;
}

public void setGrp(int grp) {
	this.grp = grp;
}

public String getNickname() {
      return nickname;
   }
   

   public void setNickname(String nickname) {
	this.nickname = nickname;
}

public String getDate() {
      return date;
   }

   public void setDate(String date) {
      this.date = date;
   }

   public int getViews() {
      return views;
   }

   public void setViews(int views) {
      this.views = views;
   }

   public int getRepboard_no() {
      return repboard_no;
   }

   public int getNo() {
      return repboard_no;
   }

   public void setNo(int repboard_no) {
      this.repboard_no = repboard_no;
   }

   public int getParent_no() {
      return parent_no;
   }

   public void setParent_no(int parent_no) {
      this.parent_no = parent_no;
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

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getImage_url() {
      return image_url;
   }

   public void setImage_url(String image_url) {
      this.image_url = image_url;
   }

@Override
public String toString() {
	return "RepBoard [repboard_no=" + repboard_no + ", parent_no=" + parent_no + ", email=" + email + ", subject="
			+ subject + ", content=" + content + ", password=" + password + ", image_url=" + image_url + ", date="
			+ date + ", views=" + views + ", nickname=" + nickname + "]";
}



   

   
   
   
   
   
   
}

