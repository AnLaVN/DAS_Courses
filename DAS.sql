USE MASTER
DROP DATABASE  IF EXISTS DASJ5SQL
CREATE DATABASE DASJ5SQL
USE DASJ5SQL


CREATE TABLE ADMIN(
	USERNAME VARCHAR(64) NOT NULL PRIMARY KEY,
	MATKHAU VARCHAR(64),
	TEN NVARCHAR(128),
	EMAIL VARCHAR(256) UNIQUE
);
CREATE TABLE SINHVIEN(
	USERNAME VARCHAR(64) NOT NULL PRIMARY KEY,
	MATKHAU VARCHAR(64),
	TEN NVARCHAR(128),
	AVATAR VARCHAR(256),
	EMAIL VARCHAR(256) UNIQUE
);
CREATE TABLE PHANLOAI(
	IDPL VARCHAR(10) PRIMARY KEY,
	TENPL NVARCHAR(128),
);
CREATE TABLE KHOAHOC(
	IDKH VARCHAR(20) NOT NULL PRIMARY KEY,
	TENKHOAHOC NVARCHAR(128),
	MOTA NVARCHAR(2048),
	MOTANGAN NVARCHAR(1024),
	ANHMOTA VARCHAR(256),
	IDPL VARCHAR(10),
	FOREIGN KEY (IDPL) REFERENCES PHANLOAI(IDPL)
);

CREATE TABLE KHOAHOC_SINHVIEN(
	USERNAME VARCHAR(64) NOT NULL,
	IDKH VARCHAR(20) NOT NULL,
	PRIMARY KEY(USERNAME,IDKH),
	FOREIGN KEY (USERNAME) REFERENCES SINHVIEN(USERNAME),
	FOREIGN KEY (IDKH) REFERENCES KHOAHOC(IDKH)
);

CREATE TABLE DIEM(
	USERNAME VARCHAR(64),
	IDKH VARCHAR(20),
	DIEM FLOAT,
	PRIMARY KEY (USERNAME,IDKH),
	FOREIGN KEY (USERNAME) REFERENCES SINHVIEN(USERNAME),
	FOREIGN KEY (IDKH) REFERENCES KHOAHOC(IDKH)
);

CREATE TABLE DANHGIA(
	USERNAME VARCHAR(64),
	IDKH VARCHAR(20),
	BINHLUAN NVARCHAR(512),
	SAO FLOAT,
	PRIMARY KEY (USERNAME,IDKH),
	FOREIGN KEY (USERNAME) REFERENCES SINHVIEN(USERNAME),
	FOREIGN KEY (IDKH) REFERENCES KHOAHOC(IDKH)
);

CREATE TABLE TAINGUYEN(
	IDTN VARCHAR(10) PRIMARY KEY NOT NULL,
	TENTAINGUYEN NVARCHAR(128),
	IDYOUTUBE VARCHAR(11),
	MOTA NVARCHAR(1024),
	IDKH VARCHAR(20),
	FOREIGN KEY (IDKH) REFERENCES KHOAHOC(IDKH)
);

CREATE TABLE CAUHOI(
	IDCH VARCHAR(10) PRIMARY KEY NOT NULL,
	CAUHOI NVARCHAR(512),
	DAPANA NVARCHAR(256),
	DAPANB NVARCHAR(256),
	DAPANC NVARCHAR(256),
	DAPAND NVARCHAR(256),
	DAPANDUNG VARCHAR(1),
	IDKH VARCHAR(20),
	FOREIGN KEY (IDKH) REFERENCES KHOAHOC(IDKH)
);

