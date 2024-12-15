<template>
  <div class="whole">
    <div style="height: 60px; background-color: rgba(255, 255, 255, .7); display: flex; align-items: center; border-bottom: 0px solid #ddd">
      <div style="flex: 1">
        <div style="padding-left: 20px; display: flex; align-items: center">
          <img src="@/assets/imgs/logo.png" alt="" style="width: 40px">
          <div style="font-weight: bold; font-size: 24px; margin-left: 5px">Student grade management system</div>
        </div>
      </div>
      <div style="width: fit-content; padding-right: 10px; display: flex; align-items: center;">
        <img :src="user.avatar ? `${baseUrl}${user.avatar}` : 'https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png'"  alt="" style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover;">
        <span style="margin-left: 5px">{{ user.name }}</span>
      </div>
    </div>

    <div style="display: flex">
      <div style="width: 200px;background-color: rgba(255, 255, 255, .7);border-right: 0px solid #ddd;min-height: calc(100vh - 60px);">
        <el-menu
            router
            style="border: none;border-radius: 5px;"
            background-color="rgba(255, 255, 255, 0)"
            :default-active="$route.path"
            :default-openeds="['/home', '2', '3', '4']"
        >
          <el-menu-item index="/home">
            <el-icon><HomeFilled /></el-icon>
            <span>Home</span>
          </el-menu-item>
          <el-sub-menu index="2">
            <template #title>
              <el-icon><Memo /></el-icon>
              <span>Course</span>
            </template>
            <el-menu-item index="/course" v-if="user.role === 'ADMIN'">
              <el-icon><Document /></el-icon>
              <span>Detail</span>
            </el-menu-item>
            <el-menu-item index="/courseList" v-if="user.role === 'STUDENT'">
              <el-icon><Document /></el-icon>
              <span>Student Course</span> 
            </el-menu-item>
            <el-menu-item index="/studentCourse">
              <el-icon><Document /></el-icon>
              <span>Record</span> 
            </el-menu-item>
          </el-sub-menu>
          <el-sub-menu index="3">
            <template #title>
              <el-icon><Collection /></el-icon>
              <span>Score</span>
            </template>
            <el-menu-item index="/grade">
              <el-icon><Medal /></el-icon>
              <span>Score & Feedback</span>
            </el-menu-item>
          </el-sub-menu>
          <el-sub-menu index="4" v-if="user.role === 'ADMIN'">
            <template #title>
              <el-icon><Files /></el-icon>
              <span>User</span>
            </template>
            <el-menu-item index="/student">
              <el-icon><Folder /></el-icon>
              <span>Student Info</span>
            </el-menu-item>
          </el-sub-menu>
          <el-menu-item index="/person" v-if="user.role === 'STUDENT'">
            <el-icon><User /></el-icon>
            <span>Person Info</span>
          </el-menu-item>
          <el-menu-item index="login" @click="logout">
            <el-icon><SwitchButton /></el-icon>
            <span>Exit</span>
          </el-menu-item>
        </el-menu>
      </div>

      <div class="content">
        <router-view />
      </div>
    </div>

  </div>
</template>

<script setup>
import { useRoute } from 'vue-router'
const $route = useRoute()
// console.log($route.path)
const user = JSON.parse(localStorage.getItem('student-user') || '{}')
const baseUrl = import.meta.env.VITE_BASE_URL

const logout = () => {
  localStorage.removeItem('student-user')
}
</script>

<style scoped>
.whole {
  background-image: url(../assets/imgs/background4.png);
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
.content {
  flex: 1;
  width: 0;
  /* background-image: url(../assets/imgs/background1.png); */
  background-repeat: no-repeat;
  background-attachment: fixed;
  /* border-radius: 5px; */
  padding: 10px;
  background-size: cover;
}
el-menu {
  background-color: rgba(255, 255, 255, .7);
}
.el-menu-item.is-active {
  background-color: #dcede9 !important;
}
.el-menu-item:hover {
  color: #11A983;
}
:deep(th)  {
  color: #333;
}
</style>