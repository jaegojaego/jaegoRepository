//20170406 박진우 : 게시판 VO
package com.jaego.web.VO;

public class CSBoard {

	private int boardnum;
	private String id;
	private String title;
	private String content;
	private String inputdate;
	private int hits;
	private String originalfile;
	private String savedfile;
	private String type;

	public CSBoard(int boardnum, String id, String title, String content, String inputdate, int hits, String originalfile, String savedfile, String type) {
		this.boardnum = boardnum;
		this.id = id;
		this.title = title;
		this.content = content;
		this.inputdate = inputdate;
		this.hits = hits;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
		this.type = type;
	}

	public CSBoard() {

	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}
	
	public String getOriginalfile() {
		return originalfile;
	}

	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}

	public String getSavedfile() {
		return savedfile;
	}

	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "CSBoard [boardnum=" + boardnum + ", id=" + id + ", title=" + title + ", content=" + content + ", inputdate=" + inputdate + ", hits=" + hits + ", originalfile=" + originalfile + ", savedfile=" + savedfile + ", type=" + type + "]";
	}

}