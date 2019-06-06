package com.pojo;

public class JsonMsg {
	private int code;
	private String  msg;
	private Object data;
	
	
	
	public JsonMsg(int code) {
		super();
		this.code = code;
	}
	public JsonMsg(int code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}



	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
}
