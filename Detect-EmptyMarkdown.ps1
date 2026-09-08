# Detect-EmptyMarkdown.ps1
# Script de solo lectura para auditar archivos Markdown vacíos o con placeholders.

# Definir la ruta base del repositorio de SCREEN by KLIK
$PathProyecto = "y:\Documentos\GitHub\SCREEN_by_KLIK"

# Verificar si la ruta existe físicamente; si no, usar el directorio de ejecución actual
if (-not (Test-Path $PathProyecto)) {
    $PathProyecto = Get-Location
}

Write-Host "=====================================================================" -ForegroundColor Cyan
Write-Host "AUDITORÍA DE SOLO LECTURA: Buscando archivos Markdown vacíos en:" -ForegroundColor Cyan
Write-Host "-> $PathProyecto" -ForegroundColor Yellow
Write-Host "=====================================================================" -ForegroundColor Cyan

# Obtener todos los archivos .md de forma recursiva
$ArchivosMD = Get-ChildItem -Path $PathProyecto -Filter "*.md" -Recurse

$Resultados = [System.Collections.Generic.List[PSCustomObject]]::new()

foreach ($Archivo in $ArchivosMD) {
    $EsVacio = $false
    $Razon = ""

    # Caso 1: El archivo tiene tamaño físico de 0 bytes
    if ($Archivo.Length -eq 0) {
        $EsVacio = $true
        $Razon = "Tamaño físico de 0 bytes (vacío absoluto)"
    } else {
        # Caso 2: El archivo contiene texto, pero es solo espacios, títulos o puntos suspensivos (...)
        $Contenido = Get-Content -Path $Archivo.FullName -Raw
        
        # Limpiar saltos de línea y espacios
        $ContenidoLimpio = $Contenido.Trim()
        
        # Expresión regular para remover encabezados Markdown (ej. # FASE 00)
        $SinEncabezados = $ContenidoLimpio -replace '(?m)^#.*$', ''
        
        # Remover puntos suspensivos, retornos de carro y espacios
        $SinMarcadores = $SinEncabezados -replace '\.', ''
        $TextoResidual = $SinMarcadores.Trim()

        # Si no queda texto real sustancial después de limpiar
        if ([string]::IsNullOrWhiteSpace($TextoResidual)) {
            $EsVacio = $true
            $Razon = "Solo contiene títulos, espacios o marcadores de posición (...)"
        }
    }

    if ($EsVacio) {
        $Resultados.Add([PSCustomObject]@{
            "Archivo" = $Archivo.Name
            "Tamaño"  = "$($Archivo.Length) bytes"
            "Estado"  = $Razon
            "Ruta"    = $Archivo.FullName
        })
    }
}

# Mostrar resultados
if ($Resultados.Count -gt 0) {
    Write-Host "`nSe han detectado $($Resultados.Count) archivos vacíos o sin contenido de ingeniería real:`n" -ForegroundColor Red
    $Resultados | Format-Table -AutoSize
} else {
    Write-Host "`n¡Sincronización Perfecta! Todos los archivos Markdown contienen información real." -ForegroundColor Green
}

Write-Host "=====================================================================" -ForegroundColor Cyan
Write-Host "Fin de la auditoría. Ningún archivo fue modificado." -ForegroundColor Cyan
Write-Host "=====================================================================" -ForegroundColor Cyan
