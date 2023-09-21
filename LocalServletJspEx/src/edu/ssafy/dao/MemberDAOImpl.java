package edu.ssafy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import edu.ssafy.model.MemberDto;
import edu.ssafy.util.DBUtil;

public class MemberDAOImpl implements MemberDAO {

	@Override
	public MemberDto login(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * \n");
			sql.append("from members \n");
			sql.append("WHERE user_id = ?" + " and user_password= ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				MemberDto memberDto = new MemberDto();
				memberDto.setUserId(rs.getString("user_id"));
				memberDto.setUserName(rs.getString("user_name"));
				memberDto.setUserPwd(rs.getString("user_password"));
				return memberDto;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs, pstmt, conn);
		}
		return null;
	}

	@Override
	public boolean idCheck(String id) {
		// TODO Auto-generated method stub
		return false;
	}

}
