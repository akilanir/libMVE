.class public Lcom/rey/material/widget/ListPopupWindow;
.super Ljava/lang/Object;
.source "ListPopupWindow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/widget/ListPopupWindow$PopupScrollListener;,
        Lcom/rey/material/widget/ListPopupWindow$PopupTouchInterceptor;,
        Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;,
        Lcom/rey/material/widget/ListPopupWindow$ListSelectorHider;,
        Lcom/rey/material/widget/ListPopupWindow$PopupDataSetObserver;,
        Lcom/rey/material/widget/ListPopupWindow$DropDownListView;,
        Lcom/rey/material/widget/ListPopupWindow$ForwardingListener;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final EXPAND_LIST_TIMEOUT:I = 0xfa

.field public static final INPUT_METHOD_FROM_FOCUSABLE:I = 0x0

.field public static final INPUT_METHOD_NEEDED:I = 0x1

.field public static final INPUT_METHOD_NOT_NEEDED:I = 0x2

.field public static final MATCH_PARENT:I = -0x1

.field public static final POSITION_PROMPT_ABOVE:I = 0x0

.field public static final POSITION_PROMPT_BELOW:I = 0x1

.field private static final TAG:Ljava/lang/String; = "ListPopupWindow"

.field public static final WRAP_CONTENT:I = -0x2

.field private static sClipToWindowEnabledMethod:Ljava/lang/reflect/Method;


# instance fields
.field private mAdapter:Landroid/widget/ListAdapter;

.field private mContext:Landroid/content/Context;

.field private mDropDownAlwaysVisible:Z

.field private mDropDownAnchorView:Landroid/view/View;

.field private mDropDownGravity:I

.field private mDropDownHeight:I

.field private mDropDownHorizontalOffset:I

.field private mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

.field private mDropDownListHighlight:Landroid/graphics/drawable/Drawable;

.field private mDropDownVerticalOffset:I

.field private mDropDownVerticalOffsetSet:Z

.field private mDropDownWidth:I

.field private mForceIgnoreOutsideTouch:Z

.field private mHandler:Landroid/os/Handler;

.field private final mHideSelector:Lcom/rey/material/widget/ListPopupWindow$ListSelectorHider;

.field private mItemAnimationId:I

.field private mItemAnimationOffset:I

.field private mItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private mItemSelectedListener:Landroid/widget/AdapterView$OnItemSelectedListener;

.field private mLayoutDirection:I

.field mListItemExpandMaximum:I

.field private mModal:Z

.field private mObserver:Landroid/database/DataSetObserver;

.field private mPopup:Lcom/rey/material/widget/PopupWindow;

.field private mPromptPosition:I

.field private mPromptView:Landroid/view/View;

.field private final mResizePopupRunnable:Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;

.field private final mScrollListener:Lcom/rey/material/widget/ListPopupWindow$PopupScrollListener;

.field private mShowDropDownRunnable:Ljava/lang/Runnable;

.field private mTempRect:Landroid/graphics/Rect;

