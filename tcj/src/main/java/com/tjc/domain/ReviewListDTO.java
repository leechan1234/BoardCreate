package com.tjc.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewListDTO {

	private List<OrderVO> partsOrderList; // 부품 
	private List<CustomOrdersVO> finishedOrderList; // 완제품 
	private List<CustomOrdersVO> customeOrderList; // 주문제작 
	
}
