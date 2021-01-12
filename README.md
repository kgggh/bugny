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
- 후기

AWS EC2(ubuntu)환경에서 배포진행,aws ec2로 처음 배포해보는거라 어려웠다.<br>
원래 계획은 AWS RDS 이용해서 db 연동해서 쓰려고 했는데 잘 안됨.<br>
그래서 그냥 로컬 DB데이터를 dump(export)해서 FileZilla 이용해 ubuntu로 옮겨 import 처리했다.<br>
프로젝트 파일도 git 사용해서 하려다 그냥 WAR파일을 FileZilla로 옮겨서 진행.<br>
<br>
- 고칠점

중복코드 및 일부 js head영역에 노출한 점.<br>
부트스트랩 사용했지만 일부 페이지 핸드폰으로 접속시 화면밖으로 넘쳐흐르는 점.
