.class public Lcom/rey/material/app/ThemeManager;
.super Ljava/lang/Object;
.source "ThemeManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;,
        Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;,
        Lcom/rey/material/app/ThemeManager$SimpleDispatcher;,
        Lcom/rey/material/app/ThemeManager$EventDispatcher;
    }
.end annotation


# static fields
.field private static final KEY_THEME:Ljava/lang/String; = "theme"

.field private static final PREF:Ljava/lang/String; = "theme.pref"

.field public static final THEME_UNDEFINED:I = -0x80000000

.field private static volatile mInstance:Lcom/rey/material/app/ThemeManager;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mCurrentTheme:I

.field private mDispatcher:Lcom/rey/material/app/ThemeManager$EventDispatcher;

.field private mStyles:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<[I>;"
        }
    .end annotation
.end field

.field private mThemeCount:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/rey/material/app/ThemeManager;->mStyles:Landroid/util/SparseArray;

    .line 264
    return-void
.end method

.method private dispatchThemeChanged(I)V
    .registers 3
    .param p1, "theme"    # I

    .prologue
    .line 123
    iget-object v0, p0, Lcom/rey/material/app/ThemeManager;->mDispatcher:Lcom/rey/material/app/ThemeManager$EventDispatcher;

    if-eqz v0, :cond_9

    .line 124
    iget-object v0, p0, Lcom/rey/material/app/ThemeManager;->mDispatcher:Lcom/rey/material/app/ThemeManager$EventDispatcher;

    invoke-interface {v0, p1}, Lcom/rey/material/app/ThemeManager$EventDispatcher;->dispatchThemeChanged(I)V

    .line 125
    :cond_9
    return-void
.end method

.method public static getInstance()Lcom/rey/material/app/ThemeManager;
    .registers 2

    .prologue
    .line 69
    sget-object v0, Lcom/rey/material/app/ThemeManager;->mInstance:Lcom/rey/material/app/ThemeManager;

    if-nez v0, :cond_13

    .line 70
    const-class v1, Lcom/rey/material/app/ThemeManager;

    monitor-enter v1

    .line 71
    :try_start_7
    sget-object v0, Lcom/rey/material/app/ThemeManager;->mInstance:Lcom/rey/material/app/ThemeManager;

    if-nez v0, :cond_12

    .line 72
    new-instance v0, Lcom/rey/material/app/ThemeManager;

    invoke-direct {v0}, Lcom/rey/material/app/ThemeManager;-><init>()V

    sput-object v0, Lcom/rey/material/app/ThemeManager;->mInstance:Lcom/rey/material/app/ThemeManager;

    .line 73
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 76
    :cond_13
    sget-object v0, Lcom/rey/material/app/ThemeManager;->mInstance:Lcom/rey/material/app/ThemeManager;

    return-object v0

    .line 73
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method

.method private getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 119
    if-nez p1, :cond_4

    const/4 v0, 0x0

    :goto_3
    return-object v0

    :cond_4
    const-string v0, "theme.pref"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    goto :goto_3
.end method

