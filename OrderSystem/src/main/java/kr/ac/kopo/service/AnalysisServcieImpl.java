package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.AnalysisDao;
import kr.ac.kopo.model.ExerciseJournal;
@Service
public class AnalysisServcieImpl implements AnalysisService {

	@Autowired
	AnalysisDao dao;
	
	@Override
	public List<ExerciseJournal> list() {
		return dao.list();
	}

}
