package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.Question;
import kr.ac.kopo.model.QuestionComment;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.util.SearchVO;

public interface QuestionDao {

	List<Question> list(SearchVO searchVO);

	void add(Question question);

	Question item(int questionId);

	void update(Question item);

	void delete(int questionId);

	int total(SearchVO searchVO);

	List<QuestionComment> commentList(int questionId);

	void commentAdd(QuestionComment qComment);

	void commentDel(int qcommentId);

	void commentUpdate(QuestionComment qComment);

	void views(int questionId);

	void selection(int qcommentId);

	void pointUp(String pointGetUser, int pointSet);

	int onlyOnceSelection(int questionId);

	int userpoint(String username);

	void pointLoseUser(String pointLoseUser, int pointSet);

	String trainerCheck(String pointGetUser);

	int mentiCount(String pointGetUser);

	void trainerTierLevelUpDown(String tier, String username);

	String tierCheck(String username);

	int userCommentCount(String username, int questionId);

	String questionWriter(int questionId);

	String commentWriter(int qcommentId);

	void pointDown(String username);
	

}