INSERT INTO SINHVIEN VALUES
	('13ef04f726b3d0e682efdaa96590812fa8a2b7fd4b63d587644443714bc27049','ee3736b04a9127286a69fb06aaaeea2c9fb719063811cba48eaab7e056be9396',N'LÊ THÀNH ĐẠT','https://inkythuatso.com/uploads/thumbnails/800/2022/03/anh-da-dien-fb-hai-32-29-13-54-49.jpg','dtruog51@gmail.com'),  --LETHANHDAT2510|25101025
	('ea6505a1103f71ca44504fdb5ff1479a4038b9fbc86f3befefdbf321ba50847e','3f8ea555d298590ca88337fbfcc1c00d6dbd48e019c4de2c93ab254706632f5c',N'EM LÀ SỸ NÈ','https://inkythuatso.com/uploads/thumbnails/800/2022/03/anh-da-dien-fb-hai-32-29-13-54-49.jpg','trantiensyhihihi@gmail.com'),  --TRANTIENSYHIHIHI|123456
	('26cc6328d284548980f3eca3b3c9a1b3751a134ba4f7311e188391f610ea34b8','3f8ea555d298590ca88337fbfcc1c00d6dbd48e019c4de2c93ab254706632f5c',N'LA ĐẶNG BÌNH GOLD','https://inkythuatso.com/uploads/thumbnails/800/2022/03/anh-da-dien-fb-hai-32-29-13-54-49.jpg','binhyen@gmail.com')  --ANLA|123456

INSERT INTO PHANLOAI VALUES
	('FE','FRONT END'),
	('BE','BACK END'),
	('DB','DATABASE'),
	('GIT','PROJECT MANAGEMENT'),
	('DA','DATA ANALYTICS')

