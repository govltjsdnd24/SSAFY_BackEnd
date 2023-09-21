package edu.ssafy.dao;

import edu.ssafy.model.MemberDto;

public interface MemberDAO {
	MemberDto login(String id, String pw);
	boolean idCheck(String id);
}
