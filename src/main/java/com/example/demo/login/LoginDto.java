package com.example.demo.login;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class LoginDto {

	private long pk;
	private String userMasterPk;
	private String userLoginPk;
	private String name;
	@Size(min = 10,message = "mobile number is invalid")
	private String mobile;
	private String city;
	private String username;
	@NotBlank
	@Size(min = 8, message = "password must be 8 character")
	@Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$", message = "Password must contain at least one lowercase letter, one uppercase letter, and one digit.")
	private String password;
	private String password1;
	private String confirmPassword;
	private String verificationCode;
	private Long designationPk;
	private String designation;
	private String intro;
	private String status;
	private String address1;
	private String address2;
	private String state;
	private String district;
	private String country;
	private String pincode;
	private String refId;
	
	@Size(min = 6, max = 12, message = "uniqueId must be 6 digits")
	@Pattern(regexp = ".*[A-Za-z]{3}.*", message = "uniqueId must contain at least three letters")
	private String uniqueId;
//	private Long createdBy;
//	private Long companyPk;
//	private MultipartFile profile_pic;
//	private String profile_pic_name;

//	private String addEducationalDetailsCount;
//
////	Educational Details
//	private Long educationalDetailsPk;
//	private String school;
//	private String degree;
//	private String field;
//	private String fromDate;
//	private String toDate;

	public LoginDto() {
	}
}
