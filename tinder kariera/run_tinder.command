#!/bin/bash
cd "$(dirname "$0")"

PORT=8765
while lsof -i :$PORT &>/dev/null 2>&1; do
  PORT=$((PORT + 1))
done

# מצא IP מקומי
IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || echo "localhost")

clear
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "    טינדר קריירה — שרת מקומי"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📱  קישור לאייפון/אנדרואיד:"
echo ""
echo "  http://$IP:$PORT/tinder_kariera_06.html"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "⚠️  המחשב והטלפון חייבים באותה WiFi"
echo "    לעצירה: Ctrl+C"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

(sleep 1 && open "http://localhost:$PORT/tinder_kariera_06.html") &

python3 -m http.server $PORT
