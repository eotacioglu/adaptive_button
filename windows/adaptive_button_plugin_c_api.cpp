#include "include/adaptive_button/adaptive_button_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "adaptive_button_plugin.h"

void AdaptiveButtonPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  adaptive_button::AdaptiveButtonPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
