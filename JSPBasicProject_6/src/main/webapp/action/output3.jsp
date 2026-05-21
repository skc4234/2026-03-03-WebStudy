<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.bean.*"%>
<%--
	JSP 액션 태그
		=> Java 코드를 직접 쓰지 않고 기능을 수행하게 만드는 표준 태그
		- 사용법 
			<jsp:~>
		- XML 형식으로 되어있다 => 태그/속성명의 대소문자 구분
		- 속성값 입력시 반드시 "" 사용
		- Java 코드 감소
		- 재사용성 증가
		- 다른 JSP / Bean 연동
		
		<jsp:useBean id="member" class="com.sist.bean.Member">
		=> Member member = new Member();
		=> JSP에서 사용 가능 => MVC에서는 사용빈도가 적다
		
		<jsp:setProperty name="member" property="name"/>
		=> member.setName(name);
		<jsp:setProperty name="member" property="*"/>
		=> member 객체에 있는 모든 setter를 호출해서 값을 채운다
		=> 리플렉션
		
		<jsp:getProperty name="member" property="name"/>
		=> member.getName();
		
		==> 자바 소스가 길어지는 것을 방지 => JSP 액션 태그
		현재까지 사용되는 액션 태그 : <jsp:include> => MVC 구조에 적합하다
		
		include : 동적으로 변경
		<jsp:include file="다른 jsp 파일"> => 메인 페이지 구조 제작 가능
		
		JSP => HTML + Java
		MVC => Java : Model => 순수 자바
			   HTML : View => <%%> 제거 => JSTL
			   연결 => Controller
			   		  forward()로 메소드 이동
					  Spring에서 이미 만들어져 있다
		
		- 자바빈(javaBean) => 213p
			- 단순한 클래스
			- JSP -- Servlet -- DB데이터 전송
			- 캡슐화 : private / setter/ gertt
			- MVC에서도 데이터를 모아서 한번에 전ㅅ농
			- 데이터베이스 컬럼명과 일치
		------------------------------------
		 javabean     dto/vo
	목적   JSP 표준     데이터 전달
	규칙      엄격       자유로움
	사용	  JSP 중심  Spring/MyBathis
	
	최근에는 VO 보다 record 사용
		=> record는 
	
 --%>
<jsp:useBean id="bean" class="com.sist.bean.MemberBean">
	<jsp:setProperty name="bean" property="*"/>
	<%-- useBean의 id와 setProperty의 name이 같아야함 --%>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>받은 데이터1(jsp:useBean)</h1>
	이름:<%=bean.getName() %><br>
	나이:<%=bean.getAge() %><br>
	성별:<%=bean.getSex() %><br>
	주소:<%=bean.getAddress() %><br>
	전화:<%=bean.getPhone() %><br>
	소개:<%=bean.getContent() %><br>
	<hr>
	<h1>받은 데이터2(jsp:useBean)</h1>
	이름:<jsp:getProperty property="name" name="bean"/><br>
	<%--
		=> bean.getName()
		getProperty : 출력
	 --%>
	나이:<jsp:getProperty property="age" name="bean"/><br>
	성별:<jsp:getProperty property="sex" name="bean"/><br>
	주소:<jsp:getProperty property="address" name="bean"/><br>
	전화:<jsp:getProperty property="phone" name="bean"/><br>
	소개:<jsp:getProperty property="content" name="bean"/><br>
</body>
</html>