import HomePage from  "./homePage"
import GameSettingsPage from "./gameSettingsPage"
import GameListPage from "./gameListPage"
import DownloadPage from "./downloadPage"
import LauncherSettingsPage from "./launcherSettingsPage"
import { deviceInfo } from "@kit.BasicServicesKit"
import { display } from "@kit.ArkUI"

interface TabItem {
    text: string;
    icon: Resource;
}

@Entry
@Component
struct VerticalTabExample {
    @State currentIndex: number = 0
    private screen: display.Display | null = null;

    onPageShow(): void {
        try {
            this.screen  = display.getPrimaryDisplaySync()
        } catch (exception) {

        }
    }

    private tabItem: TabItem[] = [
        {
            text: "主页面",
            icon: $r("app.media.home")
        },
        {
            text: "游戏设置",
            icon: $r("app.media.tool")
        },
        {
            text: "游戏列表",
            icon: $r("app.media.list")
        },
        {
            text: "下载",
            icon: $r("app.media.download")
        },
        {
            text: "启动器设置",
            icon: $r("app.media.settings")
        }
    ]


    build() {
        Column(){
            Tabs({barPosition: BarPosition.Start,index: this.currentIndex}){
                ForEach(this.tabItem, (item: TabItem, index: number) => {
                    TabContent(){
                        this.TabContent(index)
                    }
                    .tabBar(this.IconTabBar(item, index))
                })
            }
            .vertical(true)
            .scrollable(false)
            //.backgroundImage($r("app.media.launcher_background_light"))
        }
        // .backgroundImage($r("app.media.launcher_background_light"))
        // .backgroundImagePosition({x: 0, y: 0})
    }

    @Builder
    IconTabBar(item: TabItem, index: number) {
        Column() {
            // 图标
            Image(item.icon)
                .width(24)
                .height(24)
                //.fillColor(this.currentIndex===index?"#00BFFF":Color.Transparent)
                //.backgroundColor(this.currentIndex===index?"#00BFFF":Color.Transparent)
        }
        .height(70)
        .justifyContent(FlexAlign.Center)
        .bindTips(item.text)
        .onHover((hovering) => {
            this.bindPopup(hovering, {
                message: item.text,
            })
        })
        .onClick(() => {
            this.currentIndex = index
        })

    }

    @Builder
    TabContent(index: number) {
        Column() {
            if (index === 0) {
                HomePage()
            }
            if (index === 1) {
                GameSettingsPage()
            }
            if (index === 2) {
                GameListPage()
            }
            if (index === 3) {
                DownloadPage()
            }
            if (index === 4) {
                LauncherSettingsPage()
            }
        }
    }
}