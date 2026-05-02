.class public Lcom/rey/material/widget/SnackBar;
.super Lcom/rey/material/widget/FrameLayout;
.source "SnackBar.java"

# interfaces
.implements Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/widget/SnackBar$BackgroundDrawable;,
        Lcom/rey/material/widget/SnackBar$OnStateChangeListener;,
        Lcom/rey/material/widget/SnackBar$OnActionClickListener;
    }
.end annotation


# static fields
.field public static final MATCH_PARENT:I = -0x1

.field public static final STATE_DISMISSED:I = 0x0

.field public static final STATE_DISMISSING:I = 0x3

.field public static final STATE_SHOWING:I = 0x2

.field public static final STATE_SHOWN:I = 0x1

.field public static final WRAP_CONTENT:I = -0x2


# instance fields
.field private mAction:Lcom/rey/material/widget/Button;

.field private mActionClickListener:Lcom/rey/material/widget/SnackBar$OnActionClickListener;

.field private mActionId:I

.field private mBackground:Lcom/rey/material/widget/SnackBar$BackgroundDrawable;

.field private mDismissRunnable:Ljava/lang/Runnable;

.field private mDuration:J

.field private mHeight:I

.field private mInAnimation:Landroid/view/animation/Animation;

.field private mIsRtl:Z

.field private mMarginBottom:I

.field private mMarginStart:I

.field private mMaxHeight:I

.field private mMinHeight:I

.field private mOutAnimation:Landroid/view/animation/Animation;

.field private mRemoveOnDismiss:Z

.field private mState:I

.field private mStateChangeListener:Lcom/rey/material/widget/SnackBar$OnStateChangeListener;

.field private mText:Lcom/rey/material/widget/TextView;

.field private mWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 119
    invoke-direct {p0, p1}, Lcom/rey/material/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 55
    new-instance v0, Lcom/rey/material/widget/SnackBar$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/SnackBar$1;-><init>(Lcom/rey/material/widget/SnackBar;)V

    iput-object v0, p0, Lcom/rey/material/widget/SnackBar;->mDismissRunnable:Ljava/lang/Runnable;

    .line 62
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    .line 120
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 123
    invoke-direct {p0, p1, p2}, Lcom/rey/material/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 55
    new-instance v0, Lcom/rey/material/widget/SnackBar$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/SnackBar$1;-><init>(Lcom/rey/material/widget/SnackBar;)V

    iput-object v0, p0, Lcom/rey/material/widget/SnackBar;->mDismissRunnable:Ljava/lang/Runnable;

    .line 62
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    .line 124
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 127
    invoke-direct {p0, p1, p2, p3}, Lcom/rey/material/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 55
    new-instance v0, Lcom/rey/material/widget/SnackBar$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/SnackBar$1;-><init>(Lcom/rey/material/widget/SnackBar;)V

    iput-object v0, p0, Lcom/rey/material/widget/SnackBar;->mDismissRunnable:Ljava/lang/Runnable;

    .line 62
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    .line 128
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 131
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 55
    new-instance v0, Lcom/rey/material/widget/SnackBar$1;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/SnackBar$1;-><init>(Lcom/rey/material/widget/SnackBar;)V

    iput-object v0, p0, Lcom/rey/material/widget/SnackBar;->mDismissRunnable:Ljava/lang/Runnable;

    .line 62
    const/4 v0, 0x0

    iput v0, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    .line 132
    return-void
.end method

.method static synthetic access$000(Lcom/rey/material/widget/SnackBar;)Lcom/rey/material/widget/SnackBar$OnActionClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/SnackBar;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mActionClickListener:Lcom/rey/material/widget/SnackBar$OnActionClickListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/rey/material/widget/SnackBar;)I
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/SnackBar;

    .prologue
    .line 33
    iget v0, p0, Lcom/rey/material/widget/SnackBar;->mActionId:I

    return v0
.end method

.method static synthetic access$200(Lcom/rey/material/widget/SnackBar;I)V
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/SnackBar;
    .param p1, "x1"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/rey/material/widget/SnackBar;->setState(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/rey/material/widget/SnackBar;)V
    .registers 1
    .param p0, "x0"    # Lcom/rey/material/widget/SnackBar;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/rey/material/widget/SnackBar;->startTimer()V

    return-void
.end method

.method static synthetic access$400(Lcom/rey/material/widget/SnackBar;)Z
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/SnackBar;

    .prologue
    .line 33
    iget-boolean v0, p0, Lcom/rey/material/widget/SnackBar;->mRemoveOnDismiss:Z

    return v0
.end method

.method public static make(Landroid/content/Context;)Lcom/rey/material/widget/SnackBar;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 115
    new-instance v0, Lcom/rey/material/widget/SnackBar;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/SnackBar;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method private setState(I)V
    .registers 5
    .param p1, "state"    # I

    .prologue
    .line 911
    iget v1, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    if-eq v1, p1, :cond_13

    .line 912
    iget v0, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    .line 913
    .local v0, "oldState":I
    iput p1, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    .line 914
    iget-object v1, p0, Lcom/rey/material/widget/SnackBar;->mStateChangeListener:Lcom/rey/material/widget/SnackBar$OnStateChangeListener;

    if-eqz v1, :cond_13

    .line 915
    iget-object v1, p0, Lcom/rey/material/widget/SnackBar;->mStateChangeListener:Lcom/rey/material/widget/SnackBar$OnStateChangeListener;

    iget v2, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    invoke-interface {v1, p0, v0, v2}, Lcom/rey/material/widget/SnackBar$OnStateChangeListener;->onStateChange(Lcom/rey/material/widget/SnackBar;II)V

    .line 917
    .end local v0    # "oldState":I
    :cond_13
    return-void
