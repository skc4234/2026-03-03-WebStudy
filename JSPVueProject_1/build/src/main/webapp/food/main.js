let food=Vue.createApp({
		data(){
			return {
				curPage:1,
				totalPage:0,
				endPage:0,
				startPage:0,
				food_list:[], // ArrayList
				isShow:false,
				food_detail:{} // VO
			}
		},
		mounted(){
			this.dataRecv()
		},
		methods:{
			dataRecv() {
				axios.get('../food/list_vue.do',{
					params:{ // ? 뒤에 값 => 데이터 전송
						page:this.curPage
					}
				}).then(response=>{
					// 결과값 받기 => response에 채워서 갖고온다
					console.log(response.data)
					this.endPage=response.data.endPage
					this.totalPage=response.data.totalPage
					this.startPage=response.data.startPage
					this.curPage=response.data.curPage
					this.food_list=response.data.food_list
				})
			},
			// 숫자 증가 => 배열에 저장
			range(start,end) {
				let arr=[]
				let len=end-start
				for(let i=0; i<=len; i++) {
					arr[i]=start
					start++;
				}
				return arr;
			},
			move(page) {
				this.curPage=page
				this.dataRecv()
			},
			detail(no) {
				this.isShow=true
				axios.get('../food/detail_vue.do',{
					params:{
						no:no
					}
				}).then(response=>{
					console.log(response.data)
					this.food_detail=response.data
				})
			}
		},
		components: {
			page_card:page_card,
			food_detail:food_detail
		}
	}).mount('.container-fluid')