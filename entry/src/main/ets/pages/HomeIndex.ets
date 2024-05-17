import CommonConstants from '../common/constants/CommonConstants'
import ItemData from '../viewmodel/ItemData'
import MainViewModel from '../viewmodel/MainViewModel'
@Component
export default struct HomeIndex {

  build() {
    Scroll() {
      Column({space:CommonConstants.COMMON_SPACE}){
        Column() {
          Text($r('app.string.mainPage_tabTitles_home'))
            .fontWeight(FontWeight.Medium)
            .fontSize($r('app.float.page_title_text_size'))
            .margin({top:$r('app.float.mainPage_tabTitles_margin')})
            .padding({left:$r('app.float.mainPage_tabTitles_padding')})
        }
        .width(CommonConstants.FULL_PARENT)
        .alignItems(HorizontalAlign.Start)

        //SwiperController
        Swiper(){
          ForEach(MainViewModel.getSwiperImages(),(item)=>{
            Image(item)
              .borderRadius($r('app.float.home_swiper_borderRadius'))
          })
        }
        .width(CommonConstants.FULL_PARENT)
        .autoPlay(true)
        .margin({top:$r('app.float.home_swiper_margin')})


        Grid(){
          ForEach(MainViewModel.getFirstGridData(),(item:ItemData)=>{
              GridItem(){
                  Column(){
                    Image(item.img)
                      .width($r('app.float.home_homeCell_size'))
                      .height($r('app.float.home_homeCell_size'))
                    Text(item.title)
                      .fontSize($r('app.float.little_text_size'))
                      .margin({top:$r('app.float.home_homeCell_margin')})
                  }
              }
          })
        }.columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap($r('app.float.home_grid_columnsGap'))
        .rowsGap($r('app.float.home_grid_rowGap'))
        .padding({top:$r('app.float.home_grid_padding'),bottom:$r('app.float.home_grid_padding')})
        .height($r('app.float.home_grid_height'))
        .backgroundColor(Color.White)
        .borderRadius($r('app.float.home_grid_borderRadius'))

          Text($r('app.string.home_list'))
            .fontWeight(FontWeight.Medium)
            .fontSize($r('app.float.normal_text_size'))
            .margin({top:$r('app.float.home_text_margin')})
            .width(CommonConstants.FULL_PARENT)

        Grid(){
          ForEach(MainViewModel.getSecondGridData(),(item:ItemData)=>{
            GridItem(){
              Column(){
                Text(item.title)
                  .fontSize($r('app.float.normal_text_size'))
                  .fontWeight(FontWeight.Medium)
                Text(item.others)
                  .fontSize($r('app.float.little_text_size'))
                  .margin({top:$r('app.float.home_list_margin')})
                  .fontColor($r('app.color.home_grid_fontColor'))
              }.width(CommonConstants.FULL_PARENT)
              .alignItems(HorizontalAlign.Start)

            }
            .padding({top:$r('app.float.home_list_padding'),left:$r('app.float.home_list_padding')})
            .borderRadius($r('app.float.home_backgroundImage_borderRadius'))
            .align(Alignment.TopStart)
            .backgroundImage(item.img)
            .backgroundImageSize(ImageSize.Cover)
            .width(CommonConstants.FULL_PARENT)
            .height(CommonConstants.FULL_PARENT)
          })
        }.columnsTemplate('1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap($r('app.float.home_grid_columnsGap'))
        .rowsGap($r('app.float.home_grid_rowGap'))
        .width(CommonConstants.FULL_PARENT)
        .height($r('app.float.home_secondGrid_height'))
        .backgroundColor(Color.White)
        .margin({bottom:$r('app.float.home_secondGrid_margin')})

      }
    }
    .height(CommonConstants.FULL_PARENT)

  }
}