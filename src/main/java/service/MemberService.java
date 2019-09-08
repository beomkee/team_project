package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.Emp;
import model.MemberDataBean;
import mybatis.MybatisConnector;

@Service //���� Ŭ������ ���������� �����ϴ� service bean���� ���
public class MemberService {

	private final String namespace = "mybatis.Member";

	@Autowired
	public MybatisConnector mybatisConnentor;

	public List getAllNodeDiv2() throws Exception {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		try {
			return sqlSession.selectList(namespace + ".getAllNodeDiv2");
		} finally {
			sqlSession.close();
		}

	}

	public void insertMember(MemberDataBean member) throws Exception {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		try {
			System.out.println(member);
			sqlSession.insert(namespace + ".insertMember", member);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public int getMaxNum() {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		try {
			return sqlSession.selectOne(namespace + ".getMaxNum");
		} finally {
			sqlSession.close();
		}

	}

	public MemberDataBean user_login(String m_id, String m_pw) throws Exception {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		HashMap map = new HashMap();
		map.put("m_id", m_id);
		map.put("m_pw", m_pw);
		System.out.println("---------service_login");
		try {
			return sqlSession.selectOne(namespace + ".user_login", map);
		} finally {
			sqlSession.close();
		}
	}
	public int user_meminformation(MemberDataBean member) throws Exception {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		System.out.println("---------service_user_meminformation");
		try {
			return sqlSession.update(namespace + ".user_meminformation", member);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	public int isMember(String id) {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		try {
			return sqlSession.selectOne(namespace + ".isMem", id);
		} finally {
			sqlSession.close();
		}
	}
	
	public Emp empLogin(String id, String pw) {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("pw", pw);
		try {
			System.out.println("service: "+id+","+pw);
			return sqlSession.selectOne(namespace + ".empLogin", map);
		} finally {
			sqlSession.close();
		}
	}
	
}
