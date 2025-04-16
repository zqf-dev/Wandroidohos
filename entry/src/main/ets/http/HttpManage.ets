import { FastHttp } from 'netbuild'
import { API } from './API'

class HttpManage {
  private fastHttp: FastHttp = new FastHttp()

  getBanner() {
    this.fastHttp.get(API.banner).then(() => {

    })
  }
}

export default new HttpManage()