.class public final Landroid/support/v7/widget/AppCompatDrawableManager;
.super Ljava/lang/Object;
.source "AppCompatDrawableManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/AppCompatDrawableManager$1;,
        Landroid/support/v7/widget/AppCompatDrawableManager$AvdcInflateDelegate;,
        Landroid/support/v7/widget/AppCompatDrawableManager$VdcInflateDelegate;,
        Landroid/support/v7/widget/AppCompatDrawableManager$ColorFilterLruCache;,
        Landroid/support/v7/widget/AppCompatDrawableManager$InflateDelegate;
    }
.end annotation


# static fields
.field private static final COLORFILTER_COLOR_BACKGROUND_MULTIPLY:[I

.field private static final COLORFILTER_COLOR_CONTROL_ACTIVATED:[I

.field private static final COLORFILTER_TINT_COLOR_CONTROL_NORMAL:[I

.field private static final COLOR_FILTER_CACHE:Landroid/support/v7/widget/AppCompatDrawableManager$ColorFilterLruCache;

.field private static final DEBUG:Z = false

.field private static final DEFAULT_MODE:Landroid/graphics/PorterDuff$Mode;

.field private static INSTANCE:Landroid/support/v7/widget/AppCompatDrawableManager; = null

.field private static final SKIP_DRAWABLE_TAG:Ljava/lang/String; = "appcompat_skip_skip"

.field private static final TAG:Ljava/lang/String; = "AppCompatDrawableManager"

.field private static final TINT_CHECKABLE_BUTTON_LIST:[I

.field private static final TINT_COLOR_CONTROL_NORMAL:[I

.field private static final TINT_COLOR_CONTROL_STATE_LIST:[I


# instance fields
.field private final mDelegateDrawableCacheLock:Ljava/lang/Object;

.field private final mDelegateDrawableCaches:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/content/Context;",
            "Landroid/support/v4/util/LongSparseArray",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/graphics/drawable/Drawable$ConstantState;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private mDelegates:Landroid/support/v4/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/ArrayMap",
            "<",
            "Ljava/lang/String;",
            "Landroid/support/v7/widget/AppCompatDrawableManager$InflateDelegate;",
            ">;"
        }
    .end annotation
.end field

.field private mKnownDrawableIdTags:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mTintLists:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/content/Context;",
            "Landroid/util/SparseArray",
            "<",
            "Landroid/content/res/ColorStateList;",
            ">;>;"
        }
    .end annotation
.end field

.field private mTypedValue:Landroid/util/TypedValue;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 73
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    sput-object v0, Landroid/support/v7/widget/AppCompatDrawableManager;->DEFAULT_MODE:Landroid/graphics/PorterDuff$Mode;

    .line 100
    new-instance v0, Landroid/support/v7/widget/AppCompatDrawableManager$ColorFilterLruCache;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Landroid/support/v7/widget/AppCompatDrawableManager$ColorFilterLruCache;-><init>(I)V

    sput-object v0, Landroid/support/v7/widget/AppCompatDrawableManager;->COLOR_FILTER_CACHE:Landroid/support/v7/widget/AppCompatDrawableManager$ColorFilterLruCache;

    .line 106
    new-array v0, v5, [I

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_textfield_search_default_mtrl_alpha:I

    aput v1, v0, v2

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_textfield_default_mtrl_alpha:I

    aput v1, v0, v3

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_ab_share_pack_mtrl_alpha:I

    aput v1, v0, v4

    sput-object v0, Landroid/support/v7/widget/AppCompatDrawableManager;->COLORFILTER_TINT_COLOR_CONTROL_NORMAL:[I

    .line 116
    new-array v0, v4, [I

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_ic_search_api_mtrl_alpha:I

    aput v1, v0, v2

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_ic_commit_search_api_mtrl_alpha:I

    aput v1, v0, v3

    sput-object v0, Landroid/support/v7/widget/AppCompatDrawableManager;->TINT_COLOR_CONTROL_NORMAL:[I

    .line 125
    const/4 v0, 0x4

    new-array v0, v0, [I

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_textfield_activated_mtrl_alpha:I

    aput v1, v0, v2

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_textfield_search_activated_mtrl_alpha:I

    aput v1, v0, v3

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_cab_background_top_mtrl_alpha:I

    aput v1, v0, v4

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_text_cursor_material:I

    aput v1, v0, v5

    sput-object v0, Landroid/support/v7/widget/AppCompatDrawableManager;->COLORFILTER_COLOR_CONTROL_ACTIVATED:[I

    .line 136
    new-array v0, v5, [I

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_popup_background_mtrl_mult:I

    aput v1, v0, v2

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_cab_background_internal_bg:I

    aput v1, v0, v3

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_menu_hardkey_panel_mtrl_mult:I

    aput v1, v0, v4

    sput-object v0, Landroid/support/v7/widget/AppCompatDrawableManager;->COLORFILTER_COLOR_BACKGROUND_MULTIPLY:[I

    .line 146
    new-array v0, v5, [I

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_tab_indicator_material:I

    aput v1, v0, v2

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_textfield_search_material:I

    aput v1, v0, v3

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_ratingbar_full_material:I

    aput v1, v0, v4

    sput-object v0, Landroid/support/v7/widget/AppCompatDrawableManager;->TINT_COLOR_CONTROL_STATE_LIST:[I

    .line 157
    new-array v0, v4, [I

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_btn_check_material:I

    aput v1, v0, v2

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_btn_radio_material:I

    aput v1, v0, v3

    sput-object v0, Landroid/support/v7/widget/AppCompatDrawableManager;->TINT_CHECKABLE_BUTTON_LIST:[I

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 166
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegateDrawableCacheLock:Ljava/lang/Object;

    .line 167
    new-instance v0, Ljava/util/WeakHashMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/WeakHashMap;-><init>(I)V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegateDrawableCaches:Ljava/util/WeakHashMap;

    .line 838
    return-void
.end method

.method private addCachedDelegateDrawable(Landroid/content/Context;JLandroid/graphics/drawable/Drawable;)Z
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "key"    # J
    .param p4, "drawable"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 354
    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v1

    .line 355
    .local v1, "cs":Landroid/graphics/drawable/Drawable$ConstantState;
    if-eqz v1, :cond_2b

    .line 356
    iget-object v3, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegateDrawableCacheLock:Ljava/lang/Object;

    monitor-enter v3

    .line 357
    :try_start_9
    iget-object v2, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegateDrawableCaches:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/util/LongSparseArray;

    .line 359
    .local v0, "cache":Landroid/support/v4/util/LongSparseArray;, "Landroid/support/v4/util/LongSparseArray<Ljava/lang/ref/WeakReference<Landroid/graphics/drawable/Drawable$ConstantState;>;>;"
    if-nez v0, :cond_1d

    .line 360
    new-instance v0, Landroid/support/v4/util/LongSparseArray;

    .end local v0    # "cache":Landroid/support/v4/util/LongSparseArray;, "Landroid/support/v4/util/LongSparseArray<Ljava/lang/ref/WeakReference<Landroid/graphics/drawable/Drawable$ConstantState;>;>;"
    invoke-direct {v0}, Landroid/support/v4/util/LongSparseArray;-><init>()V

    .line 361
    .restart local v0    # "cache":Landroid/support/v4/util/LongSparseArray;, "Landroid/support/v4/util/LongSparseArray<Ljava/lang/ref/WeakReference<Landroid/graphics/drawable/Drawable$ConstantState;>;>;"
    iget-object v2, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegateDrawableCaches:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    :cond_1d
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p2, p3, v2}, Landroid/support/v4/util/LongSparseArray;->put(JLjava/lang/Object;)V

    .line 364
    monitor-exit v3

    .line 365
    const/4 v2, 0x1

    .line 367
    .end local v0    # "cache":Landroid/support/v4/util/LongSparseArray;, "Landroid/support/v4/util/LongSparseArray<Ljava/lang/ref/WeakReference<Landroid/graphics/drawable/Drawable$ConstantState;>;>;"
    :goto_27
    return v2

    .line 364
    :catchall_28
    move-exception v2

    monitor-exit v3
    :try_end_2a
    .catchall {:try_start_9 .. :try_end_2a} :catchall_28

    throw v2

    .line 367
    :cond_2b
    const/4 v2, 0x0

    goto :goto_27
.end method

.method private addDelegate(Ljava/lang/String;Landroid/support/v7/widget/AppCompatDrawableManager$InflateDelegate;)V
    .registers 4
    .param p1, "tagName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "delegate"    # Landroid/support/v7/widget/AppCompatDrawableManager$InflateDelegate;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 428
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegates:Landroid/support/v4/util/ArrayMap;

    if-nez v0, :cond_b

    .line 429
    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegates:Landroid/support/v4/util/ArrayMap;

    .line 431
    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegates:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 432
    return-void
.end method

.method private addTintListToCache(Landroid/content/Context;ILandroid/content/res/ColorStateList;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3, "tintList"    # Landroid/content/res/ColorStateList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 506
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mTintLists:Ljava/util/WeakHashMap;

    if-nez v1, :cond_b

    .line 507
    new-instance v1, Ljava/util/WeakHashMap;

    invoke-direct {v1}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v1, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mTintLists:Ljava/util/WeakHashMap;

    .line 509
    :cond_b
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mTintLists:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseArray;

    .line 510
    .local v0, "themeTints":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/content/res/ColorStateList;>;"
    if-nez v0, :cond_1f

    .line 511
    new-instance v0, Landroid/util/SparseArray;

    .end local v0    # "themeTints":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/content/res/ColorStateList;>;"
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 512
    .restart local v0    # "themeTints":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/content/res/ColorStateList;>;"
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mTintLists:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    :cond_1f
    invoke-virtual {v0, p2, p3}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 515
    return-void
.end method

.method private static arrayContains([II)Z
    .registers 7
    .param p0, "array"    # [I
    .param p1, "value"    # I

    .prologue
    .line 441
    move-object v0, p0

    .local v0, "arr$":[I
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v3, :cond_e

    aget v2, v0, v1

    .line 442
    .local v2, "id":I
    if-ne v2, p1, :cond_b

    .line 443
    const/4 v4, 0x1

    .line 446
    .end local v2    # "id":I
    :goto_a
    return v4

    .line 441
    .restart local v2    # "id":I
    :cond_b
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 446
    .end local v2    # "id":I
    :cond_e
    const/4 v4, 0x0

    goto :goto_a
.end method

.method private createButtonColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "baseColorAttr"    # I

    .prologue
    const/4 v5, 0x4

    .line 684
    new-array v4, v5, [[I

    .line 685
    .local v4, "states":[[I
    new-array v2, v5, [I

    .line 686
    .local v2, "colors":[I
    const/4 v3, 0x0

    .line 688
    .local v3, "i":I
    invoke-static {p1, p2}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v0

    .line 689
    .local v0, "baseColor":I
    sget v5, Landroid/support/v7/appcompat/R$attr;->colorControlHighlight:I

    invoke-static {p1, v5}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v1

    .line 692
    .local v1, "colorControlHighlight":I
    sget-object v5, Landroid/support/v7/widget/ThemeUtils;->DISABLED_STATE_SET:[I

    aput-object v5, v4, v3

    .line 693
    sget v5, Landroid/support/v7/appcompat/R$attr;->colorButtonNormal:I

    invoke-static {p1, v5}, Landroid/support/v7/widget/ThemeUtils;->getDisabledThemeAttrColor(Landroid/content/Context;I)I

    move-result v5

    aput v5, v2, v3

    .line 694
    add-int/lit8 v3, v3, 0x1

    .line 696
    sget-object v5, Landroid/support/v7/widget/ThemeUtils;->PRESSED_STATE_SET:[I

    aput-object v5, v4, v3

    .line 697
    invoke-static {v1, v0}, Landroid/support/v4/graphics/ColorUtils;->compositeColors(II)I

    move-result v5

    aput v5, v2, v3

    .line 698
    add-int/lit8 v3, v3, 0x1

    .line 700
    sget-object v5, Landroid/support/v7/widget/ThemeUtils;->FOCUSED_STATE_SET:[I

    aput-object v5, v4, v3

    .line 701
    invoke-static {v1, v0}, Landroid/support/v4/graphics/ColorUtils;->compositeColors(II)I

    move-result v5

    aput v5, v2, v3

    .line 702
    add-int/lit8 v3, v3, 0x1

    .line 705
    sget-object v5, Landroid/support/v7/widget/ThemeUtils;->EMPTY_STATE_SET:[I

    aput-object v5, v4, v3

    .line 706
    aput v0, v2, v3

    .line 707
    add-int/lit8 v3, v3, 0x1

    .line 709
    new-instance v5, Landroid/content/res/ColorStateList;

    invoke-direct {v5, v4, v2}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v5
.end method

.method private createCheckableButtonColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x3

    .line 564
    new-array v2, v3, [[I

    .line 565
    .local v2, "states":[[I
    new-array v0, v3, [I

    .line 566
    .local v0, "colors":[I
    const/4 v1, 0x0

    .line 569
    .local v1, "i":I
    sget-object v3, Landroid/support/v7/widget/ThemeUtils;->DISABLED_STATE_SET:[I

    aput-object v3, v2, v1

    .line 570
    sget v3, Landroid/support/v7/appcompat/R$attr;->colorControlNormal:I

    invoke-static {p1, v3}, Landroid/support/v7/widget/ThemeUtils;->getDisabledThemeAttrColor(Landroid/content/Context;I)I

    move-result v3

    aput v3, v0, v1

    .line 571
    add-int/lit8 v1, v1, 0x1

    .line 573
    sget-object v3, Landroid/support/v7/widget/ThemeUtils;->CHECKED_STATE_SET:[I

    aput-object v3, v2, v1

    .line 574
    sget v3, Landroid/support/v7/appcompat/R$attr;->colorControlActivated:I

    invoke-static {p1, v3}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v3

    aput v3, v0, v1

    .line 575
    add-int/lit8 v1, v1, 0x1

    .line 578
    sget-object v3, Landroid/support/v7/widget/ThemeUtils;->EMPTY_STATE_SET:[I

    aput-object v3, v2, v1

    .line 579
    sget v3, Landroid/support/v7/appcompat/R$attr;->colorControlNormal:I

    invoke-static {p1, v3}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v3

    aput v3, v0, v1

    .line 580
    add-int/lit8 v1, v1, 0x1

    .line 582
    new-instance v3, Landroid/content/res/ColorStateList;

    invoke-direct {v3, v2, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v3
.end method

.method private createColoredButtonColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 680
    sget v0, Landroid/support/v7/appcompat/R$attr;->colorAccent:I

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/AppCompatDrawableManager;->createButtonColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method private createDefaultButtonColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 676
    sget v0, Landroid/support/v7/appcompat/R$attr;->colorButtonNormal:I

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/AppCompatDrawableManager;->createButtonColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method private createDefaultColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x7

    .line 523
    sget v5, Landroid/support/v7/appcompat/R$attr;->colorControlNormal:I

    invoke-static {p1, v5}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v1

    .line 524
    .local v1, "colorControlNormal":I
    sget v5, Landroid/support/v7/appcompat/R$attr;->colorControlActivated:I

    invoke-static {p1, v5}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v0

    .line 526
    .local v0, "colorControlActivated":I
    new-array v4, v6, [[I

    .line 527
    .local v4, "states":[[I
    new-array v2, v6, [I

    .line 528
    .local v2, "colors":[I
    const/4 v3, 0x0

    .line 531
    .local v3, "i":I
    sget-object v5, Landroid/support/v7/widget/ThemeUtils;->DISABLED_STATE_SET:[I

    aput-object v5, v4, v3

    .line 532
    sget v5, Landroid/support/v7/appcompat/R$attr;->colorControlNormal:I

    invoke-static {p1, v5}, Landroid/support/v7/widget/ThemeUtils;->getDisabledThemeAttrColor(Landroid/content/Context;I)I

    move-result v5

    aput v5, v2, v3

    .line 533
    add-int/lit8 v3, v3, 0x1

    .line 535
    sget-object v5, Landroid/support/v7/widget/ThemeUtils;->FOCUSED_STATE_SET:[I

    aput-object v5, v4, v3

    .line 536
    aput v0, v2, v3

    .line 537
    add-int/lit8 v3, v3, 0x1

    .line 539
    sget-object v5, Landroid/support/v7/widget/ThemeUtils;->ACTIVATED_STATE_SET:[I

    aput-object v5, v4, v3

    .line 540
    aput v0, v2, v3

    .line 541
    add-int/lit8 v3, v3, 0x1

    .line 543
    sget-object v5, Landroid/support/v7/widget/ThemeUtils;->PRESSED_STATE_SET:[I

    aput-object v5, v4, v3

    .line 544
    aput v0, v2, v3

    .line 545
    add-int/lit8 v3, v3, 0x1

    .line 547
    sget-object v5, Landroid/support/v7/widget/ThemeUtils;->CHECKED_STATE_SET:[I

    aput-object v5, v4, v3

    .line 548
    aput v0, v2, v3

    .line 549
    add-int/lit8 v3, v3, 0x1

    .line 551
    sget-object v5, Landroid/support/v7/widget/ThemeUtils;->SELECTED_STATE_SET:[I

    aput-object v5, v4, v3

    .line 552
    aput v0, v2, v3

    .line 553
    add-int/lit8 v3, v3, 0x1

    .line 556
    sget-object v5, Landroid/support/v7/widget/ThemeUtils;->EMPTY_STATE_SET:[I

    aput-object v5, v4, v3

    .line 557
    aput v1, v2, v3

    .line 558
    add-int/lit8 v3, v3, 0x1

    .line 560
    new-instance v5, Landroid/content/res/ColorStateList;

    invoke-direct {v5, v4, v2}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v5
.end method

.method private createEditTextColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x3

    .line 654
    new-array v2, v3, [[I

    .line 655
    .local v2, "states":[[I
    new-array v0, v3, [I

    .line 656
    .local v0, "colors":[I
    const/4 v1, 0x0

    .line 659
    .local v1, "i":I
    sget-object v3, Landroid/support/v7/widget/ThemeUtils;->DISABLED_STATE_SET:[I

    aput-object v3, v2, v1

    .line 660
    sget v3, Landroid/support/v7/appcompat/R$attr;->colorControlNormal:I

    invoke-static {p1, v3}, Landroid/support/v7/widget/ThemeUtils;->getDisabledThemeAttrColor(Landroid/content/Context;I)I

    move-result v3

    aput v3, v0, v1

    .line 661
    add-int/lit8 v1, v1, 0x1

    .line 663
    sget-object v3, Landroid/support/v7/widget/ThemeUtils;->NOT_PRESSED_OR_FOCUSED_STATE_SET:[I

    aput-object v3, v2, v1

    .line 664
    sget v3, Landroid/support/v7/appcompat/R$attr;->colorControlNormal:I

    invoke-static {p1, v3}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v3

    aput v3, v0, v1

    .line 665
    add-int/lit8 v1, v1, 0x1

    .line 668
    sget-object v3, Landroid/support/v7/widget/ThemeUtils;->EMPTY_STATE_SET:[I

    aput-object v3, v2, v1

    .line 669
    sget v3, Landroid/support/v7/appcompat/R$attr;->colorControlActivated:I

    invoke-static {p1, v3}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v3

    aput v3, v0, v1

    .line 670
    add-int/lit8 v1, v1, 0x1

    .line 672
    new-instance v3, Landroid/content/res/ColorStateList;

    invoke-direct {v3, v2, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v3
.end method

.method private createSeekbarThumbColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x2

    .line 734
    new-array v2, v3, [[I

    .line 735
    .local v2, "states":[[I
    new-array v0, v3, [I

    .line 736
    .local v0, "colors":[I
    const/4 v1, 0x0

    .line 739
    .local v1, "i":I
    sget-object v3, Landroid/support/v7/widget/ThemeUtils;->DISABLED_STATE_SET:[I

    aput-object v3, v2, v1

    .line 740
    sget v3, Landroid/support/v7/appcompat/R$attr;->colorControlActivated:I

    invoke-static {p1, v3}, Landroid/support/v7/widget/ThemeUtils;->getDisabledThemeAttrColor(Landroid/content/Context;I)I

    move-result v3

    aput v3, v0, v1

    .line 741
    add-int/lit8 v1, v1, 0x1

    .line 743
    sget-object v3, Landroid/support/v7/widget/ThemeUtils;->EMPTY_STATE_SET:[I

    aput-object v3, v2, v1

    .line 744
    sget v3, Landroid/support/v7/appcompat/R$attr;->colorControlActivated:I

    invoke-static {p1, v3}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v3

    aput v3, v0, v1

    .line 745
    add-int/lit8 v1, v1, 0x1

    .line 747
    new-instance v3, Landroid/content/res/ColorStateList;

    invoke-direct {v3, v2, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v3
.end method

.method private createSpinnerColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x3

    .line 713
    new-array v2, v3, [[I

    .line 714
    .local v2, "states":[[I
    new-array v0, v3, [I

    .line 715
    .local v0, "colors":[I
    const/4 v1, 0x0

    .line 718
    .local v1, "i":I
    sget-object v3, Landroid/support/v7/widget/ThemeUtils;->DISABLED_STATE_SET:[I

    aput-object v3, v2, v1

    .line 719
    sget v3, Landroid/support/v7/appcompat/R$attr;->colorControlNormal:I

    invoke-static {p1, v3}, Landroid/support/v7/widget/ThemeUtils;->getDisabledThemeAttrColor(Landroid/content/Context;I)I

    move-result v3

    aput v3, v0, v1

    .line 720
    add-int/lit8 v1, v1, 0x1

    .line 722
    sget-object v3, Landroid/support/v7/widget/ThemeUtils;->NOT_PRESSED_OR_FOCUSED_STATE_SET:[I

    aput-object v3, v2, v1

    .line 723
    sget v3, Landroid/support/v7/appcompat/R$attr;->colorControlNormal:I

    invoke-static {p1, v3}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v3

    aput v3, v0, v1

    .line 724
    add-int/lit8 v1, v1, 0x1

    .line 726
    sget-object v3, Landroid/support/v7/widget/ThemeUtils;->EMPTY_STATE_SET:[I

    aput-object v3, v2, v1

    .line 727
    sget v3, Landroid/support/v7/appcompat/R$attr;->colorControlActivated:I

    invoke-static {p1, v3}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v3

    aput v3, v0, v1

    .line 728
    add-int/lit8 v1, v1, 0x1

    .line 730
    new-instance v3, Landroid/content/res/ColorStateList;

    invoke-direct {v3, v2, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v3
.end method

.method private createSwitchThumbColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x3

    .line 608
    new-array v2, v4, [[I

    .line 609
    .local v2, "states":[[I
    new-array v0, v4, [I

    .line 610
    .local v0, "colors":[I
    const/4 v1, 0x0

    .line 612
    .local v1, "i":I
    sget v4, Landroid/support/v7/appcompat/R$attr;->colorSwitchThumbNormal:I

    invoke-static {p1, v4}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    .line 615
    .local v3, "thumbColor":Landroid/content/res/ColorStateList;
    if-eqz v3, :cond_43

    invoke-virtual {v3}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v4

    if-eqz v4, :cond_43

    .line 620
    sget-object v4, Landroid/support/v7/widget/ThemeUtils;->DISABLED_STATE_SET:[I

    aput-object v4, v2, v1

    .line 621
    aget-object v4, v2, v1

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v4

    aput v4, v0, v1

    .line 622
    add-int/lit8 v1, v1, 0x1

    .line 624
    sget-object v4, Landroid/support/v7/widget/ThemeUtils;->CHECKED_STATE_SET:[I

    aput-object v4, v2, v1

    .line 625
    sget v4, Landroid/support/v7/appcompat/R$attr;->colorControlActivated:I

    invoke-static {p1, v4}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v4

    aput v4, v0, v1

    .line 626
    add-int/lit8 v1, v1, 0x1

    .line 629
    sget-object v4, Landroid/support/v7/widget/ThemeUtils;->EMPTY_STATE_SET:[I

    aput-object v4, v2, v1

    .line 630
    invoke-virtual {v3}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v4

    aput v4, v0, v1

    .line 631
    add-int/lit8 v1, v1, 0x1

    .line 650
    :goto_3d
    new-instance v4, Landroid/content/res/ColorStateList;

    invoke-direct {v4, v2, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v4

    .line 636
    :cond_43
    sget-object v4, Landroid/support/v7/widget/ThemeUtils;->DISABLED_STATE_SET:[I

    aput-object v4, v2, v1

    .line 637
    sget v4, Landroid/support/v7/appcompat/R$attr;->colorSwitchThumbNormal:I

    invoke-static {p1, v4}, Landroid/support/v7/widget/ThemeUtils;->getDisabledThemeAttrColor(Landroid/content/Context;I)I

    move-result v4

    aput v4, v0, v1

    .line 638
    add-int/lit8 v1, v1, 0x1

    .line 640
    sget-object v4, Landroid/support/v7/widget/ThemeUtils;->CHECKED_STATE_SET:[I

    aput-object v4, v2, v1

    .line 641
    sget v4, Landroid/support/v7/appcompat/R$attr;->colorControlActivated:I

    invoke-static {p1, v4}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v4

    aput v4, v0, v1

    .line 642
    add-int/lit8 v1, v1, 0x1

    .line 645
    sget-object v4, Landroid/support/v7/widget/ThemeUtils;->EMPTY_STATE_SET:[I

    aput-object v4, v2, v1

    .line 646
    sget v4, Landroid/support/v7/appcompat/R$attr;->colorSwitchThumbNormal:I

    invoke-static {p1, v4}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v4

    aput v4, v0, v1

    .line 647
    add-int/lit8 v1, v1, 0x1

    goto :goto_3d
.end method

.method private createSwitchTrackColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const v5, 0x1010030

    const/4 v3, 0x3

    const v4, 0x3e99999a    # 0.3f

    .line 586
    new-array v2, v3, [[I

    .line 587
    .local v2, "states":[[I
    new-array v0, v3, [I

    .line 588
    .local v0, "colors":[I
    const/4 v1, 0x0

    .line 591
    .local v1, "i":I
    sget-object v3, Landroid/support/v7/widget/ThemeUtils;->DISABLED_STATE_SET:[I

    aput-object v3, v2, v1

    .line 592
    const v3, 0x3dcccccd    # 0.1f

    invoke-static {p1, v5, v3}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;IF)I

    move-result v3

    aput v3, v0, v1

    .line 593
    add-int/lit8 v1, v1, 0x1

    .line 595
    sget-object v3, Landroid/support/v7/widget/ThemeUtils;->CHECKED_STATE_SET:[I

    aput-object v3, v2, v1

    .line 596
    sget v3, Landroid/support/v7/appcompat/R$attr;->colorControlActivated:I

    invoke-static {p1, v3, v4}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;IF)I

    move-result v3

    aput v3, v0, v1

    .line 597
    add-int/lit8 v1, v1, 0x1

    .line 600
    sget-object v3, Landroid/support/v7/widget/ThemeUtils;->EMPTY_STATE_SET:[I

    aput-object v3, v2, v1

    .line 601
    invoke-static {p1, v5, v4}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;IF)I

    move-result v3

    aput v3, v0, v1

    .line 602
    add-int/lit8 v1, v1, 0x1

    .line 604
    new-instance v3, Landroid/content/res/ColorStateList;

    invoke-direct {v3, v2, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v3
.end method

.method private static createTintFilter(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;[I)Landroid/graphics/PorterDuffColorFilter;
    .registers 5
    .param p0, "tint"    # Landroid/content/res/ColorStateList;
    .param p1, "tintMode"    # Landroid/graphics/PorterDuff$Mode;
    .param p2, "state"    # [I

    .prologue
    .line 797
    if-eqz p0, :cond_4

    if-nez p1, :cond_6

    .line 798
    :cond_4
    const/4 v1, 0x0

    .line 801
    :goto_5
    return-object v1

    .line 800
    :cond_6
    const/4 v1, 0x0

    invoke-virtual {p0, p2, v1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    .line 801
    .local v0, "color":I
    invoke-static {v0, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->getPorterDuffColorFilter(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v1

    goto :goto_5
.end method

.method public static get()Landroid/support/v7/widget/AppCompatDrawableManager;
    .registers 1

    .prologue
    .line 79
    sget-object v0, Landroid/support/v7/widget/AppCompatDrawableManager;->INSTANCE:Landroid/support/v7/widget/AppCompatDrawableManager;

    if-nez v0, :cond_10

    .line 80
    new-instance v0, Landroid/support/v7/widget/AppCompatDrawableManager;

    invoke-direct {v0}, Landroid/support/v7/widget/AppCompatDrawableManager;-><init>()V

    sput-object v0, Landroid/support/v7/widget/AppCompatDrawableManager;->INSTANCE:Landroid/support/v7/widget/AppCompatDrawableManager;

    .line 81
    sget-object v0, Landroid/support/v7/widget/AppCompatDrawableManager;->INSTANCE:Landroid/support/v7/widget/AppCompatDrawableManager;

    invoke-static {v0}, Landroid/support/v7/widget/AppCompatDrawableManager;->installDefaultInflateDelegates(Landroid/support/v7/widget/AppCompatDrawableManager;)V

    .line 83
    :cond_10
    sget-object v0, Landroid/support/v7/widget/AppCompatDrawableManager;->INSTANCE:Landroid/support/v7/widget/AppCompatDrawableManager;

    return-object v0
.end method

.method private getCachedDelegateDrawable(Landroid/content/Context;J)Landroid/graphics/drawable/Drawable;
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "key"    # J

    .prologue
    const/4 v3, 0x0

    .line 330
    iget-object v4, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegateDrawableCacheLock:Ljava/lang/Object;

    monitor-enter v4

    .line 331
    :try_start_4
    iget-object v5, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegateDrawableCaches:Ljava/util/WeakHashMap;

    invoke-virtual {v5, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/util/LongSparseArray;

    .line 333
    .local v0, "cache":Landroid/support/v4/util/LongSparseArray;, "Landroid/support/v4/util/LongSparseArray<Ljava/lang/ref/WeakReference<Landroid/graphics/drawable/Drawable$ConstantState;>;>;"
    if-nez v0, :cond_10

    .line 334
    monitor-exit v4

    .line 349
    :goto_f
    return-object v3

    .line 337
    :cond_10
    invoke-virtual {v0, p2, p3}, Landroid/support/v4/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 338
    .local v2, "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/graphics/drawable/Drawable$ConstantState;>;"
    if-eqz v2, :cond_30

    .line 340
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/Drawable$ConstantState;

    .line 341
    .local v1, "entry":Landroid/graphics/drawable/Drawable$ConstantState;
    if-eqz v1, :cond_2d

    .line 342
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    monitor-exit v4

    goto :goto_f

    .line 348
    .end local v0    # "cache":Landroid/support/v4/util/LongSparseArray;, "Landroid/support/v4/util/LongSparseArray<Ljava/lang/ref/WeakReference<Landroid/graphics/drawable/Drawable$ConstantState;>;>;"
    .end local v1    # "entry":Landroid/graphics/drawable/Drawable$ConstantState;
    .end local v2    # "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/graphics/drawable/Drawable$ConstantState;>;"
    :catchall_2a
    move-exception v3

    monitor-exit v4
    :try_end_2c
    .catchall {:try_start_4 .. :try_end_2c} :catchall_2a

    throw v3

    .line 345
    .restart local v0    # "cache":Landroid/support/v4/util/LongSparseArray;, "Landroid/support/v4/util/LongSparseArray<Ljava/lang/ref/WeakReference<Landroid/graphics/drawable/Drawable$ConstantState;>;>;"
    .restart local v1    # "entry":Landroid/graphics/drawable/Drawable$ConstantState;
    .restart local v2    # "wr":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/graphics/drawable/Drawable$ConstantState;>;"
    :cond_2d
    :try_start_2d
    invoke-virtual {v0, p2, p3}, Landroid/support/v4/util/LongSparseArray;->delete(J)V

    .line 348
    .end local v1    # "entry":Landroid/graphics/drawable/Drawable$ConstantState;
    :cond_30
    monitor-exit v4
    :try_end_31
    .catchall {:try_start_2d .. :try_end_31} :catchall_2a

    goto :goto_f
.end method

.method public static getPorterDuffColorFilter(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;
    .registers 4
    .param p0, "color"    # I
    .param p1, "mode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 806
    sget-object v1, Landroid/support/v7/widget/AppCompatDrawableManager;->COLOR_FILTER_CACHE:Landroid/support/v7/widget/AppCompatDrawableManager$ColorFilterLruCache;

    invoke-virtual {v1, p0, p1}, Landroid/support/v7/widget/AppCompatDrawableManager$ColorFilterLruCache;->get(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v0

    .line 808
    .local v0, "filter":Landroid/graphics/PorterDuffColorFilter;
    if-nez v0, :cond_12

    .line 810
    new-instance v0, Landroid/graphics/PorterDuffColorFilter;

    .end local v0    # "filter":Landroid/graphics/PorterDuffColorFilter;
    invoke-direct {v0, p0, p1}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 811
    .restart local v0    # "filter":Landroid/graphics/PorterDuffColorFilter;
    sget-object v1, Landroid/support/v7/widget/AppCompatDrawableManager;->COLOR_FILTER_CACHE:Landroid/support/v7/widget/AppCompatDrawableManager$ColorFilterLruCache;

    invoke-virtual {v1, p0, p1, v0}, Landroid/support/v7/widget/AppCompatDrawableManager$ColorFilterLruCache;->put(ILandroid/graphics/PorterDuff$Mode;Landroid/graphics/PorterDuffColorFilter;)Landroid/graphics/PorterDuffColorFilter;

    .line 814
    :cond_12
    return-object v0
.end method

.method private getTintListFromCache(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 497
    iget-object v2, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mTintLists:Ljava/util/WeakHashMap;

    if-eqz v2, :cond_15

    .line 498
    iget-object v2, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mTintLists:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseArray;

    .line 499
    .local v0, "tints":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/content/res/ColorStateList;>;"
    if-eqz v0, :cond_15

    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/res/ColorStateList;

    .line 501
    .end local v0    # "tints":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/content/res/ColorStateList;>;"
    :cond_15
    return-object v1
.end method

.method private static installDefaultInflateDelegates(Landroid/support/v7/widget/AppCompatDrawableManager;)V
    .registers 5
    .param p0, "manager"    # Landroid/support/v7/widget/AppCompatDrawableManager;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x0

    .line 87
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 88
    .local v0, "sdk":I
    const/16 v1, 0x15

    if-ge v0, v1, :cond_1f

    .line 91
    const-string v1, "vector"

    new-instance v2, Landroid/support/v7/widget/AppCompatDrawableManager$VdcInflateDelegate;

    invoke-direct {v2, v3}, Landroid/support/v7/widget/AppCompatDrawableManager$VdcInflateDelegate;-><init>(Landroid/support/v7/widget/AppCompatDrawableManager$1;)V

    invoke-direct {p0, v1, v2}, Landroid/support/v7/widget/AppCompatDrawableManager;->addDelegate(Ljava/lang/String;Landroid/support/v7/widget/AppCompatDrawableManager$InflateDelegate;)V

    .line 93
    const/16 v1, 0xb

    if-lt v0, v1, :cond_1f

    .line 95
    const-string v1, "animated-vector"

    new-instance v2, Landroid/support/v7/widget/AppCompatDrawableManager$AvdcInflateDelegate;

    invoke-direct {v2, v3}, Landroid/support/v7/widget/AppCompatDrawableManager$AvdcInflateDelegate;-><init>(Landroid/support/v7/widget/AppCompatDrawableManager$1;)V

    invoke-direct {p0, v1, v2}, Landroid/support/v7/widget/AppCompatDrawableManager;->addDelegate(Ljava/lang/String;Landroid/support/v7/widget/AppCompatDrawableManager$InflateDelegate;)V

    .line 98
    :cond_1f
    return-void
.end method

.method private loadDrawableFromDelegates(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .registers 21
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 244
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegates:Landroid/support/v4/util/ArrayMap;

    if-eqz v14, :cond_f7

    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegates:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v14}, Landroid/support/v4/util/ArrayMap;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_f7

    .line 245
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/AppCompatDrawableManager;->mKnownDrawableIdTags:Landroid/util/SparseArray;

    if-eqz v14, :cond_38

    .line 246
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/AppCompatDrawableManager;->mKnownDrawableIdTags:Landroid/util/SparseArray;

    move/from16 v0, p2

    invoke-virtual {v14, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 247
    .local v3, "cachedTagName":Ljava/lang/String;
    const-string v14, "appcompat_skip_skip"

    invoke-virtual {v14, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_36

    if-eqz v3, :cond_41

    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegates:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v14, v3}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    if-nez v14, :cond_41

    .line 255
    :cond_36
    const/4 v5, 0x0

    .line 326
    .end local v3    # "cachedTagName":Ljava/lang/String;
    :cond_37
    :goto_37
    return-object v5

    .line 259
    :cond_38
    new-instance v14, Landroid/util/SparseArray;

    invoke-direct {v14}, Landroid/util/SparseArray;-><init>()V

    move-object/from16 v0, p0

    iput-object v14, v0, Landroid/support/v7/widget/AppCompatDrawableManager;->mKnownDrawableIdTags:Landroid/util/SparseArray;

    .line 262
    :cond_41
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/AppCompatDrawableManager;->mTypedValue:Landroid/util/TypedValue;

    if-nez v14, :cond_50

    .line 263
    new-instance v14, Landroid/util/TypedValue;

    invoke-direct {v14}, Landroid/util/TypedValue;-><init>()V

    move-object/from16 v0, p0

    iput-object v14, v0, Landroid/support/v7/widget/AppCompatDrawableManager;->mTypedValue:Landroid/util/TypedValue;

    .line 266
    :cond_50
    move-object/from16 v0, p0

    iget-object v12, v0, Landroid/support/v7/widget/AppCompatDrawableManager;->mTypedValue:Landroid/util/TypedValue;

    .line 267
    .local v12, "tv":Landroid/util/TypedValue;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    .line 268
    .local v10, "res":Landroid/content/res/Resources;
    const/4 v14, 0x1

    move/from16 v0, p2

    invoke-virtual {v10, v0, v12, v14}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 270
    iget v14, v12, Landroid/util/TypedValue;->assetCookie:I

    int-to-long v14, v14

    const/16 v16, 0x20

    shl-long v14, v14, v16

    iget v0, v12, Landroid/util/TypedValue;->data:I

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    or-long v7, v14, v16

    .line 272
    .local v7, "key":J
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v7, v8}, Landroid/support/v7/widget/AppCompatDrawableManager;->getCachedDelegateDrawable(Landroid/content/Context;J)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 273
    .local v5, "dr":Landroid/graphics/drawable/Drawable;
    if-nez v5, :cond_37

    .line 282
    iget-object v14, v12, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    if-eqz v14, :cond_b3

    iget-object v14, v12, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    invoke-interface {v14}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v14

    const-string v15, ".xml"

    invoke-virtual {v14, v15}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_b3

    .line 285
    :try_start_8c
    move/from16 v0, p2

    invoke-virtual {v10, v0}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v9

    .line 286
    .local v9, "parser":Lorg/xmlpull/v1/XmlPullParser;
    invoke-static {v9}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v2

    .line 288
    .local v2, "attrs":Landroid/util/AttributeSet;
    :cond_96
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v13

    .local v13, "type":I
    const/4 v14, 0x2

    if-eq v13, v14, :cond_a0

    const/4 v14, 0x1

    if-ne v13, v14, :cond_96

    .line 292
    :cond_a0
    const/4 v14, 0x2

    if-eq v13, v14, :cond_c2

    .line 293
    new-instance v14, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v15, "No start tag found"

    invoke-direct {v14, v15}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v14
    :try_end_ab
    .catch Ljava/lang/Exception; {:try_start_8c .. :try_end_ab} :catch_ab

    .line 314
    .end local v2    # "attrs":Landroid/util/AttributeSet;
    .end local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v13    # "type":I
    :catch_ab
    move-exception v6

    .line 315
    .local v6, "e":Ljava/lang/Exception;
    const-string v14, "AppCompatDrawableManager"

    const-string v15, "Exception while inflating drawable"

    invoke-static {v14, v15, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 318
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_b3
    :goto_b3
    if-nez v5, :cond_37

    .line 321
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/AppCompatDrawableManager;->mKnownDrawableIdTags:Landroid/util/SparseArray;

    const-string v15, "appcompat_skip_skip"

    move/from16 v0, p2

    invoke-virtual {v14, v0, v15}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    goto/16 :goto_37

    .line 296
    .restart local v2    # "attrs":Landroid/util/AttributeSet;
    .restart local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v13    # "type":I
    :cond_c2
    :try_start_c2
    invoke-interface {v9}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    .line 298
    .local v11, "tagName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/AppCompatDrawableManager;->mKnownDrawableIdTags:Landroid/util/SparseArray;

    move/from16 v0, p2

    invoke-virtual {v14, v0, v11}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 301
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegates:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v14, v11}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/AppCompatDrawableManager$InflateDelegate;

    .line 302
    .local v4, "delegate":Landroid/support/v7/widget/AppCompatDrawableManager$InflateDelegate;
    if-eqz v4, :cond_e5

    .line 303
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-interface {v4, v0, v9, v2, v14}, Landroid/support/v7/widget/AppCompatDrawableManager$InflateDelegate;->createFromXmlInner(Landroid/content/Context;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 306
    :cond_e5
    if-eqz v5, :cond_b3

    .line 308
    iget v14, v12, Landroid/util/TypedValue;->changingConfigurations:I

    invoke-virtual {v5, v14}, Landroid/graphics/drawable/Drawable;->setChangingConfigurations(I)V

    .line 309
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v7, v8, v5}, Landroid/support/v7/widget/AppCompatDrawableManager;->addCachedDelegateDrawable(Landroid/content/Context;JLandroid/graphics/drawable/Drawable;)Z
    :try_end_f3
    .catch Ljava/lang/Exception; {:try_start_c2 .. :try_end_f3} :catch_ab

    move-result v14

    if-eqz v14, :cond_b3

    goto :goto_b3

    .line 326
    .end local v2    # "attrs":Landroid/util/AttributeSet;
    .end local v4    # "delegate":Landroid/support/v7/widget/AppCompatDrawableManager$InflateDelegate;
    .end local v5    # "dr":Landroid/graphics/drawable/Drawable;
    .end local v7    # "key":J
    .end local v9    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v10    # "res":Landroid/content/res/Resources;
    .end local v11    # "tagName":Ljava/lang/String;
    .end local v12    # "tv":Landroid/util/TypedValue;
    .end local v13    # "type":I
    :cond_f7
    const/4 v5, 0x0

    goto/16 :goto_37
.end method

.method private removeDelegate(Ljava/lang/String;Landroid/support/v7/widget/AppCompatDrawableManager$InflateDelegate;)V
    .registers 4
    .param p1, "tagName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "delegate"    # Landroid/support/v7/widget/AppCompatDrawableManager$InflateDelegate;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 435
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegates:Landroid/support/v4/util/ArrayMap;

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegates:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_11

    .line 436
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatDrawableManager;->mDelegates:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 438
    :cond_11
    return-void
.end method

.method private static setPorterDuffColorFilter(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V
    .registers 4
    .param p0, "d"    # Landroid/graphics/drawable/Drawable;
    .param p1, "color"    # I
    .param p2, "mode"    # Landroid/graphics/PorterDuff$Mode;

    .prologue
    .line 818
    invoke-static {p0}, Landroid/support/v7/widget/DrawableUtils;->canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 819
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 821
    :cond_a
    if-nez p2, :cond_e

    sget-object p2, Landroid/support/v7/widget/AppCompatDrawableManager;->DEFAULT_MODE:Landroid/graphics/PorterDuff$Mode;

    .end local p2    # "mode":Landroid/graphics/PorterDuff$Mode;
    :cond_e
    invoke-static {p1, p2}, Landroid/support/v7/widget/AppCompatDrawableManager;->getPorterDuffColorFilter(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 822
    return-void
.end method

.method private tintDrawable(Landroid/content/Context;IZLandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 14
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3, "failIfNotKnown"    # Z
    .param p4, "drawable"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const v8, 0x102000f

    const v7, 0x102000d

    const/high16 v5, 0x1020000

    .line 195
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/AppCompatDrawableManager;->getTintList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 196
    .local v1, "tintList":Landroid/content/res/ColorStateList;
    if-eqz v1, :cond_2a

    .line 198
    invoke-static {p4}, Landroid/support/v7/widget/DrawableUtils;->canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 199
    invoke-virtual {p4}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p4

    .line 201
    :cond_18
    invoke-static {p4}, Landroid/support/v4/graphics/drawable/DrawableCompat;->wrap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p4

    .line 202
    invoke-static {p4, v1}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 205
    invoke-virtual {p0, p2}, Landroid/support/v7/widget/AppCompatDrawableManager;->getTintMode(I)Landroid/graphics/PorterDuff$Mode;

    move-result-object v2

    .line 206
    .local v2, "tintMode":Landroid/graphics/PorterDuff$Mode;
    if-eqz v2, :cond_28

    .line 207
    invoke-static {p4, v2}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setTintMode(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .end local v2    # "tintMode":Landroid/graphics/PorterDuff$Mode;
    :cond_28
    :goto_28
    move-object v4, p4

    .line 240
    :goto_29
    return-object v4

    .line 209
    :cond_2a
    sget v4, Landroid/support/v7/appcompat/R$drawable;->abc_cab_background_top_material:I

    if-ne p2, v4, :cond_49

    .line 210
    new-instance v4, Landroid/graphics/drawable/LayerDrawable;

    const/4 v5, 0x2

    new-array v5, v5, [Landroid/graphics/drawable/Drawable;

    const/4 v6, 0x0

    sget v7, Landroid/support/v7/appcompat/R$drawable;->abc_cab_background_internal_bg:I

    invoke-virtual {p0, p1, v7}, Landroid/support/v7/widget/AppCompatDrawableManager;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    sget v7, Landroid/support/v7/appcompat/R$drawable;->abc_cab_background_top_mtrl_alpha:I

    invoke-virtual {p0, p1, v7}, Landroid/support/v7/widget/AppCompatDrawableManager;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-direct {v4, v5}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    goto :goto_29

    .line 214
    :cond_49
    sget v4, Landroid/support/v7/appcompat/R$drawable;->abc_seekbar_track_material:I

    if-ne p2, v4, :cond_7e

    move-object v0, p4

    .line 215
    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .line 216
    .local v0, "ld":Landroid/graphics/drawable/LayerDrawable;
    invoke-virtual {v0, v5}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    sget v5, Landroid/support/v7/appcompat/R$attr;->colorControlNormal:I

    invoke-static {p1, v5}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v5

    sget-object v6, Landroid/support/v7/widget/AppCompatDrawableManager;->DEFAULT_MODE:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v4, v5, v6}, Landroid/support/v7/widget/AppCompatDrawableManager;->setPorterDuffColorFilter(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 218
    invoke-virtual {v0, v8}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    sget v5, Landroid/support/v7/appcompat/R$attr;->colorControlNormal:I

    invoke-static {p1, v5}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v5

    sget-object v6, Landroid/support/v7/widget/AppCompatDrawableManager;->DEFAULT_MODE:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v4, v5, v6}, Landroid/support/v7/widget/AppCompatDrawableManager;->setPorterDuffColorFilter(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 220
    invoke-virtual {v0, v7}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    sget v5, Landroid/support/v7/appcompat/R$attr;->colorControlActivated:I

    invoke-static {p1, v5}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v5

    sget-object v6, Landroid/support/v7/widget/AppCompatDrawableManager;->DEFAULT_MODE:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v4, v5, v6}, Landroid/support/v7/widget/AppCompatDrawableManager;->setPorterDuffColorFilter(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_28

    .line 222
    .end local v0    # "ld":Landroid/graphics/drawable/LayerDrawable;
    :cond_7e
    sget v4, Landroid/support/v7/appcompat/R$drawable;->abc_ratingbar_indicator_material:I

    if-eq p2, v4, :cond_86

    sget v4, Landroid/support/v7/appcompat/R$drawable;->abc_ratingbar_small_material:I

    if-ne p2, v4, :cond_b8

    :cond_86
    move-object v0, p4

    .line 224
    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .line 225
    .restart local v0    # "ld":Landroid/graphics/drawable/LayerDrawable;
    invoke-virtual {v0, v5}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    sget v5, Landroid/support/v7/appcompat/R$attr;->colorControlNormal:I

    invoke-static {p1, v5}, Landroid/support/v7/widget/ThemeUtils;->getDisabledThemeAttrColor(Landroid/content/Context;I)I

    move-result v5

    sget-object v6, Landroid/support/v7/widget/AppCompatDrawableManager;->DEFAULT_MODE:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v4, v5, v6}, Landroid/support/v7/widget/AppCompatDrawableManager;->setPorterDuffColorFilter(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 228
    invoke-virtual {v0, v8}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    sget v5, Landroid/support/v7/appcompat/R$attr;->colorControlActivated:I

    invoke-static {p1, v5}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v5

    sget-object v6, Landroid/support/v7/widget/AppCompatDrawableManager;->DEFAULT_MODE:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v4, v5, v6}, Landroid/support/v7/widget/AppCompatDrawableManager;->setPorterDuffColorFilter(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    .line 230
    invoke-virtual {v0, v7}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    sget v5, Landroid/support/v7/appcompat/R$attr;->colorControlActivated:I

    invoke-static {p1, v5}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v5

    sget-object v6, Landroid/support/v7/widget/AppCompatDrawableManager;->DEFAULT_MODE:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v4, v5, v6}, Landroid/support/v7/widget/AppCompatDrawableManager;->setPorterDuffColorFilter(Landroid/graphics/drawable/Drawable;ILandroid/graphics/PorterDuff$Mode;)V

    goto/16 :goto_28

    .line 233
    .end local v0    # "ld":Landroid/graphics/drawable/LayerDrawable;
    :cond_b8
    invoke-static {p1, p2, p4}, Landroid/support/v7/widget/AppCompatDrawableManager;->tintDrawableUsingColorFilter(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Z

    move-result v3

    .line 234
    .local v3, "tinted":Z
    if-nez v3, :cond_28

    if-eqz p3, :cond_28

    .line 237
    const/4 p4, 0x0

    goto/16 :goto_28
.end method

.method public static tintDrawable(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;[I)V
    .registers 5
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p1, "tint"    # Landroid/support/v7/widget/TintInfo;
    .param p2, "state"    # [I

    .prologue
    .line 773
    invoke-static {p0}, Landroid/support/v7/widget/DrawableUtils;->canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eq v0, p0, :cond_14

    .line 775
    const-string v0, "AppCompatDrawableManager"

    const-string v1, "Mutated drawable is not the same instance as the input."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 793
    :cond_13
    :goto_13
    return-void

    .line 779
    :cond_14
    iget-boolean v0, p1, Landroid/support/v7/widget/TintInfo;->mHasTintList:Z

    if-nez v0, :cond_1c

    iget-boolean v0, p1, Landroid/support/v7/widget/TintInfo;->mHasTintMode:Z

    if-eqz v0, :cond_3e

    .line 780
    :cond_1c
    iget-boolean v0, p1, Landroid/support/v7/widget/TintInfo;->mHasTintList:Z

    if-eqz v0, :cond_39

    iget-object v0, p1, Landroid/support/v7/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    :goto_22
    iget-boolean v1, p1, Landroid/support/v7/widget/TintInfo;->mHasTintMode:Z

    if-eqz v1, :cond_3b

    iget-object v1, p1, Landroid/support/v7/widget/TintInfo;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    :goto_28
    invoke-static {v0, v1, p2}, Landroid/support/v7/widget/AppCompatDrawableManager;->createTintFilter(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;[I)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 788
    :goto_2f
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-gt v0, v1, :cond_13

    .line 791
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    goto :goto_13

    .line 780
    :cond_39
    const/4 v0, 0x0

    goto :goto_22

    :cond_3b
    sget-object v1, Landroid/support/v7/widget/AppCompatDrawableManager;->DEFAULT_MODE:Landroid/graphics/PorterDuff$Mode;

    goto :goto_28

    .line 785
    :cond_3e
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->clearColorFilter()V

    goto :goto_2f
.end method

.method private static tintDrawableUsingColorFilter(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Z
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2, "drawable"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 384
    sget-object v4, Landroid/support/v7/widget/AppCompatDrawableManager;->DEFAULT_MODE:Landroid/graphics/PorterDuff$Mode;

    .line 385
    .local v4, "tintMode":Landroid/graphics/PorterDuff$Mode;
    const/4 v3, 0x0

    .line 386
    .local v3, "colorAttrSet":Z
    const/4 v2, 0x0

    .line 387
    .local v2, "colorAttr":I
    const/4 v0, -0x1

    .line 389
    .local v0, "alpha":I
    sget-object v5, Landroid/support/v7/widget/AppCompatDrawableManager;->COLORFILTER_TINT_COLOR_CONTROL_NORMAL:[I

    invoke-static {v5, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->arrayContains([II)Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 390
    sget v2, Landroid/support/v7/appcompat/R$attr;->colorControlNormal:I

    .line 391
    const/4 v3, 0x1

    .line 405
    :cond_10
    :goto_10
    if-eqz v3, :cond_5a

    .line 406
    invoke-static {p2}, Landroid/support/v7/widget/DrawableUtils;->canSafelyMutateDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v5

    if-eqz v5, :cond_1c

    .line 407
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    .line 410
    :cond_1c
    invoke-static {p0, v2}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColor(Landroid/content/Context;I)I

    move-result v1

    .line 411
    .local v1, "color":I
    invoke-static {v1, v4}, Landroid/support/v7/widget/AppCompatDrawableManager;->getPorterDuffColorFilter(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v5

    invoke-virtual {p2, v5}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 413
    const/4 v5, -0x1

    if-eq v0, v5, :cond_2d

    .line 414
    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 422
    :cond_2d
    const/4 v5, 0x1

    .line 424
    .end local v1    # "color":I
    :goto_2e
    return v5

    .line 392
    :cond_2f
    sget-object v5, Landroid/support/v7/widget/AppCompatDrawableManager;->COLORFILTER_COLOR_CONTROL_ACTIVATED:[I

    invoke-static {v5, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->arrayContains([II)Z

    move-result v5

    if-eqz v5, :cond_3b

    .line 393
    sget v2, Landroid/support/v7/appcompat/R$attr;->colorControlActivated:I

    .line 394
    const/4 v3, 0x1

    goto :goto_10

    .line 395
    :cond_3b
    sget-object v5, Landroid/support/v7/widget/AppCompatDrawableManager;->COLORFILTER_COLOR_BACKGROUND_MULTIPLY:[I

    invoke-static {v5, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->arrayContains([II)Z

    move-result v5

    if-eqz v5, :cond_4a

    .line 396
    const v2, 0x1010031

    .line 397
    const/4 v3, 0x1

    .line 398
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    goto :goto_10

    .line 399
    :cond_4a
    sget v5, Landroid/support/v7/appcompat/R$drawable;->abc_list_divider_mtrl_alpha:I

    if-ne p1, v5, :cond_10

    .line 400
    const v2, 0x1010030

    .line 401
    const/4 v3, 0x1

    .line 402
    const v5, 0x42233333    # 40.8f

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v0

    goto :goto_10

    .line 424
    :cond_5a
    const/4 v5, 0x0

    goto :goto_2e
.end method


# virtual methods
.method public getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 173
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroid/support/v7/widget/AppCompatDrawableManager;->getDrawable(Landroid/content/Context;IZ)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getDrawable(Landroid/content/Context;IZ)Landroid/graphics/drawable/Drawable;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3, "failIfNotKnown"    # Z

    .prologue
    .line 178
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/AppCompatDrawableManager;->loadDrawableFromDelegates(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 179
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_a

    .line 180
    invoke-static {p1, p2}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 182
    :cond_a
    if-eqz v0, :cond_10

    .line 184
    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v7/widget/AppCompatDrawableManager;->tintDrawable(Landroid/content/Context;IZLandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 186
    :cond_10
    if-eqz v0, :cond_15

    .line 188
    invoke-static {v0}, Landroid/support/v7/widget/DrawableUtils;->fixDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 190
    :cond_15
    return-object v0
.end method

.method public final getTintList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 461
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/AppCompatDrawableManager;->getTintListFromCache(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 463
    .local v0, "tint":Landroid/content/res/ColorStateList;
    if-nez v0, :cond_13

    .line 465
    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_edit_text_material:I

    if-ne p2, v1, :cond_14

    .line 466
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->createEditTextColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 489
    :cond_e
    :goto_e
    if-eqz v0, :cond_13

    .line 490
    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/AppCompatDrawableManager;->addTintListToCache(Landroid/content/Context;ILandroid/content/res/ColorStateList;)V

    .line 493
    :cond_13
    return-object v0

    .line 467
    :cond_14
    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_switch_track_mtrl_alpha:I

    if-ne p2, v1, :cond_1d

    .line 468
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->createSwitchTrackColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_e

    .line 469
    :cond_1d
    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_switch_thumb_material:I

    if-ne p2, v1, :cond_26

    .line 470
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->createSwitchThumbColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_e

    .line 471
    :cond_26
    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_btn_default_mtrl_shape:I

    if-eq p2, v1, :cond_2e

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_btn_borderless_material:I

    if-ne p2, v1, :cond_33

    .line 473
    :cond_2e
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->createDefaultButtonColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_e

    .line 474
    :cond_33
    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_btn_colored_material:I

    if-ne p2, v1, :cond_3c

    .line 475
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->createColoredButtonColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_e

    .line 476
    :cond_3c
    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_spinner_mtrl_am_alpha:I

    if-eq p2, v1, :cond_44

    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_spinner_textfield_background_material:I

    if-ne p2, v1, :cond_49

    .line 478
    :cond_44
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->createSpinnerColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_e

    .line 479
    :cond_49
    sget-object v1, Landroid/support/v7/widget/AppCompatDrawableManager;->TINT_COLOR_CONTROL_NORMAL:[I

    invoke-static {v1, p2}, Landroid/support/v7/widget/AppCompatDrawableManager;->arrayContains([II)Z

    move-result v1

    if-eqz v1, :cond_58

    .line 480
    sget v1, Landroid/support/v7/appcompat/R$attr;->colorControlNormal:I

    invoke-static {p1, v1}, Landroid/support/v7/widget/ThemeUtils;->getThemeAttrColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_e

    .line 481
    :cond_58
    sget-object v1, Landroid/support/v7/widget/AppCompatDrawableManager;->TINT_COLOR_CONTROL_STATE_LIST:[I

    invoke-static {v1, p2}, Landroid/support/v7/widget/AppCompatDrawableManager;->arrayContains([II)Z

    move-result v1

    if-eqz v1, :cond_65

    .line 482
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->createDefaultColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_e

    .line 483
    :cond_65
    sget-object v1, Landroid/support/v7/widget/AppCompatDrawableManager;->TINT_CHECKABLE_BUTTON_LIST:[I

    invoke-static {v1, p2}, Landroid/support/v7/widget/AppCompatDrawableManager;->arrayContains([II)Z

    move-result v1

    if-eqz v1, :cond_72

    .line 484
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->createCheckableButtonColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_e

    .line 485
    :cond_72
    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_seekbar_thumb_material:I

    if-ne p2, v1, :cond_e

    .line 486
    invoke-direct {p0, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->createSeekbarThumbColorStateList(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_e
.end method

.method final getTintMode(I)Landroid/graphics/PorterDuff$Mode;
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 450
    const/4 v0, 0x0

    .line 452
    .local v0, "mode":Landroid/graphics/PorterDuff$Mode;
    sget v1, Landroid/support/v7/appcompat/R$drawable;->abc_switch_thumb_material:I

    if-ne p1, v1, :cond_7

    .line 453
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    .line 456
    :cond_7
    return-object v0
.end method

.method public final onDrawableLoadedFromResources(Landroid/content/Context;Landroid/support/v7/widget/TintResources;I)Landroid/graphics/drawable/Drawable;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "resources"    # Landroid/support/v7/widget/TintResources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 372
    invoke-direct {p0, p1, p3}, Landroid/support/v7/widget/AppCompatDrawableManager;->loadDrawableFromDelegates(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 373
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_a

    .line 374
    invoke-virtual {p2, p3}, Landroid/support/v7/widget/TintResources;->superGetDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 376
    :cond_a
    if-eqz v0, :cond_12

    .line 377
    const/4 v1, 0x0

    invoke-direct {p0, p1, p3, v1, v0}, Landroid/support/v7/widget/AppCompatDrawableManager;->tintDrawable(Landroid/content/Context;IZLandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 379
    :goto_11
    return-object v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method
