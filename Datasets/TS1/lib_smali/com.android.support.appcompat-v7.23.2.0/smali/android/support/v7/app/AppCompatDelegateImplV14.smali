.class Landroid/support/v7/app/AppCompatDelegateImplV14;
.super Landroid/support/v7/app/AppCompatDelegateImplV11;
.source "AppCompatDelegateImplV14.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/app/AppCompatDelegateImplV14$AppCompatWindowCallbackV14;
    }
.end annotation


# static fields
.field private static final KEY_LOCAL_NIGHT_MODE:Ljava/lang/String; = "appcompat:local_night_mode"

.field private static sTwilightManager:Landroid/support/v7/app/TwilightManager;


# instance fields
.field private mApplyDayNightCalled:Z

.field private mHandleNativeActionModes:Z

.field private mLocalNightMode:I


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/view/Window;Landroid/support/v7/app/AppCompatCallback;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "window"    # Landroid/view/Window;
    .param p3, "callback"    # Landroid/support/v7/app/AppCompatCallback;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/app/AppCompatDelegateImplV11;-><init>(Landroid/content/Context;Landroid/view/Window;Landroid/support/v7/app/AppCompatCallback;)V

    .line 35
    const/16 v0, -0x64

    iput v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mLocalNightMode:I

    .line 39
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mHandleNativeActionModes:Z

    .line 43
    return-void
.end method

.method private getNightModeToApply()I
    .registers 3

    .prologue
    .line 139
    iget v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mLocalNightMode:I

    const/16 v1, -0x64

    if-ne v0, v1, :cond_f

    invoke-static {}, Landroid/support/v7/app/AppCompatDelegateImplV14;->getDefaultNightMode()I

    move-result v0

    :goto_a
    invoke-direct {p0, v0}, Landroid/support/v7/app/AppCompatDelegateImplV14;->mapNightModeToYesNo(I)I

    move-result v0

    return v0

    :cond_f
    iget v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mLocalNightMode:I

    goto :goto_a
.end method

.method private getTwilightManager()Landroid/support/v7/app/TwilightManager;
    .registers 3

    .prologue
    .line 172
    sget-object v0, Landroid/support/v7/app/AppCompatDelegateImplV14;->sTwilightManager:Landroid/support/v7/app/TwilightManager;

    if-nez v0, :cond_11

    .line 173
    new-instance v0, Landroid/support/v7/app/TwilightManager;

    iget-object v1, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/app/TwilightManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Landroid/support/v7/app/AppCompatDelegateImplV14;->sTwilightManager:Landroid/support/v7/app/TwilightManager;

    .line 175
    :cond_11
    sget-object v0, Landroid/support/v7/app/AppCompatDelegateImplV14;->sTwilightManager:Landroid/support/v7/app/TwilightManager;

    return-object v0
.end method

.method private mapNightModeToYesNo(I)I
    .registers 7
    .param p1, "mode"    # I

    .prologue
    const/4 v1, 0x2

    const/4 v2, 0x1

    .line 104
    packed-switch p1, :pswitch_data_28

    :pswitch_5
    move v1, v2

    .line 123
    :cond_6
    :goto_6
    :pswitch_6
    return v1

    .line 106
    :pswitch_7
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatDelegateImplV14;->getTwilightManager()Landroid/support/v7/app/TwilightManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v7/app/TwilightManager;->isNight()Z

    move-result v3

    if-nez v3, :cond_6

    move v1, v2

    goto :goto_6

    .line 108
    :pswitch_13
    iget-object v3, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mContext:Landroid/content/Context;

    const-string v4, "uimode"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/UiModeManager;

    .line 110
    .local v0, "uiModeManager":Landroid/app/UiModeManager;
    invoke-virtual {v0}, Landroid/app/UiModeManager;->getNightMode()I

    move-result v3

    packed-switch v3, :pswitch_data_34

    :pswitch_24
    move v1, v2

    .line 117
    goto :goto_6

    .line 114
    :pswitch_26
    const/4 v1, 0x0

    goto :goto_6

    .line 104
    :pswitch_data_28
    .packed-switch -0x1
        :pswitch_13
        :pswitch_7
        :pswitch_5
        :pswitch_6
    .end packed-switch

    .line 110
    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_26
        :pswitch_24
        :pswitch_6
    .end packed-switch
