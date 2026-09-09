<div align="center">
<img src="docs/_static/images/logo.svg" width="180" alt="PebbleOAO Time">

# Pebbleㅇㅅㅇ;;
for Pebble Time 2
</p>
</div>





## 이게 뭔데

Pebbleㅇㅅㅇ;;은 제가 쓰려고 만든 PebbleOS의 **Pebble Time 2 전용** 커스텀 펌웨어입니다~~~~
PebbleOS의 Pull Request에서 괜찮아 보이는 기능, 잘 작동할 것 같은 기능을 제가 직접 골라왔습니다요.

## 뭐가 다른데

### 한글

- **한글 번역을 넣었습니다.** 한글팩을 따로 설치하지 않아도 됩니다. 추가 기능이랑 날씨 화면의 문구도 번역했습니다.
- **TUMBLED 기반 한글 폰트를 넣었습니다.** 한글 2,350자와 낱자 자모 94자가 들어 있습니다. `ㅋㅋ`, `ㅎㅎ`, `ㅠㅠ`도 됩니다. 다만 한글 11,172자를 전부 넣은 건 아니라 일부 드문 글자는 안 나올 수 있습니다.
- **내장 한글 폰트를 먼저 씁니다.** 기존 언어팩이 깔려 있어도 시스템의 한글은 펌웨어에 넣어둔 폰트로 나옵니다.

### 화면

- **손바닥으로 화면을 덮으면 워치페이스로 돌아갑니다.** 알림이 왔거나 다른 화면에 있을 때 화면을 덮으면 백라이트가 바로 꺼지고 시계 화면으로 돌아갑니다. 싫으시면 설정에서 끄셔도 됩니다.
- **시스템 다크 모드를 넣었습니다.** 계속 켜둘 수도 있고, 주변 밝기나 정해둔 시간에 맞춰 바뀌게 할 수도 있습니다.

### 배터리

- **80% 충전 제한을 넣었습니다.** 켜두면 80%에서 충전을 멈추고, 77% 이하로 내려가면 다시 충전합니다. 100%까지 충전하고 싶으시면 꺼두시면 됩니다.

### 소리와 진동

- **정각에 소리가 나게 할 수 있습니다.** 1시간이나 30분 간격으로 고를 수 있고, 몇 시부터 몇 시까지 울릴지도 설정할 수 있습니다.
- **정각 알림도 조용해야 할 때는 조용합니다.** 방해 금지나 스피커 음소거 상태에서는 안 울립니다. 저전력 상태, 펌웨어 업데이트 중, 다른 소리가 재생 중일 때도 건너뜁니다.
- **진동 패턴 6개를 추가했습니다.** 중간 길이 두 번, 페블 모스 부호, 심장 박동, 더블 탭, 물결, (스타워즈) 제국 행진곡이 있습니다.

### 알림 아이콘

- **앱 알림 아이콘 14개를 추가했습니다.** ChatGPT, 네이버, 네이버 카페, 당근, 토스, 중고나라, 네이버페이, 카카오페이, 쿠팡이츠, 디시인사이드, 폴센트, 하나페이, 뱅크샐러드, 셋로그가 들어 있습니다.
- **아이콘은 수정된 안드로이드 앱도 필요합니다.** 함께 제공하는 앱을 사용해주세요. 펌웨어만 바꾸면 새 아이콘이 나오지 않습니다.


## 사진으로 보면 이렇습니다

왼쪽은 **순정 PebbleOS v4.37.0**, 오른쪽은 **Pebbleㅇㅅㅇ;; Flan**입니다. 둘 다 Time 2 에뮬레이터에서 찍었고, 순정에는 별도 한글팩을 설치하지 않았습니다.

양쪽 모두 글자 크기를 **크게**로 맞췄습니다. 충전 설정 사진만 기존에 찍어둔 기본 글자 크기 화면입니다. 배터리·건강·알림 데이터는 테스트용이며, `--W / 계산 중`은 에뮬레이터에서 충전 측정값을 받지 못해서 나오는 표시예요.

**앱 서랍**

| 순정 | Pebbleㅇㅅㅇ;; |
| :---: | :---: |
| <img src="docs/_static/images/comparison/flan/stock-launcher.png" width="300" alt="순정 앱 서랍"> | <img src="docs/_static/images/comparison/flan/custom-launcher.png" width="300" alt="Pebbleㅇㅅㅇ;; 앱 서랍"> |
| 글자를 크게 설정해도 앱 이름은 작은 편입니다. | 앱 이름도 같이 커지고, 메뉴를 한글로 볼 수 있습니다. |

**설정 메뉴**