.end method

.method private startTimer()V
    .registers 5

    .prologue
    .line 853
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mDismissRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/SnackBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 854
    iget-wide v0, p0, Lcom/rey/material/widget/SnackBar;->mDuration:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_14

    .line 855
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mDismissRunnable:Ljava/lang/Runnable;

    iget-wide v1, p0, Lcom/rey/material/widget/SnackBar;->mDuration:J

    invoke-virtual {p0, v0, v1, v2}, Lcom/rey/material/widget/SnackBar;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 856
    :cond_14
    return-void
.end method


# virtual methods
.method public actionClickListener(Lcom/rey/material/widget/SnackBar$OnActionClickListener;)Lcom/rey/material/widget/SnackBar;
    .registers 2
    .param p1, "listener"    # Lcom/rey/material/widget/SnackBar$OnActionClickListener;

    .prologue
    .line 711
    iput-object p1, p0, Lcom/rey/material/widget/SnackBar;->mActionClickListener:Lcom/rey/material/widget/SnackBar$OnActionClickListener;

    .line 712
    return-object p0
.end method

.method public actionId(I)Lcom/rey/material/widget/SnackBar;
    .registers 2
    .param p1, "id"    # I

    .prologue
    .line 478
    iput p1, p0, Lcom/rey/material/widget/SnackBar;->mActionId:I

    .line 479
    return-object p0
.end method

.method public actionRipple(I)Lcom/rey/material/widget/SnackBar;
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 556
    if-eqz p1, :cond_14

    .line 557
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    new-instance v1, Lcom/rey/material/drawable/RippleDrawable$Builder;

    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lcom/rey/material/drawable/RippleDrawable$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1}, Lcom/rey/material/drawable/RippleDrawable$Builder;->build()Lcom/rey/material/drawable/RippleDrawable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 558
    :cond_14
    return-object p0
.end method

.method public actionText(I)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 503
    if-nez p1, :cond_8

    .line 504
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/SnackBar;->actionText(Ljava/lang/CharSequence;)Lcom/rey/material/widget/SnackBar;

    move-result-object v0

    .line 506
    :goto_7
    return-object v0

    :cond_8
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/SnackBar;->actionText(Ljava/lang/CharSequence;)Lcom/rey/material/widget/SnackBar;

    move-result-object v0

    goto :goto_7
.end method

.method public actionText(Ljava/lang/CharSequence;)Lcom/rey/material/widget/SnackBar;
    .registers 4
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 488
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 489
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/Button;->setVisibility(I)V

    .line 494
    :goto_c
    return-object p0

    .line 491
    :cond_d
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/Button;->setVisibility(I)V

    .line 492
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_c
.end method

.method public actionTextAppearance(I)Lcom/rey/material/widget/SnackBar;
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 535
    if-eqz p1, :cond_b

    .line 536
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/rey/material/widget/Button;->setTextAppearance(Landroid/content/Context;I)V

    .line 537
    :cond_b
    return-object p0
.end method

.method public actionTextColor(I)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 515
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setTextColor(I)V

    .line 516
    return-object p0
.end method

.method public actionTextColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "colors"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 525
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/Button;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 526
    return-object p0
.end method

.method public actionTextSize(F)Lcom/rey/material/widget/SnackBar;
    .registers 4
    .param p1, "size"    # F

    .prologue
    .line 546
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Lcom/rey/material/widget/Button;->setTextSize(IF)V

    .line 547
    return-object p0
.end method

.method public animationIn(Landroid/view/animation/Animation;)Lcom/rey/material/widget/SnackBar;
    .registers 2
    .param p1, "anim"    # Landroid/view/animation/Animation;

    .prologue
    .line 731
    iput-object p1, p0, Lcom/rey/material/widget/SnackBar;->mInAnimation:Landroid/view/animation/Animation;

    .line 732
    return-object p0
.end method

.method public animationOut(Landroid/view/animation/Animation;)Lcom/rey/material/widget/SnackBar;
    .registers 2
    .param p1, "anim"    # Landroid/view/animation/Animation;

    .prologue
    .line 741
    iput-object p1, p0, Lcom/rey/material/widget/SnackBar;->mOutAnimation:Landroid/view/animation/Animation;

    .line 742
    return-object p0
.end method

