package com.tjc.domain;

public class OrderVO {

	private Long ordernum;
    private String id;
    private Long partsnum; 
    /*quantity number not null, -- 주문 수량
    total_price number not null, -- 주문 총 가격
    recipient varchar2(50), -- 수령인
    phone varchar2(20), -- 전화번호
    adress varchar2(500), -- 주소
    request varchar2(1000), -- 요청사항
    payment varchar2(10), -- 결제방식, 현금 = 'CASH' OR 카드 = 'CARD'
    payment_status number, -- 결제유무, 결제했다 = 1, 안했다 = 0
    delivery_status number, -- 배송상태, 배송준비중 = 0 , 배송중 = 1
    reg date default sysdate --
	private String name; 
	*/
	
}

/*
 주문 insert 
 <selectKey keyProperty="name" order="BEFORE" resultType="string">
 	select name from parts where partsnum=#{partsnum}
 </selectKey>
 insert into orders(ordernum,..... delivery_status, name) values(orders_seq.nextval, #{}.... #{name})
 */