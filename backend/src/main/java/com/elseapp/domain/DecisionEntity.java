package com.elseapp.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
import java.time.Instant;
import java.util.UUID;

@Entity
@Table(name = "decisions")
public class DecisionEntity {
  @Id
  private UUID id;

  @Column(name = "user_id")
  private UUID userId;

  @Column(nullable = false)
  private String source;

  @Lob
  @Column(nullable = false)
  private String content;

  @Column(nullable = false, length = 1024)
  private String question;

  @Column(nullable = false, length = 32)
  private String job;

  @Column(nullable = false, length = 1024)
  private String verdict;

  @Lob
  @Column(nullable = false)
  private String reason;

  @Column(nullable = false, length = 64)
  private String confidence;

  @Column(nullable = false, length = 128)
  private String engine;

  @Column(name = "engine_mode", nullable = false, length = 64)
  private String engineMode;

  private String provider;
  private String topic;
  private Instant deadline;

  @Column(name = "created_at", nullable = false)
  private Instant createdAt;

  @Column(nullable = false)
  private boolean saved = true;

  @Column(nullable = false)
  private boolean deleted = false;

  public DecisionEntity() {}

  public UUID getId() { return id; }
  public void setId(UUID id) { this.id = id; }
  public UUID getUserId() { return userId; }
  public void setUserId(UUID userId) { this.userId = userId; }
  public String getSource() { return source; }
  public void setSource(String source) { this.source = source; }
  public String getContent() { return content; }
  public void setContent(String content) { this.content = content; }
  public String getQuestion() { return question; }
  public void setQuestion(String question) { this.question = question; }
  public String getJob() { return job; }
  public void setJob(String job) { this.job = job; }
  public String getVerdict() { return verdict; }
  public void setVerdict(String verdict) { this.verdict = verdict; }
  public String getReason() { return reason; }
  public void setReason(String reason) { this.reason = reason; }
  public String getConfidence() { return confidence; }
  public void setConfidence(String confidence) { this.confidence = confidence; }
  public String getEngine() { return engine; }
  public void setEngine(String engine) { this.engine = engine; }
  public String getEngineMode() { return engineMode; }
  public void setEngineMode(String engineMode) { this.engineMode = engineMode; }
  public String getProvider() { return provider; }
  public void setProvider(String provider) { this.provider = provider; }
  public String getTopic() { return topic; }
  public void setTopic(String topic) { this.topic = topic; }
  public Instant getDeadline() { return deadline; }
  public void setDeadline(Instant deadline) { this.deadline = deadline; }
  public Instant getCreatedAt() { return createdAt; }
  public void setCreatedAt(Instant createdAt) { this.createdAt = createdAt; }
  public boolean isSaved() { return saved; }
  public void setSaved(boolean saved) { this.saved = saved; }
  public boolean isDeleted() { return deleted; }
  public void setDeleted(boolean deleted) { this.deleted = deleted; }
}
