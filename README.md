![logo](https://user-images.githubusercontent.com/78418562/125244282-1a0b1e80-e32a-11eb-8b68-f86a26cb173e.jpg)

## STARTFUN 
스타트펀은 약 6주의 기간동안 weis팀이 준비한 Spring 프로젝트입니다. 
벤치마킹 및 시나리오 작성, 요구사항 정의서/명세서 작성, 스토리보드, 코드구현, 테스트까지의 
프로젝트 전체 진행 과정에 6명의 조원이 한명도 빠짐없이 참여하여 만들었습니다.

## 프로젝트 개요
스타트 펀은 경쟁력 있는 아이디어를 가진 프로젝트 개설자와 그 아이디어를 지지하는 후원자를 연결해 주는 플랫폼입니다.<br>
요즘 개인사업자뿐만 아니라 기업들까지 관심을 가지면서 크라우드 펀딩 시장이 커지고 있지만,
기존 플랫폼들은 리워드 품질이나 프로젝트 마감 후 사후 처리에 관한 제도가 미흡해서
후원자들의 불만이 많다는 문제점이 있습니다.<br>
저희는 이러한 문제점을 개선하기 위해 관리자 정산 제도, 프로젝트 신고 기능, 후원자 평가 기능을 솔루션으로 추가해서 
사업자와 투자자가 서로 상생할 수 있는 공존형 크라우드 펀딩 플랫폼을 구현했습니다.

## 스타트펀 관계도
* 회원은 개인과 법인으로 나뉜다.
* 개인회원은 프로젝트 참여 및 후원형 프로젝트 개설이 가능하다.
* 법인회원은 투자형 프로젝트 개설이 가능하다.
* 스타트펀에서는 프로젝트 개설자를 스타터 , 참여자는 스펀서라고 명칭한다.
![relation](https://user-images.githubusercontent.com/78418562/125282749-b0ebd100-e352-11eb-9f2c-3c42b4a9ebdb.jpg)

## ERD
![DB](https://user-images.githubusercontent.com/78418562/125284294-3f148700-e354-11eb-90a8-b3eecb642a8e.png)
> Entity는 총 23개 추출되었고, 핵심 Entity는 project 테이블과 member 테이블입니다. 각 테이블의 Primary Key인 project_no와 member_email을 거의 대부분의 테이블에서 참조하고 있습니다.

## ClassDiagram
![ClassDiagram](https://user-images.githubusercontent.com/78418562/125282755-b2b59480-e352-11eb-9256-9fe78bf18590.png)
> project 클래스와  support · invest · reward 클래스가 연관관계로 이루어져있습니다. 이 부분에 트랜젝션을 사용하여 프로젝트 삭제시 연관된 모든 테이블의 데이터가 삭제되도록 처리하였습니다.
#### (Transaction : project / support / reward를 하나의 단위로 묶은 후 insert 과정에서 오류 발생 시 rollback 되도록 처리)

## SequenceDiagram
![SequenceDiagram](https://user-images.githubusercontent.com/78418562/125282762-b34e2b00-e352-11eb-8e0a-d9b4332029f5.png)
> <후원프로젝트 개설>
1. 스타터는 프로젝트를 신청한 뒤 관리자의 심사를 받게 된다.
2. 심사에 거절되면 프로젝트 개설을 실패 | 승인되면 펀딩 시작일에 리스트에 노출된다.
3. 프로젝트 진행중에 신고를 받게되면 관리자의 판단으로 신고 프로젝트로 처리되면서 펀딩이 중단된다.
4. 펀딩 중단없이 진행된 프로젝트는 마감일에 목표금액 달성여부를 판단한다.
5. 목표금액을 달성한 프로젝트는 다음날 9시 일괄 결제처리가 된다.
6. 총 후원금액은 관리자에게 입금되며 관리자는 스타트펀 수수료와 홀딩금액을 제외하고 스타터에게 지급한다.
7. 스타터는 모든 리워드를 발송 완료한 후에 관리자에게 2차 정산요청을 한다.
8. 관리자는 스펀서 후기 평점과 리워드 완료 상태를 확인 후 잔금을 정산해준다.

## Mybatis - Dynamic query
![list](https://user-images.githubusercontent.com/78418562/125294432-37a6ab00-e35f-11eb-8e85-256e281f7add.gif)
```sql
....
<choose>
  <when test="listSort == 'total'">done desc, total desc</when>                     
  <when test="listSort == 'project_end'">done desc, p.project_end desc, dday</when>        
  <when test="listSort == 'project_start'">done desc, p.project_start desc</when>   
  <when test="listSort == 'sponsor_count'">done desc, sponsor_count desc</when> 
  <otherwise>done desc, total desc</otherwise>        
</choose>
....
```
> 프로젝트 카테고리 분류 및 리스트 정렬을 위해 choose문을 사용해서 선택된 기준에 맞는 조건절을 찾아 리스트를 노출 시킬 수 있게 구현하였습니다.

## JavaMailSender | Velocity
![velocity](https://user-images.githubusercontent.com/78418562/125288526-35d9e900-e359-11eb-8a58-69228eb12ec3.jpg)
> 회원가입 : 이메일 중복검사 후 인증번호 메일발송<br>
> 비밀번호 찾기 : 입력한 아이디(이메일)로 비밀번호 재설정 링크 메일발송

## DB scheduler
![scheduler](https://user-images.githubusercontent.com/78418562/125289716-830a8a80-e35a-11eb-82cd-883fc0de566d.gif)
> 1일 주기로 작동하는 스케줄러를 구현하여 승인된 프로젝트는 펀딩 시작일에 '진행중'으로 상태가 변경되면서 리스트에 노출되도록 구현하였습니다.

#### 구현된 스케줄러
* 프로젝트 마감일 다음날 9시에 목표금액을 달성한 프로젝트는 일괄 결제 처리
* 실시간 문의하기 채팅 후 7일 까지만 대화내용 DB 저장 후 삭제 처리
* 관리자에 의해 '승인' 처리된 프로젝트는 펀딩 시작일에 '진행중'으로 상태변경 처리
* 마감일이 지난 프로젝트는 '진행중'에서 '진행완료'로 상태변경 처리

## Trigger
```sql
drop trigger if exists project_deleteTrg;
create trigger project_deleteTrg
before delete
on project
for each row
begin
if old.project_type='후원' then
delete from reward where project_no=old.project_no;
delete from support where project_no=old.project_no;
else
delete from invest where project_no=old.project_no;
end if;
end;
```
> 프로젝트를 개설하면 참조하는 연관테이블들이 함께 생성되는데, 프로젝트 삭제시에도 invest · support · reward 함께 삭제되도록 트리거를 구현하였습니다.

#### 구현된 트리거
* 공지사항 delete하면 해당 글의 댓글도 delete되는 트리거
* project를 delete하면 invest,support,reward도 delete되는 트리거
* 팔로잉하면 팔로워에도 insert 되는 트리거
* 팔로잉 취소하면 팔로워에도 delete 되는 트리거

## WebSocket
![websocket](https://user-images.githubusercontent.com/78418562/125291540-7b4be580-e35c-11eb-9d67-125ca3993447.gif)
> 펀딩 진행 시 스타터와 스펀서간의 원활한 소통을 위해 실시간 채팅 및 알림 기능을 구현하였습니다. <br>
#### (HandshakeInterceptor를 통해 회원 이메일을 저장 후 textWebSocketHandler에 로그인 한 멤버 세션 리스트 · 해당 세션이 가지고 있는 방번호 리스트 · 채팅 방 리스트 총 세가지의 concurrentHashMap을 생성하여 세션을 관리)

## 결제API
![payment](https://user-images.githubusercontent.com/78418562/125299342-07154000-e364-11eb-80c2-a50b2ec4e204.jpg)
> 투자형 프로젝트 참여시 이전 투자내역으로 투자한도를 제한 후 한도 이내에서 import API를 통한 결제가 진행되도록 구현하였습니다.

## Apache POI
![excel](https://user-images.githubusercontent.com/78418562/125298228-edbfc400-e362-11eb-84c1-fd6032945df0.gif)
> 엑셀파일 다운로드 기능을 활용하여 후원형 개설자가 스펀서 리스트를 다운받아 리워드 배송시 활용할 수 있도록 구현하였습니다.

## AOP - Log
![log](https://user-images.githubusercontent.com/78418562/125295489-3c1f9380-e360-11eb-89d6-aec629210f76.jpg)
> 스타트펀 운영시 핵심이 되는 프로젝트 서비스 패키지를 모니터링 할 수 있도록 포인트컷으로 지정하여 패키지내 타켓메서드의 실행시간을 로그파일로 남기도록 구현하였습니다.
#### (로그를 남기는 파일의 용량이 100KB가 넘으면 이를 압축 파일로 만들고 새로운 로그 파일을 만드는 정책으로 파일관리가 편리하도록 구현)

## 관리자 모드
![admin](https://user-images.githubusercontent.com/78418562/125304280-68d7a900-e368-11eb-9769-7e67c88218b3.jpg)
> 관리자 메인페이지에는 총 회원 수(개인 | 법인) 및 총 프로젝트 수가 노출되며, 차트를 통해 일별 프로젝트 신청 현황과 후원형 | 투자형 프로젝트 수를 비교하며 관리할 수 있도록 구현하였습니다.

## 스타트펀 3가지 솔루션
![solution](https://user-images.githubusercontent.com/78418562/125309958-21075080-e36d-11eb-8a1a-e0f234f46153.jpg)
> 리워드 품질이나 프로젝트 마감 후 사후 처리에 관한 제도가 미흡한 기존 플랫폼의 문제점을 해결하기 위한 스타트펀만의 세가지 솔루션을 구현하였습니다.
#### 기존 플랫폼의 문제점을 개선하기 위한 스타트펀만의 3가지 솔루션
1. 프로젝트 신고기능
2. 관리자 정산제도
3. 후원가 평가기능

## 프로젝트 진행과정
![progress](https://user-images.githubusercontent.com/78418562/125306728-66764e80-e36a-11eb-9d2a-3b4a9358f452.jpg)
> 초기 시나리오에서 버전을 올리면서 디테일한 부분을 수정하며 작업하였습니다.<br>
> 요구사항 정의서를 기반으로 명세서를 작성하며 난이도와 중요도를 표시하고, 그 순서대로 작업 실행하여 일정 내에 코드 구현을 마칠 수 있었습니다.<br>
> div위치 및 버튼 변경 이미지 등을 꼼꼼하게 고려하며 스토리보드를 작성하여 프론트 작업 시 많은 도움이 되었습니다.

## 협업
![notion](https://user-images.githubusercontent.com/78418562/125307595-2794c880-e36b-11eb-8eb0-27ebc5a07c80.jpg)
> Notion을 활용하여 모든 회의내용을 기록하였고, 각자 개인 업무 일지를 칸반보드로 작성하여 팀원들의 업무 진행 정도를 빠르게 파악할 수 있었습니다. 또한, 각자 발생한 트러블 슈팅을 모아서 공유하며 함께 학습하였습니다.

## weis 소개
### [정수빈](https://github.com/soob312)(조장)  |  [이보희](https://github.com/lbhee)(부조장)  |  [박선희](https://github.com/sunhee1021)  |  [조하선](https://github.com/hasunzo)  |  [임나영](https://github.com/Lim-nayeong)  |  [이광희](https://github.com/Lee-Kwang-Hee)
