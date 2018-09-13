package cc.javaee.bbs.service;

import java.util.List;

import cc.javaee.bbs.model.Company;
import cc.javaee.bbs.model.PageBean;

public interface CompanyService {

	public void insert(Company company);
	
	public List<Company> queryIndexList();
	
	public PageBean<Company> findpage(Company company,PageBean<Company> page);
}
