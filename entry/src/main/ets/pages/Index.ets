import router from '@ohos.router'
import CommonConstants from '../common/constants/CommonConstants'
import HomeIndex from './HomeIndex'
import MySetting from './MySetting'
@Entry
@Component
struct Index {
  @State account: string = ''
  @State currentIndex : number = CommonConstants.HOME_TAB_INDEX
  @Builder tabBuilder(title:ResourceStr,index:number,selectImg:ResourceStr,img:ResourceStr){
    Column(){
        Image(this.currentIndex === index?selectImg:img)
          .width($r('app.float.home_homeCell_size'))
          .height($r('app.float.home_homeCell_size'))
        Text(title)
          .fontSize($r('app.float.little_text_size'))
          .margin({top:$r('app.float.home_homeCell_margin')})
          .fontColor(this.currentIndex === index?$r('app.color.mainPage_selected'):$r('app.color.mainPage_normal'))
    }
  }

  onPageShow(){
    let acc = router.getParams() as Record<string,string>
    if (acc) {
      this.account = acc['sendMsg']
    }
  }
  build() {
    Tabs({barPosition:BarPosition.End}){
      TabContent(){
        HomeIndex()
      }
      .padding({left:$r('app.float.mainPage_padding'),right:$r('app.float.mainPage_padding')})
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.tabBuilder(CommonConstants.HOME_TITLE,CommonConstants.HOME_TAB_INDEX,$r('app.media.home_selected'),$r('app.media.home_normal')))
      TabContent(){
        MySetting({account:this.account})
      }
      .padding({left:$r('app.float.mainPage_padding'),right:$r('app.float.mainPage_padding')})
      .backgroundColor($r('app.color.mainPage_backgroundColor'))
      .tabBar(this.tabBuilder(CommonConstants.HOME_TITLE,CommonConstants.MINE_TAB_INDEX,$r('app.media.mine_selected'),$r('app.media.mine_normal')))
    }
    .onChange(index=>this.currentIndex = index)
    .width(CommonConstants.FULL_PARENT)
    .barHeight($r('app.float.mainPage_barHeight'))
    .backgroundColor(Color.White)
    .barMode(BarMode.Fixed)
  }
}