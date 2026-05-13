#!/bin/bash
# ============================================================
# run-tests.sh — Executa a suíte completa com Newman
# Gera relatório HTML em reports/
# ============================================================

set -e

COLLECTION="collections/saucedemo_collection.json"
ENVIRONMENT="environments/saucedemo_env.json"
REPORT_DIR="reports"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
REPORT_FILE="$REPORT_DIR/report_$TIMESTAMP.html"

echo "============================================"
echo "  SauceDemo API Test Suite — Newman Runner"
echo "============================================"
echo ""

# Verifica se Newman está instalado
if ! command -v newman &> /dev/null; then
  echo "❌ Newman não encontrado. Instalando..."
  npm install -g newman newman-reporter-htmlextra
fi

# Cria pasta de relatórios se não existir
mkdir -p "$REPORT_DIR"

echo "🚀 Executando testes..."
echo ""

newman run "$COLLECTION" \
  --environment "$ENVIRONMENT" \
  --reporters cli,htmlextra \
  --reporter-htmlextra-export "$REPORT_FILE" \
  --reporter-htmlextra-title "SauceDemo API Test Report" \
  --reporter-htmlextra-browserTitle "QA Test Results" \
  --reporter-htmlextra-darkTheme \
  --delay-request 300 \
  --timeout-request 10000

echo ""
echo "✅ Testes concluídos!"
echo "📊 Relatório gerado em: $REPORT_FILE"
