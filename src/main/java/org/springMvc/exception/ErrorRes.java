package org.springMvc.exception;

public class ErrorRes {
	public ErrorRes() {
    }

	private int status;
    private String message;
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public ErrorRes(int status, String message) {
		this.status = status;
		this.message = message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
