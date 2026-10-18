@echo off
chcp 65001 >nul
cd /d "%~dp0"
title Bazar Dor - Next.js
if not exist .env.local (
  echo [INFO] .env.local file not found.
  echo Copy .env.example to .env.local and configure PostgreSQL before testing authentication.
  echo Home page can still be tested, but protected pages need the database configuration.
  echo.
)
if not exist node_modules (
  echo [1/2] Installing dependencies with peer-dependency workaround...
  call npm install --legacy-peer-deps
  if errorlevel 1 (
    echo [ERROR] Dependency installation failed.
    echo Try updating Node.js to a current LTS release, then run: npm install --legacy-peer-deps
    echo If it still fails, send the latest npm debug log.
    pause
    exit /b 1
  )
)
echo [2/2] Starting Bazar Dor at http://localhost:3000
call npm run dev
pause