INSERT INTO KHOAHOC VALUES
	('KHFE001',N'HỌC FRONT END CẤP TỐC'
	,N'Khóa học Front End là cơ hội tuyệt vời để bạn nắm vững kiến thức và kỹ năng cần thiết để trở thành một nhà phát triển web chuyên nghiệp. 
	Trải qua khóa học này, bạn sẽ được hướng dẫn từ những khái niệm cơ bản như HTML, CSS cho đến các công nghệ và framework tiên tiến như JavaScript, React và Angular. 
	Ngoài HTML và CSS, khóa học cũng sẽ giới thiệu cho bạn về JavaScript, một ngôn ngữ lập trình mạnh mẽ trong việc tạo ra những trang web động. 
	Bạn sẽ học cách thực hiện các tác vụ tương tác như hiển thị thông báo, kiểm tra đầu vào từ người dùng, thay đổi nội dung trang web một cách động và nhiều hơn nữa.
	Khóa học Front End sẽ cung cấp cho bạn kiến thức và kỹ năng cần thiết để trở thành một lập trình viên Front End đáng chú ý. 
	Bạn sẽ có thể làm việc trong các công ty phát triển web, công ty thiết kế giao diện hoặc thậm chí tự mình xây dựng và phát triển những trang web độc đáo của riêng mình.'
	,N'Khóa học Front End sẽ cung cấp cho bạn kiến thức và kỹ năng cần thiết để trở thành một lập trình viên Front End đáng chú ý.
	Bạn sẽ có thể làm việc trong các công ty phát triển web, công ty thiết kế giao diện hoặc thậm chí tự mình xây dựng và phát triển những trang web độc đáo của riêng mình.'
	,'https://cybersoft.edu.vn/wp-content/uploads/2022/08/chudeFE3.png','FE'),
	('KHFE002',N'BOOTSTRAP VÀ REPONSIVE DESGIN'
	,N'Khóa học Bootstrap và Responsive dạy cách sử dụng Bootstrap để xây dựng giao diện web linh hoạt và tương thích trên nhiều thiết bị. 
	Người học tìm hiểu về cấu trúc, lớp và thành phần của Bootstrap để tạo giao diện chuyên nghiệp. 
	Khóa học cung cấp hướng dẫn chi tiết về tạo menu, thanh điều hướng, biểu đồ và các phần tử tương tác. Ngoài ra, người học học cách tùy chỉnh giao diện bằng CSS và kết hợp Bootstrap với JavaScript. 
	Khóa học cũng giới thiệu về responsive design và cách làm cho giao diện tự thích ứng trên các thiết bị khác nhau.'
	,N'Khóa học Bootstrap và Responsive dạy cách sử dụng Bootstrap để xây dựng giao diện web linh hoạt và tương thích trên nhiều thiết bị. 
	Khóa học cung cấp hướng dẫn chi tiết về tạo menu, thanh điều hướng, biểu đồ và các phần tử tương tác. Ngoài ra, người học học cách tùy chỉnh giao diện bằng CSS và kết hợp Bootstrap với JavaScript. 
	Khóa học cũng giới thiệu về responsive design và cách làm cho giao diện tự thích ứng trên các thiết bị khác nhau.'
	,'https://cybersoft.edu.vn/wp-content/uploads/2022/08/chudeFE12.svg','FE'),

	('KHBE001',N'HỌC BACK END SIÊU KHÓ VỚI JAVA'
	,N'Khóa học Back End cũng là một khóa học quan trọng và bổ ích cho những người muốn trở thành nhà phát triển web đằng sau màn hình.
	Trong khóa học này, bạn sẽ tìm hiểu về các ngôn ngữ và công nghệ được sử dụng để xây dựng phần server-side của một trang web. 
	Ngoài ra, khóa học Back End cũng sẽ giới thiệu cho bạn các khái niệm quan trọng như quản lý phiên, bảo mật dữ liệu, quản lý tài nguyên, và tối ưu hóa hiệu suất.
	Bạn sẽ học cách xây dựng và triển khai ứng dụng web đáng tin cậy, an toàn và có khả năng mở rộng. 
	Sau khi hoàn thành khóa học Back End, bạn sẽ có kiến thức và kỹ năng để làm việc với các công ty phát triển phần mềm, công ty dịch vụ web, hoặc thậm chí xây dựng ứng dụng web riêng của mình. 
	Bạn sẽ có khả năng thiết kế và xây dựng phần Back End mạnh mẽ và linh hoạt, tạo ra những trang web đáp ứng được yêu cầu phức tạp và tương tác với cơ sở dữ liệu và các dịch vụ bên ngoài.'
	,N'Khóa học Back End là một khóa học quan trọng cho những người muốn trở thành nhà phát triển web chuyên nghiệp. 
	Trong khóa học này, bạn sẽ học về các ngôn ngữ và công nghệ Back End như PHP hoặc JavaScript để xây dựng phần server-side của trang web.'
	,'https://cybersoft.edu.vn/wp-content/uploads/2022/08/chudeFE5.svg','BE'),

	('KHDB001',N'LƯU TRỮ DỮ LIỆU VỚI CƠ SỞ DỮ LIỆU SQL SERVER'
	,N'Khóa học về cơ sở dữ liệu (Database) là một phần quan trọng trong việc trở thành một nhà phát triển hoặc quản trị cơ sở dữ liệu chuyên nghiệp.
	Trong khóa học này, bạn sẽ học về các khái niệm và công nghệ liên quan đến việc thiết kế, quản lý và truy vấn cơ sở dữ liệu.
	Đầu tiên, bạn sẽ được giới thiệu với các loại cơ sở dữ liệu phổ biến như quan hệ, đối tượng, NoSQL và đặc điểm của chúng. 
	Bạn sẽ học cách thiết kế mô hình dữ liệu, xác định các quan hệ giữa các bảng và tạo ra các quy tắc phụ thuộc để đảm bảo tính nhất quán và hiệu quả của cơ sở dữ liệu. 
	Đầu tiên, bạn sẽ được giới thiệu với các loại cơ sở dữ liệu phổ biến như quan hệ, đối tượng, NoSQL và đặc điểm của chúng. Bạn sẽ học cách thiết kế mô hình dữ liệu, 
	xác định các quan hệ giữa các bảng và tạo ra các quy tắc phụ thuộc để đảm bảo tính nhất quán và hiệu quả của cơ sở dữ liệu.
	Khóa học về cơ sở dữ liệu sẽ trang bị bạn với kiến thức và kỹ năng để làm việc với các hệ quản trị cơ sở dữ liệu như MySQL, Oracle, SQL Server hoặc MongoDB. 
	Bạn sẽ có khả năng thiết kế, quản lý và truy vấn cơ sở dữ liệu một cách hiệu quả, đáp ứng các yêu cầu phức tạp từ các ứng dụng web và hệ thống thông tin.'
	,N'Khóa học về cơ sở dữ liệu là một phần quan trọng trong việc trở thành một nhà phát triển hoặc quản trị cơ sở dữ liệu chuyên nghiệp.
	Trong khóa học này, bạn sẽ học về việc thiết kế, quản lý và truy vấn cơ sở dữ liệu. 
	Bạn sẽ tìm hiểu về các loại cơ sở dữ liệu, như quan hệ và NoSQL, và học cách thiết kế mô hình dữ liệu nhất quán. Bạn sẽ cũng được hướng dẫn về ngôn ngữ truy vấn cơ sở dữ liệu như SQL và công cụ để tối ưu hiệu suất và bảo mật.'
	,'https://cybersoft.edu.vn/wp-content/uploads/2022/06/dev_illustration.png','DB'),

	('KHGIT001',N'LƯU TRỮ VÀ QUẢN LÍ DỰ ÁN'
	,N'Khóa học Quản lý dự án bằng Git cung cấp kiến thức và kỹ năng để quản lý dự án phát triển phần mềm hiệu quả. 
	Người học sẽ tìm hiểu về cách sử dụng Git để theo dõi và kiểm soát phiên bản của dự án, bao gồm các lệnh cơ bản và khái niệm quan trọng như nhánh, kho chứa và xung đột. 
	Khóa học giúp người học trở thành người quản lý dự án có khả năng sử dụng Git hiệu quả, tăng cường sự hiệu quả và sắp xếp công việc trong dự án.
	Khóa học Mô hình Agile giới thiệu về quy trình phát triển phần mềm linh hoạt và nhạy bén với biến đổi. Người học sẽ nắm được các nguyên tắc và phương pháp Agile, tập trung vào con người, tương tác và hợp tác. 
	Khóa học hướng dẫn áp dụng Agile vào dự án phát triển, giúp người học làm việc hiệu quả trong môi trường biến đổi.'
	,N'Khóa học Quản lý dự án bằng Git dạy cách sử dụng Git để quản lý phiên bản dự án phát triển phần mềm. 
	Người học tìm hiểu về các lệnh cơ bản, nhánh và xử lý xung đột. 
	Khóa học Agile giới thiệu mô hình linh hoạt và tập trung vào con người, tương tác và hợp tác trong quy trình phát triển.'
	,'https://cybersoft.edu.vn/wp-content/uploads/2022/08/chudeFE7.png','GIT'),

	('KHDA001',N'TRÍ TUỆ NHÂN TẠO AI'
	,N'Khóa học Trí tuệ nhân tạo (AI) là một khóa học chuyên sâu về lĩnh vực Trí tuệ nhân tạo, nghiên cứu về khả năng của máy tính và hệ thống tự động học và thực hiện các nhiệm vụ mà trước đây chỉ có con người có thể thực hiện.
	Trong khóa học này, người học sẽ tìm hiểu về các khái niệm cơ bản của Trí tuệ nhân tạo như học máy, mạng nơ-ron nhân tạo, xử lý ngôn ngữ tự nhiên và thị giác máy tính. 
	Khóa học cung cấp kiến thức về các thuật toán và phương pháp trong Trí tuệ nhân tạo, bao gồm học có giám sát, học không giám sát và học tăng cường.
	Người học sẽ được hướng dẫn thực hành sử dụng các công cụ và thư viện phổ biến như TensorFlow và scikit-learn để triển khai các mô hình Trí tuệ nhân tạo trong thực tế.'
	,N'Khóa học Trí tuệ nhân tạo (AI) cung cấp kiến thức và kỹ năng về lĩnh vực AI, bao gồm học máy, mạng nơ-ron và xử lý ngôn ngữ tự nhiên. 
	Người học sẽ thực hành với TensorFlow và scikit-learn, triển khai các mô hình AI. Khóa học giới thiệu ứng dụng AI trong xử lý ngôn ngữ, nhận dạng hình ảnh và tự động lái xe. 
	Người học có thể trở thành chuyên gia AI và đóng góp vào sự phát triển của lĩnh vực này.'
	,'https://cdn.pixabay.com/photo/2018/09/18/11/19/artificial-intelligence-3685928_1280.png','DA'),
	('KHDA002',N'MACHINE LEARNING'
	,N'Machine Learning (ML) là một lĩnh vực trong Trí tuệ nhân tạo (AI) mà máy tính được lập trình để tự học và cải thiện hiệu suất của nó dựa trên dữ liệu. 
	Thay vì được lập trình cụ thể, máy tính sử dụng các thuật toán và mô hình để tự động tìm ra mẫu và rút ra những dự đoán và quyết định từ dữ liệu.
	Machine Learning được chia thành ba loại chính: Học có giám sát (Supervised Learning), Học không giám sát (Unsupervised Learning) và Học tăng cường (Reinforcement Learning). 
	Trong Học có giám sát, mô hình được huấn luyện bằng cách cung cấp cho nó dữ liệu đầu vào và kết quả mong muốn tương ứng, để từ đó dự đoán và phân loại dữ liệu mới. 
	Học không giám sát không yêu cầu nhãn dữ liệu, mà tập trung vào việc phát hiện cấu trúc và mẫu trong dữ liệu. 
	Học tăng cường liên quan đến việc máy tính tương tác với một môi trường động và học từ những phần thưởng hoặc hình phạt.'
	,N'Machine Learning (ML) là một phần của Trí tuệ nhân tạo (AI) cho phép máy tính tự học và cải thiện hiệu suất dựa trên dữ liệu. 
	Có ba loại chính: Học có giám sát, Học không giám sát và Học tăng cường. ML được áp dụng rộng rãi trong xử lý ngôn ngữ, nhận dạng hình ảnh, dự báo tài chính và nhiều lĩnh vực khác. 
	Nó mang lại sự thông minh và hiệu suất cao trong việc đưa ra quyết định và giải quyết các vấn đề thực tế.'
	,'https://cybersoft.edu.vn/wp-content/uploads/2022/06/team_illustration.png','DA')

