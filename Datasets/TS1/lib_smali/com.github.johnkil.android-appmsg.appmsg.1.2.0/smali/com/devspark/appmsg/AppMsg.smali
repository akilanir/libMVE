.class public Lcom/devspark/appmsg/AppMsg;
.super Ljava/lang/Object;
.source "AppMsg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/devspark/appmsg/AppMsg$Style;
    }
.end annotation


# static fields
.field public static final LENGTH_LONG:I = 0x1388

.field public static final LENGTH_SHORT:I = 0xbb8

.field public static final LENGTH_STICKY:I = -0x1

.field public static final PRIORITY_HIGH:I = 0x7fffffff

.field public static final PRIORITY_LOW:I = -0x80000000

.field public static final PRIORITY_NORMAL:I

.field public static final STYLE_ALERT:Lcom/devspark/appmsg/AppMsg$Style;

.field public static final STYLE_CONFIRM:Lcom/devspark/appmsg/AppMsg$Style;

.field public static final STYLE_INFO:Lcom/devspark/appmsg/AppMsg$Style;


# instance fields
.field private final mActivity:Landroid/app/Activity;

.field private mDuration:I

.field private mFloating:Z

.field mInAnimation:Landroid/view/animation/Animation;

.field private mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

.field mOutAnimation:Landroid/view/animation/Animation;

.field private mParent:Landroid/view/ViewGroup;

.field mPriority:I

.field private mView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/16 v3, 0xbb8

    .line 92
    new-instance v0, Lcom/devspark/appmsg/AppMsg$Style;

    const/16 v1, 0x1388

    sget v2, Lcom/devspark/appmsg/R$color;->alert:I

    invoke-direct {v0, v1, v2}, Lcom/devspark/appmsg/AppMsg$Style;-><init>(II)V

    sput-object v0, Lcom/devspark/appmsg/AppMsg;->STYLE_ALERT:Lcom/devspark/appmsg/AppMsg$Style;

    .line 97
    new-instance v0, Lcom/devspark/appmsg/AppMsg$Style;

    sget v1, Lcom/devspark/appmsg/R$color;->confirm:I

    invoke-direct {v0, v3, v1}, Lcom/devspark/appmsg/AppMsg$Style;-><init>(II)V

    sput-object v0, Lcom/devspark/appmsg/AppMsg;->STYLE_CONFIRM:Lcom/devspark/appmsg/AppMsg$Style;

    .line 102
    new-instance v0, Lcom/devspark/appmsg/AppMsg$Style;

    sget v1, Lcom/devspark/appmsg/R$color;->info:I

    invoke-direct {v0, v3, v1}, Lcom/devspark/appmsg/AppMsg$Style;-><init>(II)V

    sput-object v0, Lcom/devspark/appmsg/AppMsg;->STYLE_INFO:Lcom/devspark/appmsg/AppMsg$Style;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    const/16 v0, 0xbb8

    iput v0, p0, Lcom/devspark/appmsg/AppMsg;->mDuration:I

    .line 111
    const/4 v0, 0x0

    iput v0, p0, Lcom/devspark/appmsg/AppMsg;->mPriority:I

    .line 120
    iput-object p1, p0, Lcom/devspark/appmsg/AppMsg;->mActivity:Landroid/app/Activity;

    .line 121
    return-void
.end method

.method public static cancelAll()V
    .registers 0

    .prologue
    .line 320
    invoke-static {}, Lcom/devspark/appmsg/MsgManager;->clearAll()V

    .line 321
    return-void
.end method

.method public static cancelAll(Landroid/app/Activity;)V
    .registers 1
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 329
    invoke-static {p0}, Lcom/devspark/appmsg/MsgManager;->release(Landroid/app/Activity;)V

    .line 330
    return-void
.end method

