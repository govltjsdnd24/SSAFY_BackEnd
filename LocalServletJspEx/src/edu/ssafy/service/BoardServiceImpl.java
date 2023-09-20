package edu.ssafy.service;

import java.util.List;

import edu.ssafy.dao.BoardDao;
import edu.ssafy.dao.BoardDaoImpl;
import edu.ssafy.dao.BoardDto;

public class BoardServiceImpl implements BoardService{
	static private BoardDao dao;
	private static BoardService boardService = new BoardServiceImpl();
	private BoardServiceImpl() {
		dao= BoardDaoImpl.getBoardDao();
	}
	
	public static BoardService getBoardService() {
		return boardService;
	}
	@Override
	public int writeArticle(BoardDto boardDto) {
		return dao.writeArticle(boardDto);
	}
	@Override
	public List<BoardDto> listArticle() {
		return dao.listArticle();
	}
	@Override
	public BoardDto viewArticle(int articleNo) {
		return dao.viewArticle(articleNo);
	}
	@Override
	public void updateHit(int articleNo) {
		dao.updateHit(articleNo);
		
	}
	
	
}
