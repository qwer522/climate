package org.climate.core.model.file;
import java.util.Date;

public class Dir {
	private int dirIdx;
	private String path;
	private String state;
	private Date createTime;
	public int getDirIdx() {
		return dirIdx;
	}
	public void setDirIdx(int dirIdx) {
		this.dirIdx = dirIdx;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}