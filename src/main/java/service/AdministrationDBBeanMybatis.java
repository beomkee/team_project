package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.NoticeDataBean;
import model.TopMenuDataBean;
import mybatis.MybatisConnector;

@Service
public class AdministrationDBBeanMybatis {
	
	private final String namespace = "mybatis.Administer";
	private final String namespace1 = "mybatis.TopMenu";

	@Autowired
	public MybatisConnector mybatisConnector;
	
	/*==================================공지사항======================================================*/
	
	public List<NoticeDataBean> getNoticeList() throws Exception {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		try {
			return sqlSession.selectList(namespace + ".noticeList");
		} finally {
			sqlSession.close();
		}
	}

	public int getNoticeNum() {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		int number = sqlSession.selectOne(namespace + ".getNoticeNum");
		try {
			System.out.println("search 0k:" + number);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return number;
	}

	public void insertNotice(NoticeDataBean notice) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		try {
			int result = sqlSession.insert(namespace + ".insertNotice", notice);
			System.out.println("insert  0k:" + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	
	public int getNoticeSelectCount(int nb_num) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		int count = sqlSession.selectOne(namespace + ".getNoticeSelectOverNum",nb_num);
		try {
			System.out.println("search 0k:" + count);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return count;
	}

	public void updateNoticeNum(int nb_numEdit) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		int nb_num = nb_numEdit-1;
		HashMap map = new HashMap();
		map.put("nb_numEdit", nb_numEdit);
		map.put("nb_num", nb_num);
		try {
			int result = sqlSession.update(namespace + ".updateNoticeNum",map);
			System.out.println("update  0k:" + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public void deleteNotice(int nb_num) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		try {
			int result = sqlSession.delete(namespace + ".deleteNotice",nb_num);
			System.out.println("delete  0k:" + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public void updateNotice(NoticeDataBean notice) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		try {
			int result = sqlSession.update(namespace + ".updateNotice",notice);
			System.out.println("update  0k:" + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public List<NoticeDataBean> getNoticeInfo(int nb_num) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		
		try {
			return sqlSession.selectList(namespace + ".bringNoticeAbout", nb_num);
		} finally {
			sqlSession.close();
		}
	}
	
	/*==================================메뉴======================================================*/

	public List<TopMenuDataBean> getTopMenuList() {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		try {
			return sqlSession.selectList(namespace1 + ".topMenuList");
		} finally {
			sqlSession.close();
		}
	}
	
	public int getTopMenuCount() {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		int number = sqlSession.selectOne(namespace1 + ".getTopMenuNum");
		try {
			System.out.println("search 0k:" + number);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return number;
	}
	
	public void insertTopMenu(TopMenuDataBean topMenu, String tm_parentYN) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		try {
			if (tm_parentYN.equals("y")) {
				int result = sqlSession.insert(namespace1 + ".insertTopMenu", topMenu);
				System.out.println("insert  0k:" + result);
			}
			else if (tm_parentYN.equals("n")) {
				int result = sqlSession.insert(namespace1 + ".insertTopMenuNotparent", topMenu);
				System.out.println("insert  0k:" + result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	public List<TopMenuDataBean> getMenuInfo(int tm_num) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		try {
			return sqlSession.selectList(namespace1 + ".bringMenuInfo", tm_num);
		} finally {
			sqlSession.close();
		}
	}
	
	public void updateTopMenu(TopMenuDataBean topMenu, String tm_parentYN) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		try {
			if (tm_parentYN.equals("y")) {
			int result = sqlSession.update(namespace1 + ".updateTopMenu",topMenu);
			System.out.println("update  0k:" + result);
			}
			else if (tm_parentYN.equals("n")) {
				int result = sqlSession.update(namespace1 + ".updateTopMenuNotparent",topMenu);
				System.out.println("update  0k:" + result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}


	public void deleteMenu(int tm_num) {
		SqlSession sqlSession = mybatisConnector.sqlSession();
		try {
			int result = sqlSession.delete(namespace1 + ".deleteTopMenu",tm_num);
			System.out.println("delete  0k:" + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	

}
