package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ReviewBoardDao;
import kr.ac.kopo.model.ReviewBoard;
import kr.ac.kopo.util.FileVO;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {

	@Autowired
	ReviewBoardDao dao;
	
	@Override
	public List<ReviewBoard> list() {
		return dao.list();
	}

	@Override
	public void add(ReviewBoard item) {
		dao.add(item);
	}

	@Override
	public void incRef(long reviewId) {
		dao.incRef(reviewId);
	}

	@Override
	public void views(int reviewId) {
		dao.views(reviewId);
	}

	@Override
	public ReviewBoard view(int reviewId) {
		return dao.view(reviewId);
	}

	@Override
	public ReviewBoard item(int reviewId) {
		return dao.item(reviewId);
	}

	@Override
	public void update(ReviewBoard item) {
		dao.update(item);
	}

}
