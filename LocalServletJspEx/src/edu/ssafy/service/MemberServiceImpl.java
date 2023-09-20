package edu.ssafy.service;

import edu.ssafy.dao.MemberDAO;
import edu.ssafy.dao.MemberDAOImpl;
import edu.ssafy.model.MemberDto;

public class MemberServiceImpl implements MemberService{

	MemberDAO dao;
	
	public MemberServiceImpl() {
		dao=new MemberDAOImpl();
	}

	@Override
	public MemberDto login(String id, String pw) {
		// TODO Auto-generated method stub
		return dao.login(id, pw);
	}

}
