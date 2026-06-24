-- Seed 200 câu hỏi mẫu (50 câu đầu, các phase sau sẽ bổ sung)
-- Tất cả câu hỏi được tạo bởi system (user_id = NULL tạm thời)

INSERT INTO quiz_cards (question, option_a, option_b, option_c, option_d, correct_ans, difficulty, category, language, explanation, status) VALUES
-- ===== KIẾN THỨC TỔNG HỢP =====
('Mặt Trời thuộc loại sao nào?', 'Sao lùn trắng', 'Sao lùn vàng', 'Sao khổng lồ đỏ', 'Sao neutron', 'B', 3, 'science', 'vi', 'Mặt Trời là sao lùn vàng (G-type main-sequence star).', 'approved'),
('Nước sôi ở nhiệt độ bao nhiêu độ C?', '90°C', '100°C', '110°C', '120°C', 'B', 1, 'science', 'vi', 'Nước sôi ở 100°C tại áp suất tiêu chuẩn 1 atm.', 'approved'),
('Trái Đất có bao nhiêu đại dương?', '3', '4', '5', '7', 'C', 2, 'geography', 'vi', 'Có 5 đại dương: Thái Bình Dương, Đại Tây Dương, Ấn Độ Dương, Nam Băng Dương, Bắc Băng Dương.', 'approved'),
('Thủ đô của Nhật Bản là gì?', 'Osaka', 'Tokyo', 'Kyoto', 'Nagoya', 'B', 1, 'geography', 'vi', 'Tokyo là thủ đô của Nhật Bản.', 'approved'),
('DNA là viết tắt của?', 'Deoxyribonucleic Acid', 'Dynamic Nuclear Acid', 'Dual Nucleotide Acid', 'Digital Nucleic Array', 'A', 3, 'science', 'vi', 'DNA = Deoxyribonucleic Acid, vật chất di truyền của sinh vật.', 'approved'),
('Đơn vị tiền tệ của EU là gì?', 'USD', 'GBP', 'EUR', 'CHF', 'C', 1, 'economics', 'vi', 'Euro (EUR) là tiền tệ chính thức của Liên minh châu Âu.', 'approved'),
('Ai đã phát minh ra bóng đèn sợi đốt?', 'Nikola Tesla', 'Thomas Edison', 'Alexander Bell', 'Albert Einstein', 'B', 2, 'history', 'vi', 'Thomas Edison được ghi nhận với bóng đèn sợi đốt thương mại năm 1879.', 'approved'),
('Kim tự tháp lớn nhất Ai Cập là của vị Pharaoh nào?', 'Khufu', 'Ramesses II', 'Tutankhamun', 'Cleopatra', 'A', 3, 'history', 'vi', 'Kim tự tháp Khufu (Cheops) là lớn nhất trong 7 kỳ quan thế giới cổ đại.', 'approved'),
('Tầng khí quyển gần Trái Đất nhất là?', 'Tầng đối lưu', 'Tầng bình lưu', 'Tầng trung lưu', 'Tầng nhiệt', 'A', 2, 'science', 'vi', 'Tầng đối lưu (troposphere) là tầng thấp nhất, nơi có thời tiết.', 'approved'),
('Cầu thủ nào đã ghi nhiều bàn nhất lịch sử World Cup?', 'Pelé', 'Miroslav Klose', 'Ronaldo', 'Lionel Messi', 'B', 3, 'sports', 'vi', 'Klose ghi 16 bàn, nhiều nhất lịch sử World Cup.', 'approved'),

