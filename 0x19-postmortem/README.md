# Postmortem Report

## Issue Summary

**Duration:**  
- **Start:** June 1, 2024, 02:00 AM UTC
- **End:** June 1, 2024, 04:30 AM UTC

**Impact:**  
- The user authentication service was down, preventing users from logging into our platform.
- Approximately 80% of users were affected, experiencing failed login attempts and being unable to access their accounts.

**Root Cause:**  
- The root cause was an unhandled exception in the authentication microservice due to an expired SSL certificate.

---

## Timeline

- **02:00 AM:** Issue detected by monitoring alert indicating a spike in authentication failures.
- **02:05 AM:** Engineers began investigating the authentication microservice logs.
- **02:15 AM:** Assumed the issue was related to a recent deployment; rollback initiated.
- **02:30 AM:** Rollback completed, but the issue persisted.
- **02:45 AM:** Escalated to the DevOps team to check for infrastructure issues.
- **03:00 AM:** Identified that SSL certificate for the authentication service had expired.
- **03:15 AM:** Requested a new certificate from the certificate authority.
- **03:45 AM:** Received and installed the new SSL certificate.
- **04:00 AM:** Deployed the updated authentication service with the new certificate.
- **04:30 AM:** Full functionality restored, monitoring for further issues.

---

## Root Cause and Resolution

**Root Cause:**  
The authentication microservice’s SSL certificate expired, causing secure connections to fail. This was due to a misconfiguration in our certificate management system, which failed to renew the certificate automatically.

**Resolution:**  
Once the expired certificate was identified as the cause:
- A new SSL certificate was urgently requested and received from our certificate authority.
- The new certificate was installed, and the authentication microservice was redeployed.
- Normal service was restored, and users were able to log in without issues.

---

## Corrective and Preventative Measures

**Improvements and Fixes:**
- Implement an automated system for SSL certificate renewal to prevent expiration.
- Enhance monitoring to alert when an SSL certificate is close to expiring (e.g., 30 days prior).
- Conduct a review and update of all critical infrastructure components to ensure similar issues are preemptively addressed.

**Tasks to Address the Issue:**
1. **Patch Certificate Management System:**
   - Integrate an automated SSL certificate renewal process.
2. **Add SSL Monitoring:**
   - Implement alerts for SSL certificates nearing expiration.
3. **Review Deployment Processes:**
   - Ensure rollback procedures include SSL verification.
4. **Conduct Training:**
   - Train engineers on identifying and handling SSL-related issues.
5. **Update Documentation:**
   - Document the SSL certificate renewal process and common issues for future reference.

By addressing these areas, we aim to prevent similar outages and ensure a more robust and reliable authentication service for our users.
# Postmortem Report

## Issue Summary

**Duration:**  
- **Start:** June 1, 2024, 02:00 AM UTC
- **End:** June 1, 2024, 04:30 AM UTC

**Impact:**  
- The user authentication service was down, preventing users from logging into our platform.
- Approximately 80% of users were affected, experiencing failed login attempts and being unable to access their accounts.

**Root Cause:**  
- The root cause was an unhandled exception in the authentication microservice due to an expired SSL certificate.

---

## Timeline

- **02:00 AM:** Issue detected by monitoring alert indicating a spike in authentication failures.
- **02:05 AM:** Engineers began investigating the authentication microservice logs.
- **02:15 AM:** Assumed the issue was related to a recent deployment; rollback initiated.
- **02:30 AM:** Rollback completed, but the issue persisted.
- **02:45 AM:** Escalated to the DevOps team to check for infrastructure issues.
- **03:00 AM:** Identified that SSL certificate for the authentication service had expired.
- **03:15 AM:** Requested a new certificate from the certificate authority.
- **03:45 AM:** Received and installed the new SSL certificate.
- **04:00 AM:** Deployed the updated authentication service with the new certificate.
- **04:30 AM:** Full functionality restored, monitoring for further issues.

---

## Root Cause and Resolution

**Root Cause:**  
The authentication microservice’s SSL certificate expired, causing secure connections to fail. This was due to a misconfiguration in our certificate management system, which failed to renew the certificate automatically.

**Resolution:**  
Once the expired certificate was identified as the cause:
- A new SSL certificate was urgently requested and received from our certificate authority.
- The new certificate was installed, and the authentication microservice was redeployed.
- Normal service was restored, and users were able to log in without issues.

---

## Corrective and Preventative Measures

**Improvements and Fixes:**
- Implement an automated system for SSL certificate renewal to prevent expiration.
- Enhance monitoring to alert when an SSL certificate is close to expiring (e.g., 30 days prior).
- Conduct a review and update of all critical infrastructure components to ensure similar issues are preemptively addressed.

**Tasks to Address the Issue:**
1. **Patch Certificate Management System:**
   - Integrate an automated SSL certificate renewal process.
2. **Add SSL Monitoring:**
   - Implement alerts for SSL certificates nearing expiration.
3. **Review Deployment Processes:**
   - Ensure rollback procedures include SSL verification.
4. **Conduct Training:**
   - Train engineers on identifying and handling SSL-related issues.
5. **Update Documentation:**
   - Document the SSL certificate renewal process and common issues for future reference.
