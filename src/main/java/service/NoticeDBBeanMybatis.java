package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.NoticeDataBean;
import model.SurveyBoardDataBean;
import mybatis.MybatisConnector;

@Service
public class NoticeDBBeanMybatis {
	private final String namespace = "mybatis.NoticeBoard";

	@Autowired
	public MybatisConnector mybatisConnector;
	
	public int getContentCount() {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		try {
			return sqlSession.selectOne(namespace + ".noticeListCount");
		} finally {
			sqlSession.close();
		}
	}

	public List<NoticeDataBean> getNoticeList(int startRow, int endRow) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		HashMap map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		try {
			return sqlSession.selectList(namespace + ".noticeList", map);
		} finally {
			sqlSession.close();
		}
	}

	public NoticeDataBean getNoticeContent(int nb_num) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		NoticeDataBean noticeDataBean = new NoticeDataBean();

		try {
			int result = sqlSession.update(namespace + ".updateReadCount", nb_num);
			noticeDataBean = sqlSession.selectOne(namespace + ".getSurveyBoardContent", nb_num);
		} finally {
			sqlSession.commit();
			sqlSession.close();
			return noticeDataBean;
		}

	}

	public String getEmpId(int nb_num) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		String empId = null;
		try {
			empId = sqlSession.selectOne(namespace + ".searchEmpId", nb_num);
			return empId;
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}

	}
}