INSERT INTO KHOAHOC_SINHVIEN VALUES
('13ef04f726b3d0e682efdaa96590812fa8a2b7fd4b63d587644443714bc27049','KHFE001')

INSERT INTO TAINGUYEN VALUES
	('TNFE01',N'Lộ Trình Học Lập Trình Front-End Từ Căn Bản Đến Nâng Cao | BÀI 1','DyXab2jrXhc',N'GIỚI THIỆU CHƯƠNG TRÌNH HỌC','KHFE001'),
	('TNFE02',N'Tổng quan về thiết kế web và các bước xây dựng | BÀI 2','d07_8oNW9gg',N'TỔNG QUAN VỀ WEB VÀ INTERNET','KHFE001'),

	('TNBE01',N'Lập trình java web học java web backend lập trình web | BÀI 1','X5nt9_11Ozg',N'GIỚI THIỆU MỤC TIÊU VÀ ĐỀ CƯƠNG','KHBE001'),
	('TNBE02',N'Học lập trình java web jsp servlet jdbc mysql cơ bản | BÀI 2','2DDisxS2Mdg',N'GIỚI THIỆU JAVA SERVLET VÀ JDBC','KHBE001'),
	('TNBE03',N'Cài đặt eclipse 2018 mysql 8 jdk 8 maven 3.6 tomcat 8.5 | BÀI 3','dJ386tghZRI',N'CÀI ĐẶT IDE, MÔI TRƯỜNG VÀ SERVER','KHBE001'),
	('TNBE04',N'Tạo project jsp servlet theo mô hình MVC | BÀI 5','43TVwPxgndE',N'HƯỚNG DẪN TẠO PROJECT VỚI MÔ HÌNH MVC','KHBE001'),

	('TNDB01',N'Giới thiệu SQL và SQL server | BÀI 1','2fanjSYVElY',N'TÌM HIỂU VỀ SQL','KHDB001'),
	('TNDB02',N'Tạo database | BÀI 2','XUIm5VQlpJM',N'SỬ DỤNG MS SQL ĐỂ TẠO DB','KHDB001'),
	('TNDB03',N'Tạo bảng | BÀI 3','TrLKdQH_Qng',N'TẠO BẢNG VỚI CÂU LỆNH SQL','KHDB001'),
	('TNDB04',N'Kiểu dữ liệu trong SQL | BÀI 4','_40bzGOHloo',N'TÌM HIỂU VỀ KIỂU DỮ LIỆU SQL','KHDB001'),

	('TNDA01',N'Tổng quan Trí tuệ nhân tạo AI','9t1IsxTeyHQ',N'TÌM HIỂU VỀ AI','KHDA001'),
	('TNDA02',N'Python cơ bản cho AI | BÀI 1','MpppDoAWDdA',N'KHÁI NIỆM CƠ BẢN - MÔI TRƯỜNG CÀI ĐẶT','KHDA001'),
	('TNDA03',N'Python cơ bản cho AI | BÀI 2','muS8I4Unnyc',N'KHÁI NIỆM CƠ BẢN','KHDA001'),
	('TNDA04',N'Python cơ bản cho AI | BÀI 3','Usr6ikXu-M4',N'KHÁI NIỆM CƠ BẢN','KHDA001'),
	('TNDA05',N'Tìm kiếm lời giải [BFS, DFS] | BÀI 4','ZQozkaatPEg',N'KHÔNG GIAN TRẠNG THÁI','KHDA001'),
	('TNDA06',N'Thuật toán Uniform cost search | BÀI 5','11xhp8Ec3zE',N'THUẬT TOÁN TÌM KIẾM','KHDA001')


