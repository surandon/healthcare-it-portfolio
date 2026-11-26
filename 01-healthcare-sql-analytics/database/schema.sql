
-- PROJECT: HEALTHCARE DATA QUALITY & ANALYTICS
-- DATABASE: healthcare_analytics
-- TECHNOLOGY: PostgreSQL

-- TABLE 1: MEMBERS
CREATE TABLE members (
    member_id INTEGER PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    registration_date DATE NOT NULL
);

-- TABLE 2: PROVIDERS
CREATE TABLE providers (
    provider_id INTEGER PRIMARY KEY,
    provider_name VARCHAR(150) NOT NULL,
    specialty VARCHAR(100) NOT NULL
);

-- TABLE 3: COVERAGE
CREATE TABLE coverage (
    coverage_id INTEGER PRIMARY KEY,
    member_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    coverage_status VARCHAR(20) NOT NULL,

    CONSTRAINT fk_coverage_member
        FOREIGN KEY (member_id)
        REFERENCES members(member_id),

    CONSTRAINT chk_coverage_dates
        CHECK (end_date IS NULL OR end_date >= start_date),

    CONSTRAINT chk_coverage_status
        CHECK (coverage_status IN ('ACTIVE', 'INACTIVE', 'PENDING'))
);

-- TABLE 4: CLAIMS
CREATE TABLE claims (
    claim_id INTEGER PRIMARY KEY,
    member_id INTEGER NOT NULL,
    provider_id INTEGER NOT NULL,
    service_date DATE NOT NULL,
    claim_amount NUMERIC(12,2) NOT NULL,

    CONSTRAINT fk_claim_member
        FOREIGN KEY (member_id)
        REFERENCES members(member_id),

    CONSTRAINT fk_claim_provider
        FOREIGN KEY (provider_id)
        REFERENCES providers(provider_id),

    CONSTRAINT chk_claim_amount
        CHECK (claim_amount > 0)
);

-- TABLE 5: PAYMENTS
CREATE TABLE payments (
    payment_id INTEGER PRIMARY KEY,
    claim_id INTEGER NOT NULL,
    payment_date DATE,
    payment_amount NUMERIC(12,2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,

    CONSTRAINT fk_payment_claim
        FOREIGN KEY (claim_id)
        REFERENCES claims(claim_id),

    CONSTRAINT chk_payment_amount
        CHECK (payment_amount >= 0),

    CONSTRAINT chk_payment_status
        CHECK (payment_status IN ('PAID', 'PENDING', 'DENIED'))
);

-- INDEXES FOR QUERY PERFORMANCE

CREATE INDEX idx_coverage_member
ON coverage(member_id);

CREATE INDEX idx_claims_member
ON claims(member_id);

CREATE INDEX idx_claims_provider
ON claims(provider_id);

CREATE INDEX idx_payments_claim
ON payments(claim_id);