.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 26
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 172
    invoke-super/range {p0 .. p4}, Lcom/rey/material/widget/FrameLayout;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 174
    sget-object v19, Lcom/rey/material/R$styleable;->SnackBar:[I

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, v19

    move/from16 v3, p3

    move/from16 v4, p4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 176
    .local v5, "a":Landroid/content/res/TypedArray;
    const/4 v12, -0x1

    .line 177
    .local v12, "horizontalPadding":I
    const/16 v18, -0x1

    .line 178
    .local v18, "verticalPadding":I
    const/16 v17, -0x1

    .line 179
    .local v17, "textSize":I
    const/4 v15, 0x0

    .line 180
    .local v15, "textColor":I
    const/16 v16, 0x0

    .line 181
    .local v16, "textColorDefined":Z
    const/4 v14, 0x0

    .line 182
    .local v14, "textAppearance":I
    const/4 v8, -0x1

    .line 183
    .local v8, "actionTextSize":I
    const/4 v7, 0x0

    .line 184
    .local v7, "actionTextColor":Landroid/content/res/ColorStateList;
    const/4 v6, 0x0

    .line 186
    .local v6, "actionTextAppearance":I
    const/4 v13, 0x0

    .local v13, "i":I
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v10

    .local v10, "count":I
    :goto_24
    if-ge v13, v10, :cond_2ff

    .line 187
    invoke-virtual {v5, v13}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v9

    .line 188
    .local v9, "attr":I
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_backgroundColor:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_42

    .line 189
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->backgroundColor(I)Lcom/rey/material/widget/SnackBar;

    .line 186
    :cond_3f
    :goto_3f
    add-int/lit8 v13, v13, 0x1

    goto :goto_24

    .line 190
    :cond_42
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_backgroundCornerRadius:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_58

    .line 191
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->backgroundRadius(I)Lcom/rey/material/widget/SnackBar;

    goto :goto_3f

    .line 192
    :cond_58
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_horizontalPadding:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_67

    .line 193
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v12

    goto :goto_3f

    .line 194
    :cond_67
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_verticalPadding:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_76

    .line 195
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v18

    goto :goto_3f

    .line 196
    :cond_76
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_width:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_a8

    .line 197
    invoke-static {v5, v9}, Lcom/rey/material/util/ThemeUtil;->getType(Landroid/content/res/TypedArray;I)I

    move-result v19

    const/16 v20, 0x10

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_98

    .line 198
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->width(I)Lcom/rey/material/widget/SnackBar;

    goto :goto_3f

    .line 200
    :cond_98
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->width(I)Lcom/rey/material/widget/SnackBar;

    goto :goto_3f

    .line 202
    :cond_a8
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_height:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_dc

    .line 203
    invoke-static {v5, v9}, Lcom/rey/material/util/ThemeUtil;->getType(Landroid/content/res/TypedArray;I)I

    move-result v19

    const/16 v20, 0x10

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_cb

    .line 204
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->height(I)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 206
    :cond_cb
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->height(I)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 208
    :cond_dc
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_minWidth:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_f3

    .line 209
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->minWidth(I)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 210
    :cond_f3
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_maxWidth:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_10a

    .line 211
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->maxWidth(I)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 212
    :cond_10a
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_minHeight:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_121

    .line 213
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->minHeight(I)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 214
    :cond_121
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_maxHeight:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_138

    .line 215
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->maxHeight(I)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 216
    :cond_138
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_marginStart:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_14f

    .line 217
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->marginStart(I)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 218
    :cond_14f
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_marginBottom:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_166

    .line 219
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->marginBottom(I)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 220
    :cond_166
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_textSize:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_176

    .line 221
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v17

    goto/16 :goto_3f

    .line 222
    :cond_176
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_textColor:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_188

    .line 223
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v15

    .line 224
    const/16 v16, 0x1

    goto/16 :goto_3f

    .line 226
    :cond_188
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_textAppearance:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_198

    .line 227
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v14

    goto/16 :goto_3f

    .line 228
    :cond_198
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_text:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_1ab

    .line 229
    invoke-virtual {v5, v9}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->text(Ljava/lang/CharSequence;)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 230
    :cond_1ab
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_singleLine:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_1c2

    .line 231
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->singleLine(Z)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 232
    :cond_1c2
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_maxLines:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_1d9

    .line 233
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->maxLines(I)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 234
    :cond_1d9
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_lines:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_1f0

    .line 235
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->lines(I)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 236
    :cond_1f0
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_ellipsize:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_238

    .line 237
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v11

    .line 238
    .local v11, "ellipsize":I
    packed-switch v11, :pswitch_data_35e

    .line 252
    sget-object v19, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->ellipsize(Landroid/text/TextUtils$TruncateAt;)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 240
    :pswitch_20c
    sget-object v19, Landroid/text/TextUtils$TruncateAt;->START:Landroid/text/TextUtils$TruncateAt;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->ellipsize(Landroid/text/TextUtils$TruncateAt;)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 243
    :pswitch_217
    sget-object v19, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->ellipsize(Landroid/text/TextUtils$TruncateAt;)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 246
    :pswitch_222
    sget-object v19, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->ellipsize(Landroid/text/TextUtils$TruncateAt;)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 249
    :pswitch_22d
    sget-object v19, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->ellipsize(Landroid/text/TextUtils$TruncateAt;)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 256
    .end local v11    # "ellipsize":I
    :cond_238
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_actionTextSize:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_248

    .line 257
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v8

    goto/16 :goto_3f

    .line 258
    :cond_248
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_actionTextColor:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_254

    .line 259
    invoke-virtual {v5, v9}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    goto/16 :goto_3f

    .line 260
    :cond_254
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_actionTextAppearance:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_264

    .line 261
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    goto/16 :goto_3f

    .line 262
    :cond_264
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_actionText:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_277

    .line 263
    invoke-virtual {v5, v9}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->actionText(Ljava/lang/CharSequence;)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 264
    :cond_277
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_actionRipple:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_28e

    .line 265
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->actionRipple(I)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 266
    :cond_28e
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_duration:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_2aa

    .line 267
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v19

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v19, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v19

    invoke-virtual {v0, v1, v2}, Lcom/rey/material/widget/SnackBar;->duration(J)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 268
    :cond_2aa
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_removeOnDismiss:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_2c1

    .line 269
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->removeOnDismiss(Z)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 270
    :cond_2c1
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_inAnimation:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_2e0

    .line 271
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/SnackBar;->getContext()Landroid/content/Context;

    move-result-object v19

    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v20

    invoke-static/range {v19 .. v20}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->animationIn(Landroid/view/animation/Animation;)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 272
    :cond_2e0
    sget v19, Lcom/rey/material/R$styleable;->SnackBar_sb_outAnimation:I

    move/from16 v0, v19

    if-ne v9, v0, :cond_3f

    .line 273
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/SnackBar;->getContext()Landroid/content/Context;

    move-result-object v19

    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v5, v9, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v20

    invoke-static/range {v19 .. v20}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->animationOut(Landroid/view/animation/Animation;)Lcom/rey/material/widget/SnackBar;

    goto/16 :goto_3f

    .line 276
    .end local v9    # "attr":I
    :cond_2ff
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    .line 278
    if-gez v12, :cond_306

    if-ltz v18, :cond_311

    .line 279
    :cond_306
    if-ltz v12, :cond_348

    .end local v12    # "horizontalPadding":I
    :goto_308
    if-ltz v18, :cond_353

    .end local v18    # "verticalPadding":I
    :goto_30a
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v12, v1}, Lcom/rey/material/widget/SnackBar;->padding(II)Lcom/rey/material/widget/SnackBar;

    .line 281
    :cond_311
    if-eqz v14, :cond_318

    .line 282
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/rey/material/widget/SnackBar;->textAppearance(I)Lcom/rey/material/widget/SnackBar;

    .line 283
    :cond_318
    if-ltz v17, :cond_326

    .line 284
    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->textSize(F)Lcom/rey/material/widget/SnackBar;

    .line 285
    :cond_326
    if-eqz v16, :cond_32d

    .line 286
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/rey/material/widget/SnackBar;->textColor(I)Lcom/rey/material/widget/SnackBar;

    .line 288
    :cond_32d
    if-eqz v14, :cond_334

    .line 289
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/rey/material/widget/SnackBar;->actionTextAppearance(I)Lcom/rey/material/widget/SnackBar;

    .line 290
    :cond_334
    if-ltz v8, :cond_340

    .line 291
    int-to-float v0, v8

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar;->actionTextSize(F)Lcom/rey/material/widget/SnackBar;

    .line 292
    :cond_340
    if-eqz v7, :cond_347

    .line 293
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/rey/material/widget/SnackBar;->actionTextColor(Landroid/content/res/ColorStateList;)Lcom/rey/material/widget/SnackBar;

    .line 294
    :cond_347
    return-void

    .line 279
    .restart local v12    # "horizontalPadding":I
    .restart local v18    # "verticalPadding":I
    :cond_348
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/rey/material/widget/TextView;->getPaddingLeft()I

    move-result v12

    goto :goto_308

    .end local v12    # "horizontalPadding":I
    :cond_353
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/rey/material/widget/TextView;->getPaddingTop()I

    move-result v18

    goto :goto_30a

    .line 238
    :pswitch_data_35e
    .packed-switch 0x1
        :pswitch_20c
        :pswitch_217
        :pswitch_222
        :pswitch_22d
    .end packed-switch
