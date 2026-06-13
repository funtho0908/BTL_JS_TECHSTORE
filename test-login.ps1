$body = @"
{"email":"admin@techzone.com","password":"admin123"}
"@
$headers = @{"Content-Type"="application/json"}
try {
    $r = Invoke-WebRequest -Uri 'http://localhost:3000/api/auth/admin/login' -Method POST -ContentType 'application/json' -Body $body -Headers $headers
    Write-Host "Status:" $r.StatusCode
    Write-Host "Response:" $r.Content
} catch {
    $_.Exception.Response
}
