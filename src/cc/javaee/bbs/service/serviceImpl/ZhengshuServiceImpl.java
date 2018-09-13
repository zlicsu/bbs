package cc.javaee.bbs.service.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.javaee.bbs.dao.ZhengshuDao;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Zhengshu;
import cc.javaee.bbs.service.ZhengshuService;
/**
 * 证书service实现类
 * @author lzhang6
 *
 */
@Service
public class ZhengshuServiceImpl implements ZhengshuService {

	@Autowired
	private ZhengshuDao zhengshuDao;
	
	public void insert(Zhengshu zhengshu) {
		if(zhengshu.getRegType().equals("1")) {
			zhengshu.setRegType("初始注册");
		}else if(zhengshu.getRegType().equals("2")) {
			zhengshu.setRegType("转注册");
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		zhengshu.setCreatetime(df.format(new Date()));
		zhengshuDao.insert(zhengshu);
	}
	
	public List<Zhengshu> queryIndexList(){
		List<Zhengshu> queryIndexList = zhengshuDao.queryIndexList();
		for (Zhengshu zhengshu : queryIndexList) {
			String xing = zhengshu.getName().substring(0, 1);
			zhengshu.setName(xing+"工");
		}
		return queryIndexList;
	}
	
	public PageBean<Zhengshu> findpage(Zhengshu zhengshu,PageBean<Zhengshu> page) {
		page.setBean(zhengshu);
		int count = zhengshuDao.findpagecount(page);
		page.setTotalRecords(count);
		List<Zhengshu> list = zhengshuDao.findpage(page);
		page.setList(list);
		return page ;
	}
}
