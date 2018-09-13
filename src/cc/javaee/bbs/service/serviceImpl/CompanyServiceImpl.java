package cc.javaee.bbs.service.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.javaee.bbs.dao.CompanyDao;
import cc.javaee.bbs.model.Company;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.service.CompanyService;
/**
 * 证书service实现类
 * @author lzhang6
 *
 */
@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyDao companyDao;
	
	public void insert(Company company) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		company.setCreatetime(df.format(new Date()));
		companyDao.insert(company);
	}
	
	public List<Company> queryIndexList(){
		List<Company> queryIndexList = companyDao.queryIndexList();
		return queryIndexList;
	}
	
	public PageBean<Company> findpage(Company company,PageBean<Company> page) {
		page.setBean(company);
		int count = companyDao.findpagecount(page);
		page.setTotalRecords(count);
		List<Company> list = companyDao.findpage(page);
		page.setList(list);
		return page ;
	}
}