INSERT INTO CAUHOI VALUES
	('FEB01',N'Có bao nhiêu loại doctype trong html?','1','3','5','2','B','KHFE001'),
	('FEB02',N'CSS được sử dụng để làm gì trong phát triển Front End?',N'Định dạng và tạo kiểu cho giao diện web',N'Xử lý các yêu cầu từ phía người dùng',N'Xử lý các yêu cầu từ phía người dùng',N'Tạo các chức năng logic phía server','A','KHFE001'),
	('FEB03',N'HTML là viết tắt của thuật ngữ gì trong lĩnh vực phát triển web?',N'HyperText Markup Language',N'HyperTool Markup Language',N'HyperLink Markup Language',N'HighText Markup Language','A','KHFE001'),
	('FEB04',N'Để tạo một đường viền xung quanh một phần tử HTML, ta sử dụng thuộc tính nào trong CSS?','background-color','background-color','font-size','margin','B','KHFE001'),
	('FEB05',N'Để chọn phần tử đầu tiên trong danh sách các phần tử HTML, ta sử dụng selector nào trong CSS?','first-child','last-child','nth-child','only-child','A','KHFE001'),
	('FEB06',N'Để tạo hiệu ứng chuyển động cho phần tử HTML trong CSS, ta sử dụng thuộc tính nào?','transform','transition ','animation','opacity','B','KHFE001'),
	('FEB07',N'Để chọn tất cả các phần tử có cùng class trong CSS, ta sử dụng selector nào?','#',',','.',':','C','KHFE001'),
	('FEB08',N'Để thêm một hình ảnh vào trang web, ta sử dụng thẻ HTML nào?','<div>','<img>','<span>','<p>','B','KHFE001'),
	('FEB09',N'Để thêm một màu nền cho một phần tử trong CSS, ta sử dụng thuộc tính nào?','text-color','background-color','background-color','color','B','KHFE001'),
	('FEB010',N'Để thay đổi kiểu chữ cho một phần tử trong CSS, ta sử dụng thuộc tính nào?','font-style','font-style','font-family','font-size','D','KHFE001'),

	('BEB01',N'Servlet là gì trong lĩnh vực phát triển Back End?',N'Servlet là gì trong lĩnh vực phát triển Back End?',N'Là một loại cơ sở dữ liệu',N'Là một thành phần của Java để xử lý yêu cầu và phản hồi trên phía máy chủ',N'Là một công nghệ để tạo giao diện người dùng động','C','KHBE001'),
	('BEB02',N'Servlet được viết bằng ngôn ngữ lập trình nào?',N'Java',N'Python',N'PHP',N'C++',N'A','KHBE001'),
	('BEB03',N'Servlet được sử dụng để thực hiện những tác vụ gì trong phát triển Back End?',N'Tạo và quản lý cơ sở dữ liệu',N'Xử lý yêu cầu từ phía người dùng và tạo phản hồi từ phía máy chủ',N'Xử lý yêu cầu từ phía người dùng và tạo phản hồi từ phía máy chủ',N'Xử lý yêu cầu từ phía người dùng và tạo phản hồi từ phía máy chủ','B','KHBE001')

