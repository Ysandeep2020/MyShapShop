package com.example.demo.connection;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Entity
@Table(name = "user_hier_result")
public class UserHierarchyResult {
    @Id
    private Long id;
    private String uniqueId;
    private String firstName;
    private Integer level;
    private String parent_id;

    // Getters and setters
}
