package com.example.demo.menuMapping;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RoleMenuMappringRepository extends JpaRepository<RoleMenuMapping, Long> {

	@Query(nativeQuery = true, value = "select mm2.module_name, mm2.id as moduleId, mm.menu_name,mm.id,mm.module_id as menuId ,mm.menu_url  from user_role ur\r\n"
			+ "inner join role_menu_mapping rmm on rmm.role_id =ur.id \r\n"
			+ "inner join menu_master mm on mm.id =rmm.menu_master_id \r\n"
			+ "inner join module_master mm2 on mm2.id = mm.module_id \r\n"
			+ "where ur.role_name =?1\r\n"
			+ "order  by mm2.module_name ;")
	List<Map<String, Object>> getModuleAndMenuByRole(String roleName);
	
	@Query(nativeQuery = true, value = "select ur.role_name,ur.id as roleId ,mm.menu_name,mm.id as menuId  from user_role ur\r\n"
			+ "inner join role_menu_mapping rmm on rmm.role_id =ur.id \r\n"
			+ "inner join menu_master mm on mm.id =rmm.menu_master_id \r\n"
			+ "inner join module_master mm2 on mm2.id = mm.module_id \r\n"
			+ "where ur.role_name =?")
	List<Map<String, Object>> getMenuByRole(String roleName);

	boolean existsByRoleIdAndMenuMasterId(String roleId, String menuId);

}
