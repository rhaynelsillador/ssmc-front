package net.ssmc.utils;

import org.springframework.beans.factory.annotation.Value;

public class Properties {

//	UPLOAD("C:/Users/Rhaynel/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/upload/");
	@Value("${upload.dir}")
	private String uploadDir;
	@Value("${upload.server}")
	private String uploadServer;
	@Value("${upload.location}")
	private String upload;
	
	
	public String getUploadDir() {
		return uploadDir;
	}
	public void setUploadDir(String uploadDir) {
		this.uploadDir = uploadDir;
	}
	public String getUploadServer() {
		return uploadServer;
	}
	public void setUploadServer(String uploadServer) {
		this.uploadServer = uploadServer;
	}
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload = upload;
	}
	@Override
	public String toString() {
		return "Properties [uploadServer=" + uploadServer + ", upload=" + upload + "]";
	}
	
}
