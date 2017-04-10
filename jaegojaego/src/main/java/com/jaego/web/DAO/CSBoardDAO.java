//20170406 박진우
package com.jaego.web.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jaego.web.VO.CSBoard;
import com.jaego.web.VO.CSReply;

@Repository
public class CSBoardDAO {

	@Autowired
	private SqlSession sqlsession;

	public int write(CSBoard csboard) {
		int result = 0;

		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		try {
			result = mapper.write(csboard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<CSBoard> getAll(int startRecord, int countPerPage, String searchText) {
		
		ArrayList<CSBoard> bList = new ArrayList<CSBoard>();
		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);		//offset은 시작위치, limit은 개수(제한) - ★ MyBatis에서 알아서 범위를 지정하도록 도와주는 명령어(쿼리로 해결할 수도 있지만, 이게 더 간단!)
		bList = mapper.getAll(rb,searchText);
		return bList;
	}

	public int getAllCount(String searchText) {	
		int result = 0; 
		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		result = mapper.getAllCount(searchText);
		return result;
	}
	
	public CSBoard selectOne(int boardnum) {	
		CSBoard csboard = null;
		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		csboard = mapper.selectOne(boardnum);
		return csboard;
	}
	
	public void insertCSReply (CSReply csreply) {
		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		mapper.insertCSReply(csreply);
	}
	
	public ArrayList<CSReply> getCSReplylist (int boardnum) {
		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		ArrayList<CSReply> replylist = mapper.getCSReplylist(boardnum);
		return replylist;
	}
	
	//몸글 삭제
	public int deleteCSBoard(CSBoard csboard) {
		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		int result = mapper.deleteCSBoard(csboard);
		return result;
	}
	
	//몸글 수정
	public void updateCSBoard(CSBoard csboard) {
		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		mapper.updateCSBoard(csboard);
	}
	
	//몸글 삭제 전 댓글 삭제
	public void deleteAllCSBoard(int boardnum) {
		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		mapper.deleteAllCSBoard(boardnum);
	}
	
	public CSReply getCSReply(int replynum) {
		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		CSReply csreply = mapper.getCSReply(replynum);
		return csreply;
	}
	
	//댓글 삭제
	public void deleteCSReply(int replynum) {
		CSBoardMapper mapper = sqlsession.getMapper(CSBoardMapper.class);
		mapper.deleteCSReply(replynum);
	}

}