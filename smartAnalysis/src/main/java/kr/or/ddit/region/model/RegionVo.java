package kr.or.ddit.region.model;

public class RegionVo {
	private long reg_code;
	private String reg_si;
	private String reg_gu;
	private String reg_dong;
	private int reg_cnt;
	private int reg_gucode;
	private int reg_sicode;

	public long getReg_code() {
		return reg_code;
	}

	public int getReg_gucode() {
		return reg_gucode;
	}

	public void setReg_gucode(int reg_gucode) {
		this.reg_gucode = reg_gucode;
	}

	public int getReg_sicode() {
		return reg_sicode;
	}

	public void setReg_sicode(int reg_sicode) {
		this.reg_sicode = reg_sicode;
	}

	public void setReg_code(long reg_code) {
		this.reg_code = reg_code;
	}

	public String getReg_si() {
		return reg_si;
	}

	public void setReg_si(String reg_si) {
		this.reg_si = reg_si;
	}

	public String getReg_gu() {
		return reg_gu;
	}

	public void setReg_gu(String reg_gu) {
		this.reg_gu = reg_gu;
	}

	public String getReg_dong() {
		return reg_dong;
	}

	public void setReg_dong(String reg_dong) {
		this.reg_dong = reg_dong;
	}

	public int getReg_cnt() {
		return reg_cnt;
	}

	public void setReg_cnt(int reg_cnt) {
		this.reg_cnt = reg_cnt;
	}

	@Override
	public String toString() {
		return "RegionVo [reg_code=" + reg_code + ", reg_si=" + reg_si
				+ ", reg_gu=" + reg_gu + ", reg_dong=" + reg_dong
				+ ", reg_cnt=" + reg_cnt + ", reg_gucode=" + reg_gucode
				+ ", reg_sicode=" + reg_sicode + "]";
	}

}
