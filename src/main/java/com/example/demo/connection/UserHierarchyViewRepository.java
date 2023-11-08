package com.example.demo.connection;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserHierarchyViewRepository extends JpaRepository<UserHierarchyView, Long> {
	List<UserHierarchyView> findByParentId(Long parentId);
}
