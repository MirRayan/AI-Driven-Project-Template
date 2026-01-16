# [Service Name] Service

**Service Type:** [Core | Optional | Infrastructure | Integration]
**Status:** [Planned | In Development | Production | Deprecated]
**Owner:** [Team/Person]
**Last Updated:** YYYY-MM-DD

---

## Overview

**Purpose:**
[1-2 sentences describing what this service does and why it exists]

**Key Responsibilities:**
- Responsibility 1
- Responsibility 2
- Responsibility 3

**Example:**
> The Inventory Service manages restaurant grocery purchases through receipt OCR, manual verification, and price history tracking. It helps restaurants track purchase costs, compare vendors, and manage inventory levels.

---

## Architecture Context

### Service Boundaries

**What this service DOES:**
- Core function 1
- Core function 2
- Core function 3

**What this service DOES NOT do:**
- Out-of-scope function 1 (handled by [Other Service])
- Out-of-scope function 2 (handled by [Other Service])
- Out-of-scope function 3

**Example:**
> **Does:** Receipt OCR, purchase history, price tracking, vendor comparison
> **Does Not:** Menu management (Menu Service), order processing (Order Service), payment processing (Payment Service)

### Dependencies

**Upstream Dependencies (Services this service depends on):**
- Service A - For [purpose]
- Service B - For [purpose]
- External System C - For [purpose]

**Downstream Dependencies (Services that depend on this service):**
- Service X - Uses [capability]
- Service Y - Uses [capability]

**Example:**
> **Upstream:**
> - Auth Service - For user authentication and tenant identification
> - S3 - For receipt image storage
> - AWS Textract / Tesseract - For OCR processing
>
> **Downstream:**
> - Analytics Service - Consumes purchase events for cost analysis
> - Notification Service - Receives alerts for price spikes

---

## Technical Specifications

### Technology Stack

| Component | Technology | Version | Rationale |
|-----------|-----------|---------|-----------|
| Language | [e.g., Java] | [e.g., 17+] | [Why chosen] |
| Framework | [e.g., Spring Boot] | [e.g., 3.x] | [Why chosen] |
| Database | [e.g., PostgreSQL] | [e.g., 15+] | [Why chosen] |
| Cache | [e.g., Redis] | [e.g., 7+] | [Optional] |
| Message Queue | [e.g., Kafka] | [e.g., 3.x] | [If applicable] |

**Example:**
| Component | Technology | Version | Rationale |
|-----------|-----------|---------|-----------|
| Language | Java | 17+ | Team expertise, enterprise support |
| Framework | Spring Boot | 3.x | Microservices standard (ADR-002) |
| Database | PostgreSQL | 15+ | Multi-tenant schema support (ADR-004) |
| Cache | Redis | 7+ | Session and query caching (ADR-006) |
| OCR | AWS Textract | Latest | High accuracy for receipts |

### Database Schema

#### Tables

**Table 1: [table_name]**
```sql
CREATE TABLE table_name (
    id UUID PRIMARY KEY,
    tenant_id UUID NOT NULL,
    field1 VARCHAR(255) NOT NULL,
    field2 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    field3 JSONB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by UUID,
    updated_by UUID,

    FOREIGN KEY (tenant_id) REFERENCES tenants(id),
    FOREIGN KEY (created_by) REFERENCES users(id)
);

CREATE INDEX idx_table_tenant ON table_name(tenant_id);
CREATE INDEX idx_table_field1 ON table_name(field1);
```

**Purpose:** [Describe what this table stores and why]

**Key Fields:**
- `id`: Primary key
- `tenant_id`: Multi-tenant isolation
- `field1`: [Description]
- `field3`: [Description]

---

**Table 2: [table_name]**
[Repeat structure for each table]

---

#### Relationships

```
[Table A] 1──N [Table B]
[Table B] N──1 [Table C]
```

**Example:**
```
inventory_purchases 1──N inventory_purchase_items
inventory_purchase_items N──1 inventory_items
inventory_items N──N inventory_vendors (via inventory_item_vendors)
```

---

### API Endpoints

#### Endpoint Pattern

**Convention:** `/{version}/tenants/{tenantId}/{resource}`

#### REST APIs

