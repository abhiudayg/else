package com.elseapp.repository;

import com.elseapp.domain.DecisionEntity;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DecisionRepository extends JpaRepository<DecisionEntity, UUID> {
  List<DecisionEntity> findByUserIdAndDeletedFalseOrderByCreatedAtDesc(UUID userId);
}
