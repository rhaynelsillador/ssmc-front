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
	@Value("${upload.result}")
	private String result;
	@Value("${upload.allowed}")
	private String allowed;
	
	
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
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getAllowed() {
		return allowed;
	}
	public void setAllowed(String allowed) {
		this.allowed = allowed;
	}
	public String[] getAlloweds(){
		return allowed.split(",");
	}
	@Override
	public String toString() {
		return "Properties [uploadDir=" + uploadDir + ", uploadServer=" + uploadServer + ", upload=" + upload
				+ ", result=" + result + "]";
	}
	
}
