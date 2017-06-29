package com.my.vo;

public class Paging {

	private int Size; // 한 페이지에 보일 게시글 수
	private int pageCount; // 총 페이지 갯수
	private int stand; // LIMIT 함수 첫번 째 인자
	
	
	
	public int getStand() {
		return stand;
	}
	public void setStand(int stand) {
		this.stand = stand;
	}
	public int getSize() {
		return Size;
	}
	public void setSize(int size) {
		Size = size;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	
	
}
