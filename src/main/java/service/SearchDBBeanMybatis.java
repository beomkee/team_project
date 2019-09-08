package service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.Parcel;
import model.Pickup;
import model.Qualities;
import model.RootNode;
import model.WayBill;
import mybatis.MybatisConnector;

@Service
public class SearchDBBeanMybatis {

	private final String namespace = "mybatis.search";
	
	@Autowired
	public MybatisConnector mybatisConnector;
	
	public WayBill searchPost(String w_num) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		try {
			WayBill wb = sqlSession.selectOne(namespace + ".searchPost", w_num);
			return wb;
		} finally {
			sqlSession.close();
		} 
	}
	
	public RootNode selectNodeCode(String w_num) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		try {
			RootNode rn = sqlSession.selectOne(namespace + ".selectNodeCode", w_num);
			return rn;
		} finally {
			sqlSession.close();
		} 
	}
	
	public List<Qualities> selectQualities(String w_num){
		SqlSession sqlSession = mybatisConnector.sqlSession();		
		List<Qualities> list = new ArrayList<Qualities>();
		try {
			list = sqlSession.selectList(namespace + ".selectQualities", w_num);
			return list;
		} finally {
			sqlSession.close();
		}
	}
	
	public Parcel selectWhereNow(String w_num) {
		SqlSession sqlSession = mybatisConnector.sqlSession();		
		try {
			Parcel parcel = sqlSession.selectOne(namespace + ".selectWhereNow", w_num);
			return parcel;
		} finally {
			sqlSession.close();
		}
	}
	
	public Pickup reservedChk(String p_num) {
		SqlSession sqlSession = mybatisConnector.sqlSession();		
		try {
			Pickup pickup = sqlSession.selectOne(namespace + ".reservedChk", p_num);
			return pickup;
		} finally {
			sqlSession.close();
		}
	}
	
	public void pickupReserve(Pickup pickup) {
		SqlSession sqlSession = mybatisConnector.sqlSession();	
		try {
			int result = sqlSession.insert(namespace + ".pickupReserve", pickup);
			if(result > 0) {
				sqlSession.commit();
			}
		} finally {
			sqlSession.close();
		}
	}
}
