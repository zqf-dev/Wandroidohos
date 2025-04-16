// 引入包名
import { http } from '@kit.NetworkKit';
import { NConst } from '../constant/NConst';
import { BaseResponse } from '../../../../../Index';

export class BaseHttp {
  baseGet(pathApi: string, data?: object, baseHeader?: object): Promise<BaseResponse> {
    // 每一个httpRequest对应一个HTTP请求任务，不可复用
    let httpRequest = http.createHttp();
    // 用于订阅HTTP响应头，此接口会比request请求先返回。可以根据业务需要订阅此消息
    httpRequest.on('headersReceive', (header) => {
      console.info('headersReceive: ' + JSON.stringify(header));
    });
    // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
    let responseResult = httpRequest.request(NConst.opt.baseUrl + pathApi, {
      method: http.RequestMethod.GET, // 可选，默认为http.RequestMethod.GET
      header: baseHeader, // 开发者根据自身业务需要添加header字段
      extraData: data, // 携带的参数data
      expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
      connectTimeout: 30000, // 可选，默认为30000ms
      readTimeout: 30000, // 可选，默认为30000ms
      usingProxy: false, // 可选，默认不使用网络代理，自API 10开始支持该属性
    })
    let res: BaseResponse = new BaseResponse()
    return new Promise((resolve, reject) => {
      responseResult.then((value: http.HttpResponse) => {
        if (value.responseCode === 200) {
          let result = `${value.result}`;
          let resultJson: BaseResponse = JSON.parse(result);
          if (resultJson.errorCode === 0) {
            res.data = resultJson.data;
          }
          res.errorCode = resultJson.errorCode;
          res.errorMsg = resultJson.errorMsg;
        } else {
          res.errorMsg = `请求失败，请重试!${value.responseCode}`;
        }
        return resolve(res)
      }).catch(() => {
        res.errorMsg = '请求失败，请重试!';
        return reject(res);
      })
    })
  }
}