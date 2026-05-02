.class public Lcom/rey/material/app/BottomSheetDialog;
.super Landroid/app/Dialog;
.source "BottomSheetDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;,
        Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;
    }
.end annotation


# instance fields
.field private mAnimation:Landroid/view/animation/Animation;

.field private mCancelable:Z

.field private mCanceledOnTouchOutside:Z

.field private mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

.field private mContentView:Landroid/view/View;

.field private final mDismissAction:Ljava/lang/Runnable;

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private final mHandler:Landroid/os/Handler;

.field private mInDuration:I

.field private mInInterpolator:Landroid/view/animation/Interpolator;

.field private mLayoutHeight:I

.field private mMinFlingVelocity:I

.field private mOutDuration:I

.field private mOutInterpolator:Landroid/view/animation/Interpolator;

.field private mRunShowAnimation:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 59
    sget v0, Lcom/rey/material/R$style;->Material_App_BottomSheetDialog:I

    invoke-direct {p0, p1, v0}, Lcom/rey/material/app/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "style"    # I

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x1

    .line 63
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 30
    iput-boolean v2, p0, Lcom/rey/material/app/BottomSheetDialog;->mCancelable:Z

    .line 31
    iput-boolean v2, p0, Lcom/rey/material/app/BottomSheetDialog;->mCanceledOnTouchOutside:Z

    .line 32
    const/4 v1, -0x2

    iput v1, p0, Lcom/rey/material/app/BottomSheetDialog;->mLayoutHeight:I

    .line 44
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/rey/material/app/BottomSheetDialog;->mHandler:Landroid/os/Handler;

    .line 45
    new-instance v1, Lcom/rey/material/app/BottomSheetDialog$1;

    invoke-direct {v1, p0}, Lcom/rey/material/app/BottomSheetDialog$1;-><init>(Lcom/rey/material/app/BottomSheetDialog;)V

    iput-object v1, p0, Lcom/rey/material/app/BottomSheetDialog;->mDismissAction:Ljava/lang/Runnable;

    .line 55
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/rey/material/app/BottomSheetDialog;->mRunShowAnimation:Z

    .line 67
    invoke-virtual {p0, v2}, Lcom/rey/material/app/BottomSheetDialog;->requestWindowFeature(I)Z

    .line 68
    invoke-virtual {p0}, Lcom/rey/material/app/BottomSheetDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-static {}, Lcom/rey/material/drawable/BlankDrawable;->getInstance()Lcom/rey/material/drawable/BlankDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 69
    invoke-virtual {p0}, Lcom/rey/material/app/BottomSheetDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 70
    .local v0, "layout":Landroid/view/WindowManager$LayoutParams;
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 71
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 72
    sget v1, Lcom/rey/material/R$style;->DialogNoAnimation:I

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 73
    invoke-virtual {p0}, Lcom/rey/material/app/BottomSheetDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 75
    invoke-direct {p0, p1, p2}, Lcom/rey/material/app/BottomSheetDialog;->init(Landroid/content/Context;I)V

    .line 76
    return-void
.end method

