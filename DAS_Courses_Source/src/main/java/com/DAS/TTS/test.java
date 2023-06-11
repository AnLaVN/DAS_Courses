package com.DAS.TTS;

import java.io.File;

import com.AnLa.HASH.SHA256;
import com.DAS.Tools.UpFileCloud;

public class test {
	private static final UpFileCloud UploadFile = null;

	public static void main(String[] args) {
		
		File file = new File("C:\\Users\\TIEN SY\\Pictures\\Screenshots\\Screenshot 2023-03-11 000340.png");
//		
//		
//	UpFileCloud.upCloudBinaryByFile(file);
		
	UpFileCloud.removeCloudBinaryByUrl("https://res.cloudinary.com/dqzsk2uls/image/upload/v1685810985/s90abocqdnfhoxodcifp.png");
	}
}
