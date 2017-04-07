//20170406 박진우
package com.jaego.web.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.jaego.web.VO.CSBoard;

public interface CSBoardMapper {

	public int write(CSBoard csboard);
	public ArrayList<CSBoard> getAll(RowBounds rb, String searchText);		//★ 몇 개를 가져올 지가 담기게 됨	: 기존 getAll 쿼리를 변경 없이 범위만 지정해서 가져올 수 있게 됨 - RowBounds는 매개변수가 아니라 그저 세팅!
	public int getAllCount(String searchText);

}