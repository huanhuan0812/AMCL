import GlobslValue from "../global/globalValue";



@Entry
@Component
export default struct HomePage {
    @State message: string = '主界面';
    @State globalValue : GlobslValue = GlobslValue.getInstance();

    build() {
        RelativeContainer() {
            Column({space: 20}){
                Text(this.message)
                .fontSize(20)

                Image(this.globalValue.getCurrentAvatar())
                    .height('20%')
                    .width('40%')
                    .alignRules({
                        center: { anchor: '__container__', align: VerticalAlign.Center },
                    })

                Text("游戏版本:")
                    .fontSize(15)
                Text(this.globalValue.getCurrentGameVersion())
                    .fontSize(10)

                Button('启动游戏\n')
                    .height('20%')
                    .width("90")
                    .fontColor(Color.Black)
                    .backgroundColor("#EeEeEe")
                    .borderColor(Color.Black)
                    .borderWidth(1)
                    .alignRules({
                        bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
                    })

            }
            .id('mainContainer')
            .height('95%')
            .width('20%')
            .alignRules({
                center: { anchor: '__container__', align: VerticalAlign.Center },
                right: { anchor: '__container__', align: HorizontalAlign.End }
            })
        }
        .height('100%')
        .width('100%')
    }
}