| Method | Endpoint | Description | Request | Response |
|--------|----------|-------------|---------|----------|
| POST | `/v1/tenants/{id}/[resource]` | Create [resource] | [Schema] | [Schema] |
| GET | `/v1/tenants/{id}/[resource]` | List [resources] | Query params | [Schema] |
| GET | `/v1/tenants/{id}/[resource]/{id}` | Get [resource] | - | [Schema] |
| PUT | `/v1/tenants/{id}/[resource]/{id}` | Update [resource] | [Schema] | [Schema] |
| DELETE | `/v1/tenants/{id}/[resource]/{id}` | Delete [resource] | - | 204 |

**Example:**

| Method | Endpoint | Description | Auth |
|--------|----------|-------------|------|
| POST | `/v1/tenants/{id}/purchases` | Upload receipt and create purchase | Required |
| GET | `/v1/tenants/{id}/purchases` | List all purchases | Required |
| GET | `/v1/tenants/{id}/purchases/{purchaseId}` | Get purchase details | Required |
| PUT | `/v1/tenants/{id}/purchases/{purchaseId}/verify` | Verify OCR results | Required |
| GET | `/v1/tenants/{id}/items/{itemId}/price-history` | Get price history | Required |

---

#### Request/Response Schemas

**POST /v1/tenants/{id}/[resource]**

Request:
```json
{
  "field1": "value",
  "field2": 123,
  "field3": {
    "nested": "object"
  }
}
```

Response (201 Created):
```json
{
  "id": "uuid",
  "field1": "value",
  "field2": 123,
  "createdAt": "2024-01-15T10:30:00Z"
}
```

**Example:**

**POST /v1/tenants/{id}/purchases**
```json
Request:
{
  "vendorId": "uuid",
  "purchaseDate": "2024-01-15",
  "receiptImage": "base64-encoded-image",
  "notes": "Weekly grocery purchase"
}

Response (201):
{
  "id": "purchase-uuid",
  "vendorId": "vendor-uuid",
  "purchaseDate": "2024-01-15",
  "status": "pending_ocr",
  "receiptImageUrl": "https://s3.../receipt.jpg",
  "createdAt": "2024-01-15T10:30:00Z"
}
```

---

### Events Published

**Event Format:** Follow CloudEvents specification

| Event Type | Trigger | Payload Schema | Consumers |
|------------|---------|----------------|-----------|
| `[domain].[entity].[action]` | [When] | [Schema] | [Services] |

**Example:**

| Event Type | Trigger | Consumers |
|------------|---------|-----------|
| `inventory.purchase.created` | New purchase uploaded | Analytics Service |
| `inventory.purchase.verified` | OCR results verified | Notification Service |
| `inventory.price.spike_detected` | Price increase >20% | Notification Service |

**Event Schema Example:**
```json
{
  "specversion": "1.0",
  "type": "inventory.purchase.created",
  "source": "inventory-service",
  "id": "uuid",
  "time": "2024-01-15T10:30:00Z",
  "datacontenttype": "application/json",
  "data": {
    "tenantId": "uuid",
    "purchaseId": "uuid",
    "totalAmount": 1250.50,
    "itemCount": 15,
    "vendorId": "uuid"
  }
}
```

---

### Events Consumed

| Event Type | Source Service | Action Taken |
|------------|----------------|--------------|
| `[domain].[entity].[action]` | [Service] | [What this service does] |

**Example:**

| Event Type | Source | Action |
|------------|--------|--------|
| `tenant.created` | Tenant Service | Initialize inventory schema for tenant |
| `user.deleted` | Auth Service | Anonymize purchase records |

---

## Business Logic

### Core Workflows

#### Workflow 1: [Workflow Name]

**Trigger:** [What initiates this workflow]

**Steps:**
1. Step 1 description
   - Validation: [What is validated]
   - Business rule: [Rule applied]
2. Step 2 description
   - Integration: [External call if any]
   - Data transformation: [How data changes]
3. Step 3 description
   - Event publication: [Event published]
   - State change: [Entity state changes]

**Success Criteria:** [What indicates success]

**Error Handling:** [How errors are managed]

---

**Example:**

#### Workflow 1: Receipt Upload and OCR Processing

**Trigger:** Restaurant admin uploads receipt image

**Steps:**
1. **Upload and Validation**
   - Validate image format (JPEG, PNG)
   - Validate file size (<10MB)
   - Check tenant has Inventory Service enabled

