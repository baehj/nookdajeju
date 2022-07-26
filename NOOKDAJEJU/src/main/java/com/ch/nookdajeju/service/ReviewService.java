package com.ch.nookdajeju.service;

import java.util.List;

import com.ch.nookdajeju.model.Acm;
import com.ch.nookdajeju.model.Member;
import com.ch.nookdajeju.model.Review;

public interface ReviewService {
	
	int getmyRv(String memail);
	List<Review> list(Review review);
	int gettotalRv(int acmno);
	List<Review> rvlist(Review review);
	int delete(int rvno);
	float selectStar(int acmno);
	Review selectRvno(int rvno);
	int update(Review review);
	int insert(Review review);
	List<Review> hostRvList(int mno);
	Review select(int bookno2);
	List<Review> hostRvList_p(int mno);
}
