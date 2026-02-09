import HomePage from  "./homePage"
import GameSettingsPage from "./gameSettingsPage"
import GameListPage from "./gameListPage"
import DownloadPage from "./downloadPage"
import LauncherSettingsPage from "./launcherSettingsPage"

@Entry
@Component
struct VerticalTabExample {
  @State currentIndex: number = 0

  build() {
    Row() {
      // 侧边 Tab 栏
      Column() {
        this.SideTabItem("主页面" ,'app.media.home' , 0)
        this.SideTabItem("游戏设置", 'app.media.tool', 1)
        this.SideTabItem("游戏列表",'app.media.list', 2)
        this.SideTabItem("下载",'app.media.download', 3)
        this.SideTabItem("启动器设置",'app.media.settings', 4)
      }
      .width(60)
      .height('100%')
      .backgroundColor('#F5F5F5')
      .padding({ top: 20 })

      // 内容区域
      Column() {
        if (this.currentIndex === 0) {
          HomePage()
        } else if (this.currentIndex === 1) {
          GameSettingsPage()
        } else if (this.currentIndex === 2) {
          GameListPage()
        } else if (this.currentIndex === 3) {
          DownloadPage()
        } else{
          LauncherSettingsPage()
        }
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }

  @Builder SideTabItem(text: string, icon: string , index: number) {
    Row() {
      Image($r(icon))
        .width(20)
        .height(20)
        .margin({ right: 10 })
        .autoResize(true)
    }
    .width('100%')
    .height(60)
    .padding({ left: 20 })
    .backgroundColor(this.currentIndex === index ? '#E6F2FF' : 'transparent')
    .borderRadius(8)
    .justifyContent(FlexAlign.Start)
    .alignItems(VerticalAlign.Center)
    .onClick(() => {
      this.currentIndex = index
    })
    .bindTips(text,{
      appearingTime: 700,
      disappearingTime: 300,
      appearingTimeWithContinuousOperation: 300,
      disappearingTimeWithContinuousOperation: 0,
      enableArrow: true
    })
  }
}