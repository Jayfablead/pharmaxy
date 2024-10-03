//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <file_selector_windows/file_selector_windows.h>
#include <fl_downloader/fl_downloader_plugin_c_api.h>
#include <modal_progress_hud_nsn/modal_progress_hud_nsn_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FileSelectorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FileSelectorWindows"));
  FlDownloaderPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlDownloaderPluginCApi"));
  ModalProgressHudNsnPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ModalProgressHudNsnPluginCApi"));
}
