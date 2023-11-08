package com.example.demo.students;

import java.util.List;

public class Response<T> {
	private String status;
	private String message;
	private List<T> data;
	private T singleData;

	public Response() {
		// Default constructor
	}

	public Response(String status, String message, List<T> data) {
		this.status = status;
		this.message = message;
		this.data = data;
	}

	public Response(String status, String message, T singleData) {
		this.status = status;
		this.message = message;
		this.singleData = singleData;
	}

	// Getters and Setters
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public T getSingleData() {
		return singleData;
	}

	public void setSingleData(T singleData) {
		this.singleData = singleData;
	}
}
