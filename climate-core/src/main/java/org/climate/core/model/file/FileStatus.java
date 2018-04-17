package org.climate.core.model.file;
public enum FileStatus {
	NON(100, "없음"),
	DEL(999, "삭제"),
	ENC(200, "암호화됨");
	
	private int code;
	private String desc;
	
	private FileStatus(int code, String desc) {
		this.code = code;
		this.desc = desc;
	}
	
	public static FileStatus valueOf(int code) {
		for(FileStatus status : values()) {
			if(status.code == code) {
				return status;
			}
		}
		throw new IllegalArgumentException("No matching constant for [" + code + "]");
	}
	
	@Override
	public String toString() {
		return Integer.toString(code);
	}
	
	public int getCode() {
		return code;
	}
	
	public String getDesc() {
		return desc;
	}
	
	public boolean equals(FileStatus type) {
		return code == type.getCode();
	}
}
