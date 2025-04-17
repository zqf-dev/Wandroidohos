import { BaseContentType } from './base/BaseContentType';
import { HashMap } from '@kit.ArkTS';
import { NConst } from './constant/NConst';
import { BaseHttp } from './base/BaseHttp';
import { BaseResponse } from '../../../../Index';
import { HttpInterceptor } from './interceptor/HttpInterceptor';
import { DefHeadersInterceptor } from './interceptor/DefHeadersInterceptor';

let headData: object

export class FastHttp extends BaseHttp {
  private REQUEST_INTERCEPTORS: Array<HttpInterceptor> = [new DefHeadersInterceptor()]

  addRequestInterceptor(interceptor: HttpInterceptor) {
    this.REQUEST_INTERCEPTORS.push(interceptor)
  }

  static setBaseUrl(baseUrl: string) {
    if (baseUrl) {
      NConst.baseUrl = baseUrl;
    }
  }

  static setHeadParams(header: HashMap<string, string>) {
    if (header) {
      NConst.headMap = header;
    }
  }

  get(url: string, params?: object, header?: HashMap<string, string>, method?: BaseContentType): Promise<BaseResponse> {
    if (method) {
      headData["Content-Type"] = method
    }
    if (header && header.length > 0) {
      header.forEach((value: string, key: string) => {
        headData[key] = value
      });
    }
    if (NConst.headMap && NConst.headMap.length > 0) {
      NConst.headMap.forEach((value: string, key: string) => {
        headData[key] = value
      });
    }
    return this.baseGet(url, params, headData)
  }

  post() {

  }
}
