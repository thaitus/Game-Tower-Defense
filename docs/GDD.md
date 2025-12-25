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

