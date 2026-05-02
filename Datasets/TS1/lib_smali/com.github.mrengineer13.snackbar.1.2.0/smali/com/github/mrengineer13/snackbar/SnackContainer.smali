.class Lcom/github/mrengineer13/snackbar/SnackContainer;
.super Landroid/widget/FrameLayout;
.source "SnackContainer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;
    }
.end annotation


# static fields
.field private static final ANIMATION_DURATION:I = 0x12c

.field private static final SAVED_MSGS:Ljava/lang/String; = "SAVED_MSGS"


# instance fields
.field private final mHideRunnable:Ljava/lang/Runnable;

.field private mInAnimationSet:Landroid/view/animation/AnimationSet;

.field private mOutAnimationSet:Landroid/view/animation/AnimationSet;

.field private mPreviousY:F

.field private mSnacks:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 30
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    .line 258
    new-instance v0, Lcom/github/mrengineer13/snackbar/SnackContainer$3;

    invoke-direct {v0, p0}, Lcom/github/mrengineer13/snackbar/SnackContainer$3;-><init>(Lcom/github/mrengineer13/snackbar/SnackContainer;)V

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mHideRunnable:Ljava/lang/Runnable;

    .line 39
    invoke-direct {p0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->init()V

    .line 40
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    .line 258
    new-instance v0, Lcom/github/mrengineer13/snackbar/SnackContainer$3;

    invoke-direct {v0, p0}, Lcom/github/mrengineer13/snackbar/SnackContainer$3;-><init>(Lcom/github/mrengineer13/snackbar/SnackContainer;)V

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mHideRunnable:Ljava/lang/Runnable;

    .line 44
    invoke-direct {p0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->init()V

    .line 45
    return-void
.end method

.method constructor <init>(Landroid/view/ViewGroup;)V
    .registers 4
    .param p1, "container"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v1, -0x1

    .line 48
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 30
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    .line 258
    new-instance v0, Lcom/github/mrengineer13/snackbar/SnackContainer$3;

    invoke-direct {v0, p0}, Lcom/github/mrengineer13/snackbar/SnackContainer$3;-><init>(Lcom/github/mrengineer13/snackbar/SnackContainer;)V

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mHideRunnable:Ljava/lang/Runnable;

    .line 50
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->setVisibility(I)V

    .line 52
    sget v0, Lcom/github/mrengineer13/snackbar/R$id;->snackContainer:I

    invoke-virtual {p0, v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->setId(I)V

    .line 53
    invoke-direct {p0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->init()V

    .line 54
    return-void
.end method

.method static synthetic access$000(Lcom/github/mrengineer13/snackbar/SnackContainer;)Ljava/util/Queue;
    .registers 2
    .param p0, "x0"    # Lcom/github/mrengineer13/snackbar/SnackContainer;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    return-object v0
.end method

.method static synthetic access$100(Lcom/github/mrengineer13/snackbar/SnackContainer;Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V
    .registers 2
    .param p0, "x0"    # Lcom/github/mrengineer13/snackbar/SnackContainer;
    .param p1, "x1"    # Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/github/mrengineer13/snackbar/SnackContainer;->sendOnHide(Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V

    return-void
.end method

.method static synthetic access$200(Lcom/github/mrengineer13/snackbar/SnackContainer;Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V
    .registers 2
    .param p0, "x0"    # Lcom/github/mrengineer13/snackbar/SnackContainer;
    .param p1, "x1"    # Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/github/mrengineer13/snackbar/SnackContainer;->showSnack(Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V

    return-void
.end method

.method static synthetic access$400(Lcom/github/mrengineer13/snackbar/SnackContainer;)F
    .registers 2
    .param p0, "x0"    # Lcom/github/mrengineer13/snackbar/SnackContainer;

    .prologue
    .line 24
    iget v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mPreviousY:F

    return v0
.end method

.method static synthetic access$402(Lcom/github/mrengineer13/snackbar/SnackContainer;F)F
    .registers 2
    .param p0, "x0"    # Lcom/github/mrengineer13/snackbar/SnackContainer;
    .param p1, "x1"    # F

    .prologue
    .line 24
    iput p1, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mPreviousY:F

    return p1
.end method

.method static synthetic access$500(Lcom/github/mrengineer13/snackbar/SnackContainer;)Ljava/lang/Runnable;
    .registers 2
    .param p0, "x0"    # Lcom/github/mrengineer13/snackbar/SnackContainer;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mHideRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$600(Lcom/github/mrengineer13/snackbar/SnackContainer;)Landroid/view/animation/AnimationSet;
    .registers 2
    .param p0, "x0"    # Lcom/github/mrengineer13/snackbar/SnackContainer;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mOutAnimationSet:Landroid/view/animation/AnimationSet;

    return-object v0
.end method

.method private getPxFromDp(I)I
    .registers 8
    .param p1, "dp"    # I

    .prologue
    .line 317
    invoke-virtual {p0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 318
    .local v2, "rs":Landroid/content/res/Resources;
    const/4 v3, 0x1

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    invoke-static {v3, v4, v5}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    float-to-int v1, v3

    .line 319
    .local v1, "pxConverter":I
    mul-int v0, v1, p1

    .line 320
    .local v0, "px":I
    return v0
.end method

.method private init()V
    .registers 13

    .prologue
    .line 57
    new-instance v2, Landroid/view/animation/AnimationSet;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    iput-object v2, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mInAnimationSet:Landroid/view/animation/AnimationSet;

    .line 59
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 65
    .local v0, "mSlideInAnimation":Landroid/view/animation/TranslateAnimation;
    new-instance v10, Landroid/view/animation/AlphaAnimation;

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v10, v2, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 67
    .local v10, "mFadeInAnimation":Landroid/view/animation/AlphaAnimation;
    iget-object v2, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mInAnimationSet:Landroid/view/animation/AnimationSet;

    invoke-virtual {v2, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 68
    iget-object v2, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mInAnimationSet:Landroid/view/animation/AnimationSet;

    invoke-virtual {v2, v10}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 70
    new-instance v2, Landroid/view/animation/AnimationSet;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    iput-object v2, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mOutAnimationSet:Landroid/view/animation/AnimationSet;

    .line 72
    new-instance v1, Landroid/view/animation/TranslateAnimation;

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct/range {v1 .. v9}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 78
    .local v1, "mSlideOutAnimation":Landroid/view/animation/TranslateAnimation;
    new-instance v11, Landroid/view/animation/AlphaAnimation;

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-direct {v11, v2, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 80
    .local v11, "mFadeOutAnimation":Landroid/view/animation/AlphaAnimation;
    iget-object v2, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mOutAnimationSet:Landroid/view/animation/AnimationSet;

    invoke-virtual {v2, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 81
    iget-object v2, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mOutAnimationSet:Landroid/view/animation/AnimationSet;

    invoke-virtual {v2, v11}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 83
    iget-object v2, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mOutAnimationSet:Landroid/view/animation/AnimationSet;

    const-wide/16 v3, 0x12c

    invoke-virtual {v2, v3, v4}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 84
    iget-object v2, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mOutAnimationSet:Landroid/view/animation/AnimationSet;

    new-instance v3, Lcom/github/mrengineer13/snackbar/SnackContainer$1;

    invoke-direct {v3, p0}, Lcom/github/mrengineer13/snackbar/SnackContainer$1;-><init>(Lcom/github/mrengineer13/snackbar/SnackContainer;)V

    invoke-virtual {v2, v3}, Landroid/view/animation/AnimationSet;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 110
    return-void
.end method

.method private sendOnHide(Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V
    .registers 4
    .param p1, "snackHolder"    # Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    .prologue
    .line 243
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->visListener:Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;

    if-eqz v0, :cond_f

    .line 244
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->visListener:Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;

    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->size()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;->onHide(I)V

    .line 246
    :cond_f
    return-void
.end method

.method private sendOnShow(Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V
    .registers 4
    .param p1, "snackHolder"    # Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    .prologue
    .line 249
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->visListener:Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;

    if-eqz v0, :cond_f

    .line 250
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->visListener:Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;

    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->size()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;->onShow(I)V

    .line 252
    :cond_f
    return-void
.end method

.method private showSnack(Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V
    .registers 3
    .param p1, "holder"    # Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    .prologue
    .line 172
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->showSnack(Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;Z)V

    .line 173
    return-void
.end method

.method private showSnack(Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;Z)V
    .registers 6
    .param p1, "holder"    # Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;
    .param p2, "showImmediately"    # Z

    .prologue
    const/4 v2, 0x0

    .line 177
    invoke-virtual {p0, v2}, Lcom/github/mrengineer13/snackbar/SnackContainer;->setVisibility(I)V

    .line 179
    invoke-direct {p0, p1}, Lcom/github/mrengineer13/snackbar/SnackContainer;->sendOnShow(Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V

    .line 181
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snackView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->addView(Landroid/view/View;)V

    .line 182
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->messageView:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    iget-object v1, v1, Lcom/github/mrengineer13/snackbar/Snack;->mMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 183
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    iget-object v0, v0, Lcom/github/mrengineer13/snackbar/Snack;->mActionMessage:Ljava/lang/String;

    if-eqz v0, :cond_99

    .line 184
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->button:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 185
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->button:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    iget-object v1, v1, Lcom/github/mrengineer13/snackbar/Snack;->mActionMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 186
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->button:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    iget v1, v1, Lcom/github/mrengineer13/snackbar/Snack;->mActionIcon:I

    invoke-virtual {v0, v1, v2, v2, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 191
    :goto_32
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->button:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    iget-object v1, v1, Lcom/github/mrengineer13/snackbar/Snack;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 192
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->messageView:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    iget-object v1, v1, Lcom/github/mrengineer13/snackbar/Snack;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 194
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->button:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    iget-object v1, v1, Lcom/github/mrengineer13/snackbar/Snack;->mBtnTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 195
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snackView:Landroid/view/View;

    iget-object v1, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    iget-object v1, v1, Lcom/github/mrengineer13/snackbar/Snack;->mBackgroundColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 196
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    iget v0, v0, Lcom/github/mrengineer13/snackbar/Snack;->mHeight:I

    if-lez v0, :cond_70

    .line 197
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snackView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget-object v1, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    iget v1, v1, Lcom/github/mrengineer13/snackbar/Snack;->mHeight:I

    invoke-direct {p0, v1}, Lcom/github/mrengineer13/snackbar/SnackContainer;->getPxFromDp(I)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 199
    :cond_70
    if-eqz p2, :cond_a1

    .line 200
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mInAnimationSet:Landroid/view/animation/AnimationSet;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 204
    :goto_79
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mInAnimationSet:Landroid/view/animation/AnimationSet;

    invoke-virtual {p0, v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->startAnimation(Landroid/view/animation/Animation;)V

    .line 206
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    iget-short v0, v0, Lcom/github/mrengineer13/snackbar/Snack;->mDuration:S

    if-lez v0, :cond_8e

    .line 207
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mHideRunnable:Ljava/lang/Runnable;

    iget-object v1, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    iget-short v1, v1, Lcom/github/mrengineer13/snackbar/Snack;->mDuration:S

    int-to-long v1, v1

    invoke-virtual {p0, v0, v1, v2}, Lcom/github/mrengineer13/snackbar/SnackContainer;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 210
    :cond_8e
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snackView:Landroid/view/View;

    new-instance v1, Lcom/github/mrengineer13/snackbar/SnackContainer$2;

    invoke-direct {v1, p0, p1}, Lcom/github/mrengineer13/snackbar/SnackContainer$2;-><init>(Lcom/github/mrengineer13/snackbar/SnackContainer;Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 240
    return-void

    .line 188
    :cond_99
    iget-object v0, p1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->button:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_32

    .line 202
    :cond_a1
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mInAnimationSet:Landroid/view/animation/AnimationSet;

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    goto :goto_79
.end method


# virtual methods
.method public clearSnacks(Z)V
    .registers 3
    .param p1, "animate"    # Z

    .prologue
    .line 138
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    .line 139
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 140
    if-eqz p1, :cond_11

    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mHideRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 141
    :cond_11
    return-void
.end method

.method public hide()V
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 153
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mHideRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 154
    return-void
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isShowing()Z
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 114
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 115
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mInAnimationSet:Landroid/view/animation/AnimationSet;

    invoke-virtual {v0}, Landroid/view/animation/AnimationSet;->cancel()V

    .line 116
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mOutAnimationSet:Landroid/view/animation/AnimationSet;

    invoke-virtual {v0}, Landroid/view/animation/AnimationSet;->cancel()V

    .line 117
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 118
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    .line 119
    return-void
.end method

.method public peek()Lcom/github/mrengineer13/snackbar/Snack;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    iget-object v0, v0, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    return-object v0
.end method

.method public pollSnack()Lcom/github/mrengineer13/snackbar/Snack;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    iget-object v0, v0, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    return-object v0
.end method

.method public restoreState(Landroid/os/Bundle;Landroid/view/View;)V
    .registers 10
    .param p1, "state"    # Landroid/os/Bundle;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 272
    const-string v6, "SAVED_MSGS"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v4

    .line 273
    .local v4, "messages":[Landroid/os/Parcelable;
    const/4 v5, 0x1

    .line 275
    .local v5, "showImmediately":Z
    move-object v0, v4

    .local v0, "arr$":[Landroid/os/Parcelable;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_a
    if-ge v1, v2, :cond_18

    aget-object v3, v0, v1

    .line 276
    .local v3, "message":Landroid/os/Parcelable;
    check-cast v3, Lcom/github/mrengineer13/snackbar/Snack;

    .end local v3    # "message":Landroid/os/Parcelable;
    const/4 v6, 0x0

    invoke-virtual {p0, v3, p2, v6, v5}, Lcom/github/mrengineer13/snackbar/SnackContainer;->showSnack(Lcom/github/mrengineer13/snackbar/Snack;Landroid/view/View;Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;Z)V

    .line 277
    const/4 v5, 0x0

    .line 275
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 279
    :cond_18
    return-void
.end method

.method public saveState()Landroid/os/Bundle;
    .registers 9

    .prologue
    .line 282
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 284
    .local v5, "outState":Landroid/os/Bundle;
    iget-object v7, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    invoke-interface {v7}, Ljava/util/Queue;->size()I

    move-result v0

    .line 285
    .local v0, "count":I
    new-array v6, v0, [Lcom/github/mrengineer13/snackbar/Snack;

    .line 286
    .local v6, "snacks":[Lcom/github/mrengineer13/snackbar/Snack;
    const/4 v2, 0x0

    .line 287
    .local v2, "i":I
    iget-object v7, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    invoke-interface {v7}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_14
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_28

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    .line 288
    .local v1, "holder":Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    iget-object v7, v1, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;->snack:Lcom/github/mrengineer13/snackbar/Snack;

    aput-object v7, v6, v2

    move v2, v3

    .line 289
    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_14

    .line 291
    .end local v1    # "holder":Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;
    :cond_28
    const-string v7, "SAVED_MSGS"

    invoke-virtual {v5, v7, v6}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 292
    return-object v5
.end method

.method public showSnack(Lcom/github/mrengineer13/snackbar/Snack;Landroid/view/View;Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;)V
    .registers 5
    .param p1, "snack"    # Lcom/github/mrengineer13/snackbar/Snack;
    .param p2, "snackView"    # Landroid/view/View;
    .param p3, "listener"    # Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;

    .prologue
    .line 157
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/github/mrengineer13/snackbar/SnackContainer;->showSnack(Lcom/github/mrengineer13/snackbar/Snack;Landroid/view/View;Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;Z)V

    .line 158
    return-void
.end method

.method public showSnack(Lcom/github/mrengineer13/snackbar/Snack;Landroid/view/View;Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;Z)V
    .registers 8
    .param p1, "snack"    # Lcom/github/mrengineer13/snackbar/Snack;
    .param p2, "snackView"    # Landroid/view/View;
    .param p3, "listener"    # Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;
    .param p4, "immediately"    # Z

    .prologue
    .line 162
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_15

    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eq v1, p0, :cond_15

    .line 163
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 166
    :cond_15
    new-instance v0, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, p3, v1}, Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;-><init>(Lcom/github/mrengineer13/snackbar/Snack;Landroid/view/View;Lcom/github/mrengineer13/snackbar/SnackBar$OnVisibilityChangeListener;Lcom/github/mrengineer13/snackbar/SnackContainer$1;)V

    .line 167
    .local v0, "holder":Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;
    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    invoke-interface {v1, v0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 168
    iget-object v1, p0, Lcom/github/mrengineer13/snackbar/SnackContainer;->mSnacks:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2c

    invoke-direct {p0, v0, p4}, Lcom/github/mrengineer13/snackbar/SnackContainer;->showSnack(Lcom/github/mrengineer13/snackbar/SnackContainer$SnackHolder;Z)V

    .line 169
    :cond_2c
    return-void
.end method
