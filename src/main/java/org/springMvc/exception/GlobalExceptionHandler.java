package org.springMvc.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(EmpNotFound.class)
	@ResponseBody
	public ResponseEntity<ErrorRes> handleEmpNotFound(EmpNotFound ex)
	{
		ErrorRes er=new ErrorRes(404, ex.getMessage());
		return new ResponseEntity<>(er,HttpStatus.NOT_FOUND);	
	}
	
		@ExceptionHandler(Exception.class)
	    @ResponseBody
	    public ResponseEntity<ErrorRes> handleAll(Exception ex) {

	        ErrorRes err = new ErrorRes(
	            500,
	            "Server Error"
	        );

	        return new ResponseEntity<>(err, HttpStatus.INTERNAL_SERVER_ERROR);
	    }
}
