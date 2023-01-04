//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <adaptive_button/adaptive_button_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) adaptive_button_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AdaptiveButtonPlugin");
  adaptive_button_plugin_register_with_registrar(adaptive_button_registrar);
}
