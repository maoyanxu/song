package com.cainiao.web.controller;
import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
@Controller
public class FileUploadController {
	@RequestMapping("/fileUpload1.do")
	public String handleFormUpload(@RequestParam("name") String name,
			@RequestParam("uploadfile") List<MultipartFile> uploadfile,
			HttpServletRequest request ,Model model) {
		if (!uploadfile.isEmpty() && uploadfile.size() > 0) {
			for (MultipartFile file : uploadfile) {
				String originalFilename = file.getOriginalFilename();
				String dirPath1 = 
                       request.getServletContext().getRealPath("/WEB-INF/work/");
				File filePath = new File(dirPath1);
				if (!filePath.exists()) {
					filePath.mkdirs();
				}
				
				 String type = file.getOriginalFilename().substring(
				  file.getOriginalFilename().indexOf("."));
				 
				 if (!type.toLowerCase().contains("doc") && !type.toLowerCase().contains("text")) {
					 return "error";
				 }else {
//					 String newFilename = System.currentTimeMillis()+type;
					 String newFilename = originalFilename;
					 name=newFilename.substring(0, newFilename.indexOf("."));
					 try {
						 file.transferTo(new File(dirPath1 + newFilename));
					 } catch (Exception e) {
						 e.printStackTrace();
						 return"error";
					 }
					 System.out.println(dirPath1);
					 System.out.println(newFilename);
					 
					 model.addAttribute("msg1", dirPath1);
					 model.addAttribute("msg2", name);
					 return "success";
					 
				}
				 
				//获取任务发布的时间
//				 System.out.println(type);
//	    		Date  date =new Date();
//	    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd  hh:mm:ss");
//	    		String date1 = sdf.format(date);
			}
			return "success";
		}else{
			return"error";
		}
	}
	

	
	@RequestMapping("/download")
	public ResponseEntity<byte[]> fileDownload(HttpServletRequest request,
	                                           String filename) throws Exception{
	    String path = request.getServletContext().getRealPath("/upload/");
	    File file = new File(path+File.separator+filename);
	    filename = this.getFilename(request, filename);
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentDispositionFormData("attachment", filename);
	    headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	   return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
	                                           headers,HttpStatus.OK);
	}
	public String getFilename(HttpServletRequest request,
	                                            String filename) throws Exception { 
	    String[] IEBrowserKeyWords = {"MSIE", "Trident", "Edge"};  
	    String userAgent = request.getHeader("User-Agent");  
	    for (String keyWord : IEBrowserKeyWords) { 
	         if (userAgent.contains(keyWord)) { 
	              return URLEncoder.encode(filename, "UTF-8");
	         }
	    }  
	    return new String(filename.getBytes("UTF-8"), "ISO-8859-1");  
	}  


}
