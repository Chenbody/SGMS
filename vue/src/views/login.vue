<template>
  <div>
    <div class="login-container">
      <div class="login-box" style="width: 350px;">
        <div style="font-size: 24px; font-weight: bold; text-align: center; margin-bottom: 30px;">Login</div>
        <el-form :model="data.form" ref="formRef" :rules="rules">
          <el-form-item prop="username">
            <el-input prefix-icon="User" v-model="data.form.username" placeholder="please enter username"/>
          </el-form-item>
          <el-form-item prop="password">
            <el-input show-password clearable prefix-icon="Lock" v-model="data.form.password" placeholder="please enter password"/>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" style="width: 100%;" @click="login">Confirm</el-button>
          </el-form-item>
        </el-form>
        <div style="margin-top: 30px; text-align: right;">
          Have't account? Please <a href="/register">Register</a>
        </div>
      </div>
    </div>
  </div>
</template> 

<script setup>
import { reactive, ref } from "vue";
import request from "../utils/request";
import {ElMessage} from "element-plus";
import router from "@/router";

  const data = reactive({
    form: {
      username: "",
      password: "",
    }
  })

  const validateUsername = (rule, value, callback) => {
    if (value === '') {
      return callback(new Error('Cannot be empty'));
    }
    if (/\s/.test(value)){
      return callback(new Error(`Cannot have space`));
    }
    if (value.length > 200) {
      return callback(new Error('No more than 200 long'));
    }
    callback();
  }


  const validatePassword = (rule, value, callback) => {
    if (value === '') {
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
      { validator: validateUsername, trigger: 'change' }
    ],
    password: [
      { validator: validatePassword, trigger: 'change' }
    ]
  })

  const formRef = ref()

  const login = () => {
    formRef.value.validate((valid) => {
      // console.log(valid)
      if (valid){
        request.post('/login', data.form).then(res => {
          if (res.code === "200"){
            localStorage.setItem("student-user", JSON.stringify(res.data))
            ElMessage.success("success login")
            // console.log(res.data)
            router.push("/home")
          } else {
            ElMessage.error(res.msg)
          }
        })
      }
    })
  }
</script>

<style scoped>
  .login-container {
    min-height: 100vh;
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
    background-image: url("../assets/imgs/backgrond.png");
    background-size: cover ;
  }
  .login-box{
    background-color: rgba(255,255,255,.85 );
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border: 1px solid #ddd;
    padding: 30px;
    border-radius: 12px;
  }
</style>