.field private final mTouchInterceptor:Lcom/rey/material/widget/ListPopupWindow$PopupTouchInterceptor;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    .line 78
    :try_start_0
    const-class v1, Landroid/widget/PopupWindow;

    const-string v2, "setClipToScreenEnabled"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/rey/material/widget/ListPopupWindow;->sClipToWindowEnabledMethod:Ljava/lang/reflect/Method;
    :try_end_12
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_12} :catch_13

    .line 83
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    :goto_12
    return-void

    .line 80
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_13
    move-exception v0

    .line 81
    .restart local v0    # "e":Ljava/lang/NoSuchMethodException;
    const-string v1, "ListPopupWindow"

    const-string v2, "Could not find method setClipToScreenEnabled() on PopupWindow. Oh well."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 193
    const/4 v0, 0x0

    sget v1, Lcom/rey/material/R$attr;->listPopupWindowStyle:I

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/rey/material/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 194
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 204
    sget v0, Lcom/rey/material/R$attr;->listPopupWindowStyle:I

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/rey/material/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 205
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 216
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/rey/material/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 217
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v2, -0x2

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 228
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHeight:I

    .line 91
    iput v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    .line 99
    iput v3, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownGravity:I

    .line 101
    iput-boolean v3, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownAlwaysVisible:Z

    .line 102
    iput-boolean v3, p0, Lcom/rey/material/widget/ListPopupWindow;->mForceIgnoreOutsideTouch:Z

    .line 103
    const v2, 0x7fffffff

    iput v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mListItemExpandMaximum:I

    .line 106
    iput v3, p0, Lcom/rey/material/widget/ListPopupWindow;->mPromptPosition:I

    .line 117
    new-instance v2, Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;

    invoke-direct {v2, p0, v4}, Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;-><init>(Lcom/rey/material/widget/ListPopupWindow;Lcom/rey/material/widget/ListPopupWindow$1;)V

    iput-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mResizePopupRunnable:Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;

    .line 118
    new-instance v2, Lcom/rey/material/widget/ListPopupWindow$PopupTouchInterceptor;

    invoke-direct {v2, p0, v4}, Lcom/rey/material/widget/ListPopupWindow$PopupTouchInterceptor;-><init>(Lcom/rey/material/widget/ListPopupWindow;Lcom/rey/material/widget/ListPopupWindow$1;)V

    iput-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mTouchInterceptor:Lcom/rey/material/widget/ListPopupWindow$PopupTouchInterceptor;

    .line 119
    new-instance v2, Lcom/rey/material/widget/ListPopupWindow$PopupScrollListener;

    invoke-direct {v2, p0, v4}, Lcom/rey/material/widget/ListPopupWindow$PopupScrollListener;-><init>(Lcom/rey/material/widget/ListPopupWindow;Lcom/rey/material/widget/ListPopupWindow$1;)V

    iput-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mScrollListener:Lcom/rey/material/widget/ListPopupWindow$PopupScrollListener;

    .line 120
    new-instance v2, Lcom/rey/material/widget/ListPopupWindow$ListSelectorHider;

    invoke-direct {v2, p0, v4}, Lcom/rey/material/widget/ListPopupWindow$ListSelectorHider;-><init>(Lcom/rey/material/widget/ListPopupWindow;Lcom/rey/material/widget/ListPopupWindow$1;)V

    iput-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mHideSelector:Lcom/rey/material/widget/ListPopupWindow$ListSelectorHider;

    .line 123
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    iput-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mHandler:Landroid/os/Handler;

    .line 125
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    .line 229
    iput-object p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mContext:Landroid/content/Context;

    .line 231
    sget-object v2, Lcom/rey/material/R$styleable;->ListPopupWindow:[I

    invoke-virtual {p1, p2, v2, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 233
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v2, Lcom/rey/material/R$styleable;->ListPopupWindow_android_dropDownHorizontalOffset:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHorizontalOffset:I

    .line 235
    sget v2, Lcom/rey/material/R$styleable;->ListPopupWindow_android_dropDownVerticalOffset:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    iput v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    .line 237
    iget v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    if-eqz v2, :cond_60

    .line 238
    iput-boolean v5, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownVerticalOffsetSet:Z

    .line 240
    :cond_60
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 242
    new-instance v2, Lcom/rey/material/widget/PopupWindow;

    invoke-direct {v2, p1, p2, p3}, Lcom/rey/material/widget/PopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    .line 243
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v2, v5}, Lcom/rey/material/widget/PopupWindow;->setInputMethodMode(I)V

    .line 246
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget-object v1, v2, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 247
    .local v1, "locale":Ljava/util/Locale;
    invoke-static {v1}, Landroid/support/v4/text/TextUtilsCompat;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result v2

    iput v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mLayoutDirection:I

    .line 248
    return-void
.end method

.method static synthetic access$1500(Lcom/rey/material/widget/ListPopupWindow;)Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/ListPopupWindow;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mResizePopupRunnable:Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/rey/material/widget/ListPopupWindow;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/ListPopupWindow;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$500(Lcom/rey/material/widget/ListPopupWindow;)Lcom/rey/material/widget/PopupWindow;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/ListPopupWindow;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    return-object v0
.end method

.method static synthetic access$600(Lcom/rey/material/widget/ListPopupWindow;)Lcom/rey/material/widget/ListPopupWindow$DropDownListView;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/ListPopupWindow;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    return-object v0
.end method

.method static synthetic access$700(Lcom/rey/material/widget/ListPopupWindow;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/ListPopupWindow;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$800(Lcom/rey/material/widget/ListPopupWindow;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/ListPopupWindow;

    .prologue
    .line 63
    iget v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mItemAnimationId:I

    return v0
.end method

.method static synthetic access$900(Lcom/rey/material/widget/ListPopupWindow;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/ListPopupWindow;

    .prologue
    .line 63
    iget v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mItemAnimationOffset:I

    return v0
.end method

.method private buildDropDown()I
    .registers 23

    .prologue
    .line 1081
    const/16 v17, 0x0

    .line 1083
    .local v17, "otherHeights":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    if-nez v1, :cond_17f

    .line 1085
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/rey/material/widget/ListPopupWindow;->mContext:Landroid/content/Context;

    .line 1093
    .local v8, "context":Landroid/content/Context;
    new-instance v1, Lcom/rey/material/widget/ListPopupWindow$3;

    move-object/from16 v0, p0

    invoke-direct {v1, v0}, Lcom/rey/material/widget/ListPopupWindow$3;-><init>(Lcom/rey/material/widget/ListPopupWindow;)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mShowDropDownRunnable:Ljava/lang/Runnable;

    .line 1103
    new-instance v3, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mModal:Z

    if-nez v1, :cond_16c

    const/4 v1, 0x1

    :goto_20
    invoke-direct {v3, v8, v1}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;-><init>(Landroid/content/Context;Z)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    .line 1104
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownListHighlight:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_38

    .line 1105
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownListHighlight:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v3}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 1107
    :cond_38
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/ListPopupWindow;->mAdapter:Landroid/widget/ListAdapter;

    invoke-virtual {v1, v3}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1108
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/ListPopupWindow;->mItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v1, v3}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 1109
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setFocusable(Z)V

    .line 1110
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setFocusableInTouchMode(Z)V

    .line 1111
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    new-instance v3, Lcom/rey/material/widget/ListPopupWindow$4;

    move-object/from16 v0, p0

    invoke-direct {v3, v0}, Lcom/rey/material/widget/ListPopupWindow$4;-><init>(Lcom/rey/material/widget/ListPopupWindow;)V

    invoke-virtual {v1, v3}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 1127
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/ListPopupWindow;->mScrollListener:Lcom/rey/material/widget/ListPopupWindow$PopupScrollListener;

    invoke-virtual {v1, v3}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 1129
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mItemSelectedListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    if-eqz v1, :cond_88

    .line 1130
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/ListPopupWindow;->mItemSelectedListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-virtual {v1, v3}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 1133
    :cond_88
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    .line 1135
    .local v9, "dropDownView":Landroid/view/ViewGroup;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/rey/material/widget/ListPopupWindow;->mPromptView:Landroid/view/View;

    .line 1136
    .local v13, "hintView":Landroid/view/View;
    if-eqz v13, :cond_e9

    .line 1139
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1140
    .local v11, "hintContainer":Landroid/widget/LinearLayout;
    const/4 v1, 0x1

    invoke-virtual {v11, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 1142
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v12, v1, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 1146
    .local v12, "hintParams":Landroid/widget/LinearLayout$LayoutParams;
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mPromptPosition:I

    packed-switch v1, :pswitch_data_210

    .line 1158
    const-string v1, "ListPopupWindow"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid hint position "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/ListPopupWindow;->mPromptPosition:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1164
    :goto_c7
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    const/high16 v3, -0x80000000

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v21

    .line 1165
    .local v21, "widthSpec":I
    const/4 v10, 0x0

    .line 1166
    .local v10, "heightSpec":I
    move/from16 v0, v21

    invoke-virtual {v13, v0, v10}, Landroid/view/View;->measure(II)V

    .line 1168
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    .end local v12    # "hintParams":Landroid/widget/LinearLayout$LayoutParams;
    check-cast v12, Landroid/widget/LinearLayout$LayoutParams;

    .line 1169
    .restart local v12    # "hintParams":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    iget v3, v12, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr v1, v3

    iget v3, v12, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int v17, v1, v3

    .line 1172
    move-object v9, v11

    .line 1175
    .end local v10    # "heightSpec":I
    .end local v11    # "hintContainer":Landroid/widget/LinearLayout;
    .end local v12    # "hintParams":Landroid/widget/LinearLayout$LayoutParams;
    .end local v21    # "widthSpec":I
    :cond_e9
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v1, v9}, Lcom/rey/material/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 1189
    .end local v8    # "context":Landroid/content/Context;
    .end local v9    # "dropDownView":Landroid/view/ViewGroup;
    .end local v13    # "hintView":Landroid/view/View;
    :cond_f0
    :goto_f0
    const/16 v18, 0x0

    .line 1190
    .local v18, "padding":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v1}, Lcom/rey/material/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 1191
    .local v7, "background":Landroid/graphics/drawable/Drawable;
    if-eqz v7, :cond_19a

    .line 1192
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v7, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 1193
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    add-int v18, v1, v3

    .line 1197
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownVerticalOffsetSet:Z

    if-nez v1, :cond_122

    .line 1198
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    neg-int v1, v1

    move-object/from16 v0, p0

    iput v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    .line 1204
    :cond_122
    :goto_122
    const/16 v19, 0x0

    .line 1205
    .local v19, "systemBarsReservedSpace":I
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v1, v3, :cond_13e

    .line 1207
    const-string v1, "status_bar_height"

    move-object/from16 v0, p0

    invoke-direct {v0, v1}, Lcom/rey/material/widget/ListPopupWindow;->getSystemBarHeight(Ljava/lang/String;)I

    move-result v1

    const-string v3, "navigation_bar_height"

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/rey/material/widget/ListPopupWindow;->getSystemBarHeight(Ljava/lang/String;)I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v19

    .line 1214
    :cond_13e
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v1}, Lcom/rey/material/widget/PopupWindow;->getInputMethodMode()I

    move-result v1

    const/4 v3, 0x2

    if-ne v1, v3, :cond_1a2

    const/4 v14, 0x1

    .line 1216
    .local v14, "ignoreBottomDecorations":Z
    :goto_14a
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/ListPopupWindow;->getAnchorView()Landroid/view/View;

    move-result-object v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    invoke-virtual {v1, v3, v4}, Lcom/rey/material/widget/PopupWindow;->getMaxAvailableHeight(Landroid/view/View;I)I

    move-result v1

    sub-int v16, v1, v19

    .line 1220
    .local v16, "maxHeight":I
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownAlwaysVisible:Z

    if-nez v1, :cond_169

    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHeight:I

    const/4 v3, -0x1

    if-ne v1, v3, :cond_1a4

    .line 1221
    :cond_169
    add-int v1, v16, v18

    .line 1249
    :goto_16b
    return v1

    .line 1103
    .end local v7    # "background":Landroid/graphics/drawable/Drawable;
    .end local v14    # "ignoreBottomDecorations":Z
    .end local v16    # "maxHeight":I
    .end local v18    # "padding":I
    .end local v19    # "systemBarsReservedSpace":I
    .restart local v8    # "context":Landroid/content/Context;
    :cond_16c
    const/4 v1, 0x0

    goto/16 :goto_20

    .line 1148
    .restart local v9    # "dropDownView":Landroid/view/ViewGroup;
    .restart local v11    # "hintContainer":Landroid/widget/LinearLayout;
    .restart local v12    # "hintParams":Landroid/widget/LinearLayout$LayoutParams;
    .restart local v13    # "hintView":Landroid/view/View;
    :pswitch_16f
    invoke-virtual {v11, v9, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1149
    invoke-virtual {v11, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_c7

    .line 1153
    :pswitch_177
    invoke-virtual {v11, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1154
    invoke-virtual {v11, v9, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_c7

    .line 1178
    .end local v8    # "context":Landroid/content/Context;
    .end local v9    # "dropDownView":Landroid/view/ViewGroup;
    .end local v11    # "hintContainer":Landroid/widget/LinearLayout;
    .end local v12    # "hintParams":Landroid/widget/LinearLayout$LayoutParams;
    .end local v13    # "hintView":Landroid/view/View;
    :cond_17f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/ListPopupWindow;->mPromptView:Landroid/view/View;

    move-object/from16 v20, v0

    .line 1179
    .local v20, "view":Landroid/view/View;
    if-eqz v20, :cond_f0

    .line 1180
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Landroid/widget/LinearLayout$LayoutParams;

    .line 1182
    .restart local v12    # "hintParams":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    iget v3, v12, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr v1, v3

    iget v3, v12, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int v17, v1, v3

    goto/16 :goto_f0

    .line 1201
    .end local v12    # "hintParams":Landroid/widget/LinearLayout$LayoutParams;
    .end local v20    # "view":Landroid/view/View;
    .restart local v7    # "background":Landroid/graphics/drawable/Drawable;
    .restart local v18    # "padding":I
    :cond_19a
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->setEmpty()V

    goto :goto_122

    .line 1214
    .restart local v19    # "systemBarsReservedSpace":I
    :cond_1a2
    const/4 v14, 0x0

    goto :goto_14a

    .line 1225
    .restart local v14    # "ignoreBottomDecorations":Z
    .restart local v16    # "maxHeight":I
    :cond_1a4
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    packed-switch v1, :pswitch_data_218

    .line 1239
    move-object/from16 v0, p0

    iget v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 1243
    .local v2, "childWidthSpec":I
    :goto_1b5
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    const/4 v3, 0x0

    const/4 v4, -0x1

    sub-int v5, v16, v17

    const/4 v6, -0x1

    invoke-virtual/range {v1 .. v6}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->measureHeightOfChildrenCompat(IIIII)I

    move-result v15

    .line 1247
    .local v15, "listContent":I
    if-lez v15, :cond_1c6

    add-int v17, v17, v18

    .line 1249
    :cond_1c6
    add-int v1, v15, v17

    goto :goto_16b

    .line 1227
    .end local v2    # "childWidthSpec":I
    .end local v15    # "listContent":I
    :pswitch_1c9
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    add-int/2addr v3, v4

    sub-int/2addr v1, v3

    const/high16 v3, -0x80000000

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 1231
    .restart local v2    # "childWidthSpec":I
    goto :goto_1b5

    .line 1233
    .end local v2    # "childWidthSpec":I
    :pswitch_1ec
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/rey/material/widget/ListPopupWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/rey/material/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    add-int/2addr v3, v4

    sub-int/2addr v1, v3

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 1237
    .restart local v2    # "childWidthSpec":I
    goto :goto_1b5

    .line 1146
    nop

    :pswitch_data_210
    .packed-switch 0x0
        :pswitch_177
        :pswitch_16f
    .end packed-switch

    .line 1225
    :pswitch_data_218
    .packed-switch -0x2
        :pswitch_1c9
        :pswitch_1ec
    .end packed-switch
.end method

.method private getSystemBarHeight(Ljava/lang/String;)I
    .registers 7
    .param p1, "resourceName"    # Ljava/lang/String;

    .prologue
    .line 1066
    const/4 v0, 0x0

    .line 1067
    .local v0, "height":I
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "dimen"

    const-string v4, "android"

    invoke-virtual {v2, p1, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 1068
    .local v1, "resourceId":I
    if-lez v1, :cond_1b

    .line 1069
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 1071
    :cond_1b
    return v0
.end method

.method private static isConfirmKey(I)Z
    .registers 2
    .param p0, "keyCode"    # I

    .prologue
    .line 1808
    const/16 v0, 0x42

    if-eq p0, v0, :cond_8

    const/16 v0, 0x17

    if-ne p0, v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private removePromptView()V
    .registers 4

    .prologue
    .line 708
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mPromptView:Landroid/view/View;

    if-eqz v2, :cond_16

    .line 709
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mPromptView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 710
    .local v1, "parent":Landroid/view/ViewParent;
    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_16

    move-object v0, v1

    .line 711
    check-cast v0, Landroid/view/ViewGroup;

    .line 712
    .local v0, "group":Landroid/view/ViewGroup;
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mPromptView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 715
    .end local v0    # "group":Landroid/view/ViewGroup;
    .end local v1    # "parent":Landroid/view/ViewParent;
    :cond_16
    return-void
.end method

.method private setPopupClipToScreenEnabled(Z)V
    .registers 8
    .param p1, "clip"    # Z

    .prologue
    const/4 v3, 0x0

    .line 1812
    sget-object v1, Lcom/rey/material/widget/ListPopupWindow;->sClipToWindowEnabledMethod:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_20

    .line 1814
    :try_start_5
    sget-object v1, Lcom/rey/material/widget/ListPopupWindow;->sClipToWindowEnabledMethod:Ljava/lang/reflect/Method;

    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_16} :catch_17

    .line 1821
    :cond_16
    :goto_16
    return-void

    .line 1815
    :catch_17
    move-exception v0

    .line 1816
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "ListPopupWindow"

    const-string v2, "Could not call setClipToScreenEnabled() on PopupWindow. Oh well."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_16

    .line 1818
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_20
    if-eqz p1, :cond_16

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v2, 0x3

    if-lt v1, v2, :cond_16

    .line 1819
    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v1, v3}, Lcom/rey/material/widget/PopupWindow;->setClippingEnabled(Z)V

    goto :goto_16
.end method


# virtual methods
.method public clearListSelection()V
    .registers 3

    .prologue
    .line 767
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    .line 768
    .local v0, "list":Lcom/rey/material/widget/ListPopupWindow$DropDownListView;
    if-eqz v0, :cond_b

    .line 770
    const/4 v1, 0x1

    # setter for: Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mListSelectionHidden:Z
    invoke-static {v0, v1}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->access$1002(Lcom/rey/material/widget/ListPopupWindow$DropDownListView;Z)Z

    .line 772
    invoke-virtual {v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->requestLayout()V

    .line 774
    :cond_b
    return-void
.end method

.method public createDragToOpenListener(Landroid/view/View;)Landroid/view/View$OnTouchListener;
    .registers 3
    .param p1, "src"    # Landroid/view/View;

    .prologue
    .line 1057
    new-instance v0, Lcom/rey/material/widget/ListPopupWindow$2;

    invoke-direct {v0, p0, p1}, Lcom/rey/material/widget/ListPopupWindow$2;-><init>(Lcom/rey/material/widget/ListPopupWindow;Landroid/view/View;)V

    return-object v0
.end method

.method public dismiss()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 691
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0}, Lcom/rey/material/widget/PopupWindow;->dismiss()V

    .line 692
    invoke-direct {p0}, Lcom/rey/material/widget/ListPopupWindow;->removePromptView()V

    .line 693
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 694
    iput-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    .line 695
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mResizePopupRunnable:Lcom/rey/material/widget/ListPopupWindow$ResizePopupRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 696
    return-void
.end method

.method public getAnchorView()Landroid/view/View;
    .registers 2

    .prologue
    .line 426
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownAnchorView:Landroid/view/View;

    return-object v0
.end method

.method public getAnimationStyle()I
    .registers 2

    .prologue
    .line 417
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0}, Lcom/rey/material/widget/PopupWindow;->getAnimationStyle()I

    move-result v0

    return v0
.end method

.method public getBackground()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 263
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0}, Lcom/rey/material/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 522
    iget v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHeight:I

    return v0
.end method

.method public getHorizontalOffset()I
    .registers 2

    .prologue
    .line 443
    iget v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHorizontalOffset:I

    return v0
.end method

.method public getInputMethodMode()I
    .registers 2

    .prologue
    .line 739
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0}, Lcom/rey/material/widget/PopupWindow;->getInputMethodMode()I

    move-result v0

    return v0
