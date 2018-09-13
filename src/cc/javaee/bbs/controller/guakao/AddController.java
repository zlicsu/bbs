package cc.javaee.bbs.controller.guakao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.Company;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Zhengshu;
import cc.javaee.bbs.service.CompanyService;
import cc.javaee.bbs.service.ZhengshuService;
/*
 * 证书信息提交，查询
 * 
 */
@Controller
@RequestMapping("/guakao")
public class AddController {
	
	@Autowired
	private ZhengshuService zhengshuService;
	
	@Autowired
	private CompanyService companyService;

	private static Logger log = Logger.getLogger(AddController.class);

	@RequestMapping("/geren/index.do")
	public String geren(HttpServletRequest request, Model model) {
		return "jsp/index/guazheng/grform";
	}
	
	@RequestMapping("/qiye/index.do")
	public String qiye(HttpServletRequest request, Model model) {
		return "jsp/index/guazheng/qyform";
	}
	
	//新增证书
	@ResponseBody
	@RequestMapping("/geren/add.do")
	public Map<String, String> add(HttpServletRequest request,HttpServletResponse response,Zhengshu zhengshu,String yanzhengma) {
		Map<String, String> jsonmap=new HashMap<String, String>();
		String flag="1";
		String msg="发布成功!";
		HttpSession session = request.getSession(true); 
		String yanzhengmasession=(String)session.getAttribute("yanzhengma");
		if(!yanzhengma.equalsIgnoreCase(yanzhengmasession)){
			flag="0";
			msg="验证码错误！";
		}else{
			session.removeAttribute("yanzhengma");
			zhengshuService.insert(zhengshu);
		}
		jsonmap.put("flag", flag);
		jsonmap.put("msg", msg);
		return jsonmap;
	}
	
	//新增企业需求
	@ResponseBody
	@RequestMapping("/qiye/add.do")
	public Map<String, String> addQy(HttpServletRequest request,HttpServletResponse response,Company company,String yanzhengma) {
		Map<String, String> jsonmap=new HashMap<String, String>();
		String flag="1";
		String msg="发布成功!";
		HttpSession session = request.getSession(true); 
		String yanzhengmasession=(String)session.getAttribute("yanzhengma");
		if(!yanzhengma.equalsIgnoreCase(yanzhengmasession)){
			flag="0";
			msg="验证码错误！";
		}else{
			session.removeAttribute("yanzhengma");
			companyService.insert(company);
		}
		jsonmap.put("flag", flag);
		jsonmap.put("msg", msg);
		return jsonmap;
	}
	
	@RequestMapping("/geren/querypage.do")
	public String queryAll(HttpServletRequest request, Model model,Zhengshu Zhengshu,PageBean<Zhengshu> page) {
		page = zhengshuService.findpage(Zhengshu, page);
		model.addAttribute("page", page);
		return "jsp/index/guazheng/zspage";
	}
	
	@RequestMapping("/qiye/querypage.do")
	public String queryAllQy(HttpServletRequest request, Model model,Company company,PageBean<Company> page) {
		page = companyService.findpage(company, page);
		model.addAttribute("page", page);
		return "jsp/index/guazheng/qypage";
	}
}
