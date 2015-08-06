#### API 基本

- 所有 post body 的参数使用 x-www-form-urlencoded, 而不是 form-data, 内部实现的格式为: `key=value&key2=value2`

#### 分页规则:

- start, optional, 默认`000000000000000000000000`, 下一页查询界限
- limit, optional, 默认`10`, 本次返回结果的数量

注意:

- 传入`start`的值, 返回结果中不包含`_id`为`start`的条目
- `start`的值应该是上一次返回的 list 的最后一条记录, 服务器端查询的时候, 会查询该 id 之前的数据

#### 认证:

- 使用 jwt{JSON Web Tokens} 样式的 token 进行用户认证, 仍然是 token, 只是 token 里面包含了一些其它信息..
- 登录的时候, 会返回一个 token.
- 保存 token, **每次调用 API 的时候, 都要在参数中带上 token=xxxx.xxxxxx.xxxx**
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
