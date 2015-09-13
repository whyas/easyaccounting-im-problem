#### socket 订阅聊天室的消息

将 socket 订阅到 `chatroom.messages.{chatroomId}` 上面, 然后接收 Message 对象.

示例(JavaScript):

```
socket.on('chatroom.messages.55f03e4728824692a4dcb951', function (data) {
  console.log(data);
});
```