.end method

.method public getListView()Lcom/rey/material/widget/ListView;
    .registers 2

    .prologue
    .line 865
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    return-object v0
.end method

.method public getPopup()Lcom/rey/material/widget/PopupWindow;
    .registers 2

    .prologue
    .line 869
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    return-object v0
.end method

.method public getPromptPosition()I
    .registers 2

    .prologue
    .line 308
    iget v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPromptPosition:I

    return v0
.end method

.method public getSelectedItem()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 815
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    if-nez v0, :cond_8

    .line 816
    const/4 v0, 0x0

    .line 818
    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    invoke-virtual {v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    goto :goto_7
.end method

.method public getSelectedItemId()J
    .registers 3

    .prologue
    .line 841
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    if-nez v0, :cond_9

    .line 842
    const-wide/high16 v0, -0x8000000000000000L

    .line 844
    :goto_8
    return-wide v0

    :cond_9
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    invoke-virtual {v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getSelectedItemId()J

    move-result-wide v0

    goto :goto_8
.end method

.method public getSelectedItemPosition()I
    .registers 2

    .prologue
    .line 828
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    if-nez v0, :cond_8

    .line 829
    const/4 v0, -0x1

    .line 831
    :goto_7
    return v0

    :cond_8
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    invoke-virtual {v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getSelectedItemPosition()I

    move-result v0

    goto :goto_7
.end method

.method public getSelectedView()Landroid/view/View;
    .registers 2

    .prologue
    .line 854
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    if-nez v0, :cond_8

    .line 855
    const/4 v0, 0x0

    .line 857
    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    invoke-virtual {v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getSelectedView()Landroid/view/View;

    move-result-object v0

    goto :goto_7
.end method

.method public getSoftInputMode()I
    .registers 2

    .prologue
    .line 390
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0}, Lcom/rey/material/widget/PopupWindow;->getSoftInputMode()I

    move-result v0

    return v0
.end method

.method public getVerticalOffset()I
    .registers 2

    .prologue
    .line 459
    iget-boolean v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownVerticalOffsetSet:Z

    if-nez v0, :cond_6

    .line 460
    const/4 v0, 0x0

    .line 462
    :goto_5
    return v0

    :cond_6
    iget v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    goto :goto_5
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 489
    iget v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    return v0
.end method

.method public isDropDownAlwaysVisible()Z
    .registers 2

    .prologue
    .line 366
    iget-boolean v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownAlwaysVisible:Z

    return v0
.end method

.method public isInputMethodNotNeeded()Z
    .registers 3

    .prologue
    .line 788
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0}, Lcom/rey/material/widget/PopupWindow;->getInputMethodMode()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public isModal()Z
    .registers 2

    .prologue
    .line 331
    iget-boolean v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mModal:Z

    return v0
.end method

.method public isShowing()Z
    .registers 2

    .prologue
    .line 780
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0}, Lcom/rey/material/widget/PopupWindow;->isShowing()Z

    move-result v0

    return v0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 16
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/16 v12, 0x14

    const/16 v11, 0x13

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 894
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->isShowing()Z

    move-result v9

    if-eqz v9, :cond_91

    .line 900
    const/16 v9, 0x3e

    if-eq p1, v9, :cond_91

    iget-object v9, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    invoke-virtual {v9}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getSelectedItemPosition()I

    move-result v9

    if-gez v9, :cond_1e

    invoke-static {p1}, Lcom/rey/material/widget/ListPopupWindow;->isConfirmKey(I)Z

    move-result v9

    if-nez v9, :cond_91

    .line 903
    :cond_1e
    iget-object v9, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    invoke-virtual {v9}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getSelectedItemPosition()I

    move-result v4

    .line 906
    .local v4, "curIndex":I
    iget-object v9, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v9}, Lcom/rey/material/widget/PopupWindow;->isAboveAnchor()Z

    move-result v9

    if-nez v9, :cond_5d

    move v2, v7

    .line 908
    .local v2, "below":Z
    :goto_2d
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mAdapter:Landroid/widget/ListAdapter;

    .line 911
    .local v0, "adapter":Landroid/widget/ListAdapter;
    const v5, 0x7fffffff

    .line 912
    .local v5, "firstItem":I
    const/high16 v6, -0x80000000

    .line 914
    .local v6, "lastItem":I
    if-eqz v0, :cond_45

    .line 915
    invoke-interface {v0}, Landroid/widget/ListAdapter;->areAllItemsEnabled()Z

    move-result v1

    .line 916
    .local v1, "allEnabled":Z
    if-eqz v1, :cond_5f

    move v5, v8

    .line 918
    :goto_3d
    if-eqz v1, :cond_66

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v9

    add-int/lit8 v6, v9, -0x1

    .line 922
    .end local v1    # "allEnabled":Z
    :cond_45
    :goto_45
    if-eqz v2, :cond_4b

    if-ne p1, v11, :cond_4b

    if-le v4, v5, :cond_51

    :cond_4b
    if-nez v2, :cond_73

    if-ne p1, v12, :cond_73

    if-lt v4, v6, :cond_73

    .line 926
    :cond_51
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->clearListSelection()V

    .line 927
    iget-object v8, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v8, v7}, Lcom/rey/material/widget/PopupWindow;->setInputMethodMode(I)V

    .line 928
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->show()V

    .line 974
    .end local v0    # "adapter":Landroid/widget/ListAdapter;
    .end local v2    # "below":Z
    .end local v4    # "curIndex":I
    .end local v5    # "firstItem":I
    .end local v6    # "lastItem":I
    :goto_5c
    :sswitch_5c
    return v7

    .restart local v4    # "curIndex":I
    :cond_5d
    move v2, v8

    .line 906
    goto :goto_2d

    .line 916
    .restart local v0    # "adapter":Landroid/widget/ListAdapter;
    .restart local v1    # "allEnabled":Z
    .restart local v2    # "below":Z
    .restart local v5    # "firstItem":I
    .restart local v6    # "lastItem":I
    :cond_5f
    iget-object v9, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    invoke-virtual {v9, v8, v7}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->lookForSelectablePosition(IZ)I

    move-result v5

    goto :goto_3d

    .line 918
    :cond_66
    iget-object v9, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v9, v10, v8}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->lookForSelectablePosition(IZ)I

    move-result v6

    goto :goto_45

    .line 933
    .end local v1    # "allEnabled":Z
    :cond_73
    iget-object v9, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    # setter for: Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mListSelectionHidden:Z
    invoke-static {v9, v8}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->access$1002(Lcom/rey/material/widget/ListPopupWindow$DropDownListView;Z)Z

    .line 936
    iget-object v9, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    invoke-virtual {v9, p1, p2}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v3

    .line 939
    .local v3, "consumed":Z
    if-eqz v3, :cond_93

    .line 942
    iget-object v9, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    const/4 v10, 0x2

    invoke-virtual {v9, v10}, Lcom/rey/material/widget/PopupWindow;->setInputMethodMode(I)V

    .line 947
    iget-object v9, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    invoke-virtual {v9}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->requestFocusFromTouch()Z

    .line 948
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->show()V

    .line 950
    sparse-switch p1, :sswitch_data_a2

    .end local v0    # "adapter":Landroid/widget/ListAdapter;
    .end local v2    # "below":Z
    .end local v3    # "consumed":Z
    .end local v4    # "curIndex":I
    .end local v5    # "firstItem":I
    .end local v6    # "lastItem":I
    :cond_91
    move v7, v8

    .line 974
    goto :goto_5c

    .line 960
    .restart local v0    # "adapter":Landroid/widget/ListAdapter;
    .restart local v2    # "below":Z
    .restart local v3    # "consumed":Z
    .restart local v4    # "curIndex":I
    .restart local v5    # "firstItem":I
    .restart local v6    # "lastItem":I
    :cond_93
    if-eqz v2, :cond_9a

    if-ne p1, v12, :cond_9a

    .line 963
    if-ne v4, v6, :cond_91

    goto :goto_5c

    .line 966
    :cond_9a
    if-nez v2, :cond_91

    if-ne p1, v11, :cond_91

    if-ne v4, v5, :cond_91

    goto :goto_5c

    .line 950
    nop

    :sswitch_data_a2
    .sparse-switch
        0x13 -> :sswitch_5c
        0x14 -> :sswitch_5c
        0x17 -> :sswitch_5c
        0x42 -> :sswitch_5c
    .end sparse-switch
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .registers 7
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v2, 0x1

    .line 1012
    const/4 v3, 0x4

    if-ne p1, v3, :cond_41

    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_41

    .line 1015
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownAnchorView:Landroid/view/View;

    .line 1016
    .local v0, "anchorView":Landroid/view/View;
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v3

    if-nez v3, :cond_22

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v3

    if-nez v3, :cond_22

    .line 1017
    invoke-virtual {v0}, Landroid/view/View;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    move-result-object v1

    .line 1018
    .local v1, "state":Landroid/view/KeyEvent$DispatcherState;
    if-eqz v1, :cond_21

    .line 1019
    invoke-virtual {v1, p2, p0}, Landroid/view/KeyEvent$DispatcherState;->startTracking(Landroid/view/KeyEvent;Ljava/lang/Object;)V

    .line 1033
    .end local v0    # "anchorView":Landroid/view/View;
    .end local v1    # "state":Landroid/view/KeyEvent$DispatcherState;
    :cond_21
    :goto_21
    return v2

    .line 1022
    .restart local v0    # "anchorView":Landroid/view/View;
    :cond_22
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v3

    if-ne v3, v2, :cond_41

    .line 1023
    invoke-virtual {v0}, Landroid/view/View;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    move-result-object v1

    .line 1024
    .restart local v1    # "state":Landroid/view/KeyEvent$DispatcherState;
    if-eqz v1, :cond_31

    .line 1025
    invoke-virtual {v1, p2}, Landroid/view/KeyEvent$DispatcherState;->handleUpEvent(Landroid/view/KeyEvent;)V

    .line 1027
    :cond_31
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isTracking()Z

    move-result v3

    if-eqz v3, :cond_41

    invoke-virtual {p2}, Landroid/view/KeyEvent;->isCanceled()Z

    move-result v3

    if-nez v3, :cond_41

    .line 1028
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->dismiss()V

    goto :goto_21

    .line 1033
    .end local v0    # "anchorView":Landroid/view/View;
    .end local v1    # "state":Landroid/view/KeyEvent$DispatcherState;
    :cond_41
    const/4 v2, 0x0

    goto :goto_21
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 988
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_20

    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    invoke-virtual {v1}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getSelectedItemPosition()I

    move-result v1

    if-ltz v1, :cond_20

    .line 989
    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    invoke-virtual {v1, p1, p2}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 990
    .local v0, "consumed":Z
    if-eqz v0, :cond_1f

    invoke-static {p1}, Lcom/rey/material/widget/ListPopupWindow;->isConfirmKey(I)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 993
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->dismiss()V

    .line 997
    .end local v0    # "consumed":Z
    :cond_1f
    :goto_1f
    return v0

    :cond_20
    const/4 v0, 0x0

    goto :goto_1f
