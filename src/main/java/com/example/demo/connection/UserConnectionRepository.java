package com.example.demo.connection;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserConnectionRepository extends JpaRepository<UserConnection, Long> {

	@Query(nativeQuery = true, value = "WITH RECURSIVE UserHierarchy AS ("
			+ "  SELECT id, child_id, parent_id, 1 AS depth " + "  FROM user_connection "
			+ "  WHERE parent_id = :targetUserId " + // Replace :targetUserId with the user ID of interest
			"  UNION ALL " + "  SELECT uc.id, uc.child_id, uc.parent_id, uh.depth + 1 " + "  FROM user_connection uc "
			+ "  INNER JOIN UserHierarchy uh ON uc.parent_id = uh.child_id " + ")" + "SELECT * FROM UserHierarchy")
	List<Object[]> findUserHierarchy(Long targetUserId);

	Integer findLevelByParentId(String parentId);

	@Query(nativeQuery = true, value = "select level from user_connection uc\r\n" + "where child_id  =:childId")
	Integer getLevelByChildId(@Param("childId") String childId);

	List<UserConnection> findAllByParentId(String uniqueId);

	UserConnection findByChildId(String childId);

}
