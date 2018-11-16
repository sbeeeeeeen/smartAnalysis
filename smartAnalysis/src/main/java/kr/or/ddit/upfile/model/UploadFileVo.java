package kr.or.ddit.upfile.model;

public class UploadFileVo {

	private int file_num;
	private String file_nm;
	private String file_path;
	private String file_div;

	public UploadFileVo() {

	}

	public int getFile_num() {
		return file_num;
	}

	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}

	public String getFile_nm() {
		return file_nm;
	}

	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getFile_div() {
		return file_div;
	}

	public void setFile_div(String file_div) {
		this.file_div = file_div;
	}

	@Override
	public String toString() {
		return "UploadFileVo [file_num=" + file_num + ", file_nm=" + file_nm
				+ ", file_path=" + file_path + ", file_div=" + file_div + "]";
	}

}