.end method

.method private updateConfigurationForNightMode(I)Z
    .registers 7
    .param p1, "mode"    # I

    .prologue
    .line 149
    iget-object v4, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 150
    .local v3, "res":Landroid/content/res/Resources;
    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 151
    .local v0, "conf":Landroid/content/res/Configuration;
    iget v4, v0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v1, v4, 0x30

    .line 153
    .local v1, "currentNightMode":I
    const/4 v2, 0x0

    .line 154
    .local v2, "newNightMode":I
    packed-switch p1, :pswitch_data_2c

    .line 163
    :goto_12
    if-eq v1, v2, :cond_2a

    .line 164
    iget v4, v0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v4, v4, -0x31

    or-int/2addr v4, v2

    iput v4, v0, Landroid/content/res/Configuration;->uiMode:I

    .line 165
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 166
    const/4 v4, 0x1

    .line 168
    :goto_23
    return v4

    .line 156
    :pswitch_24
    const/16 v2, 0x10

    .line 157
    goto :goto_12

    .line 159
    :pswitch_27
    const/16 v2, 0x20

    goto :goto_12

    .line 168
    :cond_2a
    const/4 v4, 0x0

    goto :goto_23

    .line 154
    :pswitch_data_2c
    .packed-switch 0x1
        :pswitch_24
        :pswitch_27
    .end packed-switch
.end method


# virtual methods
.method public applyDayNight()Z
    .registers 2

    .prologue
    .line 76
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mApplyDayNightCalled:Z

    .line 77
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatDelegateImplV14;->getNightModeToApply()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/app/AppCompatDelegateImplV14;->updateConfigurationForNightMode(I)Z

    move-result v0

    return v0
.end method

.method public isHandleNativeActionModesEnabled()Z
    .registers 2

    .prologue
    .line 71
    iget-boolean v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mHandleNativeActionModes:Z

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v1, -0x64

    .line 47
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatDelegateImplV11;->onCreate(Landroid/os/Bundle;)V

    .line 49
    if-eqz p1, :cond_13

    iget v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mLocalNightMode:I

    if-ne v0, v1, :cond_13

    .line 52
    const-string v0, "appcompat:local_night_mode"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mLocalNightMode:I

    .line 55
    :cond_13
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 129
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatDelegateImplV11;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 131
    iget v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mLocalNightMode:I

    const/16 v1, -0x64

    if-eq v0, v1, :cond_10

    .line 133
    const-string v0, "appcompat:local_night_mode"

    iget v1, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mLocalNightMode:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 135
    :cond_10
    return-void
.end method

.method public setHandleNativeActionModesEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 66
    iput-boolean p1, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mHandleNativeActionModes:Z

    .line 67
    return-void
.end method

.method public setLocalNightMode(I)V
    .registers 4
    .param p1, "mode"    # I

    .prologue
    .line 82
    packed-switch p1, :pswitch_data_1a

    .line 97
    const-string v0, "AppCompatDelegate"

    const-string v1, "setLocalNightMode() called with an unknown mode"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    :cond_a
    :goto_a
    return-void

    .line 87
    :pswitch_b
    iget v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mLocalNightMode:I

    if-eq v0, p1, :cond_a

    .line 88
    iput p1, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mLocalNightMode:I

    .line 89
    iget-boolean v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV14;->mApplyDayNightCalled:Z

    if-eqz v0, :cond_a

    .line 92
    invoke-virtual {p0}, Landroid/support/v7/app/AppCompatDelegateImplV14;->applyDayNight()Z

    goto :goto_a

    .line 82
    nop

    :pswitch_data_1a
    .packed-switch -0x1
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
    .end packed-switch
.end method

.method wrapWindowCallback(Landroid/view/Window$Callback;)Landroid/view/Window$Callback;
    .registers 3
    .param p1, "callback"    # Landroid/view/Window$Callback;

    .prologue
    .line 61
    new-instance v0, Landroid/support/v7/app/AppCompatDelegateImplV14$AppCompatWindowCallbackV14;

    invoke-direct {v0, p0, p1}, Landroid/support/v7/app/AppCompatDelegateImplV14$AppCompatWindowCallbackV14;-><init>(Landroid/support/v7/app/AppCompatDelegateImplV14;Landroid/view/Window$Callback;)V

    return-object v0
.end method
