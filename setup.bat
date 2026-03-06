@echo off
echo Setting up DevOps Assessment Application...
echo.

if not exist .env (
    echo Creating .env file...
    copy .env.example .env
)

echo Building and starting containers...
docker-compose up --build -d

echo.
echo Application is starting...
echo Frontend: http://localhost
echo Backend: http://localhost:8000/api/hello/
echo.
echo Run 'docker-compose logs -f' to view logs