.method public static getStyleId(Landroid/content/Context;Landroid/util/AttributeSet;II)I
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyleAttr"    # I
    .param p3, "defStyleRes"    # I

    .prologue
    .line 46
    sget-object v2, Lcom/rey/material/R$styleable;->ThemableView:[I

    invoke-virtual {p0, p1, v2, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 47
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v2, Lcom/rey/material/R$styleable;->ThemableView_v_styleId:I

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 48
    .local v1, "styleId":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 50
    return v1
.end method

.method private getStyleList(I)[I
    .registers 4
    .param p1, "styleId"    # I

    .prologue
    .line 106
    iget-object v1, p0, Lcom/rey/material/app/ThemeManager;->mStyles:Landroid/util/SparseArray;

    if-nez v1, :cond_6

    .line 107
    const/4 v0, 0x0

    .line 115
    :cond_5
    :goto_5
    return-object v0

    .line 109
    :cond_6
    iget-object v1, p0, Lcom/rey/material/app/ThemeManager;->mStyles:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 110
    .local v0, "list":[I
    if-nez v0, :cond_5

    .line 111
    iget-object v1, p0, Lcom/rey/material/app/ThemeManager;->mContext:Landroid/content/Context;

    invoke-direct {p0, v1, p1}, Lcom/rey/material/app/ThemeManager;->loadStyleList(Landroid/content/Context;I)[I

    move-result-object v0

    .line 112
    iget-object v1, p0, Lcom/rey/material/app/ThemeManager;->mStyles:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_5
.end method

.method public static init(Landroid/content/Context;IILcom/rey/material/app/ThemeManager$EventDispatcher;)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "totalTheme"    # I
    .param p2, "defaultTheme"    # I
    .param p3, "dispatcher"    # Lcom/rey/material/app/ThemeManager$EventDispatcher;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 61
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/rey/material/app/ThemeManager;->setup(Landroid/content/Context;IILcom/rey/material/app/ThemeManager$EventDispatcher;)V

    .line 62
    return-void
.end method

.method private loadStyleList(Landroid/content/Context;I)[I
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resId"    # I

    .prologue
    .line 93
    if-nez p1, :cond_4

    .line 94
    const/4 v2, 0x0

    .line 102
    :goto_3
    return-object v2

    .line 96
    :cond_4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, p2}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 97
    .local v0, "array":Landroid/content/res/TypedArray;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->length()I

    move-result v3

    new-array v2, v3, [I

    .line 98
    .local v2, "result":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_13
    array-length v3, v2

    if-ge v1, v3, :cond_20

    .line 99
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    aput v3, v2, v1

    .line 98
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 100
    :cond_20
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_3
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Lcom/rey/material/app/ThemeManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getCurrentStyle(I)I
    .registers 3
    .param p1, "styleId"    # I

    .prologue
    .line 175
    iget v0, p0, Lcom/rey/material/app/ThemeManager;->mCurrentTheme:I

    invoke-virtual {p0, p1, v0}, Lcom/rey/material/app/ThemeManager;->getStyle(II)I

    move-result v0

    return v0
.end method

.method public getCurrentTheme()I
    .registers 2
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    .prologue
    .line 137
    iget v0, p0, Lcom/rey/material/app/ThemeManager;->mCurrentTheme:I

    return v0
.end method

.method public getStyle(II)I
    .registers 5
    .param p1, "styleId"    # I
    .param p2, "theme"    # I

    .prologue
    .line 185
    invoke-direct {p0, p1}, Lcom/rey/material/app/ThemeManager;->getStyleList(I)[I

    move-result-object v0

    .line 186
    .local v0, "styles":[I
    if-nez v0, :cond_8

    const/4 v1, 0x0

    :goto_7
    return v1

    :cond_8
    aget v1, v0, p2

    goto :goto_7
.end method

.method public getThemeCount()I
    .registers 2

    .prologue
    .line 166
    iget v0, p0, Lcom/rey/material/app/ThemeManager;->mThemeCount:I

    return v0
.end method

.method public registerOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 194
    iget-object v0, p0, Lcom/rey/material/app/ThemeManager;->mDispatcher:Lcom/rey/material/app/ThemeManager$EventDispatcher;

    if-eqz v0, :cond_9

    .line 195
    iget-object v0, p0, Lcom/rey/material/app/ThemeManager;->mDispatcher:Lcom/rey/material/app/ThemeManager$EventDispatcher;

    invoke-interface {v0, p1}, Lcom/rey/material/app/ThemeManager$EventDispatcher;->registerListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 196
    :cond_9
    return-void
.end method

.method public setCurrentTheme(I)Z
    .registers 6
    .param p1, "theme"    # I

    .prologue
    const/4 v1, 0x0

    .line 146
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    if-eq v2, v3, :cond_10

    .line 158
    :cond_f
    :goto_f
    return v1

    .line 149
    :cond_10
    iget v2, p0, Lcom/rey/material/app/ThemeManager;->mCurrentTheme:I

    if-eq v2, p1, :cond_f

    .line 150
    iput p1, p0, Lcom/rey/material/app/ThemeManager;->mCurrentTheme:I

    .line 151
    iget-object v1, p0, Lcom/rey/material/app/ThemeManager;->mContext:Landroid/content/Context;

    invoke-direct {p0, v1}, Lcom/rey/material/app/ThemeManager;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 152
    .local v0, "pref":Landroid/content/SharedPreferences;
    if-eqz v0, :cond_2d

    .line 153
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "theme"

    iget v3, p0, Lcom/rey/material/app/ThemeManager;->mCurrentTheme:I

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 154
    :cond_2d
    iget v1, p0, Lcom/rey/material/app/ThemeManager;->mCurrentTheme:I

    invoke-direct {p0, v1}, Lcom/rey/material/app/ThemeManager;->dispatchThemeChanged(I)V

    .line 155
    const/4 v1, 0x1

    goto :goto_f
.end method

.method protected setup(Landroid/content/Context;IILcom/rey/material/app/ThemeManager$EventDispatcher;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "totalTheme"    # I
    .param p3, "defaultTheme"    # I
    .param p4, "dispatcher"    # Lcom/rey/material/app/ThemeManager$EventDispatcher;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 80
    iput-object p1, p0, Lcom/rey/material/app/ThemeManager;->mContext:Landroid/content/Context;

    .line 81
    if-eqz p4, :cond_22

    .end local p4    # "dispatcher":Lcom/rey/material/app/ThemeManager$EventDispatcher;
    :goto_4
    iput-object p4, p0, Lcom/rey/material/app/ThemeManager;->mDispatcher:Lcom/rey/material/app/ThemeManager$EventDispatcher;

    .line 82
    iput p2, p0, Lcom/rey/material/app/ThemeManager;->mThemeCount:I

    .line 83
    iget-object v1, p0, Lcom/rey/material/app/ThemeManager;->mContext:Landroid/content/Context;

    invoke-direct {p0, v1}, Lcom/rey/material/app/ThemeManager;->getSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 84
    .local v0, "pref":Landroid/content/SharedPreferences;
    if-eqz v0, :cond_28

    .line 85
    const-string v1, "theme"

    invoke-interface {v0, v1, p3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/rey/material/app/ThemeManager;->mCurrentTheme:I

    .line 88
    :goto_18
    iget v1, p0, Lcom/rey/material/app/ThemeManager;->mCurrentTheme:I

    iget v2, p0, Lcom/rey/material/app/ThemeManager;->mThemeCount:I

    if-lt v1, v2, :cond_21

    .line 89
    invoke-virtual {p0, p3}, Lcom/rey/material/app/ThemeManager;->setCurrentTheme(I)Z

    .line 90
    :cond_21
    return-void

    .line 81
    .end local v0    # "pref":Landroid/content/SharedPreferences;
    .restart local p4    # "dispatcher":Lcom/rey/material/app/ThemeManager$EventDispatcher;
    :cond_22
    new-instance p4, Lcom/rey/material/app/ThemeManager$SimpleDispatcher;

    .end local p4    # "dispatcher":Lcom/rey/material/app/ThemeManager$EventDispatcher;
    invoke-direct {p4}, Lcom/rey/material/app/ThemeManager$SimpleDispatcher;-><init>()V

    goto :goto_4

    .line 87
    .restart local v0    # "pref":Landroid/content/SharedPreferences;
    :cond_28
    iput p3, p0, Lcom/rey/material/app/ThemeManager;->mCurrentTheme:I

    goto :goto_18
.end method

.method public unregisterOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 203
    iget-object v0, p0, Lcom/rey/material/app/ThemeManager;->mDispatcher:Lcom/rey/material/app/ThemeManager$EventDispatcher;

    if-eqz v0, :cond_9

    .line 204
    iget-object v0, p0, Lcom/rey/material/app/ThemeManager;->mDispatcher:Lcom/rey/material/app/ThemeManager$EventDispatcher;

    invoke-interface {v0, p1}, Lcom/rey/material/app/ThemeManager$EventDispatcher;->unregisterListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 205
    :cond_9
    return-void
.end method