.method public static makeText(Landroid/app/Activity;ILcom/devspark/appmsg/AppMsg$Style;)Lcom/devspark/appmsg/AppMsg;
    .registers 4
    .param p0, "context"    # Landroid/app/Activity;
    .param p1, "resId"    # I
    .param p2, "style"    # Lcom/devspark/appmsg/AppMsg$Style;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 267
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {p0, v0, p2}, Lcom/devspark/appmsg/AppMsg;->makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;)Lcom/devspark/appmsg/AppMsg;

    move-result-object v0

    return-object v0
.end method

.method public static makeText(Landroid/app/Activity;ILcom/devspark/appmsg/AppMsg$Style;I)Lcom/devspark/appmsg/AppMsg;
    .registers 5
    .param p0, "context"    # Landroid/app/Activity;
    .param p1, "resId"    # I
    .param p2, "style"    # Lcom/devspark/appmsg/AppMsg$Style;
    .param p3, "layoutId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 283
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {p0, v0, p2, p3}, Lcom/devspark/appmsg/AppMsg;->makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;I)Lcom/devspark/appmsg/AppMsg;

    move-result-object v0

    return-object v0
.end method

.method public static makeText(Landroid/app/Activity;ILcom/devspark/appmsg/AppMsg$Style;Landroid/view/View;Z)Lcom/devspark/appmsg/AppMsg;
    .registers 6
    .param p0, "context"    # Landroid/app/Activity;
    .param p1, "resId"    # I
    .param p2, "style"    # Lcom/devspark/appmsg/AppMsg$Style;
    .param p3, "customView"    # Landroid/view/View;
    .param p4, "floating"    # Z

    .prologue
    .line 251
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {p0, v0, p2, p3, p4}, Lcom/devspark/appmsg/AppMsg;->makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;Landroid/view/View;Z)Lcom/devspark/appmsg/AppMsg;

    move-result-object v0

    return-object v0
.end method

.method public static makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;)Lcom/devspark/appmsg/AppMsg;
    .registers 4
    .param p0, "context"    # Landroid/app/Activity;
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "style"    # Lcom/devspark/appmsg/AppMsg$Style;

    .prologue
    .line 132
    sget v0, Lcom/devspark/appmsg/R$layout;->app_msg:I

    invoke-static {p0, p1, p2, v0}, Lcom/devspark/appmsg/AppMsg;->makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;I)Lcom/devspark/appmsg/AppMsg;

    move-result-object v0

    return-object v0
.end method

.method public static makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;F)Lcom/devspark/appmsg/AppMsg;
    .registers 5
    .param p0, "context"    # Landroid/app/Activity;
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "style"    # Lcom/devspark/appmsg/AppMsg$Style;
    .param p3, "textSize"    # F

    .prologue
    .line 145
    sget v0, Lcom/devspark/appmsg/R$layout;->app_msg:I

    invoke-static {p0, p1, p2, v0, p3}, Lcom/devspark/appmsg/AppMsg;->makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;IF)Lcom/devspark/appmsg/AppMsg;

    move-result-object v0

    return-object v0
.end method

.method public static makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;I)Lcom/devspark/appmsg/AppMsg;
    .registers 7
    .param p0, "context"    # Landroid/app/Activity;
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "style"    # Lcom/devspark/appmsg/AppMsg$Style;
    .param p3, "layoutId"    # I

    .prologue
    .line 157
    const-string v2, "layout_inflater"

    invoke-virtual {p0, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 159
    .local v0, "inflate":Landroid/view/LayoutInflater;
    const/4 v2, 0x0

    invoke-virtual {v0, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 161
    .local v1, "v":Landroid/view/View;
    const/4 v2, 0x1

    invoke-static {p0, p1, p2, v1, v2}, Lcom/devspark/appmsg/AppMsg;->makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;Landroid/view/View;Z)Lcom/devspark/appmsg/AppMsg;

    move-result-object v2

    return-object v2
.end method

.method public static makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;IF)Lcom/devspark/appmsg/AppMsg;
    .registers 12
    .param p0, "context"    # Landroid/app/Activity;
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "style"    # Lcom/devspark/appmsg/AppMsg$Style;
    .param p3, "layoutId"    # I
    .param p4, "textSize"    # F

    .prologue
    .line 174
    const-string v0, "layout_inflater"

    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/LayoutInflater;

    .line 176
    .local v6, "inflate":Landroid/view/LayoutInflater;
    const/4 v0, 0x0

    invoke-virtual {v6, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 178
    .local v3, "v":Landroid/view/View;
    const/4 v4, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/devspark/appmsg/AppMsg;->makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;Landroid/view/View;ZF)Lcom/devspark/appmsg/AppMsg;

    move-result-object v0

    return-object v0
