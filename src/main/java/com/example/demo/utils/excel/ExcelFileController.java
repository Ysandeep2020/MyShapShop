package com.example.demo.utils.excel;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.students.Student;
import com.example.demo.students.StudentRepository;

@RestController
public class ExcelFileController {
	@Autowired
	private StudentRepository studentRepository;

	@GetMapping("/check")
	public String check(HttpServletResponse response) throws Exception {
		return "checked !" + response;
	}

	@GetMapping("/export")
	public String goHome(HttpServletResponse response) throws Exception {
		List<Student> students = studentRepository.findAll();
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("Students Data");

//		  "id": 1,
//	        "firstName": "sandeep",
//	        "lastName": "kumar",
//	        "email": "sandeep.yadav.756836@gmail.com",
//	        "mobile": "07568368845",
//	        "linkReferralCode": null,
//	        "linkId": 0,
//	        "referralCode": "OhdLFqBz",
//	        "course": "java",
//	        "createdOn": "2023-10-11T06:30:10.933+00:00"

		// create style for header cells
		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();
		font.setFontName("Arial");
		font.setBold(true);
		// For setting the font to bold
		style.setFont(font);
		XSSFRow headerRow = sheet.createRow(0);
		headerRow.createCell(0).setCellValue("Id");
		headerRow.getCell(0).setCellStyle(style);
		headerRow.createCell(1).setCellValue("First Name");
		headerRow.getCell(1).setCellStyle(style);
		headerRow.createCell(2).setCellValue("Last Name");
		headerRow.getCell(2).setCellStyle(style);
		headerRow.createCell(3).setCellValue("Email");
		headerRow.getCell(3).setCellStyle(style);
		headerRow.createCell(4).setCellValue("Mobile");
		headerRow.getCell(4).setCellStyle(style);
		headerRow.createCell(5).setCellValue("LinkedReferralCode");
		headerRow.getCell(5).setCellStyle(style);
		headerRow.createCell(6).setCellValue("LinkId");
		headerRow.getCell(6).setCellStyle(style);
		headerRow.createCell(7).setCellValue("ReferralCode");
		headerRow.getCell(7).setCellStyle(style);
		headerRow.createCell(8).setCellValue("Course");
		headerRow.getCell(8).setCellStyle(style);
		headerRow.createCell(9).setCellValue("CreatedOn");
		headerRow.getCell(9).setCellStyle(style);

		int rowDataCount = 1;
		
		for (Student st : students) {
			XSSFRow rowData = sheet.createRow(rowDataCount);
			rowData.createCell(0).setCellValue(st.getId());
			rowData.createCell(1).setCellValue(st.getFirstName());
			rowData.createCell(2).setCellValue(st.getLastName());
			rowData.createCell(3).setCellValue(st.getEmail());
			rowData.createCell(4).setCellValue(st.getMobile());
			rowData.createCell(5).setCellValue(st.getLinkReferralCode());
			rowData.createCell(6).setCellValue(st.getLinkId());
			rowData.createCell(7).setCellValue(st.getReferralCode());
			rowData.createCell(8).setCellValue(st.getCourse());
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			String date = sdf.format(st.getCreatedOn());
			rowData.createCell(9).setCellValue(date);

			rowDataCount++;
		}

		// Autosize the columns after populating data
		int numberOfColumns = sheet.getRow(0).getPhysicalNumberOfCells();
		for (int i = 0; i < numberOfColumns; i++) {
		    sheet.autoSizeColumn(i);
		}
		response.setContentType("application/octet-stream");
		String headerKey = "Content-Disposition";
		String headerValue = "attachment;filename=MyStudents.xls";
		response.setHeader(headerKey, headerValue);
		ServletOutputStream os = response.getOutputStream();
		workbook.write(os);
		FileOutputStream fos = new FileOutputStream(new File("ram.xlsx"));
		workbook.write(fos);
		workbook.close();
		os.close();
		return "File downloaded successfully";
	}

	@PostMapping("/import")
	public String uploadExcelFile(@RequestParam MultipartFile file, RedirectAttributes attributes)
			throws IOException {
		// String filePath = "C:/Users/2017y/Downloads/MyStudents.xls";
		// FileInputStream fis = new FileInputStream(new File(filePath));

		XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
		XSSFSheet sheet = workbook.getSheetAt(0);

		Iterator<Row> rowIterator = sheet.iterator();

		while (rowIterator.hasNext()) {
			Row row = rowIterator.next();
			Iterator<Cell> cellIterator = row.cellIterator();

			while (cellIterator.hasNext()) {
				Cell cell = cellIterator.next();
				// check the cell type and fromat accordingly
				switch (cell.getCellType()) {
				case NUMERIC:
					System.out.print(cell.getNumericCellValue() + "   ");
					break;
				case STRING:
					System.out.print(cell.getStringCellValue() + "   ");
					break;
				}
			}
			System.out.println("");
		}

		return "File downloaded successfully";
	}

	@PostMapping("/upload")
	public String uploadFile(@RequestParam MultipartFile file, RedirectAttributes attributes)
			throws IOException {
		String message = "";

		// String filePath = "C:/Users/2017y/Downloads/MyStudents.xls";
		// String filePath = "C:/Users/2017y/Downloads/Std.xlsx";

		// FileInputStream fis = new FileInputStream(filePath);

		XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
		XSSFSheet sheet = workbook.getSheetAt(0);

		XSSFRow headerRow = sheet.getRow(0);

		int emailIndexColumn = -1;
		for (Cell cell : headerRow) {

			String cellValue = cell.getStringCellValue();
			if ("Email".equals(cellValue)) {
				emailIndexColumn = cell.getColumnIndex();
				break;
			}
		}

		Iterator<Row> rowIterator = sheet.iterator();
		int firstTime = 1;
		if (emailIndexColumn != -1) {
			while (rowIterator.hasNext()) {
				Row row = rowIterator.next();
				Iterator<Cell> cellIterator = row.cellIterator();
				// find email column;
				while (cellIterator.hasNext()) {
					Cell cell = cellIterator.next();

					// check the cell type and fromat accordingly
					if (cell.getColumnIndex() == emailIndexColumn) {
						switch (cell.getCellType()) {
						case NUMERIC:
							System.out.print(cell.getNumericCellValue());
							break;
						case STRING:
							System.out.print(cell.getStringCellValue());
							break;
						}
					}
				}
				System.out.println("");
			}
			message = "File downloaded successfully";

		} else {
			message = "Email column not found in the Excel sheet.";
		}

		return message;
	}

}
