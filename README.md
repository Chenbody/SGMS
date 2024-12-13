# SGMS
A student grade management system
# 项目启动
## 前端
使用命令行/终端进入`vue`目录
 ```
npm run dev
```
项目运行在5173端口上
## 后端
运行`SpringbootApplication.java`文件
项目运行在9090端口上
# 初次加载项目vue无法启动
使用命令行/终端进入`vue`目录
```bash
rm -rf node_modules
rm package-lock.json
npm install
```
# 让局域网内别的电脑能访问项目
-  在前端`vite.config.js`增加
```javascript
server: {
	host: '0.0.0.0', // 使服务器监听所有网络接口
	port: 5173, // 保持默认端口
}
```
前端启动后的结果例子:
```bash
➜ Local: http://localhost:5173/ 
➜ Network: http://10.252.150.16:5173/ 
➜ Network: http://198.19.0.7:5173
```
（两个Network有什么区别你们可以查查）
- 在`.env.development`里的`localhost:9090`换成后端ip和端口，例如：`http://10.252.150.16:9090`
- 后端`application.yml`里的`ip`对应的localhost要换成服务器ip、`server`中要增加`address: 0.0.0.0`
后端`application.yml`修改结果例子：
```yml
server:  
  address: 0.0.0.0  
  port: 9090
  
#ip: localhost  
ip: 10.252.150.16
```
