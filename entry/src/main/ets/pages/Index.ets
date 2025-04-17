import HttpManage from '../http/HttpManage';

@Entry
@Component
struct Index {
  @State message: string = '请求广告数据';

  build() {
    RelativeContainer() {
      Text(this.message)
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          HttpManage.getBanner()
        })
    }
    .height('100%')
    .width('100%')
  }
}