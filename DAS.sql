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
	('13ef04f726b3d0e682efdaa96590812fa8a2b7fd4b63d587644443714bc27049','ee3736b04a9127286a69fb06aaaeea2c9fb719063811cba48eaab7e056be9396',N'LÊ THÀNH ĐẠT',NULL,'dtruog51@gmail.com');  --LETHANHDAT2510|25101025

INSERT INTO PHANLOAI VALUES
	('FE','FRONT END'),
	('BE','BACK END'),
	('DB','DATABASE')

INSERT INTO KHOAHOC VALUES
	('KHFE001','HỌC FRONT END CẤP TỐC'
	,N'Khóa học Front End là cơ hội tuyệt vời để bạn nắm vững kiến thức và kỹ năng cần thiết để trở thành một nhà phát triển web chuyên nghiệp. 
	Trải qua khóa học này, bạn sẽ được hướng dẫn từ những khái niệm cơ bản như HTML, CSS cho đến các công nghệ và framework tiên tiến như JavaScript, React và Angular. 
	Ngoài HTML và CSS, khóa học cũng sẽ giới thiệu cho bạn về JavaScript, một ngôn ngữ lập trình mạnh mẽ trong việc tạo ra những trang web động. 
	Bạn sẽ học cách thực hiện các tác vụ tương tác như hiển thị thông báo, kiểm tra đầu vào từ người dùng, thay đổi nội dung trang web một cách động và nhiều hơn nữa.
	Khóa học Front End sẽ cung cấp cho bạn kiến thức và kỹ năng cần thiết để trở thành một lập trình viên Front End đáng chú ý. 
	Bạn sẽ có thể làm việc trong các công ty phát triển web, công ty thiết kế giao diện hoặc thậm chí tự mình xây dựng và phát triển những trang web độc đáo của riêng mình.'
	,N'Khóa học Front End sẽ cung cấp cho bạn kiến thức và kỹ năng cần thiết để trở thành một lập trình viên Front End đáng chú ý.
	Bạn sẽ có thể làm việc trong các công ty phát triển web, công ty thiết kế giao diện hoặc thậm chí tự mình xây dựng và phát triển những trang web độc đáo của riêng mình.'
	,NULL,'FE'),
	('KHBE001','HỌC BACK END SIÊU KHÓ VỚI JAVA'
	,N'Khóa học Back End cũng là một khóa học quan trọng và bổ ích cho những người muốn trở thành nhà phát triển web đằng sau màn hình.
	Trong khóa học này, bạn sẽ tìm hiểu về các ngôn ngữ và công nghệ được sử dụng để xây dựng phần server-side của một trang web. 
	Ngoài ra, khóa học Back End cũng sẽ giới thiệu cho bạn các khái niệm quan trọng như quản lý phiên, bảo mật dữ liệu, quản lý tài nguyên, và tối ưu hóa hiệu suất.
	Bạn sẽ học cách xây dựng và triển khai ứng dụng web đáng tin cậy, an toàn và có khả năng mở rộng. 
	Sau khi hoàn thành khóa học Back End, bạn sẽ có kiến thức và kỹ năng để làm việc với các công ty phát triển phần mềm, công ty dịch vụ web, hoặc thậm chí xây dựng ứng dụng web riêng của mình. 
	Bạn sẽ có khả năng thiết kế và xây dựng phần Back End mạnh mẽ và linh hoạt, tạo ra những trang web đáp ứng được yêu cầu phức tạp và tương tác với cơ sở dữ liệu và các dịch vụ bên ngoài.'
	,N'Khóa học Back End là một khóa học quan trọng cho những người muốn trở thành nhà phát triển web chuyên nghiệp. Trong khóa học này, bạn sẽ học về các ngôn ngữ và công nghệ Back End như PHP, Python hoặc JavaScript để xây dựng phần server-side của trang web.
	Bạn sẽ hiểu cách xử lý yêu cầu từ người dùng, tương tác với cơ sở dữ liệu, và xây dựng các chức năng logic phía server. Khóa học cũng giới thiệu các khái niệm bảo mật dữ liệu, quản lý tài nguyên và tối ưu hiệu suất. Sau khi hoàn thành,
	bạn sẽ có kiến thức và kỹ năng để làm việc trong lĩnh vực Back End và xây dựng những ứng dụng web đáng tin cậy, an toàn và có khả năng mở rộng.'
	,NULL,'BE'),
	('KHDB001','LƯU TRỮ DỮ LIỆU VỚI CƠ SỞ DỮ LIỆU SQL SERVER'
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
	Bạn sẽ tìm hiểu về các loại cơ sở dữ liệu, như quan hệ và NoSQL, và học cách thiết kế mô hình dữ liệu nhất quán. Bạn sẽ cũng được hướng dẫn về ngôn ngữ truy vấn cơ sở dữ liệu như SQL và công cụ để tối ưu hiệu suất và bảo mật. 
	Sau khi hoàn thành khóa học, bạn sẽ có kiến thức và kỹ năng để làm việc với các hệ quản trị cơ sở dữ liệu và xử lý dữ liệu một cách hiệu quả và an toàn.'
	,NULL,'DB')

