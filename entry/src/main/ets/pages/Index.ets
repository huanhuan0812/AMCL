@Entry
@Component
struct VerticalTabExample {
  @State currentIndex: number = 0

  build() {
    Row() {
      // 侧边 Tab 栏
      Column() {
        ForEach([0, 1, 2], (index: number) => {
          this.SideTabItem('Tab ' + (index + 1), index)
        })
      }
      .width(120)
      .height('100%')
      .backgroundColor('#F5F5F5')
      .padding({ top: 20 })

      // 内容区域
      Column() {
        if (this.currentIndex === 0) {
          this.Tab1Content()
        } else if (this.currentIndex === 1) {
          this.Tab2Content()
        } else {
          this.Tab3Content()
        }
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }

  @Builder SideTabItem(text: string, index: number) {
    Row() {
      Image(this.currentIndex === index ? 'selected_icon.png' : 'normal_icon.png')
        .width(20)
        .height(20)
        .margin({ right: 10 })

      Text(text)
        .fontSize(16)
        .fontColor(this.currentIndex === index ? '#007DFF' : '#333333')
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
  }

  @Builder Tab1Content() {
    Column() {
      Text('首页内容')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder Tab2Content() {
    Column() {
      Text('分类内容')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder Tab3Content() {
    Column() {
      Text('我的内容')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}