package PKG_DEPART;

public class DepartVO {
	private String com_id;
	private String grp_id;
	private String com_val;
	private String com_lvl;
	
	public DepartVO() {}
	
	public DepartVO(String com_id, String com_val, String com_lvl, String grp_id) {
		super();
		this.com_id = com_id;
		this.grp_id = grp_id;
		this.com_val = com_val;
		this.com_lvl = com_lvl;
	}

	public String getCom_id() {
		return com_id;
	}

	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}

	public String getGrp_id() {
		return grp_id;
	}

	public void setGrp_id(String grp_id) {
		this.grp_id = grp_id;
	}

	public String getCom_val() {
		return com_val;
	}

	public void setCom_val(String com_val) {
		this.com_val = com_val;
	}

	public String getCom_lvl() {
		return com_lvl;
	}

	public void setCom_lvl(String com_lvl) {
		this.com_lvl = com_lvl;
	}
	
	
	
	
	
}
