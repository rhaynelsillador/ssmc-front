package net.ssmc.utils;

import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;

import org.apache.commons.io.FilenameUtils;
import org.omg.CORBA.portable.ApplicationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import net.ssmc.enums.Status;

public class FileUploadUtility {
	
	@Autowired
	private Properties properties;
	
	
	public Map<String, Object> fileUpload(MultipartFile multipartFile){
		File file = new File(multipartFile.getOriginalFilename());
		Map<String, Object> map = new HashMap<>();
		String fileName = multipartFile.getOriginalFilename();
		String fileNameComplete = properties.getUploadServer()+properties.getUpload()+fileName;

		System.out.println(fileName);
		try {
			FileCopyUtils.copy(multipartFile.getBytes(), new File(properties.getUploadDir()+fileNameComplete));
			map.put("uploaded", 1);
			map.put("fileName", fileName);
			map.put("url", "/"+fileNameComplete);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public List<String> fileUploads(MultipartFile[] multipartFiles){
		
		System.out.println(multipartFiles);
		
		List<String> map = new ArrayList<>();
		for (MultipartFile multipartFile : multipartFiles) {
			
			System.out.println(multipartFile);
			
			String fileName = properties.getUploadServer()+properties.getUpload()+getSaltString()+"."+FilenameUtils.getExtension(multipartFile.getOriginalFilename());
			try {
				
//				scale(multipartFile.getBytes(), 100, 120);
				
				FileCopyUtils.copy(multipartFile.getBytes(), new File(properties.getUploadDir()+fileName));
				map.add(fileName);
			} catch (IOException e) {
				map.add(Status.ERRORUPLOAD.toString());
			}
		}
		return map;
	}
	
	protected String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 32) {
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
	
	public byte[] scale(byte[] fileData, int width, int height) throws ApplicationException {
        ByteArrayInputStream in = new ByteArrayInputStream(fileData);
        try {
            BufferedImage img = ImageIO.read(in);
            if(height == 0) {
                height = (width * img.getHeight())/ img.getWidth(); 
            }
            if(width == 0) {
                width = (height * img.getWidth())/ img.getHeight();
            }
            Image scaledImage = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
            BufferedImage imageBuff = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            imageBuff.getGraphics().drawImage(scaledImage, 0, 0, new Color(0,0,0), null);

            ByteArrayOutputStream buffer = new ByteArrayOutputStream();

            ImageIO.write(imageBuff, "jpg", buffer);

            return buffer.toByteArray();
        } catch (IOException e) {
            throw new ApplicationException("IOException in scale", null);
        }
    }	
}
