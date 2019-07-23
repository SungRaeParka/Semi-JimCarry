package com.kh.jimcarry.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File oldFile) {
		long currentTime = System.currentTimeMillis(); //현재 시간



		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");

		//객체를 하나씩 랜덤으로 생성
		int randomNumber = (int)(Math.random() * 100000);

		//파일의 파일명과 확장자명 분리
		String name = oldFile.getName(); //문자열 형태로 가져옴
		String body = null; //파일의 이름
		String ext = null; //확장자이름 담는다

		//lastIndexOf 뒤에서 부터 읽는다
		int dot = name.lastIndexOf(".");

		if(dot != -1) {
			body = name.substring(0, dot);
			ext = name.substring(dot);
		}else {
			body = name;
			ext = "";

		}

		String fileName = ft.format(new Date(currentTime)) + randomNumber + ext;

		File newFile = new File(oldFile.getParent(), fileName);




		return newFile;
	}

}





















