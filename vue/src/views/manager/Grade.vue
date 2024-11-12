<template>
  <div>

    <div class="card" style="margin-bottom: 10px;">
      <el-input style="width: 250px; margin: 8px" placeholder="Search with student username" v-model="data.username" prefix-icon="Search" clearable @keyup.enter="load" v-if="data.user.role === 'ADMIN'"></el-input>
      <el-input style="width: 250px; margin: 8px" placeholder="Search with course name" v-model="data.courseName" prefix-icon="Search" clearable @keyup.enter="load"></el-input>
      <el-input style="width: 250px; margin: 8px" placeholder="Search with course num" v-model="data.no" prefix-icon="Search" clearable @keyup.enter="load"></el-input>
      <el-button type="primary" @click="load" style="margin-left: 8px;">Search</el-button>
      <el-button type="info" style="margin: 0 10px" @click="reset">Reset</el-button>
    </div>

    <div class="card" style="margin-bottom: 10px">
      <el-table stripe :data="data.tableData">
        <el-table-column label="Course" prop="courseName"></el-table-column>
        <el-table-column label="Number" prop="no"></el-table-column>
        <el-table-column label="StudentUsername" prop="studentUsername"></el-table-column>
        <el-table-column label="StudentName" prop="studentName"></el-table-column>
        <el-table-column label="Score" prop="score"></el-table-column>
        <el-table-column label="Comment" prop="comment"></el-table-column>
        <el-table-column label="Feedback" prop="feedback"></el-table-column>
        <el-table-column label="Operation" style="align-items: center;" width="180">
          <template #default="scope">
            <el-button type="primary" @click="handleEdit(scope.row)" v-if="data.user.role === 'STUDENT'">Feedback</el-button>
            <el-button type="primary" @click="handleEdit(scope.row)" v-if="data.user.role === 'ADMIN'">Edit</el-button>
            <el-button type="danger" @click="del(scope.row.id)" v-if="data.user.role === 'ADMIN'">Delete</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <!-- 翻页条 -->
    <div class="card">
      <el-pagination background layout="prev, pager, next" v-model:page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" @current-change="handleCurrentChange"/>
    </div>


    <!-- 弹窗 -->
    <el-dialog title="Message" width="40%" v-model="data.formVisible" :close-on-click-modal="false" destroy-on-close>
      <el-form :model="data.form" label-width="100px" style="padding-right: 50px" :rules="rules" ref="formRef">
        <el-form-item label="Score" prop="score" v-if="data.user.role === 'ADMIN'">
          <el-input v-model="data.form.score" autocomplete="off" />
        </el-form-item>
        <el-form-item label="Comment" prop="comment" v-if="data.user.role === 'ADMIN'">
          <el-input type="textarea" v-model="data.form.comment" autocomplete="off" />
        </el-form-item>
        <el-form-item label="Feedback" prop="feedback" v-if="data.user.role === 'STUDENT'">
          <el-input type="textarea" v-model="data.form.feedback" autocomplete="off" />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="data.formVisible=false">Cancel</el-button>
          <el-button type="primary" @click="save">Save</el-button>
        </span>
      </template>
    </el-dialog>

    

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
  form: {},
  username: '',
  courseName: '',
  no: '',
  pageNum: 1, // 当前的页码
  pageSize: 8, // 每页的个数
  total: 0,
  tableData: [],
  user: JSON.parse(localStorage.getItem('student-user') || '{}'),
  formVisible: false,
})

// 加载课程信息
const load = () => {
  let params = {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      courseName: data.courseName,
      studentUsername: data.username,
      no: data.no,
  }
  if (data.user.role === "STUDENT") { // 如果用户为学生，则查询学生自己的选课记录
    params.studentId = data.user.id
  } 
  request.get('/grade/selectPage', {
    params: params
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
  data.username = ''
  load()
}

const del = (id) => {
  ElMessageBox.confirm('This course selection will be deleted. Continue?', 'Warning', { confirmButtonText: 'Confirm', cancelButtonText: 'Cancel', type: 'warning' }).then(res => {
    request.delete('/grade/delete/' + id).then(res => {
      if (res.code === '200') {
        load()
        ElMessage.success("Completed successfully")
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch(err => {
    // ElMessage({type: 'info', message: 'Delete canceled'})
  })
}

const handleEdit = (row) => {
  // console.log(row)
  // 弹窗
  data.form = JSON.parse(JSON.stringify(row))
  data.formVisible = true

}

const save = () => {
  request.put('/grade/update', data.form).then(res => {
    if (res.code === '200') {
      data.formVisible = false
      load()
      ElMessage.success("Completed successfully")
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const formRef = ref()
</script>