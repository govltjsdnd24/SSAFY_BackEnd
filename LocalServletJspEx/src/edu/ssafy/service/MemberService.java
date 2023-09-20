package edu.ssafy.service;

import edu.ssafy.model.MemberDto;

public interface MemberService {
	MemberDto login (String id, String pw);
}
