package com.example.demo.file;

import java.io.FileNotFoundException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface AttachmentService {
	Map<String, String> saveAttachment(MultipartFile file, String username, HttpServletRequest request) throws FileNotFoundException;

	List<Attachment> getAllAttachments();

	Attachment getAttachmentById(Long id);

	void deleteAttachment(Long id);

	
}
