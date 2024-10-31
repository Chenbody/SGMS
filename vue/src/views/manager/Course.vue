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
      <div style="margin-bottom: 10px">
        <el-button type="primary" @click="handleAdd">Add</el-button>
      </div>
      <el-table stripe :data="data.tableData">
        <el-table-column label="Course" prop="name"></el-table-column>
        <el-table-column label="Number" prop="no"></el-table-column>
        <el-table-column label="Description" prop="description"></el-table-column>
        <el-table-column label="Hours" prop="times"></el-table-column>
        <el-table-column label="Teacher" prop="teacher"></el-table-column>
        <el-table-column label="Operation" style="align-items: center;">
          <template #default="scope">
            <el-button type="primary" @click="handleEdit">Edit</el-button>
            <el-button type="danger" @click="handleDelete">Delete</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <div class="card">
      <el-pagination background layout="prev, pager, next" v-model:page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" @current-change="handleCurrentChange"/>
    </div>

    <el-dialog title="信息" width="40%" v-model="data.formVisible" :close-on-click-modal="false" destroy-on-close>
      <el-form :model="data.form" label-width="100px" style="padding-right: 50px">
        <el-form-item label="名称" prop="name">
          <el-input v-model="data.form.name" autocomplete="off" />
        </el-form-item>
        <el-form-item label="描述" prop="descr">
          <el-input v-model="data.form.descr" autocomplete="off" />
        </el-form-item>
      </el-form>
      <template #footer>
      <span class="dialog-footer">
        <el-button @click="data.formVisible = false">取 消</el-button>
        <el-button type="primary" @click="data.formVisible = false">保 存</el-button>
      </span>
      </template>
    </el-dialog>

  </div>
</template>

<script setup>
import request from "@/utils/request";
import {reactive} from "vue";
import {ElMessageBox} from "element-plus";

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
  tableData: [
    // example
    // {name: '高等数学', no:'JC3001', description: '大学数学真有趣', times: '48课时', teacher:'宋浩'},
    // {name: '高等数学', no:'JC3001', description: '大学数学真有趣', times: '48课时', teacher:'宋浩'},
  ],
  formVisible: false,
  form: {},
})

// 加载课程信息
const load = () => {
  request.get('/course/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      name: data.courseName,
      no: data.no,
      teacher: data.teacher,
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

const handleAdd = () => {
  data.form = {}
  data.formVisible = true
}
const handleEdit = (row) => {
  let form = JSON.parse(JSON.stringify(row))
  data.formVisible = true
}
const handleDelete = (id) => {
  ElMessageBox.confirm('删除后数据无法恢复，您确定删除吗?', '删除确认', { type: 'warning' }).then(res => {
    console.log('删除')
  }).catch(err => {
    console.error(err)
  })
}
</script>