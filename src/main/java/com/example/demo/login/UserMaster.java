package com.example.demo.login;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Entity
@Table(name = "user_master")
public class UserMaster {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "first_name", nullable = false)
	private String name;

	private String mobile;
	private String email;
	private String city;
	private Integer status;
	private String panNumber;
	private String gstNumber;
	private String address1;
	private String address2;
	private long stateId;
	private String state;
	private long districtId;
	private String district;
	private String country;
	private String pincode;
	private String uniqueId;
	private String profileImagePath;
	private long attachmentId;
}
