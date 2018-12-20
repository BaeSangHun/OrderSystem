package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.model.Bucket;
import kr.ac.kopo.service.CartService;

@Controller
public class CartController {

	private static final String encoding = "UTF-8";
	private static final String path = "/";

	@Autowired
	CartService cservice;

	@RequestMapping("/cartAdd")
	@ResponseBody
	List<Bucket> cartAdd(int code,Model model) {

		if (cservice.amountSelect(code) == 0) {

			cservice.bucketAdd(code);
		} else {
			cservice.amountUpdate(code);
		}
/*		List<Bucket> list = cservice.cartList();

		model.addAttribute("cart", list);
		*/
		return cartList();
	}

	@RequestMapping("/cartList")
	@ResponseBody
	List<Bucket> cartList() {
		List<Bucket> list = cservice.cartList();
		return list;
	}
	@RequestMapping("/cartDel")
	@ResponseBody
	void cartDel(int code) {
		cservice.cartDel(code);
	}

	/*
	 * @RequestMapping(value = "/cart", method = RequestMethod.POST)
	 * 
	 * @ResponseBody int cartAdd(String code, HttpServletRequest request,
	 * HttpServletResponse response) throws UnsupportedEncodingException {
	 * 
	 * Cookie[] cookiesAll = null; Cookie[] cookies = request.getCookies();
	 * 
	 * int cookieSize = cookies.length; if (cookies.length > 1) { for (int i = 1; i
	 * < cookies.length; i++) { if (cookies[i].getName().equals(code)) {
	 * System.out.println("중복되는이름 : " + cookies[i].getName() + "code값 : " + code);
	 * int cookiesAmout = Integer.parseInt(cookies[i].getValue()); //
	 * System.out.println(cookies[i].getValue()+"기존 값");
	 * 
	 * int val = cookiesAmout + 1; String cookiesVal = Integer.toString(val);
	 * cookies[i].setValue(cookiesVal); //
	 * System.out.println(cookies[i].getValue()+"변경된 값"); cookies[i].setPath(path);
	 * cookies[i].setMaxAge(60 * 60 * 24 * 1); response.addCookie(cookies[i]);
	 * cookiesAll = request.getCookies(); break;
	 * 
	 * } else {// 자바에서 넘겨줄때 오류난듯 자스로 쿠키 얻어오니까 매우 잘됨;;
	 * System.out.println("이름이 없을 경우 네임값 : " + cookies[i].getName() + "CODE 값 : " +
	 * code); String amount = "1"; Cookie cookie = new Cookie(code,
	 * URLEncoder.encode(amount, encoding)); cookie.setPath(path);
	 * cookie.setMaxAge(60 * 60 * 24 * 1);
	 * 
	 * response.addCookie(cookie); cookiesAll = request.getCookies(); }
	 * 
	 * }
	 * 
	 * } else { System.out.println("쿠키가 없을 경우"); String amount = "1"; Cookie cookie
	 * = new Cookie(code, URLEncoder.encode(amount, encoding));
	 * cookie.setPath(path); cookie.setMaxAge(60 * 60 * 24 * 1);
	 * response.addCookie(cookie); cookiesAll = request.getCookies(); }
	 * 
	 * return cookieSize;// 요녀석이 잘못됐었나봄 }
	 */
/*
	@RequestMapping("/cartDel")
	void cartDel(HttpServletRequest request, HttpServletResponse response) {

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {

			for (int i = 0; i < cookies.length; i++) {
				cookies[i].setPath(path);
				cookies[i].setMaxAge(0); // 유효시간을 0으로 설정

				response.addCookie(cookies[i]); // 응답 헤더에 추가

			}

		}
	}
*/
	
}
