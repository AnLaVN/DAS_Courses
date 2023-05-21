package com.DAS;

import com.AnLa.OpenAI.ChatGPT;
import com.AnLa.OpenAI.ChatGPT.Model;

public class OpenAISpring {

	public static void main(String[] args) {
		ChatGPT cpgt = new ChatGPT("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");
		String question = "Tóm tắt: \n"
				+ "1) Mọi người đều có quyền được học hành. Phải áp dụng chế độ giáo dục miễn phí, ít nhất là ở bậc tiểu học và giáo dục cơ sở. Giáo dục tiểu học là bắt buộc. Giáo dục kỹ thuật và ngành nghề phải mang tính phổ thông, và giáo dục cao học phải theo nguyên tắc công bằng cho bất cứ ai có đủ khả năng.\r\n"
				+ "2) Giáo dục phải hướng tới mục tiêu giúp con người phát triển đầy đủ nhân cách và thúc đẩy sự tôn trọng đối với các quyền và tự do cơ bản của con người. Giáo dục phải tăng cường sự hiểu biết, lòng vị tha và tình bằng hữu giữa tất cả các dân tộc, các nhóm tôn giáo và chủng tộc, cũng như phải đẩy mạnh các hoạt động của Liên Hợp Quốc vì mục đích gìn giữ hoà bình.\r\n"
				+ "3) Cha, mẹ có quyền ưu tiên lựa chọn loại hình giáo dục cho con cái.\r\n"
				+ "Điều 27:\r\n"
				+ "1) Mọi người đều có quyền tự do tham gia vào đời sống văn hoá của cộng đồng, được thưởng thức nghệ thuật và chia xẻ những thành tựu và lợi ích của tiến bộ khoa học.\r\n"
				+ "2) Mọi người đều có quyền được bảo hộ đối với những quyền lợi về vật chất và tinh thần xuất phát từ công trình khoa học, văn học và nhgệ thuật mà người đó là tác giả.";
		System.out.println(cpgt.Chat(question));

	}

}