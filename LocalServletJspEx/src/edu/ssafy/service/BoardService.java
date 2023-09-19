package edu.ssafy.service;

import java.util.List;

import edu.ssafy.dao.BoardDto;

public interface BoardService {
	int writeArticle(BoardDto boardDto);
	List<BoardDto> listArticle();
	BoardDto viewArticle(int articleNo);
	void updateHit(int articleNo);
}
