package cc.javaee.bbs.model;

/**
 * 证书表
 * @author lzhang6
 *
 */
public class Zhengshu {
	private Integer id;
    //真实姓名
    private String name;
    //手机号码
    private String phone;
    //证书名称
    private String zsname;
    //注册情况
    private String regType;
	//详细说明
    private String content;
    
    private String createtime;
    
    private String updatetime;
    
    public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	public String getRegType() {
    	return regType;
    }
    public void setRegType(String regType) {
    	this.regType = regType;
    }
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZsname() {
		return zsname;
	}
	public void setZsname(String zsname) {
		this.zsname = zsname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
    
}
