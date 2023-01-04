#ifndef FLUTTER_PLUGIN_ADAPTIVE_BUTTON_PLUGIN_H_
#define FLUTTER_PLUGIN_ADAPTIVE_BUTTON_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace adaptive_button {

class AdaptiveButtonPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  AdaptiveButtonPlugin();

  virtual ~AdaptiveButtonPlugin();

  // Disallow copy and assign.
  AdaptiveButtonPlugin(const AdaptiveButtonPlugin&) = delete;
  AdaptiveButtonPlugin& operator=(const AdaptiveButtonPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace adaptive_button

#endif  // FLUTTER_PLUGIN_ADAPTIVE_BUTTON_PLUGIN_H_