-- ===== VĂN HÓA & GIẢI TRÍ =====
('Bộ phim nào đạt doanh thu cao nhất mọi thời đại (chưa điều chỉnh lạm phát)?', 'Avengers: Endgame', 'Avatar', 'Titanic', 'Star Wars: TFA', 'B', 2, 'entertainment', 'vi', 'Avatar (2009) giữ kỷ lục doanh thu ~2.9 tỷ USD.', 'approved'),
('Ban nhạc nào được gọi là "Fab Four"?', 'The Rolling Stones', 'The Beatles', 'Queen', 'Led Zeppelin', 'B', 2, 'entertainment', 'vi', 'The Beatles được gọi là "Fab Four" (Bộ tứ huyền thoại).', 'approved'),
('Màu sắc nào không có trong cầu vồng?', 'Đỏ', 'Hồng', 'Xanh', 'Vàng', 'B', 1, 'general', 'vi', 'Cầu vồng có 7 màu: đỏ, cam, vàng, lục, lam, chàm, tím.', 'approved'),
('Loại nhạc cụ nào có 88 phím?', 'Violin', 'Guitar', 'Piano', 'Sáo', 'C', 1, 'entertainment', 'vi', 'Piano tiêu chuẩn có 88 phím (52 trắng, 36 đen).', 'approved'),
('Ai vẽ bức Mona Lisa?', 'Michelangelo', 'Leonardo da Vinci', 'Raphael', 'Donatello', 'B', 2, 'art', 'vi', 'Leonardo da Vinci vẽ Mona Lisa đầu thế kỷ 16.', 'approved'),
('Trong phim Harry Potter, Gryffindor có biểu tượng con vật nào?', 'Rắn', 'Sư tử', 'Đại bàng', 'Lửng', 'B', 2, 'entertainment', 'vi', 'Gryffindor: sư tử; Slytherin: rắn; Ravenclaw: đại bàng; Hufflepuff: lửng.', 'approved'),
('Bộ phim hoạt hình đầu tiên của Disney là?', 'Snow White', 'Cinderella', 'Bambi', 'Pinocchio', 'A', 3, 'entertainment', 'vi', 'Snow White (1937) là phim hoạt hình dài đầu tiên của Disney.', 'approved'),
('Game nào bán chạy nhất mọi thời đại?', 'GTA V', 'Minecraft', 'Tetris', 'Wii Sports', 'B', 3, 'gaming', 'vi', 'Minecraft đã bán hơn 300 triệu bản, nhiều nhất lịch sử.', 'approved'),
('Tác giả của "Harry Potter" là ai?', 'J.R.R. Tolkien', 'J.K. Rowling', 'George R.R. Martin', 'Stephen King', 'B', 1, 'literature', 'vi', 'J.K. Rowling là tác giả bộ truyện Harry Potter.', 'approved'),
('Số lượng bài hát trong album "Thriller" của Michael Jackson?', '7', '9', '11', '13', 'B', 3, 'entertainment', 'vi', 'Thriller có 9 bài hát, là album bán chạy nhất mọi thời đại.', 'approved'),

-- ===== TOÁN & LOGIC =====
('Kết quả của 7 × 8?', '48', '56', '64', '72', 'B', 1, 'math', 'vi', '7 × 8 = 56.', 'approved'),
('Số nguyên tố nhỏ hơn 10?', '2', '1', '9', '4', 'A', 1, 'math', 'vi', '2 là số nguyên tố nhỏ nhất và cũng là số chẵn duy nhất.', 'approved'),
('Căn bậc hai của 144?', '10', '11', '12', '13', 'C', 1, 'math', 'vi', '√144 = 12.', 'approved'),
('Giá trị của Pi (π) xấp xỉ?', '2.14', '3.14', '4.14', '5.14', 'B', 1, 'math', 'vi', 'π ≈ 3.14159...', 'approved'),
('0! (giai thừa của 0) bằng?', '0', '1', 'Không xác định', 'Vô cùng', 'B', 3, 'math', 'vi', '0! = 1 theo định nghĩa toán học.', 'approved'),
('Số tiếp theo trong dãy: 2, 6, 18, 54, ?', '108', '162', '216', '270', 'B', 2, 'math', 'vi', 'Mỗi số nhân với 3: 54 × 3 = 162.', 'approved'),
('Hình nào có 6 mặt bằng nhau?', 'Hình trụ', 'Hình lập phương', 'Hình cầu', 'Hình chóp', 'B', 1, 'math', 'vi', 'Hình lập phương có 6 mặt là hình vuông bằng nhau.', 'approved'),
('Tổng các góc trong của một tam giác?', '90°', '180°', '270°', '360°', 'B', 1, 'math', 'vi', 'Tổng ba góc trong tam giác luôn bằng 180°.', 'approved'),
('Số La Mã "XLV" là bao nhiêu?', '35', '45', '55', '65', 'B', 3, 'math', 'vi', 'XL = 40, V = 5 → 45.', 'approved'),
('Logarit cơ số 10 của 1000?', '1', '2', '3', '4', 'C', 3, 'math', 'vi', 'log₁₀(1000) = 3 vì 10³ = 1000.', 'approved'),

