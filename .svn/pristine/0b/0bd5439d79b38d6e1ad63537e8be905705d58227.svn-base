package com.csgame.common.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.csgame.common.config.Global;
import com.csgame.common.utils.StringUtils;

@Controller
@RequestMapping(value="/resource/upload")
public class UploadImageController {

	/**
	 * 上传图片
	 * 
	 * @param file
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/images")
	public Map<String, Object> images(MultipartFile upfile, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> params = new HashMap<String, Object>();
		try {
//			String basePath = Global.getConfig("jeetc.uploading.url");
//			String visitUrl = Global.getConfig("jeetc.visit.url");
			// 文件保存目录路径
			String basePath = request.getSession().getServletContext().getRealPath("/")+"upload/";
			// 文件保存目录URL
			String path = request.getContextPath();
			String visitUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"upload/";; 
//			if (basePath == null || "".equals(basePath)) {
//				basePath = "c:/jeetc/static"; // 与properties文件中lyz.uploading.url相同，未读取到文件数据时为basePath赋默认值
//			}
//			if (visitUrl == null || "".equals(visitUrl)) {
//				visitUrl = "/upload/"; // 与properties文件中lyz.visit.url相同，未读取到文件数据时为visitUrl赋默认值
//			}
			String ext = StringUtils.getExt(upfile.getOriginalFilename());
			String fileName = String.valueOf(System.currentTimeMillis()).concat("_").concat(getRandom(6))
					.concat(".").concat(ext);
			StringBuilder sb = new StringBuilder();
			// 拼接保存路径
			sb.append(basePath).append("/").append(fileName);
			visitUrl = visitUrl.concat(fileName);
			File f = new File(sb.toString());
			if (!f.exists()) {
				f.getParentFile().mkdirs();
			}
			OutputStream out = new FileOutputStream(f);
			FileCopyUtils.copy(upfile.getInputStream(), out);
			params.put("state", "SUCCESS");
			params.put("url", visitUrl);
			params.put("size", upfile.getSize());
			params.put("original", fileName);
			params.put("type", upfile.getContentType());
		} catch (Exception e) {
			params.put("state", "ERROR");
		}
		return params;
	}
	
	/** 
     * 获取指定位数的随机数 
     * @param num 
     * @return 
     */  
    public static String getRandom(int num){  
        Random random = new Random();  
        StringBuilder sb = new StringBuilder();  
        for(int i = 0;i < num; i++){  
            sb.append(String.valueOf(random.nextInt(10)));  
        }  
        return sb.toString();  
    }  
}