.end method

.method public backgroundColor(I)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 577
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mBackground:Lcom/rey/material/widget/SnackBar$BackgroundDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->setColor(I)V

    .line 578
    return-object p0
.end method

.method public backgroundRadius(I)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "radius"    # I

    .prologue
    .line 587
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mBackground:Lcom/rey/material/widget/SnackBar$BackgroundDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->setRadius(I)V

    .line 588
    return-object p0
.end method

.method public dismiss()V
    .registers 3

    .prologue
    .line 862
    iget v0, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_6

    .line 900
    :goto_5
    return-void

    .line 865
    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mDismissRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/SnackBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 867
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mOutAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_2c

    .line 868
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mOutAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->cancel()V

    .line 869
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mOutAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->reset()V

    .line 870
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mOutAnimation:Landroid/view/animation/Animation;

    new-instance v1, Lcom/rey/material/widget/SnackBar$4;

    invoke-direct {v1, p0}, Lcom/rey/material/widget/SnackBar$4;-><init>(Lcom/rey/material/widget/SnackBar;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 889
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->clearAnimation()V

    .line 890
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mOutAnimation:Landroid/view/animation/Animation;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/SnackBar;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_5

    .line 893
    :cond_2c
    iget-boolean v0, p0, Lcom/rey/material/widget/SnackBar;->mRemoveOnDismiss:Z

    if-eqz v0, :cond_47

    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_47

    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_47

    .line 894
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 896
    :cond_47
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/rey/material/widget/SnackBar;->setState(I)V

    .line 897
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/SnackBar;->setVisibility(I)V

    goto :goto_5
.end method

.method public duration(J)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "duration"    # J

    .prologue
    .line 567
    iput-wide p1, p0, Lcom/rey/material/widget/SnackBar;->mDuration:J

    .line 568
    return-object p0
.end method

.method public ellipsize(Landroid/text/TextUtils$TruncateAt;)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "at"    # Landroid/text/TextUtils$TruncateAt;

    .prologue
    .line 438
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 439
    return-object p0
.end method

.method public getState()I
    .registers 2

    .prologue
    .line 907
    iget v0, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    return v0
.end method

.method public height(I)Lcom/rey/material/widget/SnackBar;
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 661
    iput p1, p0, Lcom/rey/material/widget/SnackBar;->mHeight:I

    .line 662
    return-object p0
.end method

.method public horizontalPadding(I)Lcom/rey/material/widget/SnackBar;
    .registers 5
    .param p1, "padding"    # I

    .prologue
    .line 597
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    iget-object v1, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v1}, Lcom/rey/material/widget/TextView;->getPaddingTop()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v2}, Lcom/rey/material/widget/TextView;->getPaddingBottom()I

    move-result v2

    invoke-virtual {v0, p1, v1, p1, v2}, Lcom/rey/material/widget/TextView;->setPadding(IIII)V

    .line 598
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    iget-object v1, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v1}, Lcom/rey/material/widget/Button;->getPaddingTop()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v2}, Lcom/rey/material/widget/Button;->getPaddingBottom()I

    move-result v2

    invoke-virtual {v0, p1, v1, p1, v2}, Lcom/rey/material/widget/Button;->setPadding(IIII)V

    .line 599
    return-object p0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, -0x2

    .line 136
    const/4 v0, -0x1

    iput v0, p0, Lcom/rey/material/widget/SnackBar;->mWidth:I

    .line 137
    iput v2, p0, Lcom/rey/material/widget/SnackBar;->mHeight:I

    .line 138
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/rey/material/widget/SnackBar;->mDuration:J

    .line 139
    iput-boolean v3, p0, Lcom/rey/material/widget/SnackBar;->mIsRtl:Z

    .line 141
    new-instance v0, Lcom/rey/material/widget/TextView;

    invoke-direct {v0, p1}, Lcom/rey/material/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    .line 142
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, v4}, Lcom/rey/material/widget/TextView;->setSingleLine(Z)V

    .line 143
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    const v1, 0x800013

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/TextView;->setGravity(I)V

    .line 144
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, Lcom/rey/material/widget/SnackBar;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    new-instance v0, Lcom/rey/material/widget/Button;

    invoke-direct {v0, p1}, Lcom/rey/material/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    .line 147
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, v3}, Lcom/rey/material/widget/Button;->setBackgroundResource(I)V

    .line 148
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/Button;->setGravity(I)V

    .line 149
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    new-instance v1, Lcom/rey/material/widget/SnackBar$2;

    invoke-direct {v1, p0}, Lcom/rey/material/widget/SnackBar$2;-><init>(Lcom/rey/material/widget/SnackBar;)V

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, Lcom/rey/material/widget/SnackBar;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 162
    new-instance v0, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;

    invoke-direct {v0, p0}, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;-><init>(Lcom/rey/material/widget/SnackBar;)V

    iput-object v0, p0, Lcom/rey/material/widget/SnackBar;->mBackground:Lcom/rey/material/widget/SnackBar$BackgroundDrawable;

    .line 163
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mBackground:Lcom/rey/material/widget/SnackBar$BackgroundDrawable;

    const v1, -0xcdcdce

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/SnackBar$BackgroundDrawable;->setColor(I)V

    .line 164
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mBackground:Lcom/rey/material/widget/SnackBar$BackgroundDrawable;

    invoke-static {p0, v0}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 165
    invoke-virtual {p0, v4}, Lcom/rey/material/widget/SnackBar;->setClickable(Z)V

    .line 167
    invoke-super {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/FrameLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 168
    return-void
.end method

.method public lines(I)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "lines"    # I

    .prologue
    .line 468
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TextView;->setLines(I)V

    .line 469
    return-object p0
.end method

.method public marginBottom(I)Lcom/rey/material/widget/SnackBar;
    .registers 2
    .param p1, "size"    # I

    .prologue
    .line 701
    iput p1, p0, Lcom/rey/material/widget/SnackBar;->mMarginBottom:I

    .line 702
    return-object p0
.end method

.method public marginStart(I)Lcom/rey/material/widget/SnackBar;
    .registers 2
    .param p1, "size"    # I

    .prologue
    .line 691
    iput p1, p0, Lcom/rey/material/widget/SnackBar;->mMarginStart:I

    .line 692
    return-object p0
.end method

.method public maxHeight(I)Lcom/rey/material/widget/SnackBar;
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 671
    iput p1, p0, Lcom/rey/material/widget/SnackBar;->mMaxHeight:I

    .line 672
    return-object p0
.end method

.method public maxLines(I)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "lines"    # I

    .prologue
    .line 458
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TextView;->setMaxLines(I)V

    .line 459
    return-object p0
.end method

.method public maxWidth(I)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "width"    # I

    .prologue
    .line 651
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TextView;->setMaxWidth(I)V

    .line 652
    return-object p0
.end method

.method public minHeight(I)Lcom/rey/material/widget/SnackBar;
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 681
    iput p1, p0, Lcom/rey/material/widget/SnackBar;->mMinHeight:I

    .line 682
    return-object p0
.end method

.method public minWidth(I)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "width"    # I

    .prologue
    .line 641
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TextView;->setMinWidth(I)V

    .line 642
    return-object p0
.end method

.method protected onLayout(ZIIII)V
    .registers 12
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 363
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getPaddingLeft()I

    move-result v1

    .line 364
    .local v1, "childLeft":I
    sub-int v4, p4, p2

    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getPaddingRight()I

    move-result v5

    sub-int v2, v4, v5

    .line 365
    .local v2, "childRight":I
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getPaddingTop()I

    move-result v3

    .line 366
    .local v3, "childTop":I
    sub-int v4, p5, p3

    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getPaddingBottom()I

    move-result v5

    sub-int v0, v4, v5

    .line 368
    .local v0, "childBottom":I
    iget-object v4, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v4}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v4

    if-nez v4, :cond_3e

    .line 369
    iget-boolean v4, p0, Lcom/rey/material/widget/SnackBar;->mIsRtl:Z

    if-eqz v4, :cond_44

    .line 370
    iget-object v4, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    iget-object v5, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v5}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v5

    add-int/2addr v5, v1

    invoke-virtual {v4, v1, v3, v5, v0}, Lcom/rey/material/widget/Button;->layout(IIII)V

    .line 371
    iget-object v4, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v4}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v4

    iget-object v5, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v5}, Lcom/rey/material/widget/TextView;->getPaddingLeft()I

    move-result v5

    sub-int/2addr v4, v5

    add-int/2addr v1, v4

    .line 379
    :cond_3e
    :goto_3e
    iget-object v4, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v4, v1, v3, v2, v0}, Lcom/rey/material/widget/TextView;->layout(IIII)V

    .line 380
    return-void

    .line 374
    :cond_44
    iget-object v4, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    iget-object v5, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v5}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v5

    sub-int v5, v2, v5

    invoke-virtual {v4, v5, v3, v2, v0}, Lcom/rey/material/widget/Button;->layout(IIII)V

    .line 375
    iget-object v4, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v4}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v4

    iget-object v5, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v5}, Lcom/rey/material/widget/TextView;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    sub-int/2addr v2, v4

    goto :goto_3e
