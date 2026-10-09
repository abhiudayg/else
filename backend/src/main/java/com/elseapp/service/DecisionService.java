package com.elseapp.service;

import com.elseapp.api.DecisionDtos.CreateDecisionRequest;
import com.elseapp.api.DecisionDtos.DecisionResponse;
import com.elseapp.config.NotFoundException;
import com.elseapp.domain.DecisionEntity;
import com.elseapp.repository.DecisionRepository;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DecisionService {
  private final DecisionRepository decisions;

  public DecisionService(DecisionRepository decisions) {
    this.decisions = decisions;
  }

  @Transactional
  public DecisionResponse create(CreateDecisionRequest request) {
    DecisionEntity entity = new DecisionEntity();
    entity.setId(UUID.randomUUID());
    entity.setUserId(request.userId());
    entity.setSource(request.source());
    entity.setContent(request.content());
    entity.setQuestion(request.question());
    entity.setJob(request.job());
    entity.setVerdict(request.verdict());
    entity.setReason(request.reason());
    entity.setConfidence(request.confidence());
    entity.setEngine(request.engine());
    entity.setEngineMode(request.engineMode());
    entity.setProvider(request.provider());
    entity.setTopic(request.topic());
    entity.setDeadline(request.deadline());
    entity.setCreatedAt(request.createdAt());
    entity.setSaved(true);
    return toResponse(decisions.save(entity));
  }

  @Transactional(readOnly = true)
  public List<DecisionResponse> listForUser(UUID userId) {
    return decisions.findByUserIdAndDeletedFalseOrderByCreatedAtDesc(userId).stream()
        .map(this::toResponse)
        .toList();
  }

  @Transactional(readOnly = true)
  public DecisionResponse get(UUID id) {
    return decisions.findById(id)
        .filter(d -> !d.isDeleted())
        .map(this::toResponse)
        .orElseThrow(() -> new NotFoundException("Decision not found: " + id));
  }

  @Transactional
  public void softDelete(UUID id) {
    DecisionEntity entity = decisions.findById(id)
        .orElseThrow(() -> new NotFoundException("Decision not found: " + id));
    entity.setDeleted(true);
  }

  private DecisionResponse toResponse(DecisionEntity e) {
    return new DecisionResponse(
        e.getId(),
        e.getUserId(),
        e.getSource(),
        e.getContent(),
        e.getQuestion(),
        e.getJob(),
        e.getVerdict(),
        e.getReason(),
        e.getConfidence(),
        e.getEngine(),
        e.getEngineMode(),
        e.getProvider(),
        e.getTopic(),
        e.getDeadline(),
        e.getCreatedAt(),
        e.isSaved());
  }
}
