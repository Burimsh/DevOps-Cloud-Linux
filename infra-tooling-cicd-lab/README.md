# Infrastructure Tooling CI/CD Lab

This project demonstrates a production-style CI/CD pipeline for infrastructure tooling.

## Features
- Automated testing
- Bash security scanning
- Multi-environment deployment (dev → prod)
- Manual approval gate for production
- Semantic versioning
- Deterministic rollback using Git tags

## Pipeline Flow
1. Lint & security scan (ShellCheck)
2. Automated connectivity tests
3. Deploy to dev
4. Manual approval
5. Deploy to prod
6. Version tagging

## Rollback Strategy
If a production deployment fails, the system rolls back to the previous stable Git tag and redeploys automatically.
