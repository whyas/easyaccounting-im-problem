#### API 基本

- 所有 post body 的参数使用 x-www-form-urlencoded, 而不是 form-data, 内部实现的格式为: `key=value&key2=value2`

#### 分页规则:

- start, optional, 默认`000000000000000000000000`, 下一页查询界限, 第一次获取不传
- limit, optional, 默认`10`, 本次返回结果的数量

注意:

- 传入`start`的值, 返回结果中不包含`_id`为`start`的条目
- `start`的值应该是上一次返回的 list 的最后一条记录, 服务器端查询的时候, 会查询该 id 之前的数据

#### 参数传递规则

- POST 请求的参数, 凡是要向服务器增加信息的, 放在 body 里面
- GET 请求的参数, 作为请求的条件, 放在 url 参数里面
- 认证 token 因为到处都有, 放哪儿都可以

#### 认证:

- 使用 jwt{JSON Web Tokens} 样式的 token 进行用户认证, 仍然是 token, 只是 token 里面包含了一些其它信息..
- 登录的时候, 会返回一个 token.
- 保存 token, **每次调用 API 的时候, 都要在参数中带上 token=xxxx.xxxxxx.xxxx**, token 传递方式有:
  - HTTP HEADER: `x-access-token`
  - Request Param(GET & POST): `token`
- 如果 token 失效, 服务器返回状态码: 401(Unauthorized). 客户端重新登录.

#### 返回对象

API 正常请求的情况下, 返回码为 1000, 返回的对象为:

```
{
  "code": 1000,
  "msg": "success",
  "payload": {}
}
```

当请求发生异常的时候, 例如注册时输入的邮箱有误, 或者邮箱已经被注册过, 会返回对应的错误码, 通常为 1001, 1002, 1003 等.

异常消息保存在 msg 字段中. payload 中会保存异常的详细对象.

#### 上传文件

上传文件使用阿里云的 SDK, [OSS Android](https://docs.aliyun.com/#/pub/oss/sdk/android-sdk&preface), [OSS iOS](https://docs.aliyun.com/#/pub/oss/sdk/ios-sdk&preface)

注意:

- key 统一为: fileuuid/filename.jpg (fileuuid 为程序生成的 UUID 字符串, filename 为该文件的名字, jpg 为演示文件格式)
- 网络上比较成熟的参考: `https://speakerd.s3.amazonaws.com/presentations/8cc549303fff0130b9ec1231381f54b3/slides.pdf` (来源: http://felixge.de/)

#### 时间解析

示例: `2014-01-01T23:28:56.782Z`

API 统一使用 ISO 8601 格式的时间. 解析方式搜索: `parse iso 8601`

#### 头像

头像的 key 的格式为 `fileuuid/filename.png`

默认男头像 key: `9aa89c68cf3c9ecf0ff504f7b0867ef1/avatar_male.png`

默认男头像 URL: http://younion.oss-us-west-1.aliyuncs.com/9aa89c68cf3c9ecf0ff504f7b0867ef1/avatar_male.png

默认女头像 key: `9da5fe862cf2c202f53929ddae6dcc5a/avatar_female.png`

默认女头像 URL: http://younion.oss-us-west-1.aliyuncs.com/9da5fe862cf2c202f53929ddae6dcc5a/avatar_female.png
