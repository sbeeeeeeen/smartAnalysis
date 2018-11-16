package kr.or.ddit.residential.model;


public class ResidentialVo {
	private int RST_NUM;
	private int RST_AGE;
	private int RST_COUNT;
	private long REG_CODE;
	private char RST_DIV;
	public int getRST_NUM() {
		return RST_NUM;
	}
	public void setRST_NUM(int rST_NUM) {
		RST_NUM = rST_NUM;
	}
	public int getRST_AGE() {
		return RST_AGE;
	}
	public void setRST_AGE(int rST_AGE) {
		RST_AGE = rST_AGE;
	}
	public int getRST_COUNT() {
		return RST_COUNT;
	}
	public void setRST_COUNT(int rST_COUNT) {
		RST_COUNT = rST_COUNT;
	}
	public long getREG_CODE() {
		return REG_CODE;
	}
	public void setREG_CODE(long rEG_CODE) {
		REG_CODE = rEG_CODE;
	}
	public char getRST_DIV() {
		return RST_DIV;
	}
	public void setRST_DIV(char rST_DIV) {
		RST_DIV = rST_DIV;
	}
	@Override
	public String toString() {
		return "ResidentialVo [RST_NUM=" + RST_NUM + ", RST_AGE=" + RST_AGE
				+ ", RST_COUNT=" + RST_COUNT + ", REG_CODE=" + REG_CODE
				+ ", RST_DIV=" + RST_DIV + "]";
	}
	
	
}
