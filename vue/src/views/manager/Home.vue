<template>
  <div>

    <div class="card" style="line-height: 30px">
      <div>Welcome back <span style="color: dodgerblue;">{{ user.name }}</span> , have a nice day!</div>
    </div>

  </div>
</template>

<script setup>
  import request from "@/utils/request";
  const user = JSON.parse(localStorage.getItem('student-user') || '{}')
  // console.log(user)
</script>