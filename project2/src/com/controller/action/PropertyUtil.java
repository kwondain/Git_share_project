package com.controller.action;

import java.io.File;

import java.io.FileInputStream;

import java.io.FileNotFoundException;

import java.io.IOException;

import java.util.Properties;

public class PropertyUtil {

	private static PropertyUtil propertyUtil = new PropertyUtil();
	private static Properties propObj = null;
	private static File propFile = null;
	private static FileInputStream propStream = null;
	private static long propLastModified = 0L;

	/**
	 * 
	 * 작성자 : 정윤재
	 * 
	 * 파라미터 : property 파일 안에 정의 된 property 개별 항목의 이름
	 * 
	 * return type : value
	 * 
	 * 사용법 : 파라미터로 cms.password 이런식으로 질의함 (property 파일 안에는 cms.password=1234 이런식으로
	 * 정의 됨)
	 * 
	 */

	public static String getProperty(String propName) {
		long lastModified = propFile.lastModified();
		if (propLastModified < lastModified) {
			try {
				propLastModified = propFile.lastModified();
				propStream = new FileInputStream(propFile);
				propObj.load(propStream);
				propStream.close();
			} catch (FileNotFoundException fnfe) {
				fnfe.printStackTrace();
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		} // if

		return propObj.getProperty(propName);
	}// getProperty

	/**
	 * 
	 * 작성자 : 정윤재
	 * 
	 * 파라미터 : property file 의 절대 경로
	 * 
	 * return type : PropertyUtil
	 * 
	 * 사용법 : 싱글턴을 변형시켜서 만든 것이므로 객체 생성 할 때 new 로 만들지 말고 getInstance를 사용하여 만들어야 함
	 * 
	 */

	public static PropertyUtil getInstance(String propertyUrl) {
		if (propObj == null) {
			propObj = new Properties();
			try {
				propFile = new File(propertyUrl);
				propLastModified = propFile.lastModified();
				propStream = new FileInputStream(propFile);
				propObj.load(propStream);
				propStream.close();
			} catch (FileNotFoundException fnfe) {
				fnfe.printStackTrace();
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}
		return propertyUtil;

	}

}