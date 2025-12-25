# 🛡️ GAME VISION – Guardian Defense

---

## 🌌 Bối Cảnh Thế Giới
Năm 2136, những **Cổng Đỏ** bí ẩn xuất hiện trên khắp thế giới, phóng ra vô số sinh vật tàn bạo đe dọa sự tồn vong của nhân loại.

Niềm hy vọng cuối cùng nằm ở **Cây Thế Giới** – một siêu hệ thống AI khổng lồ, lưu trữ "dữ liệu và ký ức sức mạnh" của các thực thể huyền thoại, thần thoại và những chiến binh vĩ đại.

Người chơi là **Triệu Hồi Sư**, thành viên của tổ chức **Legacy Protocol** – tổ chức điều phối Summoner toàn cầu, có khả năng liên kết với Cây Thế Giới để triệu hồi các Guardian, xây dựng tuyến phòng thủ cuối cùng chống lại sự diệt vong.

---

## 🤖 JARVIS – Người Đồng Hành
Bạn không chiến đấu một mình.

**JARVIS** – hệ thống AI hỗ trợ:
- hướng dẫn người chơi
- cung cấp dữ liệu chiến thuật
- đồng hành trong cốt truyện
- thỉnh thoảng… hơi cà khịa để hành trình bớt căng thẳng

---

## 🎮 Trải Nghiệm Người Chơi
* Chiến lược & Tư duy:
    - Đặt thông minh: Vị trí Guardian là yếu tố quan trọng nhất, phải tối ưu hóa tầm bắn và sát thương lên kẻ địch.
    - Nâng cấp hợp lý: Chọn nâng cấp Guardian nào, khi nào nâng cấp để đối phó hiệu quả với từng loại kẻ thù và đợt tấn công.
    - Quản lý tiền tệ: Cân bằng giữa việc đặt Guardian mới và nâng cấp Guardian cũ để tối đa hóa nguồn lực.
* Thỏa mãn & Hài lòng:
    - Phối hợp hoàn hảo: Cảm giác tuyệt vời khi chứng kiến các Guardian cùng nhau phối hợp, tiêu diệt kẻ địch một cách hiệu quả.
    - Chinh phục thử thách: Vượt qua các màn chơi khó, đánh bại những kẻ thù mạnh mẽ mang lại sự thỏa mãn lớn.
* Thử thách & Căng thẳng:
    - Đợt tấn công dồn dập: Những đợt sóng kẻ thù mạnh mẽ, nhanh chóng tạo áp lực và đòi hỏi phản xạ nhanh.
    - Đối phó đa dạng: Học cách chống lại các loại kẻ thù khác nhau, mỗi loại có điểm mạnh, điểm yếu riêng.
* Tiến bộ & Cày cuốc:
    - Cày vàng/ XP: Kiếm tài nguyên (vàng, kinh nghiệm) để nâng cấp vĩnh viễn, giúp cho các màn chơi sau dễ dàng hơn.
    - Mở khóa/ Thử nghiệm: Khám phá các loại Guardian mới, nâng cấp khác nhau để tạo ra chiến thuật mới.
* Thư giãn & Giải trí:
    - Chơi để giải trí: Dù căng thẳng, Guardian Defense vẫn là một trò chơi mang tính giải trí cao, giúp thư giãn sau giờ làm việc. 

---

## 🎯 Định hướng cảm xúc người chơi:
- Giai đoạn đầu: tò mò - khám phá
- Giai đoạn giữa: căng thẳng - quản lý tài nguyên
- Giai đoạn sau: thỏa mãn - làm chủ chiến thuật


---

## 🧩 Điểm Khác Biệt
- Guardian mang tính cách & kỹ năng riêng
- Pixel art nhưng mang phong cách khoa học viễn tưởng (futuristic pixel art)
- Có Lore mạch lạc, không chỉ là game “đánh quái”
- Người chơi thỏa sức xây dựng đội hình tùy sở thích
- Liên tục cập nhật mùa, nội dung mới theo chủ đề

---

## 🏁 Win / Lose
- Win → Dọn sạch wave
- Lose → Quái lọt quá giới hạn


=============================================================================================================================


# 📜 GAME DESIGN DOCUMENT – Guardian Defense

---

## 1️⃣ Guardian (Hero)
- Dưới đây là danh sách Guardian dự kiến ở phiên bản đầu (MVP):

| Guardian     |    Hệ    |  Tộc/Hệ  |     Vai trò     |
|--------------|----------|----------|-----------------|
| Sobek        | Cát      | Ai Cập   | Main DPS        |
| Anubis       | Bóng Tối | Ai Cập   | Support         |
| Ra           | Ánh Sáng | Ai Cập   | DPS DOT         |
| Chu Tước     | Lửa      | Tứ Linh  | DPS, Support    |
| Huyền Vũ     | Lửa      | Tứ Linh  | Tanker, Control |
| Thanh Long   | Lửa      | Tứ Linh  | DPS, Skill      |
| Bạch Hổ      | Lửa      | Tứ Linh  | Main DPS        |
...

Mỗi Guardian có:
- Lượng sát thương gây ra
- Tầm đánh
- Tốc độ đánh 
- Kĩ năng đặc biệt

---

## 2️⃣ Enemy
- Enemy được chia thành nhiều nhóm nhằm tạo áp lực chiến thuật khác nhau cho người chơi:

|    Enemy    |            Đặc điểm            |
|-------------|--------------------------------|
| Normal      | Yếu, tốc độ bình thường        |
| Fast        | Yếu, chạy rất nhanh            |
| Fly         | Trung bình, biết bay           |
| Shield      | Trung bình, có khiên           |
| Duplicate   | Trung bình, chết sẽ phân thân  |
| Tank        | Trâu, đi chậm                  |
| Mini boss   | Trâu, cần có chiến thuật       |
| Boss        | Rất trâu, cần chiến thuật      |

---

## 3️⃣ Map
- Đường đi cố định
- Một số vị trí cho phép đặt Guardian
- Mục tiêu: bảo vệ base cuối đường

---

## 4️⃣ Gameplay Loop
1️⃣ Start game  
2️⃣ Enemy spawn theo wave  
3️⃣ Người chơi đặt Guardian  
4️⃣ Combat diễn ra  
5️⃣ Win nếu clear  
6️⃣ Lose nếu quái lọt vào quá số máu của base 

---

## 5️⃣ UI / UX
- Main Menu
- Play
- Pause
- Setting
- Database Guardian
- Victory Screen
- Defeat Screen
- Select Mode
- Select Level

---

## 6️⃣ Data
✔ Dự kiến sử dụng JSON để:
- lưu hero
- enemy
- stage

Giúp tách dữ liệu khỏi code.

---

## 7️⃣ Performance
- Ưu tiên mượt
- Hạn chế lag
- Logic rõ ràng

---

## 8️⃣ Roadmap
- [ ] Enemy movement
- [ ] Path system
- [ ] Guardian placement
- [ ] Combat
- [ ] UI polish

---

## 9️⃣ Balancing
- Các Guardian và Enemy sẽ được điều chỉnh thông số dần theo quá trình test
- Ưu tiên công bằng – không để hero nào “phá game”

