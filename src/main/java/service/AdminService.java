package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.Deliverestimation;
import model.Emp;
import mybatis.MybatisConnector;

@Service
public class AdminService {

	private final String namespace = "mybatis.Admin";

	@Autowired
	public MybatisConnector mybatisConnentor;

	public List<Deliverestimation> getDS(String num) {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		try {
			return sqlSession.selectList(namespace + ".getDS", num);
		} finally {
			sqlSession.close();
		}
	}

	public int getCurrentNode(String num) {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		try {
			int nodeNum = 0;
			int node = 0;
			nodeNum = sqlSession.selectOne(namespace + ".isStartNode", num);
			System.out.println("start: " + nodeNum);
			if (nodeNum == 1) {
				node = 1;
			}
			nodeNum = sqlSession.selectOne(namespace + ".isViaNode", num);
			System.out.println("via: " + nodeNum);
			if (nodeNum == 1) {
				node = 2;
			}
			nodeNum = sqlSession.selectOne(namespace + ".isEndNode", num);
			System.out.println("end: " + nodeNum);

			if (nodeNum == 1) {
				node = 3;
			}
			return node;
		} finally {
			sqlSession.close();
		}
	}

	public List<Emp> getNextEmp(String num, int currentNode) {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		try {
			int node = 0;
			if (currentNode == 1) {
				node = sqlSession.selectOne(namespace + ".getViaNum", num);
				return sqlSession.selectList(namespace + ".getEmps", node);
			} else {
				node = sqlSession.selectOne(namespace + ".getEndNum", num);
				return sqlSession.selectList(namespace + ".getEmps", node);
			}
		} finally {
			sqlSession.close();
		}
	}

	public int passParcel(String emp, String quality, String ds_num) {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		try {
			HashMap map = new HashMap();
			map.put("emp", emp);
			map.put("quality", quality);
			map.put("ds_num", ds_num);
			System.out.println(map);
			sqlSession.update(namespace + ".updateParcel", map);
			return sqlSession.insert(namespace + ".passParcel", map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public void clearParcel(String num, String receiver, String receiverLocation, String emp) {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		try {
			HashMap map = new HashMap();
			map.put("receiver", receiver);
			map.put("receiverLocation", receiverLocation);
			map.put("emp", emp);
			map.put("num", num);
			sqlSession.insert(namespace + ".insertReceiver", map);
			sqlSession.update(namespace + ".clearParcel", num);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	public int isPickup(String num) {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		try {
			return sqlSession.selectOne(namespace + ".isPickup", num);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	public String getpick(String num) {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		try {
			return sqlSession.selectOne(namespace + ".getpick",num);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	public String getempNode(String num) {
		SqlSession sqlSession = mybatisConnentor.sqlSession();
		try {
			return sqlSession.selectOne(namespace + ".getempNode",num);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
}
