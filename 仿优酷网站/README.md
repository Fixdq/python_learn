功能分解
=
用户
-
1. 注册（手机号，密码md5加密）
2. 登录（显示最后一条公告）
3. 冲会员
4. 查看视频（显示所有视屏）
5. 下载视频（免费）
6. 下载视频（非会员10 会员5）
7. 查看观影记录（下载记录）
8. 查看公告（包括历史公告）


管理员
-
1. 注册
2. 登录
3. 上传视频（普通视频，收费视频）
4. 删除视频（标记删除）
5. 发布公告

.
+-- start.py
+-- README.md
+-- interface
|   +-- user_interface.py
|   +-- admin_interface.py
|   +-- common_interface.py
+-- db
|   +-- models.py
|   +-- db_hanlder.py
|   +-- notice
|   |   +-- 2018-04-30 10:43:38
|   |   +-- 2018-04-30 13:52:56
|   |   +-- 2018-04-30 10:43:19
|   +-- admin
|   |   +-- w
|   +-- video
|   |   +-- 月半小夜曲-陈乐基(无现场音).mp3
|   |   +-- _恋曲1990.mp3
|   |   +-- 该死的懦弱.mp3
|   |   +-- 李袁杰 - 离人愁.mp3
|   +-- videos
|   |   +-- 月半小夜曲-陈乐基(无现场音).mp3
|   |   +-- 恋曲1990.mp3
|   |   +-- 该死的懦弱.mp3
|   |   +-- 李袁杰 - 离人愁.mp3
|   +-- user
|   |   +-- e
|   +-- src.py
|   +-- user.py
|   +-- admin.py
+-- lib
|   +-- mysocket.py
|   +-- common.py
+-- conf
|   +-- settings.py
|   +-- __pycache__
