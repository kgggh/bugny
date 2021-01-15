# bugny(커뮤니티게시판)

음악 및 자유 게시판 + 라이브채팅(pubnub)
<br>
- 개발 환경

macOS 10.15.7<br>
springframework 4.3.11<br>
Java 1.8<br>
WAS- tomcat 8.5<br>
mybatis 3.28<br>
mysql 5.7.31<br>
<br>

- 배포(AWS Ec2)

http://18.188.2.133:8080/bugny/
<br>

- 구성<br><br>
자유게시판<br><br>
글머리(카테고리),제목,내용으로 구성했고, 내용은 네이버 smartEditor를 사용해 이미지 업로드를 가능하게 하였고, 페이징 처리 후 검색기능을 넣었습니다. <br>
스프링 4.0부터 사용 가능한 @Restcontroller AJAX를 이용해 REST API에 REQUEST 요청 해서 RESPONSE 출력하는 방식으로 댓글을 비동기 처리하였습니다.<br><br>
음악요청게시판<br>
회원 가입 후 멤버가 되면, 글 목록 상단에 요청글을 작성할 form이 생기고, AJAX를 이용해 글 씀과 동시에 멤버id를 data로 넘겨 하단 글 목록에 insert 되는 형식이며<br>
페이징 처리 역시 비동기처리로 글의 갯수(count)를 받아 페이지당 10개의 데이터가 넘어가면 하단에 페이지 수가 생기며 화면 전환 없이 이동 가능하게 구성했다.<br><br>
인기음악<br><br>
 조회순으로 user에게 글 목록이 나타나게끔 구성하였습니다.<br><br>  
-최신음악-<br><br>
 발매일을 기준으로 user에게 글 목록이 나타나게끔 구성하였고, 음악이 계속 업데이트 될걸 생각해 검색기능을 추가로 넣었습니다.<br><br>
라이브채팅<br><br>
웹소켓을 이용한 라이브채팅을 구현하다가,이용량이 많지 않기도 해서 찾다보니 무료로 이용가능한 pubnub라는 걸 이용해서 구성<br>
접속이 끊겨도 pubnub.history 기능을 이용해 라이브채팅방이 로딩되면 최근 대화 목록을 다시 불러오도록 구현했다.<br>
<br><br>


- 후기
AWS EC2(ubuntu)환경에서 배포진행,aws ec2로 처음 배포해보는거라 어려웠다.<br>
원래 계획은 AWS RDS로 db 연동해서 쓰려고 했는데 잘 안됨.<br>
그래서 그냥 로컬 DB데이터를 dump(export)해서 FileZilla 이용해 ubuntu로 옮겨 import 처리했다.<br>
프로젝트 파일도 git 사용해서 하려다 그냥 WAR파일을 FileZilla로 옮겨서 진행.<br>
<br>

- 고칠점
중복코드 및 일부 js head영역에 노출한 점.<br>
부트스트랩 사용했지만 일부 페이지 핸드폰으로 접속시 화면밖으로 넘쳐흐르는 점.<br>