| 순정 | Pebbleㅇㅅㅇ;; |
| :---: | :---: |
| <img src="docs/_static/images/comparison/flan/stock-settings.png" width="300" alt="순정 설정 메뉴"> | <img src="docs/_static/images/comparison/flan/custom-settings.png" width="300" alt="Pebbleㅇㅅㅇ;; 설정 메뉴"> |
| 메뉴 사이가 넓어서 한 화면에 보이는 항목이 적습니다. | 글씨는 크게 두고 간격을 줄여 더 많은 항목이 보이게 했습니다. |

**한글 알림과 앱 아이콘**

| 순정 | Pebbleㅇㅅㅇ;; |
| :---: | :---: |
| <img src="docs/_static/images/comparison/flan/stock-notification-detail.png" width="300" alt="순정 한글 알림과 앱 아이콘"> | <img src="docs/_static/images/comparison/flan/custom-notification-detail.png" width="300" alt="Pebbleㅇㅅㅇ;; 한글 알림과 앱 아이콘"> |
| 별도 한글팩이 없으면 한글이 네모로 나오고, ChatGPT는 기본 아이콘을 씁니다. | 한글과 낱자 자모가 나오고, 수정된 폰 앱과 함께 쓰면 ChatGPT 아이콘도 뜹니다. |

**알림 목록**

| 순정 | Pebbleㅇㅅㅇ;; |
| :---: | :---: |
| <img src="docs/_static/images/comparison/flan/stock-notifications.png" width="300" alt="순정 알림 목록"> | <img src="docs/_static/images/comparison/flan/custom-notifications.png" width="300" alt="Pebbleㅇㅅㅇ;; 알림 목록"> |
| 목록의 제목과 내용은 작은 글씨로 표시됩니다. | 목록에도 큰 글씨 설정을 적용하고 항목 사이의 간격을 줄였습니다. |

**건강 앱**

| 순정 | Pebbleㅇㅅㅇ;; |
| :---: | :---: |
| <img src="docs/_static/images/comparison/flan/stock-health.png" width="300" alt="순정 건강 앱"> | <img src="docs/_static/images/comparison/flan/custom-health.png" width="300" alt="Pebbleㅇㅅㅇ;; 건강 앱"> |
| 요일별 비교가 “TYPICAL WED”처럼 영어로 나옵니다. | 비교 대상에 맞춰 “수요일 평균”처럼 한국어로 표시합니다. |

**충전 화면**

| 순정 | Pebbleㅇㅅㅇ;; |
| :---: | :---: |
| <img src="docs/_static/images/comparison/flan/stock-charging.png" width="300" alt="순정 충전 화면"> | <img src="docs/_static/images/comparison/flan/custom-charging.png" width="300" alt="Pebbleㅇㅅㅇ;; 충전 화면"> |
| 충전 아이콘과 “Charging” 문구를 보여줍니다. | 잔량·배터리 전력·남은 시간·시계를 표시하고, 소수점은 조금 작게 넣었습니다. |

**충전 설정**

| 순정 | Pebbleㅇㅅㅇ;; |
| :---: | :---: |
| <img src="docs/_static/images/comparison/flan/stock-charging.png" width="300" alt="순정 충전 설정"> | <img src="docs/_static/images/comparison/flan/custom-charging-settings.png" width="300" alt="Pebbleㅇㅅㅇ;; 충전 설정"> |
| 충전 화면의 표시 항목을 고르는 메뉴는 없습니다. | 표시 방식·소수 자릿수·갱신 간격·80% 충전 제한을 설정할 수 있습니다. |

**다크 모드**

| 순정 | Pebbleㅇㅅㅇ;; |
| :---: | :---: |
| <img src="docs/_static/images/comparison/flan/stock-launcher.png" width="300" alt="순정 다크 모드"> | <img src="docs/_static/images/comparison/flan/custom-dark-launcher.png" width="300" alt="Pebbleㅇㅅㅇ;; 다크 모드"> |
| 앱 서랍은 밝은 배경으로 표시됩니다. | 어두운 배경으로 바꿀 수 있고, 시간이나 주변 밝기에 맞춰 전환할 수도 있습니다. |

**정각 알림 소리**

| 순정 | Pebbleㅇㅅㅇ;; |
| :---: | :---: |
| <img src="docs/_static/images/comparison/flan/stock-date-time.png" width="300" alt="순정 정각 알림 소리"> | <img src="docs/_static/images/comparison/flan/custom-chime.png" width="300" alt="Pebbleㅇㅅㅇ;; 정각 알림 소리"> |
| 날짜와 시간 메뉴에는 시간 표시와 시간대 설정이 있습니다. | 스피커로 정각을 알리도록 켜고, 간격과 소리가 날 시간을 정할 수 있습니다. |

