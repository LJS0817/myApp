<div align="center">
  
# 🧼 Soap & Cosmetic Calculator

**비누 및 화장품 제작을 위한 레시피 계산 및 로컬 데이터 관리 어플리케이션**

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![PlayStore](https://img.shields.io/badge/Google_Play-414141?style=for-the-badge&logo=google-play&logoColor=white)](https://play.google.com/store/apps/details?id=com.isma_soap_calculator.music)
[![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)](https://www.figma.com/design/gcoiwsx8vGc4YKWHHSDWVy/Untitled--Copy-?node-id=0-1&t=M6sZk99IzMnl8r5h-1)

</div>

---

## 📌 Project Overview
**Soap & Cosmetic Calculator**는 비누나 화장품을 수제작할 때 요구되는 다양하고 복잡한 배합 수치들을 손쉽게 계산해 주는 유틸리티 어플리케이션입니다.
계산된 나만의 레시피를 기기 내부에 영구적으로 저장하고 관리할 수 있으며, 뛰어난 사용성을 인정받아 **Google Play Store에 공식 출시**되어 실제 사용자들에게 서비스되고 있습니다.

### 🔗 Links
- 🚀 **[Google Play Store 다운로드](https://play.google.com/store/apps/details?id=com.isma_soap_calculator.music)**
- 🎨 **[Figma UI/UX Design](https://www.figma.com/design/gcoiwsx8vGc4YKWHHSDWVy/Untitled--Copy-?node-id=0-1&t=M6sZk99IzMnl8r5h-1)**

---

## 🛠 Tech Stack
- **Framework:** Flutter
- **Language:** Dart
- **State Management:** `Provider`
- **Permissions & Storage:** `permission_handler`, Local File I/O
- **Animation:** `flutter_animate`

---

## ✨ Key Features
- **정밀한 레시피 계산:** 수제 비누 및 화장품 제작에 필수적인 오일, 가성소다(NaOH), 정제수 등의 배합비와 비누화값을 정확하게 계산합니다.
- **로컬 파일 저장 (File I/O):** 사용자가 정성껏 작성한 레시피 데이터를 별도의 서버 없이 기기 내부 스토리지(Local Storage)에 안전하게 파일 형태로 읽고 씁니다.
- **오프라인 동작 보장:** 모든 데이터 처리와 저장이 로컬에서 이루어지므로, 인터넷 연결이 없는 환경(공방 등)에서도 완벽하게 동작합니다.
- **부드러운 UX:** `flutter_animate` 패키지를 활용하여 화면 전환과 데이터 입력 시 직관적이고 부드러운 애니메이션 피드백을 제공합니다.

---

## 🔥 Challenge & Solution (Troubleshooting)

### 🚨 스케일 아웃에 따른 데이터 흐름(Data Flow) 꼬임 현상 해결
- **Problem:** 
  개발 초기에는 단순한 계산기로 기획되었으나, 점차 다양한 재료 입력 필드와 레시피 저장/불러오기 기능이 추가되면서 앱의 규모가 크게 확장되었습니다. 이 과정에서 여러 위젯들이 데이터를 파편적으로 주고받게 되며 상태 관리가 얽히고설키는(Tangling) 일명 '스파게티 코드' 문제가 발생했습니다.

- **Solution:** 
  단순한 땜질식 처방이 아닌, 근본적인 구조 개선을 결단했습니다. `Provider` 패턴을 기반으로 **비즈니스 로직(계산 및 파일 입출력)과 UI 계층을 철저하게 분리**하는 대대적인 리팩토링(Refactoring)을 단행했습니다. 전역적인 데이터 처리 흐름을 단방향으로 통제하여 데이터 꼬임을 완벽히 해결했으며, 기능 추가 시 유지보수가 극도로 용이해진 견고한 아키텍처를 완성했습니다.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (Latest Version)

### Installation
1. Repository를 클론합니다.
```bash
git clone https://github.com/LJS0817/myApp.git
```
2. 패키지를 다운로드합니다.
```bash
flutter pub get
```
3. 앱을 실행합니다. (안드로이드 환경 테스트 권장)
```bash
flutter run
```

<br>

<div align="center">
  <i>Designed and Developed by <b>LJS0817</b></i>
</div>
