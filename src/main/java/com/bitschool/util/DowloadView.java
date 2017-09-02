package com.bitschool.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

public class DowloadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> arg0, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {

		FileInputStream fis = null;
		OutputStream os = null;
		File file = (File)arg0.get("fileName"); 

		try {
			fis = new FileInputStream(file);
			os = resp.getOutputStream();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		System.out.println(file.getName());
		resp.setContentLength((int)file.length()); // response???뚯씪???ш린瑜??뚮젮以?
		
		String mimetype = req.getServletContext().getMimeType(file.getName());

		if(mimetype==null){
			mimetype="appliction/octet-stream";
		}
		System.out.println(mimetype);
		resp.setContentType(mimetype);
		resp.setCharacterEncoding("UTF-8");
		String fName = null;
		try {
			fName = URLEncoder.encode(file.getName(),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		fName = fName.replaceAll("\\+", "%20"); 
		String hearder = "Content-Disposition"; 
		String content = String.format("attachment; filename=\"%s\"",fName);
		resp.setHeader(hearder, content);
		byte[] buffer = new byte[512];
		int length = -1;
		try {
			while((length = fis.read(buffer)) != -1){ 
				os.write(buffer,0,length);
			}
			os.close();
			fis.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("download");
	}

}
