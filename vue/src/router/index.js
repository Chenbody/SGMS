import {createRouter, createWebHistory} from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Manager',
      component: () => import('@/views/Manager.vue'),
      redirect: '/home',
      children: [
        { path: 'home', name: 'Home', component: () => import('@/views/manager/Home.vue')},
        { path: 'course', name: 'Course', component: () => import('@/views/manager/Course.vue')},
        { path: 'student', name: 'Student', component: () => import('@/views/manager/Student.vue')},
        { path: 'person', name: 'Person', component: () => import('@/views/manager/Person.vue')},
        { path: 'courseList', name: 'CourseList', component: () => import('@/views/manager/CourseList.vue')},
        { path: 'studentCourse', name: 'StudentCourse', component: () => import('@/views/manager/StudentCourse.vue')},
        { path: 'grade', name: 'Grade', component: () => import('@/views/manager/Grade.vue')},
      ]
    },
    {
      path: '/login',
      name: 'Login',
      component: () => import('@/views/Login.vue'),
    },
    {
      path: '/register',
      name: 'Register',
      component: () => import('@/views/Register.vue'),
      
    },
  ]
})

router.beforeEach((to, from, next) => {
  // path that requires login
  let loggedInPath = ['/home', '/grade', '/studentCourse'];
  // path that requires user to be a student
  let studentPath = ['/person', '/courseList'];
  // path that requires user to be an admin
  let adminPath = ['/student', '/course'];
  // path that would log out the account
  let loggedOutPath = ['/login', '/register'];
  let user = JSON.parse(localStorage.getItem('student-user'));

  // check if logged in
  if (loggedInPath.includes(to.path)) {
    if (user == undefined) {
      next('/login');
    } else {
      next(true);
    }
  }
  // check if account is student
  else if (studentPath.includes(to.path)) {
    if (user == undefined || user.role != 'STUDENT') {
      if (from.path != undefined) {
        next(from.path);
      } else {
        next('/home');
      }
    } else {
      next(true);
    }
  }
  // check if account is admin
  else if (adminPath.includes(to.path)) {
    if (user == undefined || user.role != 'ADMIN') {
      if (from.path != undefined) {
        next(from.path);
      } else {
        next('/home');
      }
    } else {
      next(true);
    }
  }
  // log out if already logged in
  else if (loggedOutPath.includes(to.path)) {
    if (user != undefined) {
      localStorage.removeItem('student-user');
    }
    next(true);
  }
  else {
    next('/home');
  }
})

export default router
