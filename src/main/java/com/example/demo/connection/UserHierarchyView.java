package com.example.demo.connection;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.example.demo.login.UserMaster;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Entity
@Table(name = "user_hier_view")
public class UserHierarchyView {
	@Id
	private Long id;
	private Long childId;
	private Long parentId;
	private Integer depth;

	// Getters and setters
}
