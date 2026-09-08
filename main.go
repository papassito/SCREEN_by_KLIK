package main

import (
	"fmt"
	"os"

	"github.com/klik/screen/internal/configuration"
	"github.com/klik/screen/internal/diagnostics"
)

func main() {
	// 1. Inicializar sistema de logs nativo/local
	logger, err := diagnostics.NewLogger()
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error al inicializar el logger de SCREEN: %v\n", err)
		os.Exit(1)
	}
	defer logger.Close()

	logger.Info("Iniciando SCREEN by KLIK (Core)...")

	// 2. Cargar o generar configuraciones locales
	configManager := configuration.NewManager()
	if err := configManager.Load(); err != nil {
		logger.Error("Fallo crítico cargando configuraciones: %v", err)
		os.Exit(1)
	}

	currentConfig := configManager.Get()
	logger.Info("Configuración cargada correctamente.")
	logger.Info("Directorio de exportación: %s", currentConfig.OutputDir)
	logger.Info("Perfil activo: %s (Resolución: %s, FPS: %d)",
		currentConfig.ActiveProfile,
		currentConfig.Video.Resolution,
		currentConfig.Video.FPS,
	)

	logger.Info("SCREEN base inicializada con éxito. Listo para acoplar motores nativos.")
}
