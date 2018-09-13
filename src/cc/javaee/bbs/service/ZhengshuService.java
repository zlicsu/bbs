package cc.javaee.bbs.service;

import java.util.List;

import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Zhengshu;

public interface ZhengshuService {

	public void insert(Zhengshu zhengshu);
	
	public List<Zhengshu> queryIndexList();
	
	public PageBean<Zhengshu> findpage(Zhengshu zhengshu,PageBean<Zhengshu> page);
}
