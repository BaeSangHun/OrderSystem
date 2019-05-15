package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.BEsave;
import kr.ac.kopo.model.ExerciseJournal;

public interface AnalysisService {

	List<ExerciseJournal> list(String id);

	List<ExerciseJournal> getWeight(String id);

	List<ExerciseJournal> getavgLb(String id);

	List<ExerciseJournal> todayList(String id);

	List<BEsave> getMetabolism(String id);

	List<ExerciseJournal> getOverallAvg(String id);




	



}
