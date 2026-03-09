# API Reference Template

Use this template as the starting point for your project's central API reference document.
Location: `docs/04-reference/api/API-REFERENCE.md`

---

*(Copy everything below this line into your project's API reference)*

---

# {Project Name} — API Reference

## Document Control

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 0.1 | {YYYY-MM-DD} | {Author} | Initial draft |

**Status:** {Draft / In Review / Approved}

---

## Platform Overview

| Property | Value |
|----------|-------|
| **Backend Platform** | {Magento 2.4.x / Laravel / Django / Custom} |
| **Base URL** | `https://<backend-domain>/rest/V1/` |
| **Protocol** | HTTPS only |
| **Format** | JSON |
| **Auth** | JWT Bearer Token |

---

## Authentication

### Token Types

| Token Type | How to Obtain | Used For |
|------------|---------------|----------|
| **Customer Token** | `POST /V1/integration/customer/token` | All customer-authenticated endpoints |
| **Admin Token** | `POST /V1/integration/admin/token` | Admin operations (backend-only) |
| **Anonymous** | No token needed | Public catalog, guest cart |

### Request Header
```
Authorization: Bearer <token>
Content-Type: application/json
```

### Token Storage
- **iOS:** Keychain
- **Android:** EncryptedSharedPreferences / Keystore

---

## Standard Error Responses

| HTTP Code | Meaning | Action |
|-----------|---------|--------|
| `400` | Bad Request — invalid input | Show validation error to user |
| `401` | Unauthorized — token expired or invalid | Trigger silent re-auth or redirect to login |
| `403` | Forbidden — insufficient permissions | Show error, do not retry |
| `404` | Not Found | Show empty state |
| `422` | Unprocessable Entity — business rule violation | Show specific error message |
| `500` | Server Error | Show generic error, allow retry |

---

## API Catalog

### Module: {M1 — Auth & Onboarding}

| # | Endpoint | Method | Auth | Purpose |
|---|----------|--------|------|---------|
| 1 | `/V1/{endpoint}` | POST | Anonymous | {Brief description} |
| 2 | `/V1/{endpoint}` | GET | Customer | {Brief description} |

### Module: {M2 — Home}

| # | Endpoint | Method | Auth | Purpose |
|---|----------|--------|------|---------|
| 1 | `/V1/{endpoint}` | GET | Anonymous | {Brief description} |

*(Add one section per module)*

---

## Custom Endpoints

> These are project-specific custom endpoints not part of the standard platform.

### {Vendor}/{Module} — {Purpose}

| # | Endpoint | Method | Auth | Notes |
|---|----------|--------|------|-------|
| 1 | `/V1/{custom-endpoint}` | POST | Customer | {Description} |
| 2 | `/V1/{custom-endpoint}` | GET | Anonymous | {Description} |

---

## Backend-Only Endpoints

> These endpoints are called server-to-server only. Mobile clients should NEVER call these.

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/V1/{endpoint}` | POST | {e.g. ERP sync, CRM update, payment webhook} |

---

## TBD Endpoints

> These endpoints are required by mobile but not yet confirmed / built. Track here until resolved.

| Module | Feature | Expected Endpoint | Status |
|--------|---------|-------------------|--------|
| {Module} | {Feature} | `{METHOD} /V1/{expected-path}` | ⏳ Pending backend confirmation |
| {Module} | {Feature} | `{METHOD} /V1/{expected-path}` | ✅ Confirmed — update module doc |

---

## Mobile API Playbook

> Quick reference: *"I'm building Module X — what endpoints do I need?"*

### {M1 — Auth & Onboarding}

```
1. Check email: POST /V1/customers/isEmailAvailable (Anonymous)
2. Send OTP: POST /V1/{otp-endpoint} (Anonymous)
3. Verify OTP: POST /V1/{verify-endpoint} (Anonymous) → returns JWT
4. Get profile: GET /V1/customers/me (Customer)
```

### {M2 — Home}

```
1. Store config: GET /V1/store/storeConfigs (Anonymous)
2. Categories: GET /V1/categories (Anonymous)
3. Featured products: GET /V1/products (Anonymous, filtered)
```

*(Add one section per module with the exact sequence of API calls)*

---

## Pagination Pattern

Most list endpoints use `searchCriteria`:

```
GET /V1/products
  ?searchCriteria[filterGroups][0][filters][0][field]=status
  &searchCriteria[filterGroups][0][filters][0][value]=1
  &searchCriteria[filterGroups][0][filters][0][conditionType]=eq
  &searchCriteria[sortOrders][0][field]=created_at
  &searchCriteria[sortOrders][0][direction]=DESC
  &searchCriteria[pageSize]=20
  &searchCriteria[currentPage]=1
```

**Response always includes:**
```json
{
  "items": [...],
  "total_count": 150
}
```

---

## Language / Locale

```
Store-View: {store_view_code}
```

Pass as a request header to get localised content:
- Default (English): no header needed
- {Language 2}: `Store: {store_code}`

---

## SDK Integrations

> Some features use mobile SDKs rather than REST APIs.

| SDK | Used For | Platform |
|-----|----------|----------|
| {bKash PGW} | Mobile wallet payments | Both |
| {SSLCommerz MobilePOS} | Card / internet banking | Both |
| {Firebase FCM} | Push notifications | Android |
| {APNs} | Push notifications | iOS |
| {Google Sign-In} | Social auth | Both |
| {Facebook Login} | Social auth | Both |
