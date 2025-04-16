import { BaseContentType } from './base/BaseContentType';
import { HashMap } from '@kit.ArkTS';
import { NConst } from './constant/NConst';
import { BaseHttp } from './base/BaseHttp';

let headData: object

export class FastHttp extends BaseHttp {
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

  get<T>(url: string, params?: object, header?: HashMap<string, string>, method?: BaseContentType) {
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
    this.baseGet<T>(url, params, headData)
  }

  post() {

  }
}
