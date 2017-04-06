package com.jaego.web.DAO;

import java.util.ArrayList;

import com.jaego.web.VO.CSBoard;

public interface CSBoardMapper {

	public int write(CSBoard csboard);
	public ArrayList<CSBoard> getAll();

}