.method static synthetic access$001(Lcom/rey/material/app/BottomSheetDialog;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;

    .prologue
    .line 28
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method static synthetic access$100(Lcom/rey/material/app/BottomSheetDialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;

    .prologue
    .line 28
    iget v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mMinFlingVelocity:I

    return v0
.end method

.method static synthetic access$1000(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/GestureDetector;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mGestureDetector:Landroid/view/GestureDetector;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/rey/material/app/BottomSheetDialog;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mCancelable:Z

    return v0
.end method

.method static synthetic access$1200(Lcom/rey/material/app/BottomSheetDialog;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mCanceledOnTouchOutside:Z

    return v0
.end method

.method static synthetic access$1300(Lcom/rey/material/app/BottomSheetDialog;)Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    return-object v0
.end method

.method static synthetic access$200(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/animation/Animation;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;

    return-object v0
.end method

.method static synthetic access$202(Lcom/rey/material/app/BottomSheetDialog;Landroid/view/animation/Animation;)Landroid/view/animation/Animation;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;
    .param p1, "x1"    # Landroid/view/animation/Animation;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;

    return-object p1
.end method

.method static synthetic access$300(Lcom/rey/material/app/BottomSheetDialog;)Ljava/lang/Runnable;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mDismissAction:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$400(Lcom/rey/material/app/BottomSheetDialog;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$500(Lcom/rey/material/app/BottomSheetDialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;

    .prologue
    .line 28
    iget v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mLayoutHeight:I

    return v0
.end method

.method static synthetic access$600(Lcom/rey/material/app/BottomSheetDialog;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mRunShowAnimation:Z

    return v0
.end method

.method static synthetic access$602(Lcom/rey/material/app/BottomSheetDialog;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;
    .param p1, "x1"    # Z

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/rey/material/app/BottomSheetDialog;->mRunShowAnimation:Z

    return p1
.end method

.method static synthetic access$700(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContentView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$800(Lcom/rey/material/app/BottomSheetDialog;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;

    .prologue
    .line 28
    iget v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mInDuration:I

    return v0
.end method

.method static synthetic access$900(Lcom/rey/material/app/BottomSheetDialog;)Landroid/view/animation/Interpolator;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/app/BottomSheetDialog;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mInInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method private init(Landroid/content/Context;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "style"    # I

    .prologue
    const/4 v1, 0x1

    .line 79
    new-instance v0, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    invoke-direct {v0, p0, p1}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;-><init>(Lcom/rey/material/app/BottomSheetDialog;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    .line 81
    invoke-virtual {p0, v1}, Lcom/rey/material/app/BottomSheetDialog;->cancelable(Z)Lcom/rey/material/app/BottomSheetDialog;

    .line 82
    invoke-virtual {p0, v1}, Lcom/rey/material/app/BottomSheetDialog;->canceledOnTouchOutside(Z)Lcom/rey/material/app/BottomSheetDialog;

    .line 84
    invoke-virtual {p0}, Lcom/rey/material/app/BottomSheetDialog;->onCreate()V

    .line 85
    invoke-virtual {p0, p2}, Lcom/rey/material/app/BottomSheetDialog;->applyStyle(I)Lcom/rey/material/app/BottomSheetDialog;

    .line 87
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mMinFlingVelocity:I

    .line 89
    new-instance v0, Landroid/view/GestureDetector;

    new-instance v1, Lcom/rey/material/app/BottomSheetDialog$2;

    invoke-direct {v1, p0}, Lcom/rey/material/app/BottomSheetDialog$2;-><init>(Lcom/rey/material/app/BottomSheetDialog;)V

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mGestureDetector:Landroid/view/GestureDetector;

    .line 125
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    invoke-super {p0, v0}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 126
    return-void
.end method


# virtual methods
.method public addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 329
    invoke-virtual {p0, p1}, Lcom/rey/material/app/BottomSheetDialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/BottomSheetDialog;

    .line 330
    return-void
.end method

.method public applyStyle(I)Lcom/rey/material/app/BottomSheetDialog;
    .registers 11
    .param p1, "styleId"    # I

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 132
    invoke-virtual {p0}, Lcom/rey/material/app/BottomSheetDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 133
    .local v2, "context":Landroid/content/Context;
    sget-object v6, Lcom/rey/material/R$styleable;->BottomSheetDialog:[I

    invoke-virtual {v2, p1, v6}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 135
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v4, 0x0

    .local v4, "i":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v3

    .local v3, "count":I
    :goto_11
    if-ge v4, v3, :cond_87

    .line 136
    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v1

    .line 137
    .local v1, "attr":I
    sget v6, Lcom/rey/material/R$styleable;->BottomSheetDialog_android_layout_height:I

    if-ne v1, v6, :cond_26

    .line 138
    const/4 v6, -0x2

    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/app/BottomSheetDialog;->heightParam(I)Lcom/rey/material/app/BottomSheetDialog;

    .line 135
    :cond_23
    :goto_23
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    .line 139
    :cond_26
    sget v6, Lcom/rey/material/R$styleable;->BottomSheetDialog_bsd_cancelable:I

    if-ne v1, v6, :cond_32

    .line 140
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/app/BottomSheetDialog;->cancelable(Z)Lcom/rey/material/app/BottomSheetDialog;

    goto :goto_23

    .line 141
    :cond_32
    sget v6, Lcom/rey/material/R$styleable;->BottomSheetDialog_bsd_canceledOnTouchOutside:I

    if-ne v1, v6, :cond_3e

    .line 142
    invoke-virtual {v0, v1, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/app/BottomSheetDialog;->canceledOnTouchOutside(Z)Lcom/rey/material/app/BottomSheetDialog;

    goto :goto_23

    .line 143
    :cond_3e
    sget v6, Lcom/rey/material/R$styleable;->BottomSheetDialog_bsd_dimAmount:I

    if-ne v1, v6, :cond_4b

    .line 144
    const/4 v6, 0x0

    invoke-virtual {v0, v1, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/app/BottomSheetDialog;->dimAmount(F)Lcom/rey/material/app/BottomSheetDialog;

    goto :goto_23

    .line 145
    :cond_4b
    sget v6, Lcom/rey/material/R$styleable;->BottomSheetDialog_bsd_inDuration:I

    if-ne v1, v6, :cond_57

    .line 146
    invoke-virtual {v0, v1, v7}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/app/BottomSheetDialog;->inDuration(I)Lcom/rey/material/app/BottomSheetDialog;

    goto :goto_23

    .line 147
    :cond_57
    sget v6, Lcom/rey/material/R$styleable;->BottomSheetDialog_bsd_inInterpolator:I

    if-ne v1, v6, :cond_69

    .line 148
    invoke-virtual {v0, v1, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    .line 149
    .local v5, "resId":I
    if-eqz v5, :cond_23

    .line 150
    invoke-static {v2, v5}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/rey/material/app/BottomSheetDialog;->inInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/app/BottomSheetDialog;

    goto :goto_23

    .line 152
    .end local v5    # "resId":I
    :cond_69
    sget v6, Lcom/rey/material/R$styleable;->BottomSheetDialog_bsd_outDuration:I

    if-ne v1, v6, :cond_75

    .line 153
    invoke-virtual {v0, v1, v7}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/rey/material/app/BottomSheetDialog;->outDuration(I)Lcom/rey/material/app/BottomSheetDialog;

    goto :goto_23

    .line 154
    :cond_75
    sget v6, Lcom/rey/material/R$styleable;->BottomSheetDialog_bsd_outInterpolator:I

    if-ne v1, v6, :cond_23

    .line 155
    invoke-virtual {v0, v1, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    .line 156
    .restart local v5    # "resId":I
    if-eqz v5, :cond_23

    .line 157
    invoke-static {v2, v5}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/rey/material/app/BottomSheetDialog;->outInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/app/BottomSheetDialog;

    goto :goto_23

    .line 161
    .end local v1    # "attr":I
    .end local v5    # "resId":I
    :cond_87
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 163
    iget-object v6, p0, Lcom/rey/material/app/BottomSheetDialog;->mInInterpolator:Landroid/view/animation/Interpolator;

    if-nez v6, :cond_95

    .line 164
    new-instance v6, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v6}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v6, p0, Lcom/rey/material/app/BottomSheetDialog;->mInInterpolator:Landroid/view/animation/Interpolator;

    .line 166
    :cond_95
    iget-object v6, p0, Lcom/rey/material/app/BottomSheetDialog;->mOutInterpolator:Landroid/view/animation/Interpolator;

    if-nez v6, :cond_a0

    .line 167
    new-instance v6, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v6}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    iput-object v6, p0, Lcom/rey/material/app/BottomSheetDialog;->mOutInterpolator:Landroid/view/animation/Interpolator;

    .line 169
    :cond_a0
    return-object p0
.end method

.method public cancelable(Z)Lcom/rey/material/app/BottomSheetDialog;
    .registers 2
    .param p1, "cancelable"    # Z

    .prologue
    .line 173
    invoke-super {p0, p1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 174
    iput-boolean p1, p0, Lcom/rey/material/app/BottomSheetDialog;->mCancelable:Z

    .line 175
    return-object p0
.end method

.method public canceledOnTouchOutside(Z)Lcom/rey/material/app/BottomSheetDialog;
    .registers 2
    .param p1, "cancel"    # Z

    .prologue
    .line 179
    invoke-super {p0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 180
    iput-boolean p1, p0, Lcom/rey/material/app/BottomSheetDialog;->mCanceledOnTouchOutside:Z

    .line 181
    return-object p0
.end method

.method public contentView(I)Lcom/rey/material/app/BottomSheetDialog;
    .registers 5
    .param p1, "layoutId"    # I

    .prologue
    .line 220
    if-nez p1, :cond_3

    .line 224
    .end local p0    # "this":Lcom/rey/material/app/BottomSheetDialog;
    :goto_2
    return-object p0

    .line 223
    .restart local p0    # "this":Lcom/rey/material/app/BottomSheetDialog;
    :cond_3
    invoke-virtual {p0}, Lcom/rey/material/app/BottomSheetDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 224
    .local v0, "v":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/rey/material/app/BottomSheetDialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/BottomSheetDialog;

    move-result-object p0

    goto :goto_2
.end method

.method public contentView(Landroid/view/View;)Lcom/rey/material/app/BottomSheetDialog;
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 208
    iput-object p1, p0, Lcom/rey/material/app/BottomSheetDialog;->mContentView:Landroid/view/View;

    .line 209
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    invoke-virtual {v0}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->removeAllViews()V

    .line 210
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    invoke-virtual {v0, p1}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->addView(Landroid/view/View;)V

    .line 211
    return-object p0
.end method

.method public dimAmount(F)Lcom/rey/material/app/BottomSheetDialog;
    .registers 6
    .param p1, "amount"    # F

    .prologue
    const/4 v3, 0x2

    .line 190
    invoke-virtual {p0}, Lcom/rey/material/app/BottomSheetDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 191
    .local v1, "window":Landroid/view/Window;
    const/4 v2, 0x0

    cmpl-float v2, p1, v2

    if-lez v2, :cond_17

    .line 192
    invoke-virtual {v1, v3}, Landroid/view/Window;->addFlags(I)V

    .line 193
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 194
    .local v0, "lp":Landroid/view/WindowManager$LayoutParams;
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 195
    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 199
    .end local v0    # "lp":Landroid/view/WindowManager$LayoutParams;
    :goto_16
    return-object p0

    .line 198
    :cond_17
    invoke-virtual {v1, v3}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_16
.end method

.method public dismiss()V
    .registers 4

    .prologue
    .line 347
    invoke-virtual {p0}, Lcom/rey/material/app/BottomSheetDialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_7

    .line 373
    :goto_6
    return-void

    .line 350
    :cond_7
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContentView:Landroid/view/View;

    if-eqz v0, :cond_3f

    .line 351
    new-instance v0, Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;

    iget-object v1, p0, Lcom/rey/material/app/BottomSheetDialog;->mContentView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/app/BottomSheetDialog;->mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    invoke-virtual {v2}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->getMeasuredHeight()I

    move-result v2

    invoke-direct {v0, p0, v1, v2}, Lcom/rey/material/app/BottomSheetDialog$SlideAnimation;-><init>(Lcom/rey/material/app/BottomSheetDialog;II)V

    iput-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;

    .line 352
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;

    iget v1, p0, Lcom/rey/material/app/BottomSheetDialog;->mOutDuration:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 353
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;

    iget-object v1, p0, Lcom/rey/material/app/BottomSheetDialog;->mOutInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 354
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;

    new-instance v1, Lcom/rey/material/app/BottomSheetDialog$3;

    invoke-direct {v1, p0}, Lcom/rey/material/app/BottomSheetDialog$3;-><init>(Lcom/rey/material/app/BottomSheetDialog;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 369
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContentView:Landroid/view/View;

    iget-object v1, p0, Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_6

    .line 372
    :cond_3f
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/rey/material/app/BottomSheetDialog;->mDismissAction:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_6
.end method

.method public dismissImmediately()V
    .registers 3

    .prologue
    .line 336
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 338
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_c

    .line 339
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->cancel()V

    .line 341
    :cond_c
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_17

    .line 342
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/rey/material/app/BottomSheetDialog;->mDismissAction:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 343
    :cond_17
    return-void
.end method

.method protected getContainerHeight()I
    .registers 2

    .prologue
    .line 376
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    invoke-virtual {v0}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->getHeight()I

    move-result v0

    goto :goto_5
.end method

.method public heightParam(I)Lcom/rey/material/app/BottomSheetDialog;
    .registers 3
    .param p1, "height"    # I

    .prologue
    .line 233
    iget v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mLayoutHeight:I

    if-eq v0, p1, :cond_1d

    .line 234
    iput p1, p0, Lcom/rey/material/app/BottomSheetDialog;->mLayoutHeight:I

    .line 236
    invoke-virtual {p0}, Lcom/rey/material/app/BottomSheetDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContentView:Landroid/view/View;

    if-eqz v0, :cond_1d

    .line 237
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mRunShowAnimation:Z

    .line 238
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    invoke-virtual {v0}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->forceLayout()V

    .line 239
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    invoke-virtual {v0}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->requestLayout()V

    .line 242
    :cond_1d
    return-object p0
.end method

.method public inDuration(I)Lcom/rey/material/app/BottomSheetDialog;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 251
    iput p1, p0, Lcom/rey/material/app/BottomSheetDialog;->mInDuration:I

    .line 252
    return-object p0
.end method

.method public inInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/app/BottomSheetDialog;
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 261
    iput-object p1, p0, Lcom/rey/material/app/BottomSheetDialog;->mInInterpolator:Landroid/view/animation/Interpolator;

    .line 262
    return-object p0
.end method

.method protected onCreate()V
    .registers 1

    .prologue
    .line 129
    return-void
.end method

.method protected onStart()V
    .registers 2

    .prologue
    .line 287
    invoke-super {p0}, Landroid/app/Dialog;->onStart()V

    .line 288
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContentView:Landroid/view/View;

    if-eqz v0, :cond_f

    .line 289
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mRunShowAnimation:Z

    .line 290
    iget-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    invoke-virtual {v0}, Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;->forceLayout()V

    .line 292
    :cond_f
    return-void
.end method

.method protected onStop()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 296
    invoke-super {p0}, Landroid/app/Dialog;->onStop()V

    .line 297
    iput-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContainer:Lcom/rey/material/app/BottomSheetDialog$ContainerFrameLayout;

    .line 298
    iput-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mContentView:Landroid/view/View;

    .line 299
    iput-object v0, p0, Lcom/rey/material/app/BottomSheetDialog;->mGestureDetector:Landroid/view/GestureDetector;

    .line 300
    return-void
.end method

.method public outDuration(I)Lcom/rey/material/app/BottomSheetDialog;
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 271
    iput p1, p0, Lcom/rey/material/app/BottomSheetDialog;->mOutDuration:I

    .line 272
    return-object p0
.end method

.method public outInterpolator(Landroid/view/animation/Interpolator;)Lcom/rey/material/app/BottomSheetDialog;
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 281
    iput-object p1, p0, Lcom/rey/material/app/BottomSheetDialog;->mOutInterpolator:Landroid/view/animation/Interpolator;

    .line 282
    return-object p0
.end method

.method public setCancelable(Z)V
    .registers 2
    .param p1, "flag"    # Z

    .prologue
    .line 304
    invoke-virtual {p0, p1}, Lcom/rey/material/app/BottomSheetDialog;->cancelable(Z)Lcom/rey/material/app/BottomSheetDialog;

    .line 305
    return-void
.end method

.method public setCanceledOnTouchOutside(Z)V
    .registers 2
    .param p1, "cancel"    # Z

    .prologue
    .line 309
    invoke-virtual {p0, p1}, Lcom/rey/material/app/BottomSheetDialog;->canceledOnTouchOutside(Z)Lcom/rey/material/app/BottomSheetDialog;

    .line 310
    return-void
.end method

.method public setContentView(I)V
    .registers 2
    .param p1, "layoutId"    # I

    .prologue
    .line 319
    invoke-virtual {p0, p1}, Lcom/rey/material/app/BottomSheetDialog;->contentView(I)Lcom/rey/material/app/BottomSheetDialog;

    .line 320
    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .registers 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 314
    invoke-virtual {p0, p1}, Lcom/rey/material/app/BottomSheetDialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/BottomSheetDialog;

    .line 315
    return-void
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 324
    invoke-virtual {p0, p1}, Lcom/rey/material/app/BottomSheetDialog;->contentView(Landroid/view/View;)Lcom/rey/material/app/BottomSheetDialog;

    .line 325
    return-void
.end method