-- ===== NGÔN NGỮ =====
('Từ nào là tính từ?', 'Chạy', 'Đẹp', 'Ăn', 'Ngủ', 'B', 1, 'language', 'vi', '"Đẹp" là tính từ chỉ đặc điểm.', 'approved'),
('Tiếng Anh: "Beautiful" có nghĩa là gì?', 'Xấu xí', 'Đẹp', 'Cao', 'Thấp', 'B', 1, 'language', 'vi', 'Beautiful = đẹp.', 'approved'),
('Từ trái nghĩa với "nóng" là?', 'Ấm', 'Lạnh', 'Mát', 'Nhiệt', 'B', 1, 'language', 'vi', 'Nóng ↔ Lạnh.', 'approved'),
('Bảng chữ cái tiếng Việt có bao nhiêu chữ?', '24', '26', '29', '32', 'C', 2, 'language', 'vi', 'Bảng chữ cái tiếng Việt có 29 chữ cái.', 'approved'),
('Tiếng Anh: từ nào là danh từ?', 'Quickly', 'Happiness', 'Run', 'Happy', 'B', 2, 'language', 'vi', '"Happiness" (hạnh phúc) là danh từ.', 'approved'),
('Ngôn ngữ được nói nhiều nhất thế giới?', 'Tiếng Anh', 'Tiếng Trung', 'Tiếng Tây Ban Nha', 'Tiếng Hindi', 'B', 2, 'language', 'vi', 'Tiếng Trung (Mandarin) có số người nói nhiều nhất.', 'approved'),
('Dấu câu nào dùng để kết thúc câu hỏi?', 'Dấu chấm', 'Dấu hỏi', 'Dấu chấm than', 'Dấu phẩy', 'B', 1, 'language', 'vi', 'Dấu hỏi (?) kết thúc câu hỏi.', 'approved'),
('Từ "bàn" trong "cái bàn" và "bàn bạc" là?', 'Từ đồng âm', 'Từ đồng nghĩa', 'Từ trái nghĩa', 'Từ ghép', 'A', 3, 'language', 'vi', '"Bàn" là từ đồng âm: nghĩa khác nhau, cách viết giống nhau.', 'approved'),
('Tiếng Anh: "I ___ a student." Điền từ?', 'is', 'am', 'are', 'be', 'B', 1, 'language', 'vi', 'Chủ ngữ "I" đi với "am".', 'approved'),
('Chữ cái thứ 10 của bảng chữ cái tiếng Việt?', 'I', 'K', 'H', 'J', 'B', 3, 'language', 'vi', 'a, ă, â, b, c, d, đ, e, ê, g → G là thứ 10.', 'approved'),

-- ===== CÔNG NGHỆ =====
('HTTP là viết tắt của?', 'HyperText Transfer Protocol', 'High Tech Transfer Process', 'HyperText Transmission Path', 'High Transfer Text Protocol', 'A', 2, 'technology', 'vi', 'HTTP = HyperText Transfer Protocol, giao thức truyền tải web.', 'approved'),
('Ngôn ngữ lập trình nào phổ biến nhất 2024?', 'Java', 'Python', 'JavaScript', 'C++', 'B', 2, 'technology', 'vi', 'Python dẫn đầu về độ phổ biến theo nhiều chỉ số.', 'approved'),
('RAM là viết tắt của?', 'Random Access Memory', 'Read Active Memory', 'Rapid Application Module', 'Random Algorithm Memory', 'A', 2, 'technology', 'vi', 'RAM = Random Access Memory, bộ nhớ truy cập ngẫu nhiên.', 'approved'),
('Công ty nào tạo ra iPhone?', 'Samsung', 'Apple', 'Google', 'Microsoft', 'B', 1, 'technology', 'vi', 'Apple Inc. tạo ra iPhone năm 2007.', 'approved'),
('SSD khác HDD ở điểm nào?', 'Chậm hơn', 'Không có bộ phận chuyển động', 'Nhỏ hơn', 'Rẻ hơn', 'B', 2, 'technology', 'vi', 'SSD dùng flash memory, không có đĩa quay như HDD.', 'approved'),
('Giao thức nào bảo mật cho website?', 'HTTP', 'HTTPS', 'FTP', 'SMTP', 'B', 1, 'technology', 'vi', 'HTTPS = HTTP + SSL/TLS, mã hóa dữ liệu truyền tải.', 'approved'),
('"Cloud" trong công nghệ là gì?', 'Máy chủ từ xa qua Internet', 'Mây thật', 'Phần mềm diệt virus', 'Mạng LAN', 'A', 2, 'technology', 'vi', 'Cloud computing là sử dụng tài nguyên máy chủ từ xa qua Internet.', 'approved'),
('Pixel là đơn vị đo gì?', 'Âm thanh', 'Độ phân giải màn hình', 'Tốc độ xử lý', 'Dung lượng pin', 'B', 1, 'technology', 'vi', 'Pixel là điểm ảnh, đơn vị cơ bản của độ phân giải màn hình.', 'approved'),
('Ký tự đặc biệt "@" có tên gọi là gì?', 'At sign', 'And sign', 'Hash', 'Star', 'A', 1, 'technology', 'vi', '"@" gọi là "at sign" hay "a còng" trong tiếng Việt.', 'approved'),
('AI là viết tắt của?', 'Artificial Intelligence', 'Automated Interface', 'Active Intelligence', 'Algorithmic Input', 'A', 1, 'technology', 'vi', 'AI = Artificial Intelligence (Trí tuệ nhân tạo).', 'approved'),

