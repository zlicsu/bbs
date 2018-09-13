package cc.javaee.bbs.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Zhengshu;

@Repository
public class ZhengshuDao extends SqlSessionDaoSupport {
	
	String ns="gk_zhengshu.";
	
	public void insert(Zhengshu zhengshu) {
		this.getSqlSession().insert(ns+"insert", zhengshu);
	}
	
	public List<Zhengshu> queryIndexList() {
		return this.getSqlSession().selectList(ns+"queryIndexList");
	}
	
	public List<Zhengshu> findpage(PageBean<Zhengshu> page) {
		return this.getSqlSession().selectList(ns+"findpage", page);
	}
	
	public int findpagecount(PageBean<Zhengshu> page) {
		return this.getSqlSession().selectOne(ns+"findpagecount", page);
	}

}
