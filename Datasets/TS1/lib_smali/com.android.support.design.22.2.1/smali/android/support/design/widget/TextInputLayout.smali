.class public Landroid/support/design/widget/TextInputLayout;
.super Landroid/widget/LinearLayout;
.source "TextInputLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/TextInputLayout$TextInputAccessibilityDelegate;
    }
.end annotation


# static fields
.field private static final ANIMATION_DURATION:I = 0xc8

.field private static final MSG_UPDATE_LABEL:I


# instance fields
.field private mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

.field private final mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

.field private mDefaultTextColor:I

.field private mEditText:Landroid/widget/EditText;

.field private mErrorEnabled:Z

.field private mErrorTextAppearance:I

.field private mErrorView:Landroid/widget/TextView;

.field private mFocusedTextColor:I

.field private final mHandler:Landroid/os/Handler;

.field private mHint:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 91
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/TextInputLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 92
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v7, -0x1

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 95
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 97
    invoke-virtual {p0, v6}, Landroid/support/design/widget/TextInputLayout;->setOrientation(I)V

    .line 98
    invoke-virtual {p0, v5}, Landroid/support/design/widget/TextInputLayout;->setWillNotDraw(Z)V

    .line 100
    new-instance v3, Landroid/support/design/widget/CollapsingTextHelper;

    invoke-direct {v3, p0}, Landroid/support/design/widget/CollapsingTextHelper;-><init>(Landroid/view/View;)V

    iput-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    .line 101
    new-instance v3, Landroid/os/Handler;

    new-instance v4, Landroid/support/design/widget/TextInputLayout$1;

    invoke-direct {v4, p0}, Landroid/support/design/widget/TextInputLayout$1;-><init>(Landroid/support/design/widget/TextInputLayout;)V

    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mHandler:Landroid/os/Handler;

    .line 113
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    sget-object v4, Landroid/support/design/widget/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v3, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setTextSizeInterpolator(Landroid/view/animation/Interpolator;)V

    .line 114
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    new-instance v4, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {v3, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setPositionInterpolator(Landroid/view/animation/Interpolator;)V

    .line 115
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    const/16 v4, 0x30

    invoke-virtual {v3, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedTextVerticalGravity(I)V

    .line 117
    sget-object v3, Landroid/support/design/R$styleable;->TextInputLayout:[I

    sget v4, Landroid/support/design/R$style;->Widget_Design_TextInputLayout:I

    invoke-virtual {p1, p2, v3, v5, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 119
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v3, Landroid/support/design/R$styleable;->TextInputLayout_android_hint:I

    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    iput-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mHint:Ljava/lang/CharSequence;

    .line 121
    sget v3, Landroid/support/design/R$styleable;->TextInputLayout_hintTextAppearance:I

    invoke-virtual {v0, v3, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 123
    .local v2, "hintAppearance":I
    if-eq v2, v7, :cond_54

    .line 124
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v3, v2}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedTextAppearance(I)V

    .line 127
    :cond_54
    sget v3, Landroid/support/design/R$styleable;->TextInputLayout_errorTextAppearance:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    iput v3, p0, Landroid/support/design/widget/TextInputLayout;->mErrorTextAppearance:I

    .line 128
    sget v3, Landroid/support/design/R$styleable;->TextInputLayout_errorEnabled:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 130
    .local v1, "errorEnabled":Z
    const v3, 0x101009a

    invoke-direct {p0, v3}, Landroid/support/design/widget/TextInputLayout;->getThemeAttrColor(I)I

    move-result v3

    iput v3, p0, Landroid/support/design/widget/TextInputLayout;->mDefaultTextColor:I

    .line 131
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v3}, Landroid/support/design/widget/CollapsingTextHelper;->getCollapsedTextColor()I

    move-result v3

    iput v3, p0, Landroid/support/design/widget/TextInputLayout;->mFocusedTextColor:I

    .line 133
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    iget v4, p0, Landroid/support/design/widget/TextInputLayout;->mDefaultTextColor:I

    invoke-virtual {v3, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedTextColor(I)V

    .line 134
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    iget v4, p0, Landroid/support/design/widget/TextInputLayout;->mDefaultTextColor:I

    invoke-virtual {v3, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedTextColor(I)V

    .line 136
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 138
    if-eqz v1, :cond_89

    .line 139
    invoke-virtual {p0, v6}, Landroid/support/design/widget/TextInputLayout;->setErrorEnabled(Z)V

    .line 142
    :cond_89
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v3

    if-nez v3, :cond_92

    .line 145
    invoke-static {p0, v6}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 149
    :cond_92
    new-instance v3, Landroid/support/design/widget/TextInputLayout$TextInputAccessibilityDelegate;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Landroid/support/design/widget/TextInputLayout$TextInputAccessibilityDelegate;-><init>(Landroid/support/design/widget/TextInputLayout;Landroid/support/design/widget/TextInputLayout$1;)V

    invoke-static {p0, v3}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    .line 150
    return-void
.end method

.method static synthetic access$000(Landroid/support/design/widget/TextInputLayout;Z)V
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/TextInputLayout;
    .param p1, "x1"    # Z

    .prologue
    .line 70
    invoke-direct {p0, p1}, Landroid/support/design/widget/TextInputLayout;->updateLabelVisibility(Z)V

    return-void
.end method

.method static synthetic access$200(Landroid/support/design/widget/TextInputLayout;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/TextInputLayout;

    .prologue
    .line 70
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/design/widget/TextInputLayout;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/TextInputLayout;

    .prologue
    .line 70
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$400(Landroid/support/design/widget/TextInputLayout;)Landroid/support/design/widget/CollapsingTextHelper;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/TextInputLayout;

    .prologue
    .line 70
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    return-object v0
.end method

.method static synthetic access$500(Landroid/support/design/widget/TextInputLayout;)Landroid/widget/EditText;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/TextInputLayout;

    .prologue
    .line 70
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method private animateToExpansionFraction(F)V
    .registers 4
    .param p1, "target"    # F

    .prologue
    .line 379
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    if-nez v0, :cond_33

    .line 380
    invoke-static {}, Landroid/support/design/widget/ViewUtils;->createAnimator()Landroid/support/design/widget/ValueAnimatorCompat;

    move-result-object v0

    iput-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    .line 381
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    sget-object v1, Landroid/support/design/widget/AnimationUtils;->LINEAR_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 382
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    const/16 v1, 0xc8

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setDuration(I)V

    .line 383
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    new-instance v1, Landroid/support/design/widget/TextInputLayout$5;

    invoke-direct {v1, p0}, Landroid/support/design/widget/TextInputLayout$5;-><init>(Landroid/support/design/widget/TextInputLayout;)V

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setUpdateListener(Landroid/support/design/widget/ValueAnimatorCompat$AnimatorUpdateListener;)V

    .line 392
    :cond_22
    :goto_22
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    iget-object v1, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v1}, Landroid/support/design/widget/CollapsingTextHelper;->getExpansionFraction()F

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/design/widget/ValueAnimatorCompat;->setFloatValues(FF)V

    .line 393
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->start()V

    .line 394
    return-void

    .line 389
    :cond_33
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_22

    .line 390
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->cancel()V

    goto :goto_22
.end method

.method private collapseHint(Z)V
    .registers 4
    .param p1, "animate"    # Z

    .prologue
    const/high16 v1, 0x3f800000    # 1.0f

    .line 363
    if-eqz p1, :cond_8

    .line 364
    invoke-direct {p0, v1}, Landroid/support/design/widget/TextInputLayout;->animateToExpansionFraction(F)V

    .line 368
    :goto_7
    return-void

    .line 366
    :cond_8
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/CollapsingTextHelper;->setExpansionFraction(F)V

    goto :goto_7
.end method

.method private expandHint(Z)V
    .registers 4
    .param p1, "animate"    # Z

    .prologue
    const/4 v1, 0x0

    .line 371
    if-eqz p1, :cond_7

    .line 372
    invoke-direct {p0, v1}, Landroid/support/design/widget/TextInputLayout;->animateToExpansionFraction(F)V

    .line 376
    :goto_6
    return-void

    .line 374
    :cond_7
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/CollapsingTextHelper;->setExpansionFraction(F)V

    goto :goto_6
.end method

.method private getThemeAttrColor(I)I
    .registers 5
    .param p1, "attr"    # I

    .prologue
    .line 397
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 398
    .local v0, "tv":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/support/design/widget/TextInputLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 399
    iget v1, v0, Landroid/util/TypedValue;->data:I

    .line 401
    :goto_16
    return v1

    :cond_17
    const v1, -0xff01

    goto :goto_16
.end method

.method private setEditText(Landroid/widget/EditText;Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/LinearLayout$LayoutParams;
    .registers 10
    .param p1, "editText"    # Landroid/widget/EditText;
    .param p2, "lp"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    const/4 v6, 0x0

    .line 165
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    if-eqz v2, :cond_d

    .line 166
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "We already have an EditText, can only have one"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 168
    :cond_d
    iput-object p1, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    .line 171
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getTextSize()F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedTextSize(F)V

    .line 174
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    new-instance v3, Landroid/support/design/widget/TextInputLayout$2;

    invoke-direct {v3, p0}, Landroid/support/design/widget/TextInputLayout$2;-><init>(Landroid/support/design/widget/TextInputLayout;)V

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 190
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getHintTextColors()Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/TextInputLayout;->mDefaultTextColor:I

    .line 194
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    new-instance v3, Landroid/support/design/widget/TextInputLayout$3;

    invoke-direct {v3, p0}, Landroid/support/design/widget/TextInputLayout$3;-><init>(Landroid/support/design/widget/TextInputLayout;)V

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 202
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mHint:Ljava/lang/CharSequence;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_51

    .line 203
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/support/design/widget/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    .line 205
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 208
    :cond_51
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    if-eqz v2, :cond_6c

    .line 210
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getPaddingStart(Landroid/view/View;)I

    move-result v3

    iget-object v4, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-static {v4}, Landroid/support/v4/view/ViewCompat;->getPaddingEnd(Landroid/view/View;)I

    move-result v4

    iget-object v5, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getPaddingBottom()I

    move-result v5

    invoke-static {v2, v3, v6, v4, v5}, Landroid/support/v4/view/ViewCompat;->setPaddingRelative(Landroid/view/View;IIII)V

    .line 215
    :cond_6c
    invoke-direct {p0, v6}, Landroid/support/design/widget/TextInputLayout;->updateLabelVisibility(Z)V

    .line 219
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 220
    .local v0, "newLp":Landroid/widget/LinearLayout$LayoutParams;
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 221
    .local v1, "paint":Landroid/graphics/Paint;
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v2}, Landroid/support/design/widget/CollapsingTextHelper;->getExpandedTextSize()F

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 222
    invoke-virtual {v1}, Landroid/graphics/Paint;->ascent()F

    move-result v2

    neg-float v2, v2

    float-to-int v2, v2

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 224
    return-object v0
.end method

.method private updateLabelVisibility(Z)V
    .registers 6
    .param p1, "animate"    # Z

    .prologue
    .line 228
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2b

    const/4 v0, 0x1

    .line 229
    .local v0, "hasText":Z
    :goto_d
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->isFocused()Z

    move-result v1

    .line 231
    .local v1, "isFocused":Z
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    iget v3, p0, Landroid/support/design/widget/TextInputLayout;->mDefaultTextColor:I

    invoke-virtual {v2, v3}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedTextColor(I)V

    .line 232
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    if-eqz v1, :cond_2d

    iget v2, p0, Landroid/support/design/widget/TextInputLayout;->mFocusedTextColor:I

    :goto_20
    invoke-virtual {v3, v2}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedTextColor(I)V

    .line 235
    if-nez v0, :cond_27

    if-eqz v1, :cond_30

    .line 237
    :cond_27
    invoke-direct {p0, p1}, Landroid/support/design/widget/TextInputLayout;->collapseHint(Z)V

    .line 242
    :goto_2a
    return-void

    .line 228
    .end local v0    # "hasText":Z
    .end local v1    # "isFocused":Z
    :cond_2b
    const/4 v0, 0x0

    goto :goto_d

    .line 232
    .restart local v0    # "hasText":Z
    .restart local v1    # "isFocused":Z
    :cond_2d
    iget v2, p0, Landroid/support/design/widget/TextInputLayout;->mDefaultTextColor:I

    goto :goto_20

    .line 240
    :cond_30
    invoke-direct {p0, p1}, Landroid/support/design/widget/TextInputLayout;->expandHint(Z)V

    goto :goto_2a
.end method


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 5
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 154
    instance-of v0, p1, Landroid/widget/EditText;

    if-eqz v0, :cond_10

    move-object v0, p1

    .line 155
    check-cast v0, Landroid/widget/EditText;

    invoke-direct {p0, v0, p3}, Landroid/support/design/widget/TextInputLayout;->setEditText(Landroid/widget/EditText;Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p3

    .line 156
    const/4 v0, 0x0

    invoke-super {p0, p1, v0, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 161
    :goto_f
    return-void

    .line 159
    :cond_10
    invoke-super {p0, p1, p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_f
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 337
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->draw(Landroid/graphics/Canvas;)V

    .line 338
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/CollapsingTextHelper;->draw(Landroid/graphics/Canvas;)V

    .line 339
    return-void
.end method

.method public getEditText()Landroid/widget/EditText;
    .registers 2

    .prologue
    .line 248
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method protected onLayout(ZIIII)V
    .registers 12
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 343
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 345
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    if-eqz v2, :cond_57

    .line 346
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getLeft()I

    move-result v2

    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getCompoundPaddingLeft()I

    move-result v3

    add-int v0, v2, v3

    .line 347
    .local v0, "l":I
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getRight()I

    move-result v2

    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getCompoundPaddingRight()I

    move-result v3

    sub-int v1, v2, v3

    .line 349
    .local v1, "r":I
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getTop()I

    move-result v3

    iget-object v4, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getCompoundPaddingTop()I

    move-result v4

    add-int/2addr v3, v4

    iget-object v4, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getBottom()I

    move-result v4

    iget-object v5, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getCompoundPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v2, v0, v3, v1, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedBounds(IIII)V

    .line 355
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {p0}, Landroid/support/design/widget/TextInputLayout;->getPaddingTop()I

    move-result v3

    sub-int v4, p5, p3

    invoke-virtual {p0}, Landroid/support/design/widget/TextInputLayout;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v2, v0, v3, v1, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedBounds(IIII)V

    .line 358
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v2}, Landroid/support/design/widget/CollapsingTextHelper;->recalculate()V

    .line 360
    .end local v0    # "l":I
    .end local v1    # "r":I
    :cond_57
    return-void
.end method

.method public setError(Ljava/lang/CharSequence;)V
    .registers 7
    .param p1, "error"    # Ljava/lang/CharSequence;

    .prologue
    const-wide/16 v3, 0xc8

    const/4 v2, 0x0

    .line 297
    iget-boolean v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorEnabled:Z

    if-nez v0, :cond_12

    .line 298
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 333
    :goto_d
    return-void

    .line 303
    :cond_e
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TextInputLayout;->setErrorEnabled(Z)V

    .line 306
    :cond_12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4c

    .line 307
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 308
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 309
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-static {v0, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 310
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    sget-object v1, Landroid/support/design/widget/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 332
    :cond_46
    :goto_46
    const/16 v0, 0x800

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TextInputLayout;->sendAccessibilityEvent(I)V

    goto :goto_d

    .line 317
    :cond_4c
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_46

    .line 318
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    sget-object v1, Landroid/support/design/widget/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Landroid/support/design/widget/TextInputLayout$4;

    invoke-direct {v1, p0}, Landroid/support/design/widget/TextInputLayout$4;-><init>(Landroid/support/design/widget/TextInputLayout;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_46
.end method

.method public setErrorEnabled(Z)V
    .registers 7
    .param p1, "enabled"    # Z

    .prologue
    .line 267
    iget-boolean v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorEnabled:Z

    if-eq v0, p1, :cond_45

    .line 268
    if-eqz p1, :cond_46

    .line 269
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/support/design/widget/TextInputLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    .line 270
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/support/design/widget/TextInputLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Landroid/support/design/widget/TextInputLayout;->mErrorTextAppearance:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 271
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 272
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TextInputLayout;->addView(Landroid/view/View;)V

    .line 274
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    if-eqz v0, :cond_43

    .line 276
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    iget-object v1, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getPaddingStart(Landroid/view/View;)I

    move-result v1

    const/4 v2, 0x0

    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getPaddingEnd(Landroid/view/View;)I

    move-result v3

    iget-object v4, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getPaddingBottom()I

    move-result v4

    invoke-static {v0, v1, v2, v3, v4}, Landroid/support/v4/view/ViewCompat;->setPaddingRelative(Landroid/view/View;IIII)V

    .line 283
    :cond_43
    :goto_43
    iput-boolean p1, p0, Landroid/support/design/widget/TextInputLayout;->mErrorEnabled:Z

    .line 285
    :cond_45
    return-void

    .line 280
    :cond_46
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TextInputLayout;->removeView(Landroid/view/View;)V

    .line 281
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    goto :goto_43
.end method

.method public setHint(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "hint"    # Ljava/lang/CharSequence;

    .prologue
    .line 255
    iput-object p1, p0, Landroid/support/design/widget/TextInputLayout;->mHint:Ljava/lang/CharSequence;

    .line 256
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/CollapsingTextHelper;->setText(Ljava/lang/CharSequence;)V

    .line 258
    const/16 v0, 0x800

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TextInputLayout;->sendAccessibilityEvent(I)V

    .line 259
    return-void
.end method
