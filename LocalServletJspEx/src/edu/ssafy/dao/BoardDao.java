package edu.ssafy.dao;

import java.util.List;

import edu.ssafy.dao.BoardDto;

public interface BoardDao {

	int writeArticle(BoardDto boardDto);
	List<BoardDto> listArticle();
	BoardDto viewArticle(int articleNo);
	void updateHit(int articleNo);
	
}
