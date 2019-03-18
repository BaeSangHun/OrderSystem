package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.User;
import kr.ac.kopo.model.UserVO;

public interface UserService {

	List<User> list();

	void add(User item);

	User item(int id);

	void update(User item);

	void delete(int id);

	boolean login(User user);

	UserVO selectUser(String username);
}