.end method

.method protected onMeasure(II)V
    .registers 12
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v8, 0x0

    .line 314
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v6

    .line 315
    .local v6, "widthSize":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v5

    .line 316
    .local v5, "widthMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 317
    .local v2, "heightSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 321
    .local v1, "heightMode":I
    iget-object v7, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v7}, Lcom/rey/material/widget/Button;->getVisibility()I

    move-result v7

    if-nez v7, :cond_82

    .line 322
    iget-object v7, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-static {v8, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    invoke-virtual {v7, v8, p2}, Lcom/rey/material/widget/Button;->measure(II)V

    .line 323
    iget-boolean v7, p0, Lcom/rey/material/widget/SnackBar;->mIsRtl:Z

    if-eqz v7, :cond_7b

    iget-object v7, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v7}, Lcom/rey/material/widget/TextView;->getPaddingLeft()I

    move-result v3

    .line 324
    .local v3, "padding":I
    :goto_2c
    iget-object v7, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    iget-object v8, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v8}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v8

    sub-int/2addr v8, v3

    sub-int v8, v6, v8

    invoke-static {v8, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    invoke-virtual {v7, v8, p2}, Lcom/rey/material/widget/TextView;->measure(II)V

    .line 325
    iget-object v7, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v7}, Lcom/rey/material/widget/TextView;->getMeasuredWidth()I

    move-result v7

    iget-object v8, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v8}, Lcom/rey/material/widget/Button;->getMeasuredWidth()I

    move-result v8

    add-int/2addr v7, v8

    sub-int v4, v7, v3

    .line 332
    .end local v3    # "padding":I
    .local v4, "width":I
    :goto_4d
    iget-object v7, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v7}, Lcom/rey/material/widget/TextView;->getMeasuredHeight()I

    move-result v7

    iget-object v8, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v8}, Lcom/rey/material/widget/Button;->getMeasuredHeight()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 334
    .local v0, "height":I
    sparse-switch v5, :sswitch_data_a0

    .line 343
    :goto_60
    sparse-switch v1, :sswitch_data_aa

    .line 352
    :goto_63
    iget v7, p0, Lcom/rey/material/widget/SnackBar;->mMaxHeight:I

    if-lez v7, :cond_6d

    .line 353
    iget v7, p0, Lcom/rey/material/widget/SnackBar;->mMaxHeight:I

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 355
    :cond_6d
    iget v7, p0, Lcom/rey/material/widget/SnackBar;->mMinHeight:I

    if-lez v7, :cond_77

    .line 356
    iget v7, p0, Lcom/rey/material/widget/SnackBar;->mMinHeight:I

    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 358
    :cond_77
    invoke-virtual {p0, v4, v0}, Lcom/rey/material/widget/SnackBar;->setMeasuredDimension(II)V

    .line 359
    return-void

    .line 323
    .end local v0    # "height":I
    .end local v4    # "width":I
    :cond_7b
    iget-object v7, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v7}, Lcom/rey/material/widget/TextView;->getPaddingRight()I

    move-result v3

    goto :goto_2c

    .line 328
    :cond_82
    iget-object v7, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-static {v6, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    invoke-virtual {v7, v8, p2}, Lcom/rey/material/widget/TextView;->measure(II)V

    .line 329
    iget-object v7, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v7}, Lcom/rey/material/widget/TextView;->getMeasuredWidth()I

    move-result v4

    .restart local v4    # "width":I
    goto :goto_4d

    .line 336
    .restart local v0    # "height":I
    :sswitch_92
    invoke-static {v6, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 337
    goto :goto_60

    .line 339
    :sswitch_97
    move v4, v6

    goto :goto_60

    .line 345
    :sswitch_99
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 346
    goto :goto_63

    .line 348
    :sswitch_9e
    move v0, v2

    goto :goto_63

    .line 334
    :sswitch_data_a0
    .sparse-switch
        -0x80000000 -> :sswitch_92
        0x40000000 -> :sswitch_97
    .end sparse-switch

    .line 343
    :sswitch_data_aa
    .sparse-switch
        -0x80000000 -> :sswitch_99
        0x40000000 -> :sswitch_9e
    .end sparse-switch
.end method

.method public onRtlPropertiesChanged(I)V
    .registers 7
    .param p1, "layoutDirection"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    const/4 v2, 0x4

    const/4 v3, 0x3

    const/4 v0, 0x1

    .line 299
    if-ne p1, v0, :cond_28

    .line 300
    .local v0, "rtl":Z
    :goto_5
    iget-boolean v1, p0, Lcom/rey/material/widget/SnackBar;->mIsRtl:Z

    if-eq v1, v0, :cond_27

    .line 301
    iput-boolean v0, p0, Lcom/rey/material/widget/SnackBar;->mIsRtl:Z

    .line 303
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-lt v1, v4, :cond_24

    .line 304
    iget-object v4, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    iget-boolean v1, p0, Lcom/rey/material/widget/SnackBar;->mIsRtl:Z

    if-eqz v1, :cond_2a

    move v1, v2

    :goto_18
    invoke-virtual {v4, v1}, Lcom/rey/material/widget/TextView;->setTextDirection(I)V

    .line 305
    iget-object v1, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    iget-boolean v4, p0, Lcom/rey/material/widget/SnackBar;->mIsRtl:Z

    if-eqz v4, :cond_2c

    :goto_21
    invoke-virtual {v1, v2}, Lcom/rey/material/widget/Button;->setTextDirection(I)V

    .line 308
    :cond_24
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->requestLayout()V

    .line 310
    :cond_27
    return-void

    .line 299
    .end local v0    # "rtl":Z
    :cond_28
    const/4 v0, 0x0

    goto :goto_5

    .restart local v0    # "rtl":Z
    :cond_2a
    move v1, v3

    .line 304
    goto :goto_18

    :cond_2c
    move v2, v3

    .line 305
    goto :goto_21
.end method

.method public padding(II)Lcom/rey/material/widget/SnackBar;
    .registers 4
    .param p1, "horizontalPadding"    # I
    .param p2, "verticalPadding"    # I

    .prologue
    .line 620
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, p1, p2, p1, p2}, Lcom/rey/material/widget/TextView;->setPadding(IIII)V

    .line 621
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v0, p1, p2, p1, p2}, Lcom/rey/material/widget/Button;->setPadding(IIII)V

    .line 622
    return-object p0