.end method

.method public static makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;Landroid/view/View;)Lcom/devspark/appmsg/AppMsg;
    .registers 5
    .param p0, "context"    # Landroid/app/Activity;
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "style"    # Lcom/devspark/appmsg/AppMsg$Style;
    .param p3, "customView"    # Landroid/view/View;

    .prologue
    .line 193
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/devspark/appmsg/AppMsg;->makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;Landroid/view/View;Z)Lcom/devspark/appmsg/AppMsg;

    move-result-object v0

    return-object v0
.end method

.method private static makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;Landroid/view/View;Z)Lcom/devspark/appmsg/AppMsg;
    .registers 11
    .param p0, "context"    # Landroid/app/Activity;
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "style"    # Lcom/devspark/appmsg/AppMsg$Style;
    .param p3, "view"    # Landroid/view/View;
    .param p4, "floating"    # Z

    .prologue
    .line 208
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-static/range {v0 .. v5}, Lcom/devspark/appmsg/AppMsg;->makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;Landroid/view/View;ZF)Lcom/devspark/appmsg/AppMsg;

    move-result-object v0

    return-object v0
.end method

.method private static makeText(Landroid/app/Activity;Ljava/lang/CharSequence;Lcom/devspark/appmsg/AppMsg$Style;Landroid/view/View;ZF)Lcom/devspark/appmsg/AppMsg;
    .registers 9
    .param p0, "context"    # Landroid/app/Activity;
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "style"    # Lcom/devspark/appmsg/AppMsg$Style;
    .param p3, "view"    # Landroid/view/View;
    .param p4, "floating"    # Z
    .param p5, "textSize"    # F

    .prologue
    .line 225
    new-instance v0, Lcom/devspark/appmsg/AppMsg;

    invoke-direct {v0, p0}, Lcom/devspark/appmsg/AppMsg;-><init>(Landroid/app/Activity;)V

    .line 227
    .local v0, "result":Lcom/devspark/appmsg/AppMsg;
    # getter for: Lcom/devspark/appmsg/AppMsg$Style;->background:I
    invoke-static {p2}, Lcom/devspark/appmsg/AppMsg$Style;->access$000(Lcom/devspark/appmsg/AppMsg$Style;)I

    move-result v2

    invoke-virtual {p3, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 229
    const v2, 0x102000b

    invoke-virtual {p3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 230
    .local v1, "tv":Landroid/widget/TextView;
    const/4 v2, 0x0

    cmpl-float v2, p5, v2

    if-lez v2, :cond_1d

    invoke-virtual {v1, p5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 231
    :cond_1d
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 233
    iput-object p3, v0, Lcom/devspark/appmsg/AppMsg;->mView:Landroid/view/View;

    .line 234
    # getter for: Lcom/devspark/appmsg/AppMsg$Style;->duration:I
    invoke-static {p2}, Lcom/devspark/appmsg/AppMsg$Style;->access$100(Lcom/devspark/appmsg/AppMsg$Style;)I

    move-result v2

    iput v2, v0, Lcom/devspark/appmsg/AppMsg;->mDuration:I

    .line 235
    iput-boolean p4, v0, Lcom/devspark/appmsg/AppMsg;->mFloating:Z

    .line 237
    return-object v0
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .prologue
    .line 311
    iget-object v0, p0, Lcom/devspark/appmsg/AppMsg;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/devspark/appmsg/MsgManager;->obtain(Landroid/app/Activity;)Lcom/devspark/appmsg/MsgManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/devspark/appmsg/MsgManager;->clearMsg(Lcom/devspark/appmsg/AppMsg;)V

    .line 313
    return-void
.end method

.method public getActivity()Landroid/app/Activity;
    .registers 2

    .prologue
    .line 336
    iget-object v0, p0, Lcom/devspark/appmsg/AppMsg;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method public getDuration()I
    .registers 2

    .prologue
    .line 373
    iget v0, p0, Lcom/devspark/appmsg/AppMsg;->mDuration:I

    return v0
.end method

.method public getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    .prologue
    .line 407
    iget-object v0, p0, Lcom/devspark/appmsg/AppMsg;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    if-nez v0, :cond_d

    .line 408
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/devspark/appmsg/AppMsg;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    .line 410
    :cond_d
    iget-object v0, p0, Lcom/devspark/appmsg/AppMsg;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    return-object v0
.end method

.method public getParent()Landroid/view/ViewGroup;
    .registers 2

    .prologue
    .line 515
    iget-object v0, p0, Lcom/devspark/appmsg/AppMsg;->mParent:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getPriority()I
    .registers 2

    .prologue
    .line 484
    iget v0, p0, Lcom/devspark/appmsg/AppMsg;->mPriority:I

    return v0
.end method

.method public getView()Landroid/view/View;
    .registers 2

    .prologue
    .line 354
    iget-object v0, p0, Lcom/devspark/appmsg/AppMsg;->mView:Landroid/view/View;

    return-object v0
.end method

.method public isFloating()Z
    .registers 2

    .prologue
    .line 442
    iget-boolean v0, p0, Lcom/devspark/appmsg/AppMsg;->mFloating:Z

    return v0
.end method

.method public isShowing()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 298
    iget-boolean v2, p0, Lcom/devspark/appmsg/AppMsg;->mFloating:Z

    if-eqz v2, :cond_15

    .line 299
    iget-object v2, p0, Lcom/devspark/appmsg/AppMsg;->mView:Landroid/view/View;

    if-eqz v2, :cond_13

    iget-object v2, p0, Lcom/devspark/appmsg/AppMsg;->mView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_13

    .line 301
    :cond_12
    :goto_12
    return v0

    :cond_13
    move v0, v1

    .line 299
    goto :goto_12

    .line 301
    :cond_15
    iget-object v2, p0, Lcom/devspark/appmsg/AppMsg;->mView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-eqz v2, :cond_12

    move v0, v1

    goto :goto_12
.end method

.method public setAnimation(II)Lcom/devspark/appmsg/AppMsg;
    .registers 5
    .param p1, "inAnimation"    # I
    .param p2, "outAnimation"    # I

    .prologue
    .line 460
    iget-object v0, p0, Lcom/devspark/appmsg/AppMsg;->mActivity:Landroid/app/Activity;

    invoke-static {v0, p1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iget-object v1, p0, Lcom/devspark/appmsg/AppMsg;->mActivity:Landroid/app/Activity;

    invoke-static {v1, p2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/devspark/appmsg/AppMsg;->setAnimation(Landroid/view/animation/Animation;Landroid/view/animation/Animation;)Lcom/devspark/appmsg/AppMsg;

    move-result-object v0

    return-object v0
.end method

.method public setAnimation(Landroid/view/animation/Animation;Landroid/view/animation/Animation;)Lcom/devspark/appmsg/AppMsg;
    .registers 3
    .param p1, "inAnimation"    # Landroid/view/animation/Animation;
    .param p2, "outAnimation"    # Landroid/view/animation/Animation;

    .prologue
    .line 470
    iput-object p1, p0, Lcom/devspark/appmsg/AppMsg;->mInAnimation:Landroid/view/animation/Animation;

    .line 471
    iput-object p2, p0, Lcom/devspark/appmsg/AppMsg;->mOutAnimation:Landroid/view/animation/Animation;

    .line 472
    return-object p0
.end method

.method public setDuration(I)V
    .registers 2
    .param p1, "duration"    # I

    .prologue
    .line 364
    iput p1, p0, Lcom/devspark/appmsg/AppMsg;->mDuration:I

    .line 365
    return-void
.end method

.method public setFloating(Z)V
    .registers 2
    .param p1, "mFloating"    # Z

    .prologue
    .line 451
    iput-boolean p1, p0, Lcom/devspark/appmsg/AppMsg;->mFloating:Z

    .line 452
    return-void
.end method

.method public setLayoutGravity(I)Lcom/devspark/appmsg/AppMsg;
    .registers 5
    .param p1, "gravity"    # I

    .prologue
    .line 432
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    iput-object v0, p0, Lcom/devspark/appmsg/AppMsg;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    .line 433
    return-object p0
.end method

.method public setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/devspark/appmsg/AppMsg;
    .registers 2
    .param p1, "layoutParams"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 420
    iput-object p1, p0, Lcom/devspark/appmsg/AppMsg;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    .line 421
    return-object p0
.end method

.method public setParent(I)V
    .registers 3
    .param p1, "parentId"    # I

    .prologue
    .line 536
    iget-object v0, p0, Lcom/devspark/appmsg/AppMsg;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lcom/devspark/appmsg/AppMsg;->setParent(Landroid/view/ViewGroup;)V

    .line 537
    return-void
.end method

.method public setParent(Landroid/view/ViewGroup;)V
    .registers 2
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 525
    iput-object p1, p0, Lcom/devspark/appmsg/AppMsg;->mParent:Landroid/view/ViewGroup;

    .line 526
    return-void
.end method

.method public setPriority(I)V
    .registers 2
    .param p1, "priority"    # I

    .prologue
    .line 507
    iput p1, p0, Lcom/devspark/appmsg/AppMsg;->mPriority:I

    .line 508
    return-void
.end method

.method public setText(I)V
    .registers 3
    .param p1, "resId"    # I

    .prologue
    .line 382
    iget-object v0, p0, Lcom/devspark/appmsg/AppMsg;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/devspark/appmsg/AppMsg;->setText(Ljava/lang/CharSequence;)V

    .line 383
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .registers 5
    .param p1, "s"    # Ljava/lang/CharSequence;

    .prologue
    .line 391
    iget-object v1, p0, Lcom/devspark/appmsg/AppMsg;->mView:Landroid/view/View;

    if-nez v1, :cond_c

    .line 392
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "This AppMsg was not created with AppMsg.makeText()"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 394
    :cond_c
    iget-object v1, p0, Lcom/devspark/appmsg/AppMsg;->mView:Landroid/view/View;

    const v2, 0x102000b

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 395
    .local v0, "tv":Landroid/widget/TextView;
    if-nez v0, :cond_21

    .line 396
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "This AppMsg was not created with AppMsg.makeText()"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 398
    :cond_21
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 399
    return-void
.end method

.method public setView(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 345
    iput-object p1, p0, Lcom/devspark/appmsg/AppMsg;->mView:Landroid/view/View;

    .line 346
    return-void
.end method

.method public show()V
    .registers 3

    .prologue
    .line 290
    iget-object v1, p0, Lcom/devspark/appmsg/AppMsg;->mActivity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/devspark/appmsg/MsgManager;->obtain(Landroid/app/Activity;)Lcom/devspark/appmsg/MsgManager;

    move-result-object v0

    .line 291
    .local v0, "manager":Lcom/devspark/appmsg/MsgManager;
    invoke-virtual {v0, p0}, Lcom/devspark/appmsg/MsgManager;->add(Lcom/devspark/appmsg/AppMsg;)V

    .line 292
    return-void
.end method
