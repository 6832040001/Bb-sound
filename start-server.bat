@echo off
chcp 65001 >nul
title Acoustic Omnichord Studio - Local Web Server
echo ======================================================================
echo    🎸 ACOUSTIC OMNICHORD GUITAR & UKULELE STUDIO (LOCAL WEB SERVER)
echo ======================================================================
echo.
echo กำลังเปิดหน้าเว็บในเบราว์เซอร์...
start "" "http://localhost:8080"

echo.
echo ----------------------------------------------------------------------
echo  🌐 ลิงก์สำหรับเปิดบนเครื่องคอมพิวเตอร์นี้:
echo     👉 http://localhost:8080
echo.
echo  📱 วิธีเปิดเล่นบนโทรศัพท์มือถือ หรือเครื่องอื่นในบ้าน:
echo     1. ตรวจสอบให้โทรศัพท์ต่อ Wi-Fi เดียวกันกับคอมพิวเตอร์
echo     2. ดู IP Address ของคอมพิวเตอร์เครื่องนี้ (เช่น 192.168.1.X)
echo     3. เปิดเบราว์เซอร์ในมือถือแล้วพิมพ์: http://[IP_เครื่องนี้]:8080
echo ----------------------------------------------------------------------
echo.
echo กำลังรันเซิร์ฟเวอร์... (กด Ctrl+C เพื่อหยุด)
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "$port = 8080; $listener = New-Object System.Net.HttpListener; $listener.Prefixes.Add('http://*:' + $port + '/'); try { $listener.Start() } catch { Write-Host 'รันผ่าน port 8080 ไม่ได้ จะลองเปิดแบบไฟล์ปกติ'; Start-Process 'index.html'; exit }; while ($listener.IsListening) { $ctx = $listener.GetContext(); $res = $ctx.Response; $path = Join-Path (Get-Location) 'index.html'; $buf = [System.IO.File]::ReadAllBytes($path); $res.ContentType = 'text/html; charset=utf-8'; $res.OutputStream.Write($buf, 0, $buf.Length); $res.Close() }"
pause

