.class Lcom/cocosw/bottomsheet/TranslucentHelper;
.super Ljava/lang/Object;
.source "TranslucentHelper.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation


# static fields
.field private static final NAV_BAR_HEIGHT_LANDSCAPE_RES_NAME:Ljava/lang/String; = "navigation_bar_height_landscape"

.field private static final NAV_BAR_HEIGHT_RES_NAME:Ljava/lang/String; = "navigation_bar_height"

.field private static final SHOW_NAV_BAR_RES_NAME:Ljava/lang/String; = "config_showNavigationBar"

.field private static final STATUS_BAR_HEIGHT_RES_NAME:Ljava/lang/String; = "status_bar_height"


# instance fields
.field private final dialog:Landroid/app/Dialog;

.field private mInPortrait:Z

.field mNavBarAvailable:Z

.field private mSmallestWidthDp:F

.field mStatusBarHeight:I

.field private sNavBarOverride:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/app/Dialog;Landroid/content/Context;)V
    .registers 15
    .param p1, "dialog"    # Landroid/app/Dialog;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->dialog:Landroid/app/Dialog;

    .line 40
    const-string v8, "window"

    invoke-virtual {p2, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/WindowManager;

    .line 41
    .local v7, "wm":Landroid/view/WindowManager;
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v8

    iget v8, v8, Landroid/content/res/Configuration;->orientation:I

    const/4 v9, 0x1

    if-ne v8, v9, :cond_8e

    const/4 v8, 0x1

    :goto_1b
    iput-boolean v8, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->mInPortrait:Z

    .line 43
    :try_start_1d
    const-string v8, "android.os.SystemProperties"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 44
    .local v3, "c":Ljava/lang/Class;
    const-string v8, "get"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Class;

    const/4 v10, 0x0

    const-class v11, Ljava/lang/String;

    aput-object v11, v9, v10

    invoke-virtual {v3, v8, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 45
    .local v5, "m":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 46
    const/4 v8, 0x0

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string v11, "qemu.hw.mainkeys"

    aput-object v11, v9, v10

    invoke-virtual {v5, v8, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    iput-object v8, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->sNavBarOverride:Ljava/lang/String;
    :try_end_46
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_46} :catch_90

    .line 52
    .end local v3    # "c":Ljava/lang/Class;
    .end local v5    # "m":Ljava/lang/reflect/Method;
    :goto_46
    const/4 v8, 0x1

    new-array v1, v8, [I

    const/4 v8, 0x0

    const v9, 0x10103f0

    aput v9, v1, v8

    .line 53
    .local v1, "as":[I
    invoke-virtual {p2, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 55
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v8, 0x0

    const/4 v9, 0x0

    :try_start_55
    invoke-virtual {v0, v8, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v8

    iput-boolean v8, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->mNavBarAvailable:Z
    :try_end_5b
    .catchall {:try_start_55 .. :try_end_5b} :catchall_95

    .line 57
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    move-object v8, p2

    .line 61
    check-cast v8, Landroid/app/Activity;

    invoke-virtual {v8}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v6

    .line 63
    .local v6, "winParams":Landroid/view/WindowManager$LayoutParams;
    const/high16 v2, 0x8000000

    .line 64
    .local v2, "bits":I
    iget v8, v6, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/2addr v8, v2

    if-eqz v8, :cond_73

    .line 65
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->mNavBarAvailable:Z

    .line 68
    :cond_73
    invoke-direct {p0, v7}, Lcom/cocosw/bottomsheet/TranslucentHelper;->getSmallestWidthDp(Landroid/view/WindowManager;)F

    move-result v8

    iput v8, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->mSmallestWidthDp:F

    .line 69
    iget-boolean v8, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->mNavBarAvailable:Z

    if-eqz v8, :cond_81

    .line 70
    const/4 v8, 0x1

    invoke-direct {p0, v8}, Lcom/cocosw/bottomsheet/TranslucentHelper;->setTranslucentStatus(Z)V

    .line 71
    :cond_81
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const-string v9, "status_bar_height"

    invoke-direct {p0, v8, v9}, Lcom/cocosw/bottomsheet/TranslucentHelper;->getInternalDimensionSize(Landroid/content/res/Resources;Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->mStatusBarHeight:I

    .line 72
    return-void

    .line 41
    .end local v0    # "a":Landroid/content/res/TypedArray;
    .end local v1    # "as":[I
    .end local v2    # "bits":I
    .end local v6    # "winParams":Landroid/view/WindowManager$LayoutParams;
    :cond_8e
    const/4 v8, 0x0

    goto :goto_1b

    .line 47
    :catch_90
    move-exception v4

    .line 48
    .local v4, "e":Ljava/lang/Throwable;
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->sNavBarOverride:Ljava/lang/String;

    goto :goto_46

    .line 57
    .end local v4    # "e":Ljava/lang/Throwable;
    .restart local v0    # "a":Landroid/content/res/TypedArray;
    .restart local v1    # "as":[I
    :catchall_95
    move-exception v8

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v8
.end method

.method private getInternalDimensionSize(Landroid/content/res/Resources;Ljava/lang/String;)I
    .registers 7
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 141
    const/4 v1, 0x0

    .line 142
    .local v1, "result":I
    const-string v2, "dimen"

    const-string v3, "android"

    invoke-virtual {p1, p2, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 143
    .local v0, "resourceId":I
    if-lez v0, :cond_f

    .line 144
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 146
    :cond_f
    return v1
.end method

.method private getSmallestWidthDp(Landroid/view/WindowManager;)F
    .registers 7
    .param p1, "wm"    # Landroid/view/WindowManager;

    .prologue
    .line 92
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 93
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x10

    if-lt v3, v4, :cond_25

    .line 94
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 99
    :goto_12
    iget v3, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v3, v3

    iget v4, v1, Landroid/util/DisplayMetrics;->density:F

    div-float v2, v3, v4

    .line 100
    .local v2, "widthDp":F
    iget v3, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v3, v3

    iget v4, v1, Landroid/util/DisplayMetrics;->density:F

    div-float v0, v3, v4

    .line 101
    .local v0, "heightDp":F
    invoke-static {v2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v3

    return v3

    .line 97
    .end local v0    # "heightDp":F
    .end local v2    # "widthDp":F
    :cond_25
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    goto :goto_12
.end method

.method private hasNavBar(Landroid/content/Context;)Z
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 124
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 125
    .local v1, "res":Landroid/content/res/Resources;
    const-string v3, "config_showNavigationBar"

    const-string v4, "bool"

    const-string v5, "android"

    invoke-virtual {v1, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 126
    .local v2, "resourceId":I
    if-eqz v2, :cond_2c

    .line 127
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    .line 129
    .local v0, "hasNav":Z
    const-string v3, "1"

    iget-object v4, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->sNavBarOverride:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_20

    .line 130
    const/4 v0, 0x0

    .line 136
    .end local v0    # "hasNav":Z
    :cond_1f
    :goto_1f
    return v0

    .line 131
    .restart local v0    # "hasNav":Z
    :cond_20
    const-string v3, "0"

    iget-object v4, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->sNavBarOverride:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 132
    const/4 v0, 0x1

    goto :goto_1f

    .line 136
    .end local v0    # "hasNav":Z
    :cond_2c
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->hasPermanentMenuKey()Z

    move-result v3

    if-nez v3, :cond_39

    const/4 v3, 0x1

    :goto_37
    move v0, v3

    goto :goto_1f

    :cond_39
    const/4 v3, 0x0

    goto :goto_37
.end method

.method private isNavigationAtBottom()Z
    .registers 3

    .prologue
    .line 157
    iget v0, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->mSmallestWidthDp:F

    const/high16 v1, 0x44160000    # 600.0f

    cmpl-float v0, v0, v1

    if-gez v0, :cond_c

    iget-boolean v0, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->mInPortrait:Z

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private setTranslucentStatus(Z)V
    .registers 8
    .param p1, "on"    # Z

    .prologue
    const/high16 v5, 0x8000000

    .line 76
    iget-object v3, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->dialog:Landroid/app/Dialog;

    invoke-virtual {v3}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 77
    .local v1, "win":Landroid/view/Window;
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 78
    .local v2, "winParams":Landroid/view/WindowManager$LayoutParams;
    const/high16 v0, 0x4000000

    .line 79
    .local v0, "bits":I
    if-eqz p1, :cond_1e

    .line 80
    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v4, 0x4000000

    or-int/2addr v3, v4

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 85
    :goto_17
    invoke-virtual {v1, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 87
    invoke-virtual {v1, v5, v5}, Landroid/view/Window;->setFlags(II)V

    .line 89
    return-void

    .line 82
    :cond_1e
    iget v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    const v4, -0x4000001

    and-int/2addr v3, v4

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    goto :goto_17
.end method


# virtual methods
.method getNavigationBarHeight(Landroid/content/Context;)I
    .registers 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 105
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 106
    .local v1, "res":Landroid/content/res/Resources;
    const/4 v2, 0x0

    .line 107
    .local v2, "result":I
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-lt v3, v4, :cond_1b

    .line 108
    invoke-direct {p0, p1}, Lcom/cocosw/bottomsheet/TranslucentHelper;->hasNavBar(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 110
    iget-boolean v3, p0, Lcom/cocosw/bottomsheet/TranslucentHelper;->mInPortrait:Z

    if-eqz v3, :cond_1c

    .line 111
    const-string v0, "navigation_bar_height"

    .line 117
    .local v0, "key":Ljava/lang/String;
    :goto_17
    invoke-direct {p0, v1, v0}, Lcom/cocosw/bottomsheet/TranslucentHelper;->getInternalDimensionSize(Landroid/content/res/Resources;Ljava/lang/String;)I

    move-result v2

    .line 120
    .end local v0    # "key":Ljava/lang/String;
    .end local v2    # "result":I
    :cond_1b
    :goto_1b
    return v2

    .line 113
    .restart local v2    # "result":I
    :cond_1c
    invoke-direct {p0}, Lcom/cocosw/bottomsheet/TranslucentHelper;->isNavigationAtBottom()Z

    move-result v3

    if-nez v3, :cond_24

    .line 114
    const/4 v2, 0x0

    goto :goto_1b

    .line 115
    :cond_24
    const-string v0, "navigation_bar_height_landscape"

    .restart local v0    # "key":Ljava/lang/String;
    goto :goto_17
.end method
