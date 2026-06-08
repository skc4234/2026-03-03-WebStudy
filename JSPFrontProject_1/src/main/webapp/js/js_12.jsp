<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	객체 배열 : [{},{},{},...]
	JSP 파일 제목 : - , . 공백 사용 불가
		=> _ $는 가능
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	let sawons=[
		{sabun:1,name:"홍길동",dept:"개발부",job:"대리",pay:3400,loc:"서울"},
		{sabun:2,name:"김두한",dept:"기획부",job:"사원",pay:3800,loc:"부산"},
		{sabun:3,name:"이순신",dept:"영업부",job:"과장",pay:6000,loc:"수원"},
		{sabun:4,name:"강감찬",dept:"개발부",job:"사원",pay:3700,loc:"울산"},
		{sabun:5,name:"춘향이",dept:"영업부",job:"대리",pay:3400,loc:"인천"}
	]
	
	// 데이터 출력
	const sawonList=()=>{
		document.write("<h3>사원 목록</h3>")
		document.write("<ul>")
		sawons.map((sa)=>{
			document.write("<li>"+sa.name+"</li>")
		})
		document.write("</ul>")
	}
	
	const sawonInsert=()=>{
		sawons.push({sabun:6,name:"김철수",dept:"기획부",job:"사장",pay:7000,loc:"서울"})
	}
	
	const sawonDetail=(sabun)=>{
		document.write("<h3>사원 상세</h3>")
		let sawon = sawons.find(sa=>sa.sabun===sabun)
		document.write("사번:"+sawon.sabun+"<p>")
		document.write("이름:"+sawon.name+"<p>")
		document.write("부서:"+sawon.dept+"<p>")
		document.write("직위:"+sawon.job+"<p>")
		document.write("연봉:"+sawon.pay+"<p>")
		document.write("근무지:"+sawon.loc+"<p>")
	}
	
	const sawonDelete=(sabun)=>{
		const result=sawons.filter(sa=>sa.sabun!==sabun)
		document.write("<h3>사원 삭제</h3>")
		document.write("<ul>")
		result.map((sa)=>{
			document.write("<li>"+sa.name+"</li>")
		})
		document.write("</ul>")
	}
	
	window.onload=()=>{
		sawonList()
		//sawonInsert()
		//sawonList()
		sawonDetail(2) 
		sawonDelete(6)
	}
</script>
</head>
<body>

</body>
</html>