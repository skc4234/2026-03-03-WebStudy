package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	// 기능
	/*
<select id="memberIdCount" resultType="int" parameterType="String">
	SELECT COUNT(*) FROM member WHERE id=#{id}
</select>
<select id="memberGetPassword" resultType="MemberVO" parameterType="String">
	SELECT id,name,pwd FROM member WHERE id=#{id}
</select>
	 */
	public static MemberVO memberLogin(String id, String pwd) {
		MemberVO vo=new MemberVO();
		SqlSession session=ssf.openSession();
		int count=session.selectOne("memberIdCount",id);
		// ID 존재 여부
		// ID가 없으면
		if(count==0) {
			vo.setMsg("NOID");
		}
		// ID가 존재하면
		else {
			MemberVO dbVO=session.selectOne("memberGetPassword",id);
			// 비밀번호가 맞다면
			if(pwd.equals(dbVO.getPwd())) {
				// session에 저장된 데이터를 가지고 온다
				vo.setId(dbVO.getId());
				vo.setName(dbVO.getName());
				vo.setMsg("OK");
			}
			// 비밀번호가 틀리다면
			else {
				vo.setMsg("NOPWD");
			}
		}
		if(session!=null) session.close();
		return vo;
	}
}
