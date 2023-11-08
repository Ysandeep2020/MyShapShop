package com.example.demo.file;

import java.io.FileNotFoundException;
import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/attachment")
public class AttachmentController {

	@Autowired
	private AttachmentService attachmentService;

	@ResponseBody
	@PostMapping("/upload")
	public Map<String, String> uploadFile(@RequestParam MultipartFile file,Principal p,HttpServletRequest request) throws FileNotFoundException {
		return attachmentService.saveAttachment(file, p.getName(),request);
	}
}