.end method

.method public removeOnDismiss(Z)Lcom/rey/material/widget/SnackBar;
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 751
    iput-boolean p1, p0, Lcom/rey/material/widget/SnackBar;->mRemoveOnDismiss:Z

    .line 752
    return-object p0
.end method

.method public show()V
    .registers 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 787
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 788
    .local v1, "parent":Landroid/view/ViewGroup;
    if-eqz v1, :cond_13

    iget v2, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_13

    iget v2, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    const/4 v3, 0x3

    if-ne v2, v3, :cond_14

    .line 850
    :cond_13
    :goto_13
    return-void

    .line 791
    :cond_14
    instance-of v2, v1, Landroid/widget/FrameLayout;

    if-eqz v2, :cond_64

    .line 792
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 794
    .local v0, "params":Landroid/widget/FrameLayout$LayoutParams;
    iget v2, p0, Lcom/rey/material/widget/SnackBar;->mWidth:I

    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 795
    iget v2, p0, Lcom/rey/material/widget/SnackBar;->mHeight:I

    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 796
    const v2, 0x800053

    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 797
    iget-boolean v2, p0, Lcom/rey/material/widget/SnackBar;->mIsRtl:Z

    if-eqz v2, :cond_5f

    .line 798
    iget v2, p0, Lcom/rey/material/widget/SnackBar;->mMarginStart:I

    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 801
    :goto_33
    iget v2, p0, Lcom/rey/material/widget/SnackBar;->mMarginBottom:I

    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 803
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/SnackBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 821
    .end local v0    # "params":Landroid/widget/FrameLayout$LayoutParams;
    :cond_3a
    :goto_3a
    iget-object v2, p0, Lcom/rey/material/widget/SnackBar;->mInAnimation:Landroid/view/animation/Animation;

    if-eqz v2, :cond_9e

    iget v2, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    if-eq v2, v4, :cond_9e

    .line 822
    iget-object v2, p0, Lcom/rey/material/widget/SnackBar;->mInAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v2}, Landroid/view/animation/Animation;->cancel()V

    .line 823
    iget-object v2, p0, Lcom/rey/material/widget/SnackBar;->mInAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v2}, Landroid/view/animation/Animation;->reset()V

    .line 824
    iget-object v2, p0, Lcom/rey/material/widget/SnackBar;->mInAnimation:Landroid/view/animation/Animation;

    new-instance v3, Lcom/rey/material/widget/SnackBar$3;

    invoke-direct {v3, p0}, Lcom/rey/material/widget/SnackBar$3;-><init>(Lcom/rey/material/widget/SnackBar;)V

    invoke-virtual {v2, v3}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 842
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->clearAnimation()V

    .line 843
    iget-object v2, p0, Lcom/rey/material/widget/SnackBar;->mInAnimation:Landroid/view/animation/Animation;

    invoke-virtual {p0, v2}, Lcom/rey/material/widget/SnackBar;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_13

    .line 800
    .restart local v0    # "params":Landroid/widget/FrameLayout$LayoutParams;
    :cond_5f
    iget v2, p0, Lcom/rey/material/widget/SnackBar;->mMarginStart:I

    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    goto :goto_33

    .line 805
    .end local v0    # "params":Landroid/widget/FrameLayout$LayoutParams;
    :cond_64
    instance-of v2, v1, Landroid/widget/RelativeLayout;

    if-eqz v2, :cond_3a

    .line 806
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 808
    .local v0, "params":Landroid/widget/RelativeLayout$LayoutParams;
    iget v2, p0, Lcom/rey/material/widget/SnackBar;->mWidth:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 809
    iget v2, p0, Lcom/rey/material/widget/SnackBar;->mHeight:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 810
    const/16 v2, 0xc

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 811
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v2, v3, :cond_96

    const/16 v2, 0x14

    :goto_83
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 812
    iget-boolean v2, p0, Lcom/rey/material/widget/SnackBar;->mIsRtl:Z

    if-eqz v2, :cond_99

    .line 813
    iget v2, p0, Lcom/rey/material/widget/SnackBar;->mMarginStart:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    .line 816
    :goto_8e
    iget v2, p0, Lcom/rey/material/widget/SnackBar;->mMarginBottom:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    .line 818
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/SnackBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_3a

    .line 811
    :cond_96
    const/16 v2, 0x9

    goto :goto_83

    .line 815
    :cond_99
    iget v2, p0, Lcom/rey/material/widget/SnackBar;->mMarginStart:I

    iput v2, v0, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    goto :goto_8e

    .line 846
    .end local v0    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_9e
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/rey/material/widget/SnackBar;->setVisibility(I)V

    .line 847
    invoke-direct {p0, v4}, Lcom/rey/material/widget/SnackBar;->setState(I)V

    .line 848
    invoke-direct {p0}, Lcom/rey/material/widget/SnackBar;->startTimer()V

    goto/16 :goto_13
