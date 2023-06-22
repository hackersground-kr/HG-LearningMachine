# `러닝머신` - `마이닥터`

해커그라운드 해커톤에 참여하는 `러닝머신` 팀의 `마이닥터`입니다.

## 참고 문서

> 아래 두 링크는 해커톤에서 앱을 개발하면서 참고할 만한 문서들입니다. 이 문서들에서 언급한 서비스 이외에도 더 많은 서비스들이 PaaS, SaaS, 서버리스 형태로 제공되니 참고하세요.

- [순한맛](./REFERENCES_BASIC.md)
- [매운맛](./REFERENCES_ADVANCED.md)

## 제품/서비스 소개

<!-- 아래 링크는 지우지 마세요 -->
[제품/서비스 소개 보기](TOPIC.md)
<!-- 위 링크는 지우지 마세요 -->

## 오픈 소스 라이센스

<!-- 아래 링크는 지우지 마세요 -->
[오픈소스 라이센스 보기](./LICENSE)
<!-- 위 링크는 지우지 마세요 -->

## 설치 방법

> **아래 제공하는 설치 방법을 통해 심사위원단이 여러분의 제품/서비스를 실제 Microsoft 애저 클라우드에 배포하고 설치할 수 있어야 합니다. 만약 아래 설치 방법대로 따라해서 배포 및 설치가 되지 않을 경우 본선에 진출할 수 없습니다.**

### 사전 준비 사항

colab 관련 파일은 [여기](./colab/)에서 확인 가능합니다.

