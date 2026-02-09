// 定义接口
export interface IAccount {
    uid: string
    name: string
}

export interface ILoader {
    type: string
    version: string
}

export interface IGameVersion {
    gameVersion: string
    loader: ILoader
    name: string
    startCmd: string
}

export interface ITheme{
    TextColor : number
    backgroundColor : number
}

export interface ILauncherTheme extends ITheme{

}

export interface ILauncherSettings{
    memory : number //mb
    theme : ILauncherTheme
}

// 实现类
export class Account implements IAccount {
    public uid: string;
    public name: string;

    constructor(uid: string = "", name: string = "") {
        this.uid = uid;
        this.name = name;
    }
}

export class Loader implements ILoader {
    public type: string;
    public version: string;

    constructor(type: string = "", version: string = "") {
        this.type = type;
        this.version = version;
    }
}

export class GameVersion implements IGameVersion {
    public gameVersion: string;
    public loader: ILoader;
    public name: string;
    public startCmd: string;

    constructor(gameVersion: string = "1.0",
                loader: ILoader = new Loader(),
                name: string = "",
                startCmd: string = "") {
        this.gameVersion = gameVersion;
        this.loader = loader;
        this.name = name;
        this.startCmd = startCmd;
    }
}

export class LauncherTheme implements ILauncherTheme{
    public TextColor: number
    public backgroundColor: number
    constructor(textColor: number , backgroundColor : number) {
        this.TextColor=textColor
        this.backgroundColor=backgroundColor
    }
}

export class LauncherSettings implements ILauncherSettings{
    public memory: number //mb
    public theme: ILauncherTheme
    constructor(memory : number = 2048,
            theme : ILauncherTheme = new LauncherTheme(0x0 , 0xf0f0f0)) {
        this.memory = memory
        this.theme = theme
    }
}