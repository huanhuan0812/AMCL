import Account from "../type/types"

export default  class GlobalValue {
    private static instance: GlobalValue;

  private currentAccount : Account = new Account('','')

    private currentAvatar : Resource | null = $r('app.media.steve_avater')
    private backGroundImage : Resource | null = $r('app.media.launcher_background_light')
    private currentGameVersion : string = '1.8.9'

    private constructor() {} // 单例
    static getInstance(): GlobalValue {
        if (!GlobalValue.instance) {
            GlobalValue.instance = new GlobalValue();
        }
        return GlobalValue.instance;
    }

    public setCurrentAccount(account: Account) : void{
        this.currentAccount = account
    }
    public getCurrentAccount(): Account {
        return this.currentAccount
    }
    public setCurrentAvatar(avatar: Resource | null) : void{
        this.currentAvatar = avatar
    }
    public getCurrentAvatar(): Resource | null {
        return this.currentAvatar
    }

    public setCurrentGameVersion(version: string) : void{
        this.currentGameVersion = version
    }

    public getCurrentGameVersion(): string {
        return this.currentGameVersion
    }
}