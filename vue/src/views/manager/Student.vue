<template>
  <div>

    <div class="card" style="margin-bottom: 10px;">
      <el-input style="width: 250px; margin: 8px" placeholder="Search with username" v-model="data.username" prefix-icon="Search" clearable @keyup.enter="load"></el-input>
      <el-input style="width: 250px; margin: 8px" placeholder="Search with name" v-model="data.name" prefix-icon="Search" clearable @keyup.enter="load"></el-input>
      <el-button type="primary" @click="load" style="margin-left: 8px;">Search</el-button>
      <el-button type="info" style="margin: 0 10px" @click="reset">Reset</el-button>
    </div>

    <div class="card" style="margin-bottom: 10px">
      <div style="margin-bottom: 10px">
        <el-button type="primary" @click="handleAdd">Add</el-button>
      </div>
      <el-table stripe :data="data.tableData">
        <el-table-column label="Username" prop="username"></el-table-column>
        <el-table-column label="Name" prop="name"></el-table-column>
        <el-table-column label="PhoneNum" prop="phone"></el-table-column>
        <el-table-column label="Email" prop="email"></el-table-column>
        <el-table-column label="Sex" prop="sex"></el-table-column>
        <el-table-column label="Birth" prop="birth"></el-table-column>
        <el-table-column label="Avatar" prop="avatar">
          <template #default="scope">
            <el-image v-if="scope.row.avatar" :src="scope.row.avatar" :preview-src-list="[scope.row.avatar]" style="width: 40px;height: 40px;border-radius: 5px;" fit="cover"></el-image>
          </template>
        </el-table-column>
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
        <el-form-item label="Username" prop="username">
          <el-input v-model="data.form.username" autocomplete="off" clearable />
        </el-form-item>
        <el-form-item label="Name" prop="name">
          <el-input v-model="data.form.name" autocomplete="off" clearable />
        </el-form-item>
        <el-form-item label="Password" prop="password">
          <el-input show-password v-model="data.form.password" autocomplete="off" clearable />
        </el-form-item>
        <el-form-item label="PhoneNum" prop="phone">
          <el-input v-model="data.form.phone" autocomplete="off" clearable />
        </el-form-item>
        <el-form-item label="Email" prop="email">
          <el-input v-model="data.form.email" autocomplete="off" clearable />
        </el-form-item>
        <el-form-item label="Sex" prop="sex">
          <el-radio-group v-model="data.form.sex">
            <el-radio label="Male"></el-radio>
            <el-radio label="Female"></el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="Birth" prop="birth">
          <el-date-picker format="YYYY-MM-DD" value-format="YYYY-MM-DD" v-model="data.form.birth" placeholder="YYYY-MM-DD" clearable></el-date-picker>
        </el-form-item>
        <el-form-item label="Avatar">
          <el-upload action="http://localhost:9090/files/upload" list-type="picture" :on-success="handleImgUploadSuccess">
            <el-button type="primary">Upload avatar</el-button>
          </el-upload>
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

const baseUrl = '/student'

const data = reactive({
  username: '',
  name: '',
  pageNum: 1, // 当前的页码
  pageSize: 8, // 每页的个数
  total: 0,
  tableData: [],
  formVisible: false,
  form: {},
})

// 加载课程信息
const load = () => {
  request.get(baseUrl + '/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      username: data.username,
      name: data.name,
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
  data.username = ''
  data.name = ''
  load()
}

const formRef = ref()

// const validateMessage = (rule, value, callback) => {
//     if (!value) {
//       return callback(new Error('Cannot be empty'));
//     }
//     // 检查前后是否有多余的空格（输入应与去除空格后的输入相同）
//     if (value !== value.trim()) {
//         return callback(new Error('Password cannot start or end with a space'));
//     }
//     callback();
//   }

const validateMessage = (rule, value, callback) => {
  if (!value) {
    return callback()
  }
  if (value.length > 200) {
    return callback(new Error('No more than 200 long'));
  }
    callback();
  }

const validateUsername = (rule, value, callback) => {
  if (!value) {
    return callback(new Error('Cannot be empty'));
  }
  if (!/^\d+$/.test(value)) {
    return callback(new Error('Username is studentID'));
  }
  if (value.length > 200) {
    return callback(new Error('No more than 200 long'));
  }
  callback();
}
  

const validatePassword = (rule, value, callback) => {
  if (!value) {
    return callback(new Error('Cannot be empty'));
  }
  // 正则表达式 至少一个字母和一个数字，长度6-12位，不包含空格
  const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[^\s]{6,12}$/;

  if (!passwordRegex.test(value)) {
    return callback(new Error('6-12 long, no space, need letter and digit'));
  }
  callback();
}


const rules = reactive({
    // 名字要与prop名相同
    username: [
      { required: true, validator: validateUsername, trigger: 'change' }
    ],
    name: [
      { validator: validateMessage, trigger: 'change' }
    ],
    password: [
      { required: true, validator: validatePassword, trigger: 'change' }
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
        url: data.form.id ? baseUrl + '/update' : baseUrl + '/add',
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
    request.delete(baseUrl + '/delete/' + id).then(res => {
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

const handleImgUploadSuccess = (res) => {
  // console.log(res)
  data.form.avatar = res.data

}

</script>