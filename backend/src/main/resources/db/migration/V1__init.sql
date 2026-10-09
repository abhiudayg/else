CREATE TABLE users (
    id UUID PRIMARY KEY,
    apple_subject VARCHAR(255) UNIQUE,
    display_name VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE decisions (
    id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    source VARCHAR(64) NOT NULL,
    content CLOB NOT NULL,
    question VARCHAR(1024) NOT NULL,
    job VARCHAR(32) NOT NULL,
    verdict VARCHAR(1024) NOT NULL,
    reason CLOB NOT NULL,
    confidence VARCHAR(64) NOT NULL,
    engine VARCHAR(128) NOT NULL,
    engine_mode VARCHAR(64) NOT NULL,
    provider VARCHAR(128),
    topic VARCHAR(128),
    deadline TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    saved BOOLEAN NOT NULL DEFAULT TRUE,
    deleted BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE INDEX idx_decisions_user_created ON decisions(user_id, created_at DESC);
