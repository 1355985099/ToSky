package com.logistic.Exception;
/**
 * 用于传递消息
 * @author Administrator
 *
 */
public class MsgException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public MsgException() {
		
	}
	public MsgException(String msg) {
		super(msg);
		
	}

}
