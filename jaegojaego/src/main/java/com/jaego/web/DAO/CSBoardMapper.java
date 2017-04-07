//20170406 박진우
package com.jaego.web.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.jaego.web.VO.CSBoard;

public interface CSBoardMapper {

	public int write(CSBoard csboard);
	public ArrayList<CSBoard> getAll(RowBounds rb);
	public int getAllCount();

}