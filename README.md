# 🏭 Hermes Reply Challenge - Sistema de Monitoramento Industrial


## 👨‍🎓 Integrantes: 
- <a href="https://www.linkedin.com/in/juliano-romeiro-rodrigues/">Juliano Romeiro Rodrigues</a>
- <a href="https://www.linkedin.com/in/nicolas--araujo/">Nicolas Antonio Silva Araujo</a> 
- <a href="https://www.linkedin.com/in/vitoria-bagatin-31ba88266/">Vitória Pereira Bagatin</a> 
<br><br>

## 📋 Sobre o Projeto
Projeto de digitalização industrial desenvolvido para o Challenge da Hermes Reply, focado na criação de um sistema completo de monitoramento de sensores industriais com aplicação de Machine Learning. O sistema fornece dados simulados realistas para alimentar modelos de detecção de anomalias, predição de falhas e classificação de alertas em ambientes industriais.

## 🎯 Objetivos
- ✅ **Dataset Completo**: 35.000+ leituras de sensores industriais em formato CSV
- ✅ **Modelagem de Dados**: Estrutura normalizada seguindo padrões industriais
- ✅ **Base para ML**: Dados prontos para algoritmos de Machine Learning
- ✅ **Sistema de Alertas**: Dados de monitoramento e ordens de manutenção
- ✅ **Documentação**: Guia completo para implementação e uso

## 🏗️ Modelagem do Banco de Dados

O banco de dados foi projetado para suportar o monitoramento industrial, mantendo **integridade, escalabilidade e performance** para alto volume de leituras de sensores. Ele organiza os dados em uma hierarquia clara, desde os tipos de ativos até ordens de manutenção.

### 📌 Principais Entidades

| Entidade | Descrição |
|----------|-----------|
| `TIPOS_ATIVO` | Categorias de equipamentos (Motor, Compressor, Bomba, etc.) |
| `ATIVOS` | Equipamentos físicos instalados na planta |
| `MODELOS_SENSOR` | Catálogo de sensores por fabricante |
| `SENSORES` | Dispositivos IoT conectados a cada ativo |
| `LEITURAS` | Leituras coletadas pelos sensores (alto volume) |
| `USUARIOS` | Operadores e técnicos responsáveis pelo sistema |
| `ALERTAS` | Notificações automáticas baseadas em thresholds |
| `ORDENS_MANUTENCAO` | Ordens de manutenção associadas a alertas |

### 🔗 Hierarquia e Relacionamentos
- Cada **Ativo** pertence a um **Tipo de Ativo**  
- Cada **Sensor** está ligado a um **Ativo** e a um **Modelo de Sensor**  
- Cada **Leitura** está associada a um **Sensor**  
- **Alertas** são gerados por leituras fora do padrão em ativos  
- **Ordens de Manutenção** estão vinculadas a alertas e a usuários responsáveis

### 📂 Arquivos Disponíveis no Repositório
- **DER (Diagrama Entidade-Relacionamento)**: [`der.pdf`](./BancoDeDados/Relational.pdf)  
- **Script de Criação de Tabelas**: [`create_tables.sql`](./BancoDeDados/EnterpriseChallenge_postgres.sql)  

Esses arquivos contêm a **estrutura completa do banco de dados**, incluindo chaves primárias, estrangeiras, índices e constraints de integridade referencial.

## Vídeo de Demonstração
🔗 Clique [AQUI](youtube.com) para ser redirecionado ao vídeo no YouTube.

## 📋 Conclusões

### Descobertas Chave:
- **Dataset Robusto**: 35.000+ leituras distribuídas em 8 tipos de sensores fornecem base sólida para modelos de ML
- **Estrutura Normalizada**: Modelo ER implementado garante integridade e facilita análises relacionais
- **Realismo Operacional**: Valores respeitam faixas industriais reais, essencial para aplicação prática
- **Anomalias Rotuladas**: 5% de dados anômalos permitem treino supervisionado para detecção de falhas
- **Workflow Industrial**: Correlação completa desde sensores até ordens de manutenção

### Machine Learning:
🔗 Clique [AQUI](https://youtu.be/2wflNHUXg9U) para ser redirecionado ao vídeo no YouTube.

1. **Análise Exploratória**: Estatísticas descritivas e visualizações dos dados
2. **Feature Engineering**: Criação de features temporais e agregações
3. **Modelagem**: Implementação de algoritmos para cada caso de uso
4. **Validação**: Métricas de performance e validação cruzada
5. **Deploy**: Sistema de predição em tempo real

### Metodologia:

- Preparação dos Dados: Os dados de vários arquivos CSV foram carregados e armazenados em um banco de dados SQLite para facilitar a manipulação. Tabelas relevantes foram unidas para criar um conjunto de dados unificado.
- Engenharia de Features: A variável target ('Alerta') foi criada e features temporais (hora, dia da semana, mês) foram extraídas.
- Pré-processamento: Variáveis categóricas foram codificadas (one-hot encoding) e valores ausentes foram tratados.
- Modelagem: Um modelo Random Forest foi treinado para classificar as leituras de sensores como "Com Alerta" ou "Sem Alerta".
- Avaliação: O modelo foi avaliado usando acurácia, relatório de classificação (precisão, recall, f1-score) e matriz de confusão.

### Principais Insights:

- Desbalanceamento de Classes: Os dados apresentam um desbalanceamento significativo, com muito mais registros de "Sem Alerta" do que "Com Alerta". Isso impacta a interpretação das métricas.
- Acurácia Enganosa: A alta acurácia geral não reflete o desempenho real na detecção de alertas devido ao desbalanceamento.
- Baixo Recall para Alertas: O modelo atual tem dificuldade em identificar a maioria dos alertas reais (baixo recall para a classe "Com Alerta"), resultando em muitos Falsos Negativos.
- Importância das Features: O valor da leitura do sensor foi a feature mais importante para o modelo, seguido por features temporais. No entanto, o box plot sugere que o valor da leitura sozinho pode não ser suficiente para distinguir claramente os alertas.

---

**Challenge**: Hermes Reply - Digitalização Industrial  
**Fase**: 5 - Machine Learning e Computação em Nuvem  
**Data**: Setembro 2025
