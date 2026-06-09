# ECS Nginx Demo 4

## Popis
Tento projekt nasazuje nginx aplikaci na AWS ECS pomocí Terraform a GitHub Actions.
Projekt obsahuje test správnosti html v nginx, spuštěno nejdříve v rámci CI před samotným nasazením
a podruhé po nasazení ověřuje html přímo v ECS. 

### Architektura
- AWS ECS Fargate cluster
- Application Load Balancer
- VPC s public subnety
- CloudWatch logging spolu s dashboard monitorující využití CPU, RAM a počet úspěšných přístupů za 5 minut

### Nasazení
1. Fork tento repository
2. Nastavte GitHub Secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
3. Vytvořte S3 bucket pro Terraform state
4. Upravte backend konfiguraci v `state.tf`
5. Nastavte AWS region kromě v `state.tf` i v pipeline env AWS_REGION
6. Případně upravte PROJECT_NAME v pipeline env
7. Push do master branch spustí nasazení

### Použití
Po úspěšném nasazení bude aplikace dostupná na URL z GitHub Actions výstupu.

### Čištění
```bash
terraform destroy -auto-approve