# ☁️ Cloud Foundations: Automação em Ambiente Linux

Repositório dedicado aos meus estudos de fundamentos de infraestrutura e Linux, servindo como base para a minha transição de carreira focada em Cloud Computing (AWS).

---

## 📁 Sobre o Projeto: Script de Backup Automatizado

Este projeto consiste em um script em **Bash (Shell Script)** desenvolvido para automatizar a rotina de backup de um diretório local. O script compacta os arquivos de uma pasta de origem e os armazena em um diretório de destino, utilizando uma nomenclatura dinâmica baseada na data e hora exatas da execução.

Para garantir a autonomia do processo, o script foi integrado ao **Cron**, o agendador de tarefas nativo do Linux, simulando uma rotina real de produção onde backups precisam ser gerados em segundo plano sem intervenção humana.

---

## 🛠️ Tecnologias e Ferramentas Utilizadas

*   **Sistema Operacional:** Linux Ubuntu 
*   **Editor de Texto:** Vim (via Terminal)
*   **Linguagem de Script:** Bash (Shell Script)
*   **Utilitário de Compactação:** `tar` (com algoritmo `gzip`)
*   **Agendamento:** Cron (`crontab`)
*   **Controle de Versão:** Git & GitHub

---

## 🚀 Como o Projeto Funciona

### 1. Estrutura do Script (`backup.sh`)
O script executa os seguintes passos cronológicos:
1.  **Variáveis de Ambiente:** Define caminhos absolutos para organização e fácil manutenção das pastas de origem e destino.
2.  **Timestamp Dinâmico:** Captura a data e hora do sistema através do comando `date +%Y-%m-%d_%H-%M-%S`, garantindo que arquivos antigos nunca sejam sobrescritos.
3.  **Compactação de Alta Performance:** Utiliza o comando `tar -czf` para gerar um arquivo leve (`.tar.gz`).

### 2. Automação com Cron
Para rodar o script de forma 100% automatizada, a rotina foi adicionada ao arquivo de configuração do usuário (`crontab -e`), seguindo a sintaxe de agendamento do Linux:
```text
# Exemplo de execução diária programada
0 0 * * * /home/neoxpepismo/projeto_backup/backup.sh
