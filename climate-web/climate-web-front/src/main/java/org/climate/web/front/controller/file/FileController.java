package org.climate.web.front.controller.file;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;
import org.climate.core.model.file.Dir;
import org.climate.core.model.file.FileInfo;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class FileController {

	private static final String BUCKET_NAME = "climate-static-amazonaws";
	private static final String ACCESS_KEY = "AKIAIQXUOG3TTHFYLXPQ";
	private static final String SECRET_KEY = "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";
	
	@Value("${climate.s3Path://s3.us-east-2.amazonaws.com/climate-static-amazonaws}")
	private String context;
	
	private AmazonS3 amazonS3;
	
	//xml 파일을 json으로 변경 후 데이터 return
//	@RequestMapping("/file")
//	public @ResponseBody Map<String, Object> xml2json(HttpServletRequest  request, HttpServletResponse response) throws JSONException, IOException {
//		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
//		String line="";
//		StringBuffer str = new StringBuffer();
//		Map<String, Object> map = new HashedMap<>();
//	
//		Iterator<String> itr = multipartRequest.getFileNames();
//		MultipartFile mpf = null;
//		
//		while (itr.hasNext()) {
//			mpf = multipartRequest.getFile(itr.next());
//			try {
//				
//				//파일 받은 정보 json 변환 
//				InputStream is = mpf.getInputStream();
//				BufferedReader br = new BufferedReader(new InputStreamReader(is));
//				
//				while ((line = br.readLine()) != null) 
//				{
//					str.append(line);
//				}
//				JSONObject jsondata = XML.toJSONObject(str.toString());
//				
//				map.put("jsonData", jsondata.toString());
//				
//			} catch (IOException e) {
//				throw e;
//			}
//		}
//		return map;
//	}
	
	//S3 upload 포함
	@RequestMapping("/file")
	public @ResponseBody Map<String, Object> s3Upload(HttpServletRequest  request, HttpServletResponse response) throws JSONException, IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		
		Map<String, Object> map = new HashedMap<>();
		List<FileInfo> list = new ArrayList<>();
		
		Iterator<String> itr = multipartRequest.getFileNames();
		MultipartFile mpf = null;
		
		Dir dir = new Dir();
		String pathK = new SimpleDateFormat("yyyy/MM/dd", Locale.KOREA).format(new Date());
		dir.setPath(pathK);
		
		while (itr.hasNext()) {
			
			mpf = multipartRequest.getFile(itr.next());
			

			FileInfo fileInfo;

			fileInfo = new FileInfo();
			fileInfo.setName(mpf.getOriginalFilename());
			fileInfo.setPath(dir.getPath());
			fileInfo.setFileSize(mpf.getSize());
			fileInfo.setType(mpf.getContentType());
			fileInfo.setRealName(makeRealName(fileInfo.getName()));
			
			try {
				
				//S3 upload start
				String path = dir.getPath() + "/" + fileInfo.getRealName();
				
//				File convFile = new File(mpf.getOriginalFilename());
//				convFile.createNewFile(); 
//				FileOutputStream fos = new FileOutputStream(convFile); 
//				fos.write(mpf.getBytes());
//				fos.close();
				
				//local
				//FileCopyUtils.copy(mpf.getBytes(), new FileOutputStream(path));
				
				if(fileInfo.getType().contains("KML") || fileInfo.getType().contains("kml") || fileInfo.getType().contains("application/octet-stream")) {

					uploadFile(path, mpf.getInputStream());
					
					fileInfo.setPath("/" + fileInfo.getPath() + "/" + mpf.getOriginalFilename());
					fileInfo.setUrl("https:" + context + "/" + path);
					list.add(fileInfo);
				}
				//S3 upload end
				
			} catch (IOException e) {
				throw e;
			}
		}
		map.put("files", list);
		
		return map;
	}
	
	
	public void uploadFile(String path, InputStream inputStream) {
		AWSCredentials awsCredentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);
		amazonS3 = new AmazonS3Client(awsCredentials);
		if (amazonS3 != null) {
			try {
				PutObjectRequest putObjectRequest =
						new PutObjectRequest(BUCKET_NAME, path, inputStream, new ObjectMetadata());
//						new PutObjectRequest(BUCKET_NAME + "/" + path, file.getName(), file);
						
				if(putObjectRequest.getKey().endsWith("kml")) {
					ObjectMetadata metadata = new ObjectMetadata();
					metadata.setContentType("application/kml");
					putObjectRequest.setMetadata(metadata);
				}
						
				putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // file permission
				amazonS3.putObject(putObjectRequest); // upload file
 
			} catch (AmazonServiceException ase) {
				ase.printStackTrace();
			} finally {
				amazonS3 = null;
			}
		}
	}
	
	private String makeRealName(String name) {
		return UUID.randomUUID().toString().replaceAll("-", "") + name.substring(name.lastIndexOf('.'));
	}

}
