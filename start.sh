cat > start.sh << 'EOF'
set -e
cd backend
pip install -r requirements.txt
python manage.py collectstatic --noinput
python manage.py migrate --noinput
exec gunicorn backend.wsgi --bind 0.0.0.0:${PORT} --workers 3 --timeout 120
EOF
chmod +x start.sh
