import { FastHttp } from "netbuild"
import { BannerBean } from "../model/BannerBean"

class HttpManage {
  private fastHttp: FastHttp = new FastHttp()

  getBanner(path: string){
    return this.fastHttp.get(path, )
  }
}

export default new HttpManage()