.end method

.method public show(Landroid/app/Activity;)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 760
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/SnackBar;->show(Landroid/view/ViewGroup;)V

    .line 761
    return-void
.end method

.method public show(Landroid/view/ViewGroup;)V
    .registers 4
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 768
    iget v0, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_a

    iget v0, p0, Lcom/rey/material/widget/SnackBar;->mState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_b

    .line 779
    :cond_a
    :goto_a
    return-void

    .line 771
    :cond_b
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eq v0, p1, :cond_23

    .line 772
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_20

    .line 773
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 775
    :cond_20
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 778
    :cond_23
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->show()V

    goto :goto_a
.end method

.method public singleLine(Z)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "b"    # Z

    .prologue
    .line 448
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TextView;->setSingleLine(Z)V

    .line 449
    return-object p0
.end method

.method public stateChangeListener(Lcom/rey/material/widget/SnackBar$OnStateChangeListener;)Lcom/rey/material/widget/SnackBar;
    .registers 2
    .param p1, "listener"    # Lcom/rey/material/widget/SnackBar$OnStateChangeListener;

    .prologue
    .line 721
    iput-object p1, p0, Lcom/rey/material/widget/SnackBar;->mStateChangeListener:Lcom/rey/material/widget/SnackBar$OnStateChangeListener;

    .line 722
    return-object p0
