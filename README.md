## Folders Structure

```bash
lib
├── global_injections.dart
├── main.dart
├── services
│   ├── database
│   │   ├── app_database.dart
│   │   └── app_database.g.dart
│   ├── localizations
│   │   ├── app_localizations
│   │   │   ├── app_localizations.dart
│   │   │   ├── app_localizations_en.dart
│   │   │   └── app_localizations_pt.dart
│   │   └── l10n
│   │       ├── app_en.arb
│   │       └── app_pt.arb
│   └── logger
│       └── error_logger.dart
└── src
    ├── core
    │   ├── defaults
    │   │   ├── default_colors.dart
    │   │   ├── default_formats.dart
    │   │   ├── default_regex.dart
    │   │   ├── default_spaces.dart
    │   │   └── default_validators.dart
    │   ├── extensions
    │   │   └── string_extension.dart
    │   ├── failure
    │   │   └── failure.dart
    │   └── navigation
    │       ├── custom
    │       │   └── dialog_page.dart
    │       ├── route_paths.dart
    │       └── routes.dart
    └── layers
        ├── controllers
        │   └── global_shared_controller
        │       ├── global_config_controller.dart
        │       ├── global_config_state.dart
        │       └── interfaces
        │           └── global_config_setter.dart
        ├── data
        │   ├── models
        │   │   ├── config_model.dart
        │   │   ├── create_transaction_model.dart
        │   │   └── transaction_model.dart
        │   └── repositories
        │       ├── config_repository.dart
        │       └── transactions_repository.dart
        └── presenter
            ├── dialogs
            │   └── add_transaction_dialog
            │       ├── add_transaction_dialog.dart
            │       └── controller
            │           ├── add_transaction_controller.dart
            │           └── add_transaction_state.dart
            ├── pages
            │   ├── config_page
            │   │   ├── config_page.dart
            │   │   ├── controller
            │   │   │   └── config_page_controller.dart
            │   │   └── widgets
            │   │       └── config_info.dart
            │   ├── failure_page
            │   │   └── failure_page.dart
            │   └── home_page
            │       ├── controller
            │       │   ├── month_transactions_controller.dart
            │       │   ├── month_transactions_state.dart
            │       │   ├── transactions_state.dart
            │       │   └── transactions_state.freezed.dart
            │       ├── home_page.dart
            │       └── widgets
            │           ├── balance_header_widget.dart
            │           ├── month_selector_widget.dart
            │           ├── month_slide_widget.dart
            │           ├── remaining_budget_progress_card.dart
            │           └── transaction_tile.dart
            └── widgets
                ├── error_snackbar.dart
                ├── progress_widget.dart
                └── sliver_sized_box.dart
```
