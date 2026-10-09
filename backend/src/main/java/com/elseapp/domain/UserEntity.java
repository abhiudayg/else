package com.elseapp.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.Instant;
import java.util.UUID;

@Entity
@Table(name = "users")
public class UserEntity {
  @Id
  private UUID id;

  @Column(name = "apple_subject", unique = true)
  private String appleSubject;

  @Column(name = "display_name")
  private String displayName;

  @Column(name = "created_at", nullable = false)
  private Instant createdAt;

  protected UserEntity() {}

  public UserEntity(UUID id, String appleSubject, String displayName, Instant createdAt) {
    this.id = id;
    this.appleSubject = appleSubject;
    this.displayName = displayName;
    this.createdAt = createdAt;
  }

  public UUID getId() { return id; }
  public String getAppleSubject() { return appleSubject; }
  public String getDisplayName() { return displayName; }
  public Instant getCreatedAt() { return createdAt; }
}
