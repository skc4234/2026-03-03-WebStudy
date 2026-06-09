/**
 * 
 */
let list=[]
window.onload=()=>{
	// 서버와 통신 => ajax:라이브러리, fetch:내장객체, axios:라이브러리
	// 소스 노출이 안됨 => 보안성이 높다
	axios.get('music.do')
		.then(response=>{
			console.log(response.data)
			list=response.data
			let html=''
			let s=''
			list.forEach((m)=>{
				if(m.state==="상승") s='<font color="red">▲ '+m.idcrement+'</font>'
				else if(m.state=="하강") s='<font color="blue">▼ '+m.idcrement+'</font>'
				else s='-'
				html+=
					'<tr>'+
					'<td class="text-center">'+m.no+'</td>'+
					'<td class="text-center">'+s+'</td>'+
					'<td class="text-center"><img src="'+m.poster+'" width=30 height=30></td>'+
					'<td>'+m.title+'</td>'+
					'<td>'+m.singer+'</td>'+
					'</tr>'
			})
			let tbody=document.querySelector('#user_table tbody')
			tbody.innerHTML=html
	})
	
	// 객체 모델을 사용
	let tr=document.querySelector('#user_table thead tr:first-child')
	tr.style.backgroundColor="green"
	
	// 검색
	let key=document.querySelector('#keyword') // $('#keyword')
	key.addEventListener('keyup',function(){ // $( )
		const keyword=this.value.trim()
		//console.log(keyword)
		const rows=document.querySelectorAll('#user_table > tbody > tr')
		/* for(let i=0; i<rows.length; i++) {
			rows[i].style.display='none'
		}
		
		const find=document.querySelectorAll('#user_table > tbody > tr > td:nth-child(5n+3):contains("'+key+'")')
		console.log(find.length)
		for(let i=0; i<find.length; i++) {
			find[i].style.display=''
		} */
		rows.forEach((row)=>{                      // index(3) => 곡명
			const title=row.querySelector('td:nth-child(4)').textContent
			//console.log(title)
			if(title.includes(keyword)) {
				//console.log(title)
				row.style.display=''
			}
			else row.style.display='none'
		})
	})
}