.end method

.method public performItemClick(I)Z
    .registers 9
    .param p1, "position"    # I

    .prologue
    .line 799
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_26

    .line 800
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    if-eqz v0, :cond_24

    .line 801
    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    .line 802
    .local v1, "list":Lcom/rey/material/widget/ListPopupWindow$DropDownListView;
    invoke-virtual {v1}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getFirstVisiblePosition()I

    move-result v0

    sub-int v0, p1, v0

    invoke-virtual {v1, v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 803
    .local v2, "child":Landroid/view/View;
    invoke-virtual {v1}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v6

    .line 804
    .local v6, "adapter":Landroid/widget/ListAdapter;
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-interface {v6, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v4

    move v3, p1

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 806
    .end local v1    # "list":Lcom/rey/material/widget/ListPopupWindow$DropDownListView;
    .end local v2    # "child":Landroid/view/View;
    .end local v6    # "adapter":Landroid/widget/ListAdapter;
    :cond_24
    const/4 v0, 0x1

    .line 808
    :goto_25
    return v0

    :cond_26
    const/4 v0, 0x0

    goto :goto_25
.end method

.method public postShow()V
    .registers 3

    .prologue
    .line 577
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mShowDropDownRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 578
    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .registers 4
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .prologue
    .line 273
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mObserver:Landroid/database/DataSetObserver;

    if-nez v0, :cond_23

    .line 274
    new-instance v0, Lcom/rey/material/widget/ListPopupWindow$PopupDataSetObserver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/rey/material/widget/ListPopupWindow$PopupDataSetObserver;-><init>(Lcom/rey/material/widget/ListPopupWindow;Lcom/rey/material/widget/ListPopupWindow$1;)V

    iput-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mObserver:Landroid/database/DataSetObserver;

    .line 278
    :cond_c
    :goto_c
    iput-object p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mAdapter:Landroid/widget/ListAdapter;

    .line 279
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_17

    .line 280
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mObserver:Landroid/database/DataSetObserver;

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 283
    :cond_17
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    if-eqz v0, :cond_22

    .line 284
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mAdapter:Landroid/widget/ListAdapter;

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 286
    :cond_22
    return-void

    .line 275
    :cond_23
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_c

    .line 276
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mObserver:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    goto :goto_c
.end method

.method public setAnchorView(Landroid/view/View;)V
    .registers 2
    .param p1, "anchor"    # Landroid/view/View;

    .prologue
    .line 436
    iput-object p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownAnchorView:Landroid/view/View;

    .line 437
    return-void
.end method

.method public setAnimationStyle(I)V
    .registers 3
    .param p1, "animationStyle"    # I

    .prologue
    .line 408
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/PopupWindow;->setAnimationStyle(I)V

    .line 409
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 259
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 260
    return-void
.end method

.method public setContentWidth(I)V
    .registers 5
    .param p1, "width"    # I

    .prologue
    .line 509
    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v1}, Lcom/rey/material/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 510
    .local v0, "popupBackground":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_1a

    .line 511
    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 512
    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    add-int/2addr v1, v2

    add-int/2addr v1, p1

    iput v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    .line 516
    :goto_19
    return-void

    .line 514
    :cond_1a
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/ListPopupWindow;->setWidth(I)V

    goto :goto_19
.end method

.method public setDropDownAlwaysVisible(Z)V
    .registers 2
    .param p1, "dropDownAlwaysVisible"    # Z

    .prologue
    .line 357
    iput-boolean p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownAlwaysVisible:Z

    .line 358
    return-void
.end method

.method public setDropDownGravity(I)V
    .registers 2
    .param p1, "gravity"    # I

    .prologue
    .line 482
    iput p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownGravity:I

    .line 483
    return-void
.end method

.method public setForceIgnoreOutsideTouch(Z)V
    .registers 2
    .param p1, "forceIgnoreOutsideTouch"    # Z

    .prologue
    .line 342
    iput-boolean p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mForceIgnoreOutsideTouch:Z

    .line 343
    return-void
.end method

.method public setHeight(I)V
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 531
    iput p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHeight:I

    .line 532
    return-void
.end method

.method public setHorizontalOffset(I)V
    .registers 2
    .param p1, "offset"    # I

    .prologue
    .line 452
    iput p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHorizontalOffset:I

    .line 453
    return-void
.end method

.method public setInputMethodMode(I)V
    .registers 3
    .param p1, "mode"    # I

    .prologue
    .line 730
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/PopupWindow;->setInputMethodMode(I)V

    .line 731
    return-void
.end method

.method public setItemAnimation(I)V
    .registers 2
    .param p1, "id"    # I

    .prologue
    .line 251
    iput p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mItemAnimationId:I

    .line 252
    return-void
.end method

.method public setItemAnimationOffset(I)V
    .registers 2
    .param p1, "offset"    # I

    .prologue
    .line 255
    iput p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mItemAnimationOffset:I

    .line 256
    return-void
.end method

.method setListItemExpandMax(I)V
    .registers 2
    .param p1, "max"    # I

    .prologue
    .line 879
    iput p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mListItemExpandMaximum:I

    .line 880
    return-void
.end method

.method public setListSelector(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "selector"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 399
    iput-object p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownListHighlight:Landroid/graphics/drawable/Drawable;

    .line 400
    return-void
.end method

.method public setModal(Z)V
    .registers 3
    .param p1, "modal"    # Z

    .prologue
    .line 321
    iput-boolean p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mModal:Z

    .line 322
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/PopupWindow;->setFocusable(Z)V

    .line 323
    return-void
.end method

.method public setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V
    .registers 3
    .param p1, "listener"    # Landroid/widget/PopupWindow$OnDismissListener;

    .prologue
    .line 704
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 705
    return-void
.end method

.method public setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    .registers 2
    .param p1, "clickListener"    # Landroid/widget/AdapterView$OnItemClickListener;

    .prologue
    .line 542
    iput-object p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 543
    return-void
.end method

.method public setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V
    .registers 2
    .param p1, "selectedListener"    # Landroid/widget/AdapterView$OnItemSelectedListener;

    .prologue
    .line 553
    iput-object p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mItemSelectedListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    .line 554
    return-void
.end method

.method public setPromptPosition(I)V
    .registers 2
    .param p1, "position"    # I

    .prologue
    .line 298
    iput p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mPromptPosition:I

    .line 299
    return-void
.end method

.method public setPromptView(Landroid/view/View;)V
    .registers 3
    .param p1, "prompt"    # Landroid/view/View;

    .prologue
    .line 563
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    .line 564
    .local v0, "showing":Z
    if-eqz v0, :cond_9

    .line 565
    invoke-direct {p0}, Lcom/rey/material/widget/ListPopupWindow;->removePromptView()V

    .line 567
    :cond_9
    iput-object p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mPromptView:Landroid/view/View;

    .line 568
    if-eqz v0, :cond_10

    .line 569
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->show()V

    .line 571
    :cond_10
    return-void
.end method

.method public setSelection(I)V
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 749
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    .line 750
    .local v0, "list":Lcom/rey/material/widget/ListPopupWindow$DropDownListView;
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_21

    if-eqz v0, :cond_21

    .line 751
    const/4 v1, 0x0

    # setter for: Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->mListSelectionHidden:Z
    invoke-static {v0, v1}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->access$1002(Lcom/rey/material/widget/ListPopupWindow$DropDownListView;Z)Z

    .line 752
    invoke-virtual {v0, p1}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setSelection(I)V

    .line 754
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_21

    .line 755
    invoke-virtual {v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->getChoiceMode()I

    move-result v1

    if-eqz v1, :cond_21

    .line 756
    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setItemChecked(IZ)V

    .line 760
    :cond_21
    return-void
.end method

.method public setSoftInputMode(I)V
    .registers 3
    .param p1, "mode"    # I

    .prologue
    .line 380
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/PopupWindow;->setSoftInputMode(I)V

    .line 381
    return-void
.end method

.method public setVerticalOffset(I)V
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 471
    iput p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    .line 472
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownVerticalOffsetSet:Z

    .line 473
    return-void
.end method

.method public setWidth(I)V
    .registers 2
    .param p1, "width"    # I

    .prologue
    .line 499
    iput p1, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    .line 500
    return-void
.end method

.method public show()V
    .registers 11

    .prologue
    const/4 v3, 0x1

    const/4 v9, -0x2

    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 585
    invoke-direct {p0}, Lcom/rey/material/widget/ListPopupWindow;->buildDropDown()I

    move-result v6

    .line 587
    .local v6, "height":I
    const/4 v4, 0x0

    .line 588
    .local v4, "widthSpec":I
    const/4 v5, 0x0

    .line 590
    .local v5, "heightSpec":I
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->isInputMethodNotNeeded()Z

    move-result v7

    .line 592
    .local v7, "noInputMethod":Z
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v2}, Lcom/rey/material/widget/PopupWindow;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_73

    .line 593
    iget v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    if-ne v2, v0, :cond_49

    .line 596
    const/4 v4, -0x1

    .line 603
    :goto_1b
    iget v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHeight:I

    if-ne v2, v0, :cond_6a

    .line 606
    if-eqz v7, :cond_59

    move v5, v6

    .line 607
    :goto_22
    if-eqz v7, :cond_5d

    .line 608
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    iget v8, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    if-ne v8, v0, :cond_5b

    :goto_2a
    invoke-virtual {v2, v0, v1}, Lcom/rey/material/widget/PopupWindow;->setWindowLayoutMode(II)V

    .line 623
    :goto_2d
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    iget-boolean v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mForceIgnoreOutsideTouch:Z

    if-nez v2, :cond_38

    iget-boolean v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownAlwaysVisible:Z

    if-nez v2, :cond_38

    move v1, v3

    :cond_38
    invoke-virtual {v0, v1}, Lcom/rey/material/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 625
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->getAnchorView()Landroid/view/View;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHorizontalOffset:I

    iget v3, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    invoke-virtual/range {v0 .. v5}, Lcom/rey/material/widget/PopupWindow;->update(Landroid/view/View;IIII)V

    .line 685
    :cond_48
    :goto_48
    return-void

    .line 597
    :cond_49
    iget v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    if-ne v2, v9, :cond_56

    .line 598
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->getAnchorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v4

    goto :goto_1b

    .line 600
    :cond_56
    iget v4, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    goto :goto_1b

    :cond_59
    move v5, v0

    .line 606
    goto :goto_22

    :cond_5b
    move v0, v1

    .line 608
    goto :goto_2a

    .line 612
    :cond_5d
    iget-object v8, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    iget v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    if-ne v2, v0, :cond_68

    move v2, v0

    :goto_64
    invoke-virtual {v8, v2, v0}, Lcom/rey/material/widget/PopupWindow;->setWindowLayoutMode(II)V

    goto :goto_2d

    :cond_68
    move v2, v1

    goto :goto_64

    .line 617
    :cond_6a
    iget v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHeight:I

    if-ne v0, v9, :cond_70

    .line 618
    move v5, v6

    goto :goto_2d

    .line 620
    :cond_70
    iget v5, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHeight:I

    goto :goto_2d

    .line 628
    :cond_73
    iget v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    if-ne v2, v0, :cond_df

    .line 629
    const/4 v4, -0x1

    .line 638
    :goto_78
    iget v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHeight:I

    if-ne v2, v0, :cond_f9

    .line 639
    const/4 v5, -0x1

    .line 648
    :goto_7d
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v2, v4, v5}, Lcom/rey/material/widget/PopupWindow;->setWindowLayoutMode(II)V

    .line 649
    invoke-direct {p0, v3}, Lcom/rey/material/widget/ListPopupWindow;->setPopupClipToScreenEnabled(Z)V

    .line 653
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    iget-boolean v8, p0, Lcom/rey/material/widget/ListPopupWindow;->mForceIgnoreOutsideTouch:Z

    if-nez v8, :cond_10d

    iget-boolean v8, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownAlwaysVisible:Z

    if-nez v8, :cond_10d

    :goto_8f
    invoke-virtual {v2, v3}, Lcom/rey/material/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 654
    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mTouchInterceptor:Lcom/rey/material/widget/ListPopupWindow$PopupTouchInterceptor;

    invoke-virtual {v1, v2}, Lcom/rey/material/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    .line 655
    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->getAnchorView()Landroid/view/View;

    move-result-object v2

    iget v3, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHorizontalOffset:I

    iget v8, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    iget v9, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownGravity:I

    invoke-static {v1, v2, v3, v8, v9}, Landroid/support/v4/widget/PopupWindowCompat;->showAsDropDown(Landroid/widget/PopupWindow;Landroid/view/View;III)V

    .line 657
    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    invoke-virtual {v1, v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->setSelection(I)V

    .line 659
    iget-boolean v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mModal:Z

    if-eqz v0, :cond_b9

    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownList:Lcom/rey/material/widget/ListPopupWindow$DropDownListView;

    invoke-virtual {v0}, Lcom/rey/material/widget/ListPopupWindow$DropDownListView;->isInTouchMode()Z

    move-result v0

    if-eqz v0, :cond_bc

    .line 660
    :cond_b9
    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->clearListSelection()V

    .line 662
    :cond_bc
    iget-boolean v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mModal:Z

    if-nez v0, :cond_c7

    .line 663
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/rey/material/widget/ListPopupWindow;->mHideSelector:Lcom/rey/material/widget/ListPopupWindow$ListSelectorHider;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 667
    :cond_c7
    iget v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mItemAnimationId:I

    if-eqz v0, :cond_48

    .line 668
    iget-object v0, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v0}, Lcom/rey/material/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/rey/material/widget/ListPopupWindow$1;

    invoke-direct {v1, p0}, Lcom/rey/material/widget/ListPopupWindow$1;-><init>(Lcom/rey/material/widget/ListPopupWindow;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto/16 :goto_48

    .line 631
    :cond_df
    iget v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    if-ne v2, v9, :cond_f1

    .line 632
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {p0}, Lcom/rey/material/widget/ListPopupWindow;->getAnchorView()Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->getWidth()I

    move-result v8

    invoke-virtual {v2, v8}, Lcom/rey/material/widget/PopupWindow;->setWidth(I)V

    goto :goto_78

    .line 634
    :cond_f1
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    iget v8, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownWidth:I

    invoke-virtual {v2, v8}, Lcom/rey/material/widget/PopupWindow;->setWidth(I)V

    goto :goto_78

    .line 641
    :cond_f9
    iget v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHeight:I

    if-ne v2, v9, :cond_104

    .line 642
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    invoke-virtual {v2, v6}, Lcom/rey/material/widget/PopupWindow;->setHeight(I)V

    goto/16 :goto_7d

    .line 644
    :cond_104
    iget-object v2, p0, Lcom/rey/material/widget/ListPopupWindow;->mPopup:Lcom/rey/material/widget/PopupWindow;

    iget v8, p0, Lcom/rey/material/widget/ListPopupWindow;->mDropDownHeight:I

    invoke-virtual {v2, v8}, Lcom/rey/material/widget/PopupWindow;->setHeight(I)V

    goto/16 :goto_7d

    :cond_10d
    move v3, v1

    .line 653
    goto :goto_8f
.end method
