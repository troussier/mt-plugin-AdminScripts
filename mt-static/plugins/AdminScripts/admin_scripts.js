const param = location.search.substring(1).split('&');
const params = new Object();
let p = '';
for (var i = 0; i < param.length; i++) {
    p = param[i].split('=');
    params[p[0]] = p[1];
}
// console.log(params);

// 使用例
if (params['_type'] === 'content_data' && params['content_type_id'] === '4' && params['__mode'] === 'view') {
    console.log('Hello!')
}
