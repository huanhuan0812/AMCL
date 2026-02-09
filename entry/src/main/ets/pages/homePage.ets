@Entry
@Component
export default struct HomePage {
    @State message: string = '主界面';

    build() {
        RelativeContainer() {
            Text(this.message)
                .id('HomePageHelloWorld')
                .fontSize($r('app.float.page_text_font_size'))
                .fontWeight(FontWeight.Bold)
                .alignRules({
                    center: { anchor: '__container__', align: VerticalAlign.Center },
                    middle: { anchor: '__container__', align: HorizontalAlign.Center }
                })
                .onClick(() => {
                    this.message = 'Welcome';
                })
        }
        .height('100%')
        .width('100%')
    }
}