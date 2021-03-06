package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.model.Question;
import kr.ac.kopo.model.QuestionComment;
import kr.ac.kopo.model.UserVO;
import kr.ac.kopo.util.SearchVO;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public List<Question> list(SearchVO searchVO) {
		return sql.selectList("question.list", searchVO);
	}

	@Override
	public void add(Question question) {
		sql.insert("question.add", question);
	}

	@Override
	public Question item(int questionId) {
		return sql.selectOne("question.item", questionId);
	}

	@Override
	public void update(Question item) {
		sql.update("question.update", item);
	}

	@Override
	public void delete(int questionId) {
		sql.delete("question.delete", questionId);
	}

	@Override
	public int total(SearchVO searchVO) {
		return sql.selectOne("question.total", searchVO);
	}

	@Override
	public List<QuestionComment> commentList(int questionId) {
		return sql.selectList("question.commentList", questionId);
	}

	@Override
	public void commentAdd(QuestionComment qComment) {
		sql.insert("question.commentAdd",qComment);
	}

	@Override
	public void commentDel(int qcommentId) {
		sql.delete("question.commentDel", qcommentId);
	}

	@Override
	public void commentUpdate(QuestionComment qComment) {
		sql.update("question.commentUpdate", qComment);
	}

	@Override
	public void views(int questionId) {
		sql.update("question.views", questionId);
	}

	@Override
	public void selection(int qcommentId) {
		sql.update("question.selection",qcommentId);
	}

	@Override
	public void pointUp(String pointGetUser,int pointSet) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id",pointGetUser);
		map.put("pointSet", pointSet);
		sql.update("question.pointUp",map);
	}

	@Override
	public int onlyOnceSelection(int questionId) {
		return sql.selectOne("question.onlyOnceSelection",questionId);
	}

	@Override
	public int userpoint(String username) {
		return sql.selectOne("question.userpoint",username);
	}

	@Override
	public void pointLoseUser(String pointLoseUser, int pointSet) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id",pointLoseUser);
		map.put("pointSet", pointSet);
		sql.update("question.pointDown",map);
	}

	@Override
	public String trainerCheck(String username) {
		return sql.selectOne("question.trainerCheck",username);
	}

	@Override
	public int mentiCount(String username) {
		return sql.selectOne("trainer.mentiCount",username);
	}

	@Override
	public void trainerTierLevelUpDown(String tier, String username) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id",username);
		map.put("tier", tier);
		sql.update("question.tierLevelUpDown",map);
	}

	@Override
	public String tierCheck(String username) {
		return sql.selectOne("question.tierCheck",username);
	}

	@Override
	public int userCommentCount(String username, int questionId) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id",username);
		map.put("code", questionId);
		return sql.selectOne("question.userCommentCount",map);
	}

	@Override
	public String questionWriter(int questionId) {
		return sql.selectOne("question.questionWriter",questionId);
	}

	@Override
	public String commentWriter(int qcommentId) {
		return sql.selectOne("question.commentWritet",qcommentId);
	}

	@Override
	public void pointDown(String username) {
		sql.update("question.minusPoint",username);
	}

}
