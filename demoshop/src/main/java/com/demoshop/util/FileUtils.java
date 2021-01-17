package com.demoshop.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.demoshop.dto.ProductImageDTO;

@Component
public class FileUtils implements ServletContextAware {

	private static ServletContext context;

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.context = servletContext;

	}

	public static String rename(String fileName) {
		String nameFile = "";
		if (!fileName.isEmpty()) {
			String[] arrImg = fileName.split("\\.");
			String duoiFileImg = arrImg[arrImg.length - 1];
			
			for (int i = 0; i < (arrImg.length - 1); i++) {
				if (i == 0) {
					nameFile = arrImg[i];
				} else {
					nameFile += "-" + arrImg[i];
				}
			}
			nameFile = nameFile + "-" + System.nanoTime() + "." + duoiFileImg;
		}
		return nameFile;
	}
	
	public static List<ProductImageDTO> addFile(List<MultipartFile> files, Long id) {
		List<ProductImageDTO> imageList = new ArrayList<ProductImageDTO>();
		if (null != files && files.size() > 0) {
			for (MultipartFile multipartFile : files) {
				ProductImageDTO productImageDTO = new ProductImageDTO();
				String fileName = rename(multipartFile.getOriginalFilename());
				if(fileName!="") {
					productImageDTO.setName(fileName);
					productImageDTO.setProductId(id);
					imageList.add(productImageDTO);

					String dirFile = context.getRealPath("uploads");
					System.out.println(dirFile);
					File fileDir = new File(dirFile);
					if (!fileDir.exists()) {
						fileDir.mkdirs();
						System.out.println("đã tạo thư mục mới");
					}

					try {
						File imageFile = new File(fileDir + File.separator + fileName);
						multipartFile.transferTo(imageFile);

					} catch (IOException e) {
						e.printStackTrace();
					}
				}
		
			}
		}
		return imageList;
	}

	public static void deleteFile(String filename) {
		String filePart = context.getRealPath("uploads") + File.separator + filename;
		
		File file = new File(filePart);
		
		file.delete();
	}
}
