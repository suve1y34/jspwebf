package com.koreait.matzip;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CommonUtils {
	public static HttpSession getSession(HttpServletRequest req) {
		return req.getSession();
	}
}
