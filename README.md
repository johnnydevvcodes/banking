# Banking App

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Usage](#usage)
- [Contributing](../CONTRIBUTING.md)

## About <a name = "about"></a>

This is a simple banking app for sending money and viewing transactions:
- Dashboard for account (hide/show account balance)
- View Transactions Button
- Send Money Button
- Transactions Screen (With Empty/Loading/Data states)
- Send Money Screen (With Success/Fail/Insufficient_Balance states) (Fields -- numbers only, Cannot be empty)
- Unit Tests
- Clean Architecture
- Bloc

## Getting Started <a name = "getting_started"></a>

Install Flutter SDK: [Flutter Installation Guide](https://docs.flutter.dev/get-started/install?_gl=1*18n5z5l*_gcl_aw*R0NMLjE3MzIwNDA3ODkuQ2owS0NRaUFpX0c1QmhEWEFSSXNBTjVTWDdyTDhZMW9UdkNMUThqamFiV1o3SjZlRDB3SC1FX1hUUWFVeVZMRG9oY1RXQXR5cmdRTGp4c2FBcHJFRUFMd193Y0I.*_gcl_dc*R0NMLjE3MzIwNDA3ODkuQ2owS0NRaUFpX0c1QmhEWEFSSXNBTjVTWDdyTDhZMW9UdkNMUThqamFiV1o3SjZlRDB3SC1FX1hUUWFVeVZMRG9oY1RXQXR5cmdRTGp4c2FBcHJFRUFMd193Y0I.*_ga*MTMwNTM1NDk3NC4xNjk1NDQxNzA1*_ga_04YGWK0175*MTczMjA0MDc4OC40MC4wLjE3MzIwNDA3ODguMC4wLjA.)

### Prerequisites

Code Generation with build_runner
If you are using Cubit, Bloc, or other code-generation tools (like JsonSerializable), you will need to run build_runner to generate necessary files such as .g.dart files.

Run the following command to generate the required files:

flutter packages pub run build_runner build

