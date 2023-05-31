package com.portfolio.mall.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	// 파일 저장
		public static final String FILE_UPLOAD_PATH = "D:\\java web develop\\portfolio\\upload\\product";
//		public static final String FILE_UPLOAD_PATH = "/home/ec2-user/portfolioMall/upload/images";
	
		// 파일을 저장하고, 클라언트에서 접근가능한 주소를 만들어서 리턴하는 기능
		public static String saveFile(int sellerId, MultipartFile file) {
			
			
			// 사용자별로 폴더를 구분한다
			// 사용자별로 폴더를 새로 만든다
			// 폴더이름: userId_현재시간
			// 폴더이름 중 현재시간을 UNIX TIME으로 한다. (UNIX TIME: 1970년 1월 1일부터 흐른 시간(millisecond 1/1000))
			// D:\\java web develop\\portfolio\\upload\\product\\2_142485314\\abcd.jpg
			
			String directoryName = "/" + sellerId + "_" + System.currentTimeMillis() + "/";
			
			// 디렉토리 생성
			String directoryPath = FILE_UPLOAD_PATH + directoryName;
			File directory = new File(directoryPath);
			if(directory.mkdir() == false) {
				// 디렉토리 생성 실패
				return null;
			}
			
			// 파일 저장
			try {
				byte[] bytes = file.getBytes();
				
				String filePath = directoryPath + file.getOriginalFilename();
				Path path = Paths.get(filePath);
				Files.write(path, bytes);
				
			} catch (IOException e) {
				
				e.printStackTrace();
				
				return null;
			}
			
			// 클라이언트에 접근 가능한 경로를 문자열로 리턴
			// http://localhost:8080/product/~
			return "/product" + directoryName + file.getOriginalFilename();
		}
}
