<template>
  <div>

    <div class="card" style="margin-bottom: 10px;">
      <el-input style="width: 250px; margin: 8px" placeholder="Search with course name" v-model="data.courseName" prefix-icon="Search" clearable @keyup.enter="load"></el-input>
      <el-input style="width: 250px; margin: 8px" placeholder="Search with course num" v-model="data.no" prefix-icon="Search" clearable @keyup.enter="load"></el-input>
      <el-input style="width: 250px; margin: 8px" placeholder="Search with course teacher" v-model="data.teacher" prefix-icon="Search" clearable @keyup.enter="load"></el-input>
      <el-button type="primary" @click="load" style="margin-left: 8px;">Search</el-button>
      <el-button type="info" style="margin: 0 10px" @click="reset">Reset</el-button>
    </div>

    <div class="card" style="margin-bottom: 10px">
      <el-table stripe :data="data.tableData">
        <el-table-column label="Course" prop="name"></el-table-column>
        <el-table-column label="Number" prop="no"></el-table-column>
        <el-table-column label="Description" prop="description"></el-table-column>
        <el-table-column label="Hours" prop="times"></el-table-column>
        <el-table-column label="Teacher" prop="teacher"></el-table-column>
        <el-table-column label="Operation" style="align-items: center;" width="180">
          <template #default="scope">
            <el-button type="primary" style="width: 80px;" @click="selectCourse(scope.row)" :disabled="scope.row.isSelected === 'Yes'">{{ scope.row.isSelected === 'Yes' ? 'Selected' : 'Select' }}</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <!-- 翻页条 -->
    <div class="card">
      <el-pagination background layout="prev, pager, next" v-model:page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" @current-change="handleCurrentChange"/>
    </div>

    

  </div>
</template>

<script setup>
import request from "@/utils/request";
import {reactive, ref} from "vue";
import {ElMessage, ElMessageBox} from "element-plus";

// request.get('/').then(res => {
//   console.log(res)
// })

const data = reactive({
  courseName: '',
  no: '',
  teacher: '',
  pageNum: 1, // 当前的页码
  pageSize: 8, // 每页的个数
  total: 0,
  tableData: [],
  user: JSON.parse(localStorage.getItem('student-user') || '{}'),
})

// 加载课程信息
const load = () => {
  request.get('/studentCourse/studentSelect', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      name: data.courseName,
      no: data.no,
      teacher: data.teacher,
      studentId: data.user.id,
    }
  }).then(res => {
    // console.log(res)
    data.tableData = res.data?.list || []
    data.total = res.data?.total || 0
  })
}
load()

const handleCurrentChange = (pageNum) => {
  // console.log(pageNum)
  // 翻页时重新加载数据
  load()
}

const reset = () => {
  data.courseName = ''
  data.no = ''
  data.teacher = ''
  load()
}

const selectCourse = (row) => {
  // console.log(row)
  request.post('/studentCourse/add', {studentId: data.user.id, name: row.name, no: row.no, courseId: row.id}).then(res => {
    if (res.code === '200'){
      row.isSelected = 'Yes';
      ElMessage.success("Completed successfully")
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const formRef = ref()
</script>