.end method

.method public text(I)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 398
    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/SnackBar;->text(Ljava/lang/CharSequence;)Lcom/rey/material/widget/SnackBar;

    move-result-object v0

    return-object v0
.end method

.method public text(Ljava/lang/CharSequence;)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 388
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 389
    return-object p0
.end method

.method public textAppearance(I)Lcom/rey/material/widget/SnackBar;
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 427
    if-eqz p1, :cond_b

    .line 428
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {p0}, Lcom/rey/material/widget/SnackBar;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/rey/material/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 429
    :cond_b
    return-object p0
.end method

.method public textColor(I)Lcom/rey/material/widget/SnackBar;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 407
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/TextView;->setTextColor(I)V

    .line 408
    return-object p0
.end method

.method public textSize(F)Lcom/rey/material/widget/SnackBar;
    .registers 4
    .param p1, "size"    # F

    .prologue
    .line 417
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Lcom/rey/material/widget/TextView;->setTextSize(IF)V

    .line 418
    return-object p0
.end method

.method public verticalPadding(I)Lcom/rey/material/widget/SnackBar;
    .registers 5
    .param p1, "padding"    # I

    .prologue
    .line 608
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    iget-object v1, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v1}, Lcom/rey/material/widget/TextView;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/widget/SnackBar;->mText:Lcom/rey/material/widget/TextView;

    invoke-virtual {v2}, Lcom/rey/material/widget/TextView;->getPaddingRight()I

    move-result v2

    invoke-virtual {v0, v1, p1, v2, p1}, Lcom/rey/material/widget/TextView;->setPadding(IIII)V

    .line 609
    iget-object v0, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    iget-object v1, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v1}, Lcom/rey/material/widget/Button;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/widget/SnackBar;->mAction:Lcom/rey/material/widget/Button;

    invoke-virtual {v2}, Lcom/rey/material/widget/Button;->getPaddingRight()I

    move-result v2

    invoke-virtual {v0, v1, p1, v2, p1}, Lcom/rey/material/widget/Button;->setPadding(IIII)V

    .line 610
    return-object p0
.end method

.method public width(I)Lcom/rey/material/widget/SnackBar;
    .registers 2
    .param p1, "width"    # I

    .prologue
    .line 631
    iput p1, p0, Lcom/rey/material/widget/SnackBar;->mWidth:I

    .line 632
    return-object p0
.end method
