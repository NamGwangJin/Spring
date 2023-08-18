$(document)
.ready(function(){
    menuPrice='', menu='', price='', qty='';
    total=0, salesSum=0, totalPrice=0, sales=0;
    getList();
    getSales();
})
.on('click','#btnAddMenu',function(){
    while(true){
        menu = prompt("메뉴명을 입력하시오. (취소:종료)");
        if (menu=="" || menu==null) break;
		price = prompt(menu+"의 가격을 입력하시오 (원)");
		$.ajax({url: "/insert",
				   data: { name : menu,price : price },
				   type: 'post',
				   dataType : 'text',
				   success: function(data) {
				   	   alert('메뉴 추가 성공!');
				   }, 
				   error: function() {
					   alert('error!');
				   }
		})
    };
    getList();
})
.on('click','#btnDelete',function(){
	if( $('#number').val() == '' ) {
		alert('삭제할 메뉴를 선택해주세요.')
		return false;
	}
	$.ajax({ url:'/delete', data: { num : $('#number').val() }, type:'post', dataType:'text',
			success: function(data){
				if(data == "1"){
					alert('메뉴 삭제 완료');
					getList();
				}
			},
			error: function(){
				alert('delete error!!');
			}
	})
})
.on('click','#btnUpdate',function(){
	if( $('#number').val() == '' ) {
		alert('변경할 메뉴를 선택해주세요.')
		return false;
	}
	let newName = prompt($('#selMenu').val() + "를 변경합니다. 변경할 메뉴명을 입력해주세요.");
	let newPrice = prompt(newName + "의 가격을 입력해주세요.");
	$.ajax({ url:'/update', data: { num : $('#number').val(), name : newName, price : newPrice }, type:'post', dataType:'text',
			success: function(data){
				if(data == "1"){
					alert('메뉴 수정 완료');
					getList();
				}
			},
			error: function(){
				alert('update error!!');
			}
	})
})
.on('click','#orderOk',function(){
    if ($('#sumPrice').val()=='') {
        alert ("선택한 메뉴가 없습니다.")
        return false;
    }
    date = new Date();
    now = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+date.getHours()+":"+date.getMinutes();
    salesSum += totalPrice;
    $.ajax({ url: '/insertSales', 
    			data: { mobile : $('#mobile').val(), total : $('#sumPrice').val(), created : now },
				type: 'post',
				dataType: 'json',
				success: function(data) {
					if(data == "1") {
						alert('주문이 성공적으로 완료되었습니다.')
						getSales();
					}
				},
				error: function(){
					alert("insert Sales Error!!")
				}
	})
    $('#order').html('');
    $('#mobile, #sumPrice').val('');
    totalPrice=0;
})

.on('click','#menu',function(){
    menuPrice = $('#menu').val().split(" ");
    $('#selMenu').val(menuPrice[1]);
    $('#selPrice').val(parseInt(menuPrice[2]));
    $('#qty').val(1);
    $('#number').val(menuPrice[0]);
    console.log($('#number').val());
})
.on('click','#delete',function(){
    $('#order').html('');
    $('#mobile, #sumPrice').val('');
    totalPrice=0;
})
.on('click','#search',function(){
    if ($('#mobile').val().length < 13) {
        alert('모바일 번호를 확인해주세요.');
        return false;
    }
    alert('확인 되었습니다.');
    return;
})
.on('change','#qty',function(){
    qty = $(this).val();
    price = parseInt(menuPrice[2]);
    total = qty*price;
    $('#selPrice').val(total);
})
.on('click','#cancle',function(){
    $('#selMenu, #qty, #selPrice').val('');
})
.on('click','#cart',function(){
    if ($('#selMenu').val()=='' || $('#qty').val()==NaN || $('#selPrice').val()==NaN) {
        alert('메뉴가 선택되지 않았습니다.')
        return false;
    } 
    let buying = '<option selected>'+$('#selMenu').val()+" "+$('#qty').val()+"개"+" "+$('#selPrice').val()+'원</option>';
    totalPrice += parseInt($('#selPrice').val());
    $('#order').append(buying);
    $('#sumPrice').val(totalPrice);
    $('#cancle').trigger('click');
})

function getList() {
	$('#menu').html('');
	$('#selMenu').val('');
	$('#qty').val('');
	$('#selPrice').val('');
	$.ajax({ url: '/getList', data: {}, type:'post', dataType:'json',
				success: function(data) {
					for(let i=0; i<data.length; i++){
						let obj = data[i];
						let str =  "<option>"+obj['num']+" "+obj['name']+" "+obj['price']+"원"+"</option>";
						$('#menu').append(str);
					}
				},
				error: function(){
					alert('getList error!');
				}
	})
}
function getSales() {
	$('#sales').html('');
	$.ajax({ url: '/getSales', data: {}, type: 'post', dataType:'json',
			success: function(data) {
				for(let i=0; i<data.length; i++){
					let obj = data[i];
					if (obj['mobile'] == "") obj['mobile'] = '비회원';
					sales += obj['total'];
					let str =  "<option>"+obj['mobile']+" "+obj['total']+"원 "+obj['created']+"</option>";
					$('#sales').append(str);
				}
				$('#sumSales').val(sales);
				sales = 0;
			},
			error: function(){
				alert("getSales Error!")
			}
	})
}
;