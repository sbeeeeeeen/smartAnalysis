package kr.or.ddit.open_close.model;

public class Open_closeVo {
	private int OPCL_NUM;
	private String IND_M;
	private float OPCL_SOP;//상반기창업
	private float OPCL_SCL;//상반기폐업
	private float OPCL_HOP;//하반기창업
	private float OPCL_HCL;//하반기폐업
	private String reg_gu;
	
	public int getOPCL_NUM() {
		return OPCL_NUM;
	}
	public void setOPCL_NUM(int oPCL_NUM) {
		OPCL_NUM = oPCL_NUM;
	}
	public String getIND_M() {
		return IND_M;
	}
	public void setIND_M(String iND_M) {
		IND_M = iND_M;
	}
	public float getOPCL_SOP() {
		return OPCL_SOP;
	}
	public void setOPCL_SOP(float oPCL_SOP) {
		OPCL_SOP = oPCL_SOP;
	}
	public float getOPCL_SCL() {
		return OPCL_SCL;
	}
	public void setOPCL_SCL(float oPCL_SCL) {
		OPCL_SCL = oPCL_SCL;
	}
	public float getOPCL_HOP() {
		return OPCL_HOP;
	}
	public void setOPCL_HOP(float oPCL_HOP) {
		OPCL_HOP = oPCL_HOP;
	}
	public float getOPCL_HCL() {
		return OPCL_HCL;
	}
	public void setOPCL_HCL(float oPCL_HCL) {
		OPCL_HCL = oPCL_HCL;
	}
	public String getReg_gu() {
		return reg_gu;
	}
	public void setReg_gu(String reg_gu) {
		this.reg_gu = reg_gu;
	}
	
	
}
