# JSP

설치방법 : 
1 sudo mkdir -p usr/local	Tomcat을 설치할 폴더를 생성함.  ||   (Password는 맥북에 설정된 암호를 입력하면 됩니다.)
2 sudo mv ~/Desktop/apache-tomcat-8.5.39 /usr/local	   ||.   바탕화면으로 옮겨놨던 tomcat폴더를 윗줄에서 생성한 폴더로 이동함 
3	sudo rm -f ~Library/Tomcat ||	Library안에 Tomcat이 혹시라도 있을 경우를 대비해 삭제함
4	sudo ln -s /usr/local/apache-tomcat-8.5.39 /Library/Tomcat ||	local에 옮겨놨던  tomcat과 Library의  Tmocat을 링크시킴
5	sudo chown -R ### /Library/Tomcat ||	Library의 Tomcat폴더의 권한을 수정. ###에 사용자 이름을 입력
6	sudo chmod +x /Library/Tomcat/bin/*.sh || Tomcat의 .sh파일 사용 가능하도록 권한 수정
7	sudo /Library/Tomcat/bin/startup.sh   || 톰캣 시작
8 (sudo /Library/Tomcat/bin/shutdown.sh) || 톰캣 종료

HTtp://127.0.0.1:8080 정상작동하는지 확인
근데 오라클을 (DB)를 깔아놨기 때문에 당연히 포트번혹 지금 중복됌
서버를 종료하고  tomcat폴더안에 conf\server.xml 파일의 69라인의 포트번호를 변경 

서버를 켜서 브라우저 확인하고
서버를 끄고 Eclipse실행 

