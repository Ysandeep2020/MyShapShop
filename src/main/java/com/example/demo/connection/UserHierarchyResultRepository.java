package com.example.demo.connection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserHierarchyResultRepository extends JpaRepository<UserHierarchyResult, Long> {
	
    @Query(value = "WITH RECURSIVE UserHierarchy AS (\r\n"
    		+ "    SELECT uc.id, uc.child_id, uc.`level`, uc.parent_id\r\n"
    		+ "    FROM my_shop.user_connection uc\r\n"
    		+ "    WHERE uc.parent_id =:parentId  -- Start with the top-level parent (change this condition to match your use case)\r\n"
    		+ "\r\n"
    		+ "    UNION ALL\r\n"
    		+ "\r\n"
    		+ "    SELECT uc.id, uc.child_id, uh.`level` + 1, uc.parent_id\r\n"
    		+ "    FROM my_shop.user_connection uc\r\n"
    		+ "    INNER JOIN UserHierarchy uh ON uc.parent_id = uh.child_id\r\n"
    		+ ")\r\n"
    		+ "SELECT um.id, um.unique_id, um.first_name, uh.`level`, uh.parent_id\r\n"
    		+ "FROM UserHierarchy uh\r\n"
    		+ "INNER JOIN my_shop.user_master um ON uh.child_id = um.unique_id;", nativeQuery = true)
List<UserHierarchyResult> findUserHierarchyByParentId(@Param("parentId") String parentId);

}
