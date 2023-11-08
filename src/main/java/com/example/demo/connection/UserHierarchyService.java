package com.example.demo.connection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserHierarchyService {
    private final UserHierarchyResultRepository userHierarchyResultRepository;

    @Autowired
    public UserHierarchyService(UserHierarchyResultRepository userHierarchyResultRepository) {
        this.userHierarchyResultRepository = userHierarchyResultRepository;
    }

    public List<UserHierarchyResult> getUserHierarchyResults(String parentId) {
        // You can implement custom methods in the repository to retrieve the data as needed
        // For example, you can create a method like findAllByParentId(String parentId)
        return userHierarchyResultRepository.findUserHierarchyByParentId(parentId);
    }
}
