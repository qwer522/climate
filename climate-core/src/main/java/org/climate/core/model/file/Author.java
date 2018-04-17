package org.climate.core.model.file;

import java.util.Date;

public class Author {//author
	private Date time;			//시간
	private Long id;				//사용자 아이디
	private String name;		//사용자이름
	
	public Author() {}
	public Author(Long id) {
		this.id = id;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
