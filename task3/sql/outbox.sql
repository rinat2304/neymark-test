CREATE TABLE integration_outbox (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,

    event_id VARCHAR(100) NOT NULL,
    event_type VARCHAR(100) NOT NULL,

    aggregate_type VARCHAR(100) NOT NULL,
    aggregate_id VARCHAR(100) NOT NULL,

    payload JSON NOT NULL,

    status VARCHAR(20) NOT NULL DEFAULT 'pending',

    attempts INT NOT NULL DEFAULT 0,
    next_retry_at DATETIME NULL,

    last_error TEXT NULL,

    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    processed_at DATETIME NULL,

    CONSTRAINT uq_integration_outbox_event
        UNIQUE (event_id)
);

CREATE INDEX idx_integration_outbox_retry
    ON integration_outbox (status, next_retry_at);

CREATE INDEX idx_integration_outbox_aggregate
    ON integration_outbox (aggregate_type, aggregate_id);