INSERT INTO TAINGUYEN VALUES
	('TNFE01',N'Lộ Trình Học Lập Trình Front-End Từ Căn Bản Đến Nâng Cao | BÀI 1','DyXab2jrXhc',N'GIỚI THIỆU CHƯƠNG TRÌNH HỌC','KHFE001'),
	('TNFE02',N'Tổng quan về thiết kế web và các bước xây dựng | BÀI 2','d07_8oNW9gg',N'TỔNG QUAN VỀ WEB VÀ INTERNET','KHFE001'),
	('TNBE01',N'Lập trình java web học java web backend lập trình web | BÀI 1','X5nt9_11Ozg',N'Giới thiệu mục tiêu và đề cương','KHBE001'),
	('TNBE02',N'Học lập trình java web jsp servlet jdbc mysql cơ bản | BÀI 2','2DDisxS2Mdg',N'GIỚI THIỆU JAVA SERVLET VÀ JDBC','KHBE001'),
	('TNDB01',N'Giới thiệu SQL và SQL server | BÀI 1','2fanjSYVElY',N'TÌM HIỂU VỀ SQL','KHDB001')

INSERT INTO CAUHOI VALUES
	('FEB01',N'Có bao nhiêu loại doctype trong html?','1','3','5','2','B','KHFE001'),
	('FEB02',N'CSS được sử dụng để làm gì trong phát triển Front End?',N'Định dạng và tạo kiểu cho giao diện web',N'Xử lý các yêu cầu từ phía người dùng',N'Xử lý các yêu cầu từ phía người dùng',N'Tạo các chức năng logic phía server','A','KHFE001'),
	('FEB03',N'HTML là viết tắt của thuật ngữ gì trong lĩnh vực phát triển web?',N'HyperText Markup Language',N'HyperTool Markup Language',N'HyperLink Markup Language',N'HighText Markup Language','A','KHFE001'),
	('BEB01',N'Servlet là gì trong lĩnh vực phát triển Back End?',N'Servlet là gì trong lĩnh vực phát triển Back End?',N'Là một loại cơ sở dữ liệu',N'Là một thành phần của Java để xử lý yêu cầu và phản hồi trên phía máy chủ',N'Là một công nghệ để tạo giao diện người dùng động','C','KHBE001'),
	('BEB02',N'Servlet được viết bằng ngôn ngữ lập trình nào?',N'Java',N'Python',N'PHP',N'C++',N'A','KHBE001'),
	('BEB03',N'Servlet được sử dụng để thực hiện những tác vụ gì trong phát triển Back End?',N'Tạo và quản lý cơ sở dữ liệu',N'Xử lý yêu cầu từ phía người dùng và tạo phản hồi từ phía máy chủ',N'Xử lý yêu cầu từ phía người dùng và tạo phản hồi từ phía máy chủ',N'Xử lý yêu cầu từ phía người dùng và tạo phản hồi từ phía máy chủ','B','KHBE001')