INSERT INTO DANHGIA VALUES
	('13ef04f726b3d0e682efdaa96590812fa8a2b7fd4b63d587644443714bc27049','KHDA001',N'Em đã học hết khóa và cảm thấy mình giống một kỹ sư AI thực thụ 😎😎😎😎😎','1'),
	('ea6505a1103f71ca44504fdb5ff1479a4038b9fbc86f3befefdbf321ba50847e','KHDA001',N'Qúa tuyệt zời, woderfulllll 🤞🤞','5'),
	('26cc6328d284548980f3eca3b3c9a1b3751a134ba4f7311e188391f610ea34b8','KHDA001',N'Em bị người yêu phản bội, em buồn quá 😭😭😭😭','3'),

	('13ef04f726b3d0e682efdaa96590812fa8a2b7fd4b63d587644443714bc27049','KHFE001',N'Em đã học hết khóa và cảm thấy mình giống một kỹ sư AI thực thụ 😎😎😎😎😎','1'),
	('ea6505a1103f71ca44504fdb5ff1479a4038b9fbc86f3befefdbf321ba50847e','KHFE001',N'Qúa tuyệt zời, woderfulllll 🤞🤞','5'),
	('26cc6328d284548980f3eca3b3c9a1b3751a134ba4f7311e188391f610ea34b8','KHFE001',N'Em bị người yêu phản bội, em buồn quá 😭😭😭😭','3'),

	('13ef04f726b3d0e682efdaa96590812fa8a2b7fd4b63d587644443714bc27049','KHBE001',N'Em đã học hết khóa và cảm thấy mình giống một kỹ sư AI thực thụ 😎😎😎😎😎','1'),
	('ea6505a1103f71ca44504fdb5ff1479a4038b9fbc86f3befefdbf321ba50847e','KHBE001',N'Qúa tuyệt zời, woderfulllll 🤞🤞','5'),
	('26cc6328d284548980f3eca3b3c9a1b3751a134ba4f7311e188391f610ea34b8','KHBE001',N'Em bị người yêu phản bội, em buồn quá 😭😭😭😭','3')

-- TRẢ VỀ TRUE KHI SINH VIÊN ĐÃ ENROLL ÍT NHẤT 1 KHÓA HỌC
IF OBJECT_ID('FN_FIND_SV_KH') IS NOT NULL
    DROP FUNCTION FN_FIND_SV_KH
GO

CREATE FUNCTION FN_FIND_SV_KH (@USERNAME VARCHAR(64), @IDKH VARCHAR(20))
RETURNS BIT
AS
BEGIN
    DECLARE @RESULT BIT

    IF EXISTS (SELECT 1 FROM KHOAHOC_SINHVIEN WHERE USERNAME = @USERNAME AND IDKH = @IDKH)
        SET @RESULT = 1
    ELSE
        SET @RESULT = 0

    RETURN @RESULT
END


