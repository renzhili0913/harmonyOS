
import CommonConstants from '../common/constants/CommonConstants'
import ItemData from '../viewmodel/ItemData'
import MainViewModel from '../viewmodel/MainViewModel'

@Component
export default struct MySetting {
  @Prop account: string

  @Builder settingCell(item: ItemData) {
    Row({ space: CommonConstants.COMMON_SPACE }) {
      Image(item.img)
        .width($r('app.float.setting_size'))
        .height($r('app.float.setting_size'))
      Text(item.title)
        .fontSize($r('app.float.normal_text_size'))
      Blank()
      if (item.others) {
        Toggle({ type: ToggleType.Switch, isOn: false })
      } else {
        Image($r('app.media.right_grey'))
          .width($r('app.float.setting_jump_width'))
          .height($r('app.float.setting_jump_height'))
      }
    }.width(CommonConstants.FULL_PARENT)
    .padding({
      left: $r('app.float.setting_settingCell_left'),
      right: $r('app.float.setting_settingCell_right')
    })
  }

  build() {
    Scroll() {
      Column({ space: CommonConstants.COMMON_SPACE }) {
        Column() {
          Text($r('app.string.mainPage_tabTitles_mine'))
            .fontWeight(FontWeight.Medium)
            .fontSize($r('app.float.page_title_text_size'))
            .margin({ top: $r('app.float.mainPage_tabTitles_margin') })
            .padding({ left: $r('app.float.mainPage_tabTitles_padding') })
        }
        .width(CommonConstants.FULL_PARENT)
        .alignItems(HorizontalAlign.Start)

        Row() {
          Image($r('app.media.account'))
            .width($r('app.float.setting_account_size'))
            .height($r('app.float.setting_account_size'))
          Column() {
            Text($r('app.string.setting_account_name'))
              .fontSize($r('app.float.setting_account_fontSize'))
            Text(this.account.toString())
              .fontSize($r('app.float.little_text_size'))
              .margin({ top: $r('app.float.setting_name_margin') })
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: $r('app.float.setting_account_margin') })
        }
        .width(CommonConstants.FULL_PARENT)
        .margin({ top: $r('app.float.setting_account_margin') })
        .alignItems(VerticalAlign.Center)
        .height($r('app.float.setting_account_height'))
        .backgroundColor(Color.White)
        .padding({ left: $r('app.float.setting_account_padding') })
        .borderRadius($r('app.float.setting_account_borderRadius'))

        List() {
          ForEach(MainViewModel.getSettingListData(), (item) => {
            ListItem() {
              this.settingCell(item)
            }.height($r('app.float.setting_list_height'))
          })
        }
        .backgroundColor(Color.White)
        .width(CommonConstants.FULL_PARENT)
        //.height(CommonConstants.SET_LIST_WIDTH)
        .divider({
          strokeWidth: $r('app.float.setting_list_strokeWidth'),
          color: Color.Gray,
          startMargin: $r('app.float.setting_list_startMargin'),
          endMargin: $r('app.float.setting_list_endMargin')
        })
        .borderRadius($r('app.float.setting_list_borderRadius'))
        .padding({
          top: $r('app.float.setting_list_padding'),
          bottom: $r('app.float.setting_list_padding')
        })

        Blank()
        Button($r('app.string.setting_button'))
          .type(ButtonType.Capsule)
          .width(CommonConstants.BUTTON_WIDTH)
          .fontSize($r('app.float.normal_text_size'))
          .fontColor($r('app.color.setting_button_fontColor'))
          .backgroundColor($r('app.color.setting_button_backgroundColor'))
          .margin({ bottom: $r('app.float.setting_button_bottom') })
          .fontWeight(FontWeight.Medium)
      }
    }.height(CommonConstants.FULL_PARENT)

  }
}