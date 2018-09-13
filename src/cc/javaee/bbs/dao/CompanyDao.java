package cc.javaee.bbs.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cc.javaee.bbs.model.Company;
import cc.javaee.bbs.model.PageBean;

@Repository
public class CompanyDao extends SqlSessionDaoSupport {
	
	String ns="gk_company.";
	
	public void insert(Company company) {
		this.getSqlSession().insert(ns+"insert", company);
	}
	
	public List<Company> queryIndexList() {
		return this.getSqlSession().selectList(ns+"queryIndexList");
	}
	
	public List<Company> findpage(PageBean<Company> page) {
		return this.getSqlSession().selectList(ns+"findpage", page);
	}
	
	public int findpagecount(PageBean<Company> page) {
		return this.getSqlSession().selectOne(ns+"findpagecount", page);
	}

}