2. **Store and Queue**
   - Upload image to S3 bucket
   - Generate secure S3 URL
   - Create purchase record (status: `pending_ocr`)
   - Queue OCR job

3. **OCR Processing**
   - Send image to AWS Textract (or Tesseract fallback)
   - Extract text, line items, prices, vendor
   - Parse structured data from OCR text
   - Update purchase record (status: `pending_verification`)

4. **Notification**
   - Publish `inventory.purchase.created` event
   - Send notification to admin for manual verification

**Success Criteria:** Purchase record created with extracted items

**Error Handling:**
- OCR failure → Retry 3 times, then mark for manual entry
- S3 upload failure → Return error to client, don't create purchase
- Invalid format → Return 400 error with details

---

#### Workflow 2: [Another Workflow]

[Repeat structure]

---

### Business Rules

**Rule 1: [Rule Name]**
- **Description:** [What the rule enforces]
- **Validation:** [How it's checked]
- **Exception:** [When rule doesn't apply]

**Example:**

**Rule 1: Price Spike Detection**
- **Description:** Alert when item price increases >20% from average
- **Validation:** Compare new price against 90-day rolling average
- **Exception:** First purchase of an item (no history)

**Rule 2: Duplicate Purchase Prevention**
- **Description:** Prevent duplicate receipt uploads
- **Validation:** Check for same vendor + date + total amount within 24 hours
- **Exception:** User explicitly confirms it's not a duplicate

---

## Security & Authorization

### Authentication

**Method:** [e.g., JWT tokens, OAuth 2.0]

**Token Validation:**
- Verify token signature
- Check token expiration
- Extract tenant ID and user ID
- Validate user belongs to tenant

---

### Authorization

**Permission Model:**

| Role | Permissions | Endpoints |
|------|-------------|-----------|
| Admin | Full access | All endpoints |
| Manager | Read/Write [resources] | Most endpoints |
| User | Read-only | GET endpoints |

**Example:**

| Role | Permissions |
|------|-------------|
| Restaurant Admin | Create/update/delete purchases, verify OCR, view all data |
| Restaurant Manager | Create/update purchases, view data |
| Inventory Staff | View purchase history, no write access |

**Multi-Tenant Isolation:**
- All queries filtered by `tenant_id`
- Tenant ID extracted from JWT token
- No cross-tenant data access allowed
- Database-level RLS (Row Level Security) enabled

---

### Data Privacy

**Sensitive Data:**
- Receipt images (may contain personal info)
- Vendor pricing information
- Purchase patterns

**Protection Measures:**
- Encrypt S3 receipts at rest (AES-256)
- Encrypt sensitive DB fields (vendor contracts)
- Audit log for data access
- GDPR-compliant data retention (configurable)

---

## Performance Considerations

### Scalability

**Expected Load:**
- [Number] requests per second
- [Number] concurrent users
- [Size] of data growth per month

**Scaling Strategy:**
- Horizontal scaling (stateless service)
- Database read replicas for queries
- CDN for receipt images
- Caching for frequently accessed data

**Example:**
> Expected: 100 receipt uploads/day per tenant, 50 tenants = 5,000/day
> Scaling: Stateless Spring Boot service, horizontal pod autoscaling in K8s
> Caching: Redis cache for item prices (1-hour TTL)

---

### Performance Targets

| Metric | Target | Measurement |
|--------|--------|-------------|
| API Response Time (p95) | <500ms | Prometheus |
| Database Query Time (p95) | <100ms | Slow query log |
| OCR Processing Time | <30s | CloudWatch |
| Receipt Upload Time | <5s | Client-side |

---

### Optimization Strategies

1. **Database Indexing**
   - Index on `tenant_id` (every table)
   - Index on frequently queried fields
   - Composite indexes for common queries

2. **Caching**
   - Redis cache for item master data
   - CDN cache for receipt images
   - Application-level cache for vendor lists

3. **Async Processing**
   - OCR processing in background
   - Event publishing non-blocking
   - Batch price history calculations

---

## Monitoring & Observability

### Metrics

**Application Metrics:**
- Request rate (requests/sec)
- Error rate (%)
- Response time (p50, p95, p99)
- Active connections

**Business Metrics:**
- Purchases created per day
- OCR success rate (%)
- Verification time (minutes)
- Price spike alerts triggered

**Infrastructure Metrics:**
- CPU usage (%)
- Memory usage (%)
- Disk I/O
- Network throughput

---

### Logging

**Log Levels:**
- ERROR: Service failures, unhandled exceptions
- WARN: Degraded performance, retry attempts
- INFO: Major business events, API calls
- DEBUG: Detailed execution flow (dev only)

**Structured Logging Format:**
```json
{
  "timestamp": "2024-01-15T10:30:00Z",
  "level": "INFO",
  "service": "inventory-service",
  "tenantId": "uuid",
  "userId": "uuid",
  "traceId": "uuid",
  "message": "Purchase created successfully",
  "context": {
    "purchaseId": "uuid",
    "itemCount": 15,
    "totalAmount": 1250.50
  }
}
```

---

### Alerts

| Alert | Condition | Severity | Action |
|-------|-----------|----------|--------|
| High Error Rate | >5% errors in 5min | Critical | Page on-call |
| OCR Service Down | OCR failures >50% | High | Alert team |
| Slow Response | p95 >1s for 10min | Medium | Investigate |

---

## Testing Strategy

### Unit Tests

**Coverage Target:** 80%+

**Focus Areas:**
- Business logic validation
- Data transformation
- Business rules enforcement
- Error handling

---

### Integration Tests

**Coverage:**
- API endpoint contracts
- Database operations
- External service integrations (OCR, S3)
- Event publishing

---

### E2E Tests

**Critical Flows:**
1. Upload receipt → OCR → Verify → Price history
2. Price spike detection → Notification
3. Multi-tenant data isolation

---

## Deployment

### Configuration

**Environment Variables:**
```bash
# Service Config
SERVICE_PORT=8080
SERVICE_NAME=inventory-service

# Database
DATABASE_URL=jdbc:postgresql://localhost:5432/restaurant_db
DATABASE_USERNAME=inventory_user
DATABASE_PASSWORD=${DB_PASSWORD}

# AWS
AWS_REGION=us-east-1
AWS_S3_BUCKET=restaurant-receipts
AWS_TEXTRACT_ENABLED=true

# OCR Fallback
TESSERACT_PATH=/usr/bin/tesseract
OCR_TIMEOUT_SECONDS=30
```

---

### Docker

```dockerfile
FROM openjdk:17-alpine
WORKDIR /app
COPY target/inventory-service.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
```

---

### Kubernetes

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: inventory-service
spec:
  replicas: 3
  selector:
    matchLabels:
      app: inventory-service
  template:
    spec:
      containers:
      - name: inventory-service
        image: inventory-service:latest
        ports:
        - containerPort: 8080
        env:
        - name: DATABASE_URL
          valueFrom:
            secretKeyRef:
              name: db-secret
              key: url
```

---

## Related Documentation

**Architecture Decisions:**
- [ADR-XXX: Service Architecture](link)
- [ADR-YYY: Database Schema Design](link)

**API Documentation:**
- [OpenAPI Spec](link-to-swagger)
- [Postman Collection](link)

**Runbooks:**
- [Incident Response](link)
- [Scaling Guide](link)
- [Troubleshooting](link)

---

## Version History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | YYYY-MM-DD | [Name] | Initial specification |
| 1.1 | YYYY-MM-DD | [Name] | Added price spike detection |

---

## Notes for Template Users

**When creating a new service specification:**

1. Copy this template to `.ai/context/services/[service-name]-service.md`
2. Fill in all sections relevant to your service
3. Remove sections that don't apply (mark as N/A if preferred)
4. Delete this "Notes" section before committing
5. Link from PROJECT-INDEX.md and architecture docs

**Section Priority:**
- **Must Have:** Overview, Architecture Context, Technical Specs, API Endpoints
- **Should Have:** Business Logic, Security, Performance, Monitoring
- **Nice to Have:** Detailed workflows, comprehensive examples

**Quality Checklist:**
- [ ] Service boundaries clearly defined
- [ ] All database tables documented with schemas
- [ ] API endpoints complete with examples
- [ ] Events published and consumed documented
- [ ] Security and authorization specified
- [ ] Monitoring and alerts defined
- [ ] Related ADRs linked

Delete this section before committing.
