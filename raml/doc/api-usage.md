API 使用建议

1. 所有 post body 的参数使用 x-www-form-urlencoded, 而不是 form-data, 内部实现的格式为: `key=value&key2=value2`
