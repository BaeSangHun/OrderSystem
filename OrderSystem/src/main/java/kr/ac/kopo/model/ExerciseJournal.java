package kr.ac.kopo.model;

import java.util.List;

public class ExerciseJournal {

	// 타이틀 번호
	private int ExerciseCode;
	// 입력한 날짜 달력에 뿌려주기 위해 start로 이름 지정 Exercise_date
	private String start;
	private String id;
	private String title;
	private int userWeight;
	private String ExerciseName;
	private int avgLb;
	private int sumReps;
	private int doneSet;
	private int oneRm;
	


	List<ExerciseContents> details;	
	

	



	public int getOneRm() {
		return oneRm;
	}


	public void setOneRm(int oneRm) {
		this.oneRm = oneRm;
	}


	public int getSumReps() {
		return sumReps;
	}


	public void setSumReps(int sumReps) {
		this.sumReps = sumReps;
	}


	public int getDoneSet() {
		return doneSet;
	}


	public void setDoneSet(int doneSet) {
		this.doneSet = doneSet;
	}
	
	public int getAvgLb() {
		return avgLb;
	}


	public void setAvgLb(int avgLb) {
		this.avgLb = avgLb;
	}

	
	public int getUserWeight() {
		return userWeight;
	}


	public void setUserWeight(int userWeight) {
		this.userWeight = userWeight;
	}


	public List<ExerciseContents> getDetails() {
		return details;
	}


	public void setDetails(List<ExerciseContents> details) {
		this.details = details;
	}
	
	


	public int getExerciseCode() {
		return ExerciseCode;
	}


	public void setExerciseCode(int exerciseCode) {
		ExerciseCode = exerciseCode;
	}


	public String getExerciseName() {
		return ExerciseName;
	}


	public void setExerciseName(String exerciseName) {
		ExerciseName = exerciseName;
	}


	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}



}