**진동 패턴**

| 순정 | Pebbleㅇㅅㅇ;; |
| :---: | :---: |
| <img src="docs/_static/images/comparison/flan/stock-vibrations.png" width="300" alt="순정 진동 패턴"> | <img src="docs/_static/images/comparison/flan/custom-vibrations.png" width="300" alt="Pebbleㅇㅅㅇ;; 진동 패턴"> |
| 기본으로 들어 있는 진동 패턴 중에서 고릅니다. | 중간 길이 두 번을 포함해 새 진동 패턴 6가지를 더 골라 쓸 수 있습니다. |

**손바닥으로 덮기**

| 순정 | Pebbleㅇㅅㅇ;; |
| :---: | :---: |
| <img src="docs/_static/images/comparison/flan/stock-backlight.png" width="300" alt="순정 손바닥으로 덮기"> | <img src="docs/_static/images/comparison/flan/custom-palm.png" width="300" alt="Pebbleㅇㅅㅇ;; 손바닥으로 덮기"> |
| 움직임이나 터치로 백라이트를 켜는 설정이 있습니다. | 화면을 덮으면 백라이트를 끄고 워치페이스로 돌아가게 할 수 있습니다. |

## 조잡해보이는데

네. 제가 쓰려고 만들었기 때문에 조잡합니다. 그래서 (혹시나 버그가 생긴다면) 알람이 안 울린다든지 뭐 어쩐다든지 할 수 있습니다. 이 레포지토리의 모든 파일을 Pebble, 또는 안드로이드 폰에 적용시 물적, 심적인 책임은 이용자에게 전부 있음을 인정한다고 간주합니다.

그렇지만 제가 쓰려고 만들었기 때문에 잘 작동 안 되는 건 제가 용서를 못 합니다. [이슈](https://github.com/devuterian/marie-PebbleOS/issues)를 보내주시면 최대한 수정해볼 수 있도록 노력하겠습니다.

## 까는 법

에이 페블 쓰시는 분이면 아시지 않나요? (아니면 죄송합니다 제미나이에게 물어보세요)

파일은 [릴리즈 페이지](https://github.com/devuterian/marie-PebbleOS/releases)에 있습니다. 본인 기종에 맞는 걸 받아주세요.

한글 번역과 폰트가 포함돼 있어서 별도 한글팩은 필요하지 않습니다잉.
시계 언어 설정에서 **한국어**를 선택하면 됩니다.
언어팩이 이미 깔려 있어도 괜찮습니다. 똑같이 한국어를 선택하면 됩니다.

## 가져온 프로젝트들

여러 분이 만들어주신 코드와 리소스를 가져와 제 취향에 맞게 수정했습니다. 만들어주신 분들께 진심으로 감사드립니다.

- **[PebbleOS](https://github.com/coredevices/PebbleOS)** 이 펌웨어의 바탕이 된 프로젝트입니다.
- **[josiahcbloomer · #1979](https://github.com/coredevices/PebbleOS/pull/1979)** 손바닥으로 덮으면 백라이트가 꺼지는 기능을 가져와, 워치페이스로도 돌아가도록 수정했습니다.
- **[spr4bhu · #1156](https://github.com/coredevices/PebbleOS/pull/1156)** 배터리 충전을 80%로 제한하는 기능을 가져왔습니다.
- **[amcolash · #1119](https://github.com/coredevices/PebbleOS/pull/1119)** 시스템 다크 모드를 가져오고, 사용 중 발견한 문제를 수정했습니다.
- **[Joshsg3 · #1982](https://github.com/coredevices/PebbleOS/pull/1982)** 추가 진동 패턴을 가져오고 설정 문구를 한국어로 번역했습니다.
- **[pebble-korean-language-pack](https://github.com/devuterian/pebble-korean-language-pack)** 한글 번역을 가져와 기반 버전에 맞추고, 추가 기능의 문구를 번역했습니다.
- **[TsFreddie/TUMBLED](https://github.com/TsFreddie/TUMBLED)** 내장 폰트로 넣었습니다. 저장 공간에 맞춰 글자 구성을 조정하고, 빠진 낱자 자모는 Galmuri로 보완했습니다.
- **[iconography 포크](https://github.com/devuterian/iconography)** 기존 아이콘에 한국에서 자주 쓰는 앱의 알림 아이콘을 추가했습니다.

## 라이선스

PebbleOS의 기본 라이선스는 [Apache License 2.0](LICENSE)입니다.
포함된 폰트, 아이콘, 외부 코드에는 별도 라이선스가 적용될 수 있습니다. 각 파일과 폴더의 라이선스 및 출처 안내를 확인해주세요.
