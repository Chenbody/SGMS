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
        <el-table-column label="Operation" style="align-items: center;" width="180">
          <template #default="scope">
            <el-button type="primary" @click="handleEdit(scope.row)">Edit</el-button>
            <el-button type="danger" @click="handleDelete(scope.row.id)">Delete</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <!-- 翻页条 -->
    <div class="card">
      <el-pagination background layout="prev, pager, next" v-model:page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" @current-change="handleCurrentChange"/>
    </div>

    <!-- 编辑弹窗 -->
    <el-dialog title="Message" width="40%" v-model="data.formVisible" :close-on-click-modal="false" destroy-on-close>
      <el-form :model="data.form" label-width="100px" style="padding-right: 50px" :rules="rules" ref="formRef">
        <el-form-item label="Course" prop="name">
          <el-input v-model="data.form.name" autocomplete="off" />
        </el-form-item>
        <el-form-item label="Number" prop="no">
          <el-input v-model="data.form.no" autocomplete="off" />
        </el-form-item>
        <el-form-item label="Description" prop="description">
          <el-input v-model="data.form.description" autocomplete="off" />
        </el-form-item>
        <el-form-item label="Hours" prop="times">
          <el-input v-model="data.form.times" autocomplete="off" />
        </el-form-item>
        <el-form-item label="Teacher" prop="teacher">
          <el-input v-model="data.form.teacher" autocomplete="off" />
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

const formRef = ref()

const validateMessage = (rule, value, callback) => {
    if (!value) {
      return callback(new Error('Cannot be empty'));
    }
    // 检查前后是否有多余的空格（输入应与去除空格后的输入相同）
    if (value !== value.trim()) {
        return callback(new Error('Value cannot start or end with a space'));
    }
    callback();
  }

const rules = reactive({
    // 名字要与prop名相同
    name: [
      { validator: validateMessage, trigger: 'change' }
    ],
    no: [
      { validator: validateMessage, trigger: 'change' }
    ],
    description: [
      { validator: validateMessage, trigger: 'change' }
    ],
    times: [
      { validator: validateMessage, trigger: 'change' }
    ],
    teacher: [
      { validator: validateMessage, trigger: 'change' }
    ],
  })

const handleAdd = () => {
  data.form = {}
  data.formVisible = true
}

// 保存信息到后台
const save = () => {
  formRef.value.validate((valid) => {
    if (valid){
      request.request({
        url: data.form.id ? '/course/update' : '/course/add',
        method: data.form.id ? 'PUT' : 'POST',
        data: data.form
      }).then(res => {
        if (res.code === '200') {
          load()
          data.formVisible = false
          ElMessage.success("Completed successfully")
        } else {
          ElMessage.error(res.msg)
        }
      })
    }
  })
}

const handleEdit = (row) => {
  // console.log(row)
  data.form = JSON.parse(JSON.stringify(row))
  data.formVisible = true
}


const handleDelete = (id) => {
  ElMessageBox.confirm('Data cannot be recovered after deletion. Continue?', 'Warning', { confirmButtonText: 'Confirm', cancelButtonText: 'Cancel', type: 'warning' }).then(res => {
    request.delete('course/delete/' + id).then(res => {
      if (res.code === '200') {
        load()
        data.formVisible = false
        ElMessage.success("Completed successfully")
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch(err => {
    // ElMessage({type: 'info', message: 'Delete canceled'})
  })
}
</script>