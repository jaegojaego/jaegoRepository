//20170406 박진우
package com.jaego.web.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.jaego.web.VO.CSBoard;
import com.jaego.web.VO.CSReply;

public interface CSBoardMapper {

	public int write(CSBoard csboard);
	public ArrayList<CSBoard> getAll(RowBounds rb, String searchText);		//★ 몇 개를 가져올 지가 담기게 됨	: 기존 getAll 쿼리를 변경 없이 범위만 지정해서 가져올 수 있게 됨 - RowBounds는 매개변수가 아니라 그저 세팅!
	public int getAllCount(String searchText);
	public CSBoard selectOne(int boardnum);
	public void insertCSReply (CSReply csreply);
	public ArrayList<CSReply> getCSReplylist (int boardnum);
	public int deleteCSBoard(CSBoard csboard);	//몸글 삭제
	public void updateCSBoard(CSBoard csboard);	//몸글 수정
	public void deleteAllCSBoard(int boardnum);	//몸글 삭제 전 댓글 삭제
	public CSReply getCSReply(int replynum);
	public void deleteCSReply(CSReply csreply);

}