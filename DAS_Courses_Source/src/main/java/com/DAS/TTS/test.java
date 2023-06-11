package com.DAS.TTS;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.cloudinary.json.JSONObject;

public class test {
	public static void main(String[] args) {
		 String inputText = "Khóa học Back End là một khóa học quan trọng cho những người muốn trở thành nhà phát triển web chuyên nghiệp. \r\n"
		 		+ "	Trong khóa học này, bạn sẽ học về các ngôn ngữ và công nghệ Back End như PHP hoặc JavaScript để xây dựng phần server-side của trang web.";

	        try {
	            // Thực hiện yêu cầu POST đến API MyMemory
	            URL url = new URL("https://api.mymemory.translated.net/get");
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);

	            // Xây dựng tham số dữ liệu
	            String data = "q=" + URLEncoder.encode(inputText, "UTF-8") +
	                    "&langpair=" + URLEncoder.encode("vi|ru", "UTF-8");

	            // Gửi dữ liệu đến server
	            OutputStream os = conn.getOutputStream();
	            os.write(data.getBytes());
	            os.flush();

	            // Đọc phản hồi từ server
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            StringBuilder response = new StringBuilder();
	            String line;
	            while ((line = br.readLine()) != null) {
	                response.append(line);
	            }

	            // Phân tích cú pháp JSON
	            JSONObject json = new JSONObject(response.toString());

	            // Truy cập vào trường "translatedText" và in ra kết quả dịch
	            String translatedText = json.getJSONObject("responseData").getString("translatedText");
	            System.out.println(translatedText);

	            // Đóng luồng
	            os.close();
	            br.close();
	            conn.disconnect();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	}
}
