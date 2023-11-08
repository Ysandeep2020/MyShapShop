package com.example.demo.file;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.login.RegisterRepository;
import com.example.demo.login.RegisterService;
import com.example.demo.login.UserMaster;

import lombok.Value;

@Service
public class AttachmentServiceImpl implements AttachmentService {

	@Autowired
	private AttachmentRepository attachmentRepository;
	@Autowired
	private RegisterService registerService;
	@Autowired
	private RegisterRepository registerRepo;
//	@org.springframework.beans.factory.annotation.Value("${upload.dir}")
//	private String uploadDir;

	@Override
	public Map<String, String> saveAttachment(MultipartFile file, String username, HttpServletRequest request)
			throws FileNotFoundException {
		UserMaster user = registerService.getUserByEmail(username);
		String path = request.getServletContext().getRealPath("/") + "images/";

		File directory = new File(path);
		if (!directory.exists()) {
			directory.mkdirs();
		}

		String filePath = directory + "\\" + file.getOriginalFilename();

		try {
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String string = filePath.split("images")[1];
		String fp = "\\images" + string;
		Attachment attachment = new Attachment();
		attachment.setContectType(file.getContentType());
		attachment.setName(file.getOriginalFilename());
		attachment.setSize(file.getSize());

		attachment.setPath(fp);
		attachment.setExtenstionType(getFileExtension(file.getOriginalFilename()));
		attachment.setModulePk(FileModuleMaster.PROFILE_MODULE);
		Attachment att = attachmentRepository.save(attachment);
		user.setProfileImagePath(fp);
		user.setAttachmentId(att.getId());
		registerRepo.save(user);
		Map<String, String> map=new HashMap<>();
		map.put("path", fp);
		map.put("status", "Uploaded Successfully");
		return map;
	}

	private String getFileExtension(String filename) {
		if (filename.lastIndexOf(".") != -1 && filename.lastIndexOf(".") != 0) {
			return filename.substring(filename.lastIndexOf(".") + 1);
		} else {
			return "No file extension found";
		}
	}

	@Override
	public List<Attachment> getAllAttachments() {
		return attachmentRepository.findAll();
	}

	@Override
	public Attachment getAttachmentById(Long id) {
		return attachmentRepository.findById(id).orElse(null);
	}

	@Override
	public void deleteAttachment(Long id) {
		attachmentRepository.deleteById(id);
	}
}