-- Tiếp tục 10 câu còn lại để đủ 50
('Quốc gia nào có diện tích lớn nhất thế giới?', 'Trung Quốc', 'Nga', 'Mỹ', 'Canada', 'B', 2, 'geography', 'vi', 'Nga là quốc gia rộng nhất thế giới với 17.1 triệu km².', 'approved'),
('Núi Everest cao bao nhiêu mét?', '8,448m', '8,848m', '9,248m', '8,648m', 'B', 2, 'geography', 'vi', 'Everest cao 8,848m so với mực nước biển.', 'approved'),
('Động vật nào nhanh nhất thế giới?', 'Báo đốm', 'Báo săn', 'Sư tử', 'Ngựa vằn', 'B', 2, 'science', 'vi', 'Báo săn (cheetah) đạt tốc độ tối đa ~120 km/h.', 'approved'),
('Hành tinh nào lớn nhất Hệ Mặt Trời?', 'Sao Thổ', 'Sao Mộc', 'Sao Hải Vương', 'Sao Thiên Vương', 'B', 1, 'science', 'vi', 'Sao Mộc (Jupiter) là hành tinh lớn nhất.', 'approved'),
('Vitamin nào được tổng hợp từ ánh nắng?', 'Vitamin A', 'Vitamin D', 'Vitamin C', 'Vitamin B', 'B', 2, 'science', 'vi', 'Vitamin D được tổng hợp khi da tiếp xúc với ánh nắng mặt trời.', 'approved'),
('Tác giả "Truyện Kiều" là ai?', 'Hồ Xuân Hương', 'Nguyễn Du', 'Nguyễn Trãi', 'Xuân Diệu', 'B', 2, 'literature', 'vi', 'Nguyễn Du là đại thi hào dân tộc, tác giả Truyện Kiều.', 'approved'),
('World Cup 2026 được tổ chức ở đâu?', 'Qatar', 'Mỹ/Mexico/Canada', 'Pháp', 'Nga', 'B', 3, 'sports', 'vi', 'World Cup 2026 được tổ chức ở 3 nước: Mỹ, Mexico, Canada.', 'approved'),
('Môn thể thao nào được gọi là "vua của các môn thể thao"?', 'Bóng rổ', 'Bóng đá', 'Tennis', 'Bóng chày', 'B', 1, 'sports', 'vi', 'Bóng đá (football) được gọi là vua của các môn thể thao.', 'approved'),
('Tết Nguyên Đán là lễ hội của nước nào?', 'Việt Nam', 'Trung Quốc', 'Hàn Quốc', 'Tất cả đều đúng', 'D', 2, 'culture', 'vi', 'Nhiều nước châu Á đón Tết Nguyên Đán với các tên gọi khác nhau.', 'approved'),
('Phở là món ăn đặc trưng của nước nào?', 'Thái Lan', 'Việt Nam', 'Lào', 'Campuchia', 'B', 1, 'culture', 'vi', 'Phở là món ăn truyền thống nổi tiếng của Việt Nam.', 'approved');
