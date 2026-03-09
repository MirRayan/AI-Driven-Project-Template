# API Mapping Workflow

**Purpose:** How to explore a backend codebase (or API spec) and produce developer-ready API documentation for module breakdown files.
**When to use:** When a backend codebase or API spec is available and module docs say "API TBD" or have no API Mapping section.
**Output:** Updated module breakdown files with full API Mapping sections + updated central API reference document.

---

## Overview

```
Backend / API Spec Available
        ↓
1. Identify backend type & structure
        ↓
2. Find all endpoint declarations
        ↓
3. Match endpoints to app modules
        ↓
4. Document request / response shapes
        ↓
5. Flag TBD / unconfirmed endpoints
        ↓
6. Update module files + API reference
```

---

## Step 1 — Identify Backend Type & Structure

Before diving into endpoints, understand what you're working with:

**Identify the API style:**
- REST — endpoints defined in route files or config
- GraphQL — schema file defines all queries/mutations
- gRPC — `.proto` files define services and messages
- Custom — look for route registration or controller files

**Find where routes/endpoints are declared:**
- Look for route config files, controller directories, or schema files
- Identify which routes are public vs authenticated
- Note if there are separate route groups (e.g. admin vs customer vs public)

**Determine auth pattern:**
- How are tokens issued? (JWT, session, OAuth 2.0, API key)
- What auth roles exist? (e.g. anonymous, user, admin)
- What header/param carries the token? (`Authorization: Bearer <token>`, `X-API-Key`, etc.)

**Check for existing API docs:**
- Postman / Insomnia collections
- Swagger / OpenAPI spec (`openapi.json`, `swagger.yaml`)
- GraphQL playground / introspection
- README or wiki pages

---

## Step 2 — Find All Endpoint Declarations

**For a REST backend (any framework):**

Look for:
- Route definition files (e.g. `routes/api.*`, `config/routes.*`, `webapi.xml`)
- Controller or handler files
- API version prefixes (e.g. `/v1/`, `/api/`, `/rest/`)

**For GraphQL:**

Look for:
- Schema definition files (`.graphql`, `schema.ts`)
- Query and mutation resolvers
- Subscription definitions (for real-time)

**For any backend — document what you find:**

```markdown
| Endpoint / Operation | Method / Type | Auth | Module | Notes |
|----------------------|---------------|------|--------|-------|
| /users/me            | GET           | User | Profile | Standard |
| /orders              | GET           | User | Orders  | Paginated |
| /payments/initiate   | POST          | User | Checkout | Custom |
| /admin/reports       | GET           | Admin | — | Backend-only, skip |
```

**Flag backend-only routes** — routes called server-to-server that the mobile app should never call directly.

---

## Step 3 — Match Endpoints to App Modules

Go through each app module and ask: *"What data does this module need, and which endpoint provides it?"*

**Standard / documented endpoints:**
- Reference official platform docs + verify field names against the version in use.

**Custom endpoints:**
- Read the handler/controller to understand what it accepts and returns
- Check any middleware for auth requirements
- If there are tests, read them — they often show exact request/response shapes

**No endpoint found for a feature:**
- Check if the feature is backend-only (no client exposure needed)
- Check if it's handled via WebView or SDK (no direct API call needed)
- If the client needs this data but no endpoint exists → mark as **TBD**

---

## Step 4 — Document Request / Response Shapes

For each endpoint used by the client, document:

````markdown
### {N}. {Operation Name}
**`{METHOD} /{path}`** — {Auth: User Token / Admin / Anonymous}

**Request:**
```json
{
  "field": "value",
  "nested": {
    "field": "value"
  }
}
```

**Response:**
```json
{
  "field": "value",
  "items": [
    { "id": 1, "name": "example" }
  ]
}
```

> {Notes: pagination pattern, filter format, important field descriptions, status values}
````

**Tips for finding response shape:**
- Read the model / schema / DTO class that the endpoint returns
- Check serialiser or transformer files (they define what fields are exposed)
- Look for existing API tests — they show real request/response pairs
- If none available — document the expected shape and mark as "Verify against live backend"

---

## Step 5 — Flag TBD / Unconfirmed Endpoints

Not every feature will have a confirmed endpoint. Use this pattern consistently:

````markdown
### {N}. {Operation Name}
> **Endpoint TBD** — No route definition found for this feature.
> Likely a custom endpoint to be built or feature uses a different mechanism.
>
> **Expected endpoint (confirm with backend team):** `{METHOD} /{expected-path}` — {Auth}
>
> **Expected Response shape:**
```json
{
  "field": "value"
}
```
````

**Common TBD scenarios:**

| Scenario | Likely Resolution |
|----------|-------------------|
| Social login | Token exchange flow with OAuth provider — confirm backend callback URL |
| Push notification registration | Device token submitted to a backend endpoint — confirm path and payload |
| Third-party service (CRM, support, loyalty) | Backend may proxy it, or client calls service directly — confirm approach |
| Feature not yet built | Flag for backend team with expected shape so they can build to spec |
| WebView-wrapped feature | No API needed — document the WebView URL pattern and auth token injection |

---

## Step 6 — Update Module Files + API Reference

**Per module file** (`docs/05-breakdown/modules/{NN}-{name}.md`):
- Add `## API Mapping` section at the bottom
- Include all endpoints used by that module
- Include value mapping tables where relevant (e.g. status codes → display labels)
- Mark TBD endpoints clearly

**Central API reference** (`docs/04-reference/api/API-REFERENCE.md`):
- Update the platform/version information
- Add all discovered custom endpoints
- Add a Client API Playbook section (quick reference by module)
- Mark backend-only endpoints clearly so client devs know to skip them

---

## Completion Checklist

- [ ] Backend type and version identified
- [ ] All route/endpoint declaration files found and scanned
- [ ] Auth pattern documented (token types, header format)
- [ ] Backend-only routes identified and excluded
- [ ] All app modules matched to their endpoint(s)
- [ ] Request/response shapes documented for all confirmed endpoints
- [ ] TBD endpoints flagged with expected shape + question for backend team
- [ ] All module breakdown files have `## API Mapping` section
- [ ] Central API reference document updated

---

## Output Quality Bar

The API mapping is complete when a developer can:
1. Know exactly which endpoint to call for each feature — no guessing
2. Know the exact request body to send — copy-paste ready
3. Know the exact response shape — can define their DTO/model immediately
4. Know which endpoints still need backend confirmation (TBD list)
5. Implement the data layer without needing to explore the backend themselves
