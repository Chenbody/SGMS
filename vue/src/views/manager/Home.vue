<template>
  <div>
    <div class="card" style="line-height: 30px">
      <div>Welcome back <span style="color: dodgerblue;">{{ user.name }}</span> , have a nice day!</div>
    </div>

    <div class="image-carousel">
        <div class="carousel-track">
          <div class="carousel-slide">
          <img src="@/assets/imgs/p1.jpg" alt="Image 1">
          <img src="@/assets/imgs/p2.jpg" alt="Image 2">
          <img src="@/assets/imgs/p3.jpg" alt="Image 3">
          <img src="@/assets/imgs/p4.jpg" alt="Image 4">
          <img src="@/assets/imgs/p5.jpg" alt="Image 5">
          <img src="@/assets/imgs/p6.jpg" alt="Image 6">
          <img src="@/assets/imgs/p7.jpg" alt="Image 7">
          <img src="@/assets/imgs/p8.jpg" alt="Image 8">
          <img src="@/assets/imgs/p9.jpg" alt="Image 9">
    </div>
        </div>
    </div>
    <div class="main-content">
    <!-- 重要通知 -->
    <div class="section">
      <h3>通知</h3>
      <ul class="notification-list">
      <li v-for="(notice, index) in notifications" :key="index" class="notification-item">
        <!-- 左侧内容：置顶标志与通知标题 -->
        <div class="left-content">
          <span v-if="notice.isPinned" class="top-tag">【置顶】</span>
          <span class="notice-title">{{ notice.title }}</span>
        </div>
        <!-- 右侧内容：标志与日期 -->
        <div class="right-content">
          <span class="new-tag" v-if="notice.isNew">NEW</span>
          <span class="notice-date">{{ notice.date }}</span>
        </div>
      </li>
    </ul>
    </div>

    <!-- 快捷选课 -->
    <div class="section">
      <h3>消息</h3>
      <ul class="message-list">
      <li v-for="(message, index) in messages" :key="index" class="message-item">
        <!-- 左侧内容：消息标题 -->
        <div class="left-content">
          <span class="message-title">{{ message.title }}</span>
        </div>
        <!-- 右侧内容：日期 -->
        <div class="right-content">
          <span class="message-date">{{ message.date }}</span>
        </div>
      </li>
    </ul>
    </div>
  </div>

  <div class="main-content">
    <!-- 快捷成绩查询 -->
    <div class="section">
      <button class="btn" @click="goToGradeQuery">快捷查询成绩</button>
    </div>

    <!-- 快捷选课 -->
    <div class="section">
      <button class="btn" @click="goToCourseSelection">快捷选课</button>
    </div>
  </div>
  </div>
</template>

<script setup>
  import request from "@/utils/request";
  const user = JSON.parse(localStorage.getItem('student-user') || '{}')
  // console.log(user)

  import { ref } from "vue";

// 通知数据
const notifications = ref([
  {
    isPinned: true,
    title: "【通知】关于做好2024年下半年全国大学英语四、六级考试有...",
    date: "2024-12-06",
  },
  {
    isPinned: true,
    title: "【通知】上课地点待更新 2024—2025（2）学期开设通...",
    date: "2024-12-05",
  },
  {
    isPinned: true,
    title: "【通知】全校通识教育选修课《中国合唱之美（2）》报名通知",
    date: "2024-12-05",
  },
  {
    isPinned: true,
    title: "【通知】全校通识教育选修课《羊城地理面面观——地学家的视角...",
    date: "2024-12-05",
  },
]);

// 消息数据
const messages = ref([
  {title:"停课提醒:原定张军老师在第8周星期三第5-7节...",
   date:"2024-11-02 09:56:29"
  },
  {
    title: "停课提醒：原定杨耀翔老师在第1周星期一第一...",
    date: "2024-09-02 09:56:29",
  },
  {
    title: "免修免考审批",
    date: "2024-03-12 10:51:00",
  },
  {
    title: "免修免考审批",
    date: "2024-03-12 10:10:48",
  },
]);
</script>

<style scoped>
/* Image Carousel Styles */
.image-carousel {
    width: 85%;
    margin: 25px auto;
    overflow: hidden;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    border: 10px solid white;
    background: #e6e6e6;
    max-width: 1500px;
    height: 300px;
    margin-bottom: 20px;
}

.carousel-track {
    display: flex;
    width: calc(400px * 9);
    animation: scroll 30s linear infinite; /* Adjust the time to make the scrolling slower */
}

.carousel-slide {
    flex: 0 0 auto;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0 10px;
}

.carousel-slide img {
    width: 100%;
    height: 350px;
    object-fit: cover;
    border-radius: 5px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s;
}

.carousel-slide img:hover {
    transform: scale(1.05);
}

/* Define an animation called scroll for horizontal scrolling */
@keyframes scroll {
    0% { transform: translateX(0); }
    100% { transform: translateX(calc(-300px * 9)); }
}

.main-content {
  margin-top:10px;
  padding: 0px;
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
}

/* 分区样式 */
.section {
  flex: 1;
  min-width: 400px;
  background-color: white;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.section h3 {
  font-size: 18px;
  margin-bottom: 15px;
  color: #333;
}

/* 通知列表样式 */
.notification-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.notification-item {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px 0;
  border-bottom: 1px solid #e6e6e6;
  font-size: 14px;
  color: #555;
}

.notification-item:last-child {
  border-bottom: none;
}

/* 置顶标志 */
.top-tag {
  color: #ff5722;
  font-weight: bold;
  margin-right: 10px;
}

/* 通知内容样式 */
.notice-content {
  display: flex;
  flex-direction: column;
}

.notice-title {
  color: #333;
  font-weight: bold;
  margin-bottom: 5px;
  line-height: 1.5;
}

.notice-date {
  color: #888;
  font-size: 12px;
}


/* 消息列表样式 */
.message-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.message-item {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px 0;
  border-bottom: 1px solid #e6e6e6;
  font-size: 14px;
  color: #555;
}

.message:last-child {
  border-bottom: none;
}

.message-content {
  display: flex;
  flex-direction: column;
}

.notice-date {
  color: #888;
  font-size: 12px;
}

/* 按钮样式 */
.btn {
  display: inline-block;
  margin-bottom: 20px;
  padding: 10px 20px;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
  text-align: center;
}

.btn:hover {
  background-color: #45a049;
}

/* 列表样式 */
ul {
  list-style: none;
  padding: 0;
}

li {
  margin: 10px 0;
  font-size: 14px;
  color: #333;
}
</style>