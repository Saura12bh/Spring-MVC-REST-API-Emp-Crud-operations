package org.springMvc.exception;

public class EmpNotFound  extends RuntimeException {
	public EmpNotFound(String msg)
	{
		super(msg);
	}

}
