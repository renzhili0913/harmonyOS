/**
 * 登录页面
 * */
import prompt from '@system.prompt'
import router from '@ohos.router'
import CommonConstants from '../common/constants/CommonConstants'
@Extend(TextInput)
function inputStyle(){
  .placeholderColor($r('app.color.placeholder_color'))
  .height($r('app.float.login_input_height'))
  .fontSize($r('app.float.big_text_size'))
  .backgroundColor($r('app.color.background'))
  .width(CommonConstants.FULL_PARENT)
  .padding({left:CommonConstants.INPUT_PADDING_LEFT})
  .margin({top:$r('app.float.input_margin_top')})
}
@Extend(Line)
function lineStyle(){
  .width(CommonConstants.FULL_PARENT)
  .height($r('app.float.line_height'))
  .backgroundColor($r('app.color.line_color'))
}
@Extend(Text)
function blueTextStyle(){
  .fontSize($r('app.float.small_text_size'))
  .fontColor($r('app.color.login_blue_text_color'))
  .fontWeight(FontWeight.Medium)
}
@Entry
@Component
struct LoginIndex {
  @State account: string = ''
  @State password: string = ''
  @State isShowProgress: boolean = false
  private timeOutId:number = -1
  login(){
    if (this.account === '' || this.password === '') {
      prompt.showToast({
        message:'输入不能为空'
      })
    }else{
      this.isShowProgress = true
      if (this.timeOutId === -1){
        this.timeOutId = setTimeout(()=>{
          this.isShowProgress = false
          clearTimeout(this.timeOutId)
          this.timeOutId = -1
          router.pushUrl({
            url:'pages/Index',
            params:{
              sendMsg:this.account
            }
          })
        },CommonConstants.LOGIN_DELAY_TIME)
      }
    }
  }
  @Builder imageButton(image:ResourceStr){
    Button({type:ButtonType.Circle,stateEffect:true}){
      Image(image)
    }
    .width($r('app.float.other_login_image_size'))
    .height($r('app.float.other_login_image_size'))
    .backgroundColor($r('app.color.background'))
  }
  build() {
      Column() {
        Image($r('app.media.logo'))
          .width($r('app.float.logo_image_size'))
          .height($r('app.float.logo_image_size'))
          .margin({
            top:$r('app.float.logo_margin_top'),
            bottom:$r('app.float.logo_margin_bottom')
          })
        Text($r('app.string.login_page'))
          .fontSize($r('app.float.page_title_text_size'))
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.title_text_color'))
        Text($r('app.string.login_more'))
          .fontSize($r('app.float.normal_text_size'))
          .fontColor($r('app.color.login_more_text_color'))
          .margin({
            top:$r('app.float.login_more_margin_top'),
            bottom:$r('app.float.login_more_margin_bottom')
          })
        TextInput({placeholder:$r('app.string.account')})
          .inputStyle()
          .maxLength(CommonConstants.INPUT_ACCOUNT_LENGTH)
          .type(InputType.Number)
          .onChange(value=>{
            this.account = value
          })
        Line().lineStyle()
        TextInput({placeholder:$r('app.string.password')})
          .inputStyle()
          .maxLength(CommonConstants.INPUT_PASSWORD_LENGTH)
          .type(InputType.Password)
          .onChange(value=>{
            this.password = value
          })
        Line().lineStyle()
        Row(){
          Text($r('app.string.message_login')).blueTextStyle()
          Text($r('app.string.forgot_password')).blueTextStyle()
        }.justifyContent(FlexAlign.SpaceBetween)
        .width(CommonConstants.FULL_PARENT)
        .margin($r('app.float.forgot_margin_top'))
        Button($r('app.string.login'))
          .type(ButtonType.Capsule)
          .width(CommonConstants.BUTTON_WIDTH)
          .height($r('app.float.login_button_height'))
          .fontSize($r('app.float.normal_text_size'))
          .fontColor($r('app.color.white'))
          .fontWeight(FontWeight.Medium)
          .backgroundColor($r('app.color.login_button_color'))
          .margin({
            top:$r('app.float.login_button_margin_top'),
            bottom:$r('app.float.login_button_margin_bottom')
          })
          .onClick(()=>{
              this.login()
          })
        Text($r('app.string.register_account'))
          .fontSize($r('app.float.normal_text_size'))
          .fontColor($r('app.color.login_blue_text_color'))
          .fontWeight(FontWeight.Medium)

        if (this.isShowProgress){
            LoadingProgress()
              .color($r('app.color.loading_color'))
              .width($r('app.float.login_progress_size'))
              .height($r('app.float.login_progress_size'))
              .margin({top:$r('app.float.login_progress_margin_top')})
        }

        Blank()
        Text($r('app.string.other_login_method'))
          .fontSize($r('app.float.little_text_size'))
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.other_login_text_color'))
          .margin({top:$r('app.float.other_login_margin_top'),
            bottom:$r('app.float.other_login_margin_bottom')})

        Row({space:CommonConstants.LOGIN_METHODS_SPACE}){
          this.imageButton($r('app.media.login_method1'))
          this.imageButton($r('app.media.login_method2'))
          this.imageButton($r('app.media.login_method3'))
        }.justifyContent(FlexAlign.Center)

      }
      .width(CommonConstants.FULL_PARENT)
      .height(CommonConstants.FULL_PARENT)
    .backgroundColor($r('app.color.background'))
    .padding({
      left:$r('app.float.page_padding_hor'),
      right:$r('app.float.page_padding_hor'),
      bottom:$r('app.float.login_page_padding_bottom')
    })
  }
}