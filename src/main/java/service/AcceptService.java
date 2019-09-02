package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.Charge;
import model.WayBill;
import mybatis.MybatisConnector;

@Service
public class AcceptService {

	private final String namespace = "mybatis.Accept";

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
	
	public Charge chargeCal(String size, String area) {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		HashMap map = new HashMap();
		map.put("size", size);
		map.put("area", area);
		try {
			return sqlSession.selectOne(namespace + ".chargeCal", map);
		} finally {
			sqlSession.close();
		}
	}
	
	public void insertWayBill(WayBill wayBill) throws Exception{
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		try {
			int result = sqlSession.insert(namespace + ".insertWayBill", wayBill);
		} catch (Exception e) { e.printStackTrace(); }
		 finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

}