코랩 관련 - 깃허브에 있는 데이터 셋과 ipynb파일을 다운로드 합니다. 데이터셋의 종류는 heart = 심장마비, brain_stroke = 뇌졸증, breast-cancer = 유방암 데이터셋 입니다. 각각 따로 다운로드한 데이터셋과 ipynb파일을 구글 드라이브에 업로드 합니다.(폴더에 저장하거나 이름을 바꾸면 안됩니다.) <br>
from google.colab import drive<br>
drive.mount('/content/drive')<br>
코드 셀을 실행하고 구글 드라이브에 연결시켜줍니다. 이후 상단 런타임에서 모두 실행이나 Ctrl+F9를 누릅니다. (만약 실행이 완료되지 않고 데이터를 불러오는 코드에서 에러가 난다면 실행자가 다운로드를 잘못한 것입니다. 이 경우에는 데이터를 다운로드 받는 코드인<br>pd.read_csv<br>
의 괄호안 경로를 다시 설정해 주어야 합니다.(작은 따움표를 빼면 안됩니다.) 경로를 다시 설정하는 방법은 코랩에 파일로 들어간후 drive에 자신이 저장한 루트에 들어가고 다운로드한 파일을 우클릭 한 후 경로를 복사하고 코드내의 모든 파일을 불러오는 코드를 바꾸어 줍니다.(하나라도 바꾸지 않으면 에러가 납니다.) 이후 코드를 모두 실행해 줍니다. 그리고 모든 ipynb을 실행시켜 줍니다.<br>

[MyDoctor.war](./MyDoctor.war), [MyDoctor.sql](./MyDoctor.sql)파일을 다운로드 받습니다.<br>

> **여러분의 제품/서비스를 Microsoft 애저 클라우드에 배포하기 위해 사전에 필요한 준비 사항들을 적어주세요.**

## 시작하기

> **여러분의 제품/서비스를 Microsoft 애저 클라우드에 배포하기 위한 절차를 구체적으로 나열해 주세요.**
Eclipse EE IDE, Apache Tomcat 10.0, Windows 환경 기준<br>

1. Azure Portal -> 리소스 만들기 -> Azure Database for MySQL -> 유연한 서버 -> 만들기를 선택합니다.<br>
기본<br>
서버 이름: (your_sql_server_name)<br>
지역: Korea Central<br>
MySQL 버전: 8.0<br>
인증 방법: MySQL 인증만<br>
관리자 사용자 이름: (your_sql_user)<br>
암호: (your_sql_passwd)<br>
네트워킹<br>
연결 방법: 퍼블릭 액세스(허용된 IP 주소)<br>
방화벽 규칙: Azure 내의  모든 Azure 서비스의 이 서버에 대한 퍼블릭 액세스 허용<br>

(괄호로 되어 있는 값은 임의로 지정하시기 바랍니다.)<br>

해당 사항으로 Azure Database for MySQL 서버를 생성합니다.<br>

2. Azure Portal -> 리소스 만들기 -> App Services -> 웹 앱 -> 만들기를 선택합니다.<br>
기본 - 인스턴스 정보<br>
이름: (your_appsvc_name)<br>
게시: 코드<br>
런타임 스택: Java 17<br>
Java 웹 서버 스택: Apache Tomcat 10.0<br>
운영 체제: Linux<br>
지역: Korea Central<br>
기본 - 가격 책정 플랜<br>
가격 책정 플랜: 프리미엄 V3 P1V3<br>

(괄호로 되어 있는 값은 임의로 지정하시기 바랍니다.)<br>

해당 사항으로 App Services 서버를 생성합니다.<br>
<br>

3. Eclipse에서 MyDoctor.war 파일을 Import 합니다.<br>
File -> Import -> Web -> WAR file<br>

4. HG-LearningMachine -> src -> main -> webapp -> header.jsp 의 jdbcUrl, dbId, dbPass 변수의 특정 부분을 임의로 지정한 서버 이름, id, 암호로 수정한 후 저장합니다.<br>
(your_sql_server_name) , (your_sql_user) , (your_sql_passwd)<br>

5. WAR 파일을 Export 합니다.<br>
HG-LearningMachine 우클릭 -> Export -> WAR file<br>

6. App Service 서버에 WAR file 을 업로드 합니다.<br>
Azure Portal -> 리소스 그룹 -> (your_resource_group) -> 개요 -> (your_appsvc_name) -> 배포 센터 -> FTPS 자격 증명<br>
FTPS 자격 증명 탭에 표시된 FTPS 엔드포인트, FTPS 사용자 이름, 암호를 FileZilla와 같은 FTP 접속 프로그램으로 App Service 서버의 드라이브에 접속합니다.<br>
Ex.)<br>
Hostname: ftps://waws-prod-se1-015.ftp.azurewebsites.windows.net/<br>
Username: LM-testserver\$LM-testserver<br>
Password: RnmH3QvyYC1kMq ...<br>

/site/wwwroot 디렉토리에 Export 한 WAR 파일을 업로드 합니다.<br>
(your_appsvc_name) -> 개요 -> 다시 시작 을 클릭합니다.<br>

8. SQL 서버 초기 설정을 수행합니다.<br>
DBeaver, MySQL Workbench와 같은 DB Tool을 기동합니다. (MySQL Workbench 기준)
Database -> Connect to Database<br>
Parameters<br>
Hostname: (your_sql_server_name).mysql.database.azure.com<br>
Port: 3306<br>
Username: (your_sql_user)<br>
Password -> Store in Vault... -> (your_sql_passwd)<br>

(괄호로 되어 있는 값은 임의로 지정하시기 바랍니다.)<br>

SSL 인증서가 필요한 경우 Azure Portal -> 리소스 그룹 -> (your_resource_group) -> 개요 -> (your_sql_server_name) -> 네트워킹 -> SSL 인증서 다운로드 탭을 클릭하면 다운로드 가능합니다.<br>

MyDoctor.sql 파일을 실행하여 데이터베이스를 구축합니다.<br>

9. 완료<br>
(your_appsvc_name).azurewebsites.net 에 접속합니다.<br>

colab에서 맨 마지막 셀을 실행하여 결과를 전송하고, 개별 페이지에서 결과를 확인합니다.<br>
