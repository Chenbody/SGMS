<template>
    <div>
        <div class="card" style="width: 60%;padding: 10px 20px;">
            <el-form :model="data.form" label-width="100px" style="padding-right: 50px;margin-top: 20px;" :rules="rules" ref="formRef">
                <el-form-item label="Avatar">
                <el-upload class="avatar-uploader"  action="http://localhost:9090/files/upload" :show-file-list="false" :on-success="handleImgUploadSuccess">
                    <img v-if="data.form.avatar" :src="data.form.avatar" style="width: 100px;height: 100px;border-radius: 5px;object-fit: contain;" class="avatar" />
                    <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
                </el-upload>
                </el-form-item>
                <el-form-item label="Username" required="true" prop="username">
                <el-input v-model="data.form.username" autocomplete="off" disabled />
                </el-form-item>
                <el-form-item label="Name" prop="name">
                <el-input v-model="data.form.name" autocomplete="off" clearable />
                </el-form-item>
                <el-form-item label="Password" required="true" prop="password">
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
                <el-form-item>
                    <el-button type="primary" @click="update">Save</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>


<script setup>
import {reactive, ref} from "vue";
import request from "@/utils/request";
import {ElMessage, ElMessageBox} from "element-plus";
import router from "@/router";


const data = reactive({
    form: JSON.parse(localStorage.getItem('student-user') || '{}')
})

const handleImgUploadSuccess = (res) => {
  // console.log(res)
  data.form.avatar = res.data

}

const formRef = ref()

const validateMessage = (rule, value, callback) => {
  if (!value) {
    return callback()
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
      { required: true, trigger: 'change' }
    ],
    name: [
      { validator: validateMessage, trigger: 'change' }
    ],
    password: [
      { required: true, validator: validatePassword, trigger: 'change' }
    ],
})


const update = () => {
    formRef.value.validate((valid) => {
        if (valid) {
            request.put('/student/update', data.form).then(res => {
                if (res.code === '200') {
                    data.formVisible = false
                    ElMessage.success("Completed successfully")
                    router.push('/login')
                } else {
                    ElMessage.error(res.msg)
                }
            })
        }
    })
}



</script>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 100px;
  height: 100px;
  text-align: center;
}
</style>