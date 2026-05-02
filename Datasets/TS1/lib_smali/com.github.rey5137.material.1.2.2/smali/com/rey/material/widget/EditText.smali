.class public Lcom/rey/material/widget/EditText;
.super Lcom/rey/material/widget/FrameLayout;
.source "EditText.java"

# interfaces
.implements Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;,
        Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;,
        Lcom/rey/material/widget/EditText$InternalEditText;,
        Lcom/rey/material/widget/EditText$LabelView;,
        Lcom/rey/material/widget/EditText$InputTextWatcher;
    }
.end annotation


# static fields
.field public static final AUTOCOMPLETE_MODE_MULTI:I = 0x2

.field public static final AUTOCOMPLETE_MODE_NONE:I = 0x0

.field public static final AUTOCOMPLETE_MODE_SINGLE:I = 0x1

.field public static final SUPPORT_MODE_CHAR_COUNTER:I = 0x3

.field public static final SUPPORT_MODE_HELPER:I = 0x1

.field public static final SUPPORT_MODE_HELPER_WITH_ERROR:I = 0x2

.field public static final SUPPORT_MODE_NONE:I


# instance fields
.field protected mAutoCompleteMode:I

.field private mDivider:Lcom/rey/material/drawable/DividerDrawable;

.field private mDividerColors:Landroid/content/res/ColorStateList;

.field private mDividerCompoundPadding:Z

.field private mDividerErrorColors:Landroid/content/res/ColorStateList;

.field private mDividerPadding:I

.field protected mInputView:Landroid/widget/EditText;

.field private mIsRtl:Z

.field private mLabelEnable:Z

.field private mLabelInAnimId:I

.field private mLabelOutAnimId:I

.field protected mLabelView:Lcom/rey/material/widget/EditText$LabelView;

.field private mLabelVisible:Z

.field private mOnSelectionChangedListener:Lcom/rey/material/widget/TextView$OnSelectionChangedListener;

.field private mSupportColors:Landroid/content/res/ColorStateList;

.field private mSupportError:Ljava/lang/CharSequence;

.field private mSupportErrorColors:Landroid/content/res/ColorStateList;

.field private mSupportHelper:Ljava/lang/CharSequence;

.field private mSupportMaxChars:I

.field protected mSupportMode:I

.field protected mSupportView:Lcom/rey/material/widget/EditText$LabelView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 116
    invoke-direct {p0, p1}, Lcom/rey/material/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 117
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 120
    invoke-direct {p0, p1, p2}, Lcom/rey/material/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 121
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 124
    invoke-direct {p0, p1, p2, p3}, Lcom/rey/material/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 125
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 128
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 129
    return-void
.end method

.method static synthetic access$100(Lcom/rey/material/widget/EditText;ZZ)V
    .registers 3
    .param p0, "x0"    # Lcom/rey/material/widget/EditText;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Z

    .prologue
    .line 64
    invoke-direct {p0, p1, p2}, Lcom/rey/material/widget/EditText;->setLabelVisible(ZZ)V

    return-void
.end method

.method static synthetic access$200(Lcom/rey/material/widget/EditText;I)V
    .registers 2
    .param p0, "x0"    # Lcom/rey/material/widget/EditText;
    .param p1, "x1"    # I

    .prologue
    .line 64
    invoke-direct {p0, p1}, Lcom/rey/material/widget/EditText;->updateCharCounter(I)V

    return-void
.end method

.method private getLabelView()Lcom/rey/material/widget/EditText$LabelView;
    .registers 3

    .prologue
    .line 150
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    if-nez v0, :cond_2d

    .line 151
    new-instance v0, Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/rey/material/widget/EditText$LabelView;-><init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    .line 152
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_1f

    .line 153
    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    iget-boolean v0, p0, Lcom/rey/material/widget/EditText;->mIsRtl:Z

    if-eqz v0, :cond_30

    const/4 v0, 0x4

    :goto_1c
    invoke-virtual {v1, v0}, Lcom/rey/material/widget/EditText$LabelView;->setTextDirection(I)V

    .line 154
    :cond_1f
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    const v1, 0x800003

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/EditText$LabelView;->setGravity(I)V

    .line 155
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/EditText$LabelView;->setSingleLine(Z)V

    .line 158
    :cond_2d
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    return-object v0

    .line 153
    :cond_30
    const/4 v0, 0x3

    goto :goto_1c
.end method

.method private getSupportView()Lcom/rey/material/widget/EditText$LabelView;
    .registers 3

    .prologue
    .line 162
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    if-nez v0, :cond_f

    .line 163
    new-instance v0, Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/rey/material/widget/EditText$LabelView;-><init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    .line 165
    :cond_f
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    return-object v0
.end method

.method private hasPasswordTransformationMethod()Z
    .registers 2

    .prologue
    .line 3633
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object v0

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object v0

    instance-of v0, v0, Landroid/text/method/PasswordTransformationMethod;

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private needCreateInputView(I)Z
    .registers 5
    .param p1, "autoCompleteMode"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 169
    iget-object v2, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    if-nez v2, :cond_7

    .line 180
    :cond_6
    :goto_6
    return v0

    .line 172
    :cond_7
    packed-switch p1, :pswitch_data_24

    move v0, v1

    .line 180
    goto :goto_6

    .line 174
    :pswitch_c
    iget-object v2, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    instance-of v2, v2, Lcom/rey/material/widget/EditText$InternalEditText;

    if-eqz v2, :cond_6

    move v0, v1

    goto :goto_6

    .line 176
    :pswitch_14
    iget-object v2, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    instance-of v2, v2, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    if-eqz v2, :cond_6

    move v0, v1

    goto :goto_6

    .line 178
    :pswitch_1c
    iget-object v2, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    instance-of v2, v2, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    if-eqz v2, :cond_6

    move v0, v1

    goto :goto_6

    .line 172
    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_c
        :pswitch_14
        :pswitch_1c
    .end packed-switch
.end method

.method private setLabelVisible(ZZ)V
    .registers 8
    .param p1, "visible"    # Z
    .param p2, "animation"    # Z

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x0

    .line 651
    iget-boolean v3, p0, Lcom/rey/material/widget/EditText;->mLabelEnable:Z

    if-eqz v3, :cond_a

    iget-boolean v3, p0, Lcom/rey/material/widget/EditText;->mLabelVisible:Z

    if-ne v3, p1, :cond_b

    .line 707
    :cond_a
    :goto_a
    return-void

    .line 654
    :cond_b
    iput-boolean p1, p0, Lcom/rey/material/widget/EditText;->mLabelVisible:Z

    .line 656
    if-eqz p2, :cond_61

    .line 657
    iget-boolean v3, p0, Lcom/rey/material/widget/EditText;->mLabelVisible:Z

    if-eqz v3, :cond_3a

    .line 658
    iget v2, p0, Lcom/rey/material/widget/EditText;->mLabelInAnimId:I

    if-eqz v2, :cond_34

    .line 659
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/EditText;->mLabelInAnimId:I

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 660
    .local v0, "anim":Landroid/view/animation/Animation;
    new-instance v1, Lcom/rey/material/widget/EditText$1;

    invoke-direct {v1, p0}, Lcom/rey/material/widget/EditText$1;-><init>(Lcom/rey/material/widget/EditText;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 673
    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v1}, Lcom/rey/material/widget/EditText$LabelView;->clearAnimation()V

    .line 674
    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v1, v0}, Lcom/rey/material/widget/EditText$LabelView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_a

    .line 677
    .end local v0    # "anim":Landroid/view/animation/Animation;
    :cond_34
    iget-object v2, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v2, v1}, Lcom/rey/material/widget/EditText$LabelView;->setVisibility(I)V

    goto :goto_a

    .line 680
    :cond_3a
    iget v1, p0, Lcom/rey/material/widget/EditText;->mLabelOutAnimId:I

    if-eqz v1, :cond_5b

    .line 681
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/EditText;->mLabelOutAnimId:I

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 682
    .restart local v0    # "anim":Landroid/view/animation/Animation;
    new-instance v1, Lcom/rey/material/widget/EditText$2;

    invoke-direct {v1, p0}, Lcom/rey/material/widget/EditText$2;-><init>(Lcom/rey/material/widget/EditText;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 698
    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v1}, Lcom/rey/material/widget/EditText$LabelView;->clearAnimation()V

    .line 699
    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v1, v0}, Lcom/rey/material/widget/EditText$LabelView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_a

    .line 702
    .end local v0    # "anim":Landroid/view/animation/Animation;
    :cond_5b
    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v1, v2}, Lcom/rey/material/widget/EditText$LabelView;->setVisibility(I)V

    goto :goto_a

    .line 706
    :cond_61
    iget-object v3, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    iget-boolean v4, p0, Lcom/rey/material/widget/EditText;->mLabelVisible:Z

    if-eqz v4, :cond_6b

    :goto_67
    invoke-virtual {v3, v1}, Lcom/rey/material/widget/EditText$LabelView;->setVisibility(I)V

    goto :goto_a

    :cond_6b
    move v1, v2

    goto :goto_67
.end method

.method private updateCharCounter(I)V
    .registers 5
    .param p1, "count"    # I

    .prologue
    .line 634
    if-nez p1, :cond_1b

    .line 635
    invoke-direct {p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mSupportColors:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/EditText$LabelView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 636
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mDividerColors:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/DividerDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 637
    invoke-direct {p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/EditText$LabelView;->setText(Ljava/lang/CharSequence;)V

    .line 648
    :goto_1a
    return-void

    .line 640
    :cond_1b
    iget v0, p0, Lcom/rey/material/widget/EditText;->mSupportMaxChars:I

    if-lez v0, :cond_5e

    .line 641
    invoke-direct {p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v1

    iget v0, p0, Lcom/rey/material/widget/EditText;->mSupportMaxChars:I

    if-le p1, v0, :cond_58

    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mSupportErrorColors:Landroid/content/res/ColorStateList;

    :goto_29
    invoke-virtual {v1, v0}, Lcom/rey/material/widget/EditText$LabelView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 642
    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    iget v0, p0, Lcom/rey/material/widget/EditText;->mSupportMaxChars:I

    if-le p1, v0, :cond_5b

    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mDividerErrorColors:Landroid/content/res/ColorStateList;

    :goto_34
    invoke-virtual {v1, v0}, Lcom/rey/material/drawable/DividerDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 643
    invoke-direct {p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " / "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/EditText;->mSupportMaxChars:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/EditText$LabelView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1a

    .line 641
    :cond_58
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mSupportColors:Landroid/content/res/ColorStateList;

    goto :goto_29

    .line 642
    :cond_5b
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mDividerColors:Landroid/content/res/ColorStateList;

    goto :goto_34

    .line 646
    :cond_5e
    invoke-direct {p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/EditText$LabelView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1a
.end method


# virtual methods
.method public addTextChangedListener(Landroid/text/TextWatcher;)V
    .registers 3
    .param p1, "textWatcher"    # Landroid/text/TextWatcher;

    .prologue
    .line 1398
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1399
    return-void
.end method

.method public final append(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 1407
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->append(Ljava/lang/CharSequence;)V

    .line 1408
    return-void
.end method

.method public append(Ljava/lang/CharSequence;II)V
    .registers 5
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    .line 1416
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2, p3}, Landroid/widget/EditText;->append(Ljava/lang/CharSequence;II)V

    .line 1417
    return-void
.end method

.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 37
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 186
    invoke-super/range {p0 .. p4}, Lcom/rey/material/widget/FrameLayout;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 188
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    if-nez v4, :cond_de

    const/16 v30, 0x0

    .line 189
    .local v30, "text":Ljava/lang/CharSequence;
    :goto_b
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->removeAllViews()V

    .line 191
    sget-object v4, Lcom/rey/material/R$styleable;->EditText:[I

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v10

    .line 193
    .local v10, "a":Landroid/content/res/TypedArray;
    const/16 v19, -0x1

    .line 194
    .local v19, "labelPadding":I
    const/16 v21, -0x1

    .line 195
    .local v21, "labelTextSize":I
    const/16 v20, 0x0

    .line 196
    .local v20, "labelTextColor":Landroid/content/res/ColorStateList;
    const/16 v28, -0x1

    .line 197
    .local v28, "supportPadding":I
    const/16 v29, -0x1

    .line 198
    .local v29, "supportTextSize":I
    const/16 v23, 0x0

    .line 199
    .local v23, "supportColors":Landroid/content/res/ColorStateList;
    const/16 v26, 0x0

    .line 200
    .local v26, "supportErrorColors":Landroid/content/res/ColorStateList;
    const/16 v27, 0x0

    .line 201
    .local v27, "supportHelper":Ljava/lang/String;
    const/16 v25, 0x0

    .line 202
    .local v25, "supportError":Ljava/lang/String;
    const/4 v14, 0x0

    .line 203
    .local v14, "dividerColors":Landroid/content/res/ColorStateList;
    const/4 v15, 0x0

    .line 204
    .local v15, "dividerErrorColors":Landroid/content/res/ColorStateList;
    const/4 v5, -0x1

    .line 205
    .local v5, "dividerHeight":I
    const/16 v16, -0x1

    .line 206
    .local v16, "dividerPadding":I
    const/4 v9, -0x1

    .line 208
    .local v9, "dividerAnimDuration":I
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_autoCompleteMode:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    invoke-virtual {v10, v4, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    .line 209
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/rey/material/widget/EditText;->needCreateInputView(I)Z

    move-result v4

    if-eqz v4, :cond_10e

    .line 210
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    packed-switch v4, :pswitch_data_5e2

    .line 218
    new-instance v4, Lcom/rey/material/widget/EditText$InternalEditText;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/rey/material/widget/EditText$InternalEditText;-><init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;Landroid/util/AttributeSet;I)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    .line 221
    :goto_66
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    move-object/from16 v0, p2

    move/from16 v1, p3

    move/from16 v2, p4

    invoke-static {v4, v0, v1, v2}, Lcom/rey/material/util/ViewUtil;->applyFont(Landroid/widget/TextView;Landroid/util/AttributeSet;II)V

    .line 222
    if-eqz v30, :cond_7e

    .line 223
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    move-object/from16 v0, v30

    invoke-virtual {v4, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 225
    :cond_7e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    new-instance v6, Lcom/rey/material/widget/EditText$InputTextWatcher;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    invoke-direct {v6, v0, v7}, Lcom/rey/material/widget/EditText$InputTextWatcher;-><init>(Lcom/rey/material/widget/EditText;Lcom/rey/material/widget/EditText$1;)V

    invoke-virtual {v4, v6}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 227
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    if-eqz v4, :cond_ae

    .line 228
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Lcom/rey/material/drawable/DividerDrawable;->setAnimEnable(Z)V

    .line 229
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-static {v4, v6}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 230
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Lcom/rey/material/drawable/DividerDrawable;->setAnimEnable(Z)V

    .line 235
    :cond_ae
    :goto_ae
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Landroid/widget/EditText;->setVisibility(I)V

    .line 236
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Landroid/widget/EditText;->setFocusableInTouchMode(Z)V

    .line 238
    const/16 v17, 0x0

    .local v17, "i":I
    invoke-virtual {v10}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v13

    .local v13, "count":I
    :goto_c4
    move/from16 v0, v17

    if-ge v0, v13, :cond_2ec

    .line 239
    move/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v11

    .line 241
    .local v11, "attr":I
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_labelEnable:I

    if-ne v11, v4, :cond_11c

    .line 242
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/rey/material/widget/EditText;->mLabelEnable:Z

    .line 238
    :cond_db
    :goto_db
    add-int/lit8 v17, v17, 0x1

    goto :goto_c4

    .line 188
    .end local v5    # "dividerHeight":I
    .end local v9    # "dividerAnimDuration":I
    .end local v10    # "a":Landroid/content/res/TypedArray;
    .end local v11    # "attr":I
    .end local v13    # "count":I
    .end local v14    # "dividerColors":Landroid/content/res/ColorStateList;
    .end local v15    # "dividerErrorColors":Landroid/content/res/ColorStateList;
    .end local v16    # "dividerPadding":I
    .end local v17    # "i":I
    .end local v19    # "labelPadding":I
    .end local v20    # "labelTextColor":Landroid/content/res/ColorStateList;
    .end local v21    # "labelTextSize":I
    .end local v23    # "supportColors":Landroid/content/res/ColorStateList;
    .end local v25    # "supportError":Ljava/lang/String;
    .end local v26    # "supportErrorColors":Landroid/content/res/ColorStateList;
    .end local v27    # "supportHelper":Ljava/lang/String;
    .end local v28    # "supportPadding":I
    .end local v29    # "supportTextSize":I
    .end local v30    # "text":Ljava/lang/CharSequence;
    :cond_de
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v30

    goto/16 :goto_b

    .line 212
    .restart local v5    # "dividerHeight":I
    .restart local v9    # "dividerAnimDuration":I
    .restart local v10    # "a":Landroid/content/res/TypedArray;
    .restart local v14    # "dividerColors":Landroid/content/res/ColorStateList;
    .restart local v15    # "dividerErrorColors":Landroid/content/res/ColorStateList;
    .restart local v16    # "dividerPadding":I
    .restart local v19    # "labelPadding":I
    .restart local v20    # "labelTextColor":Landroid/content/res/ColorStateList;
    .restart local v21    # "labelTextSize":I
    .restart local v23    # "supportColors":Landroid/content/res/ColorStateList;
    .restart local v25    # "supportError":Ljava/lang/String;
    .restart local v26    # "supportErrorColors":Landroid/content/res/ColorStateList;
    .restart local v27    # "supportHelper":Ljava/lang/String;
    .restart local v28    # "supportPadding":I
    .restart local v29    # "supportTextSize":I
    .restart local v30    # "text":Ljava/lang/CharSequence;
    :pswitch_e8
    new-instance v4, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;-><init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;Landroid/util/AttributeSet;I)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    goto/16 :goto_66

    .line 215
    :pswitch_fb
    new-instance v4, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;-><init>(Lcom/rey/material/widget/EditText;Landroid/content/Context;Landroid/util/AttributeSet;I)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    goto/16 :goto_66

    .line 234
    :cond_10e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    move-object/from16 v0, p2

    move/from16 v1, p3

    move/from16 v2, p4

    invoke-static {v4, v0, v1, v2}, Lcom/rey/material/util/ViewUtil;->applyStyle(Landroid/view/View;Landroid/util/AttributeSet;II)V

    goto :goto_ae

    .line 243
    .restart local v11    # "attr":I
    .restart local v13    # "count":I
    .restart local v17    # "i":I
    :cond_11c
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_labelPadding:I

    if-ne v11, v4, :cond_126

    .line 244
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v19

    goto :goto_db

    .line 245
    :cond_126
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_labelTextSize:I

    if-ne v11, v4, :cond_130

    .line 246
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v21

    goto :goto_db

    .line 247
    :cond_130
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_labelTextColor:I

    if-ne v11, v4, :cond_139

    .line 248
    invoke-virtual {v10, v11}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v20

    goto :goto_db

    .line 249
    :cond_139
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_labelTextAppearance:I

    if-ne v11, v4, :cond_14c

    .line 250
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getLabelView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    const/4 v6, 0x0

    invoke-virtual {v10, v11, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    move-object/from16 v0, p1

    invoke-virtual {v4, v0, v6}, Lcom/rey/material/widget/EditText$LabelView;->setTextAppearance(Landroid/content/Context;I)V

    goto :goto_db

    .line 251
    :cond_14c
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_labelEllipsize:I

    if-ne v11, v4, :cond_18f

    .line 252
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v18

    .line 253
    .local v18, "labelEllipsize":I
    packed-switch v18, :pswitch_data_5ea

    .line 267
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getLabelView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto/16 :goto_db

    .line 255
    :pswitch_163
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getLabelView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->START:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto/16 :goto_db

    .line 258
    :pswitch_16e
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getLabelView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto/16 :goto_db

    .line 261
    :pswitch_179
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getLabelView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto/16 :goto_db

    .line 264
    :pswitch_184
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getLabelView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto/16 :goto_db

    .line 271
    .end local v18    # "labelEllipsize":I
    :cond_18f
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_labelInAnim:I

    if-ne v11, v4, :cond_19e

    .line 272
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/EditText;->mLabelInAnimId:I

    goto/16 :goto_db

    .line 273
    :cond_19e
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_labelOutAnim:I

    if-ne v11, v4, :cond_1ad

    .line 274
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/EditText;->mLabelOutAnimId:I

    goto/16 :goto_db

    .line 275
    :cond_1ad
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_supportMode:I

    if-ne v11, v4, :cond_1bc

    .line 276
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/EditText;->mSupportMode:I

    goto/16 :goto_db

    .line 277
    :cond_1bc
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_supportPadding:I

    if-ne v11, v4, :cond_1c7

    .line 278
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v28

    goto/16 :goto_db

    .line 279
    :cond_1c7
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_supportTextSize:I

    if-ne v11, v4, :cond_1d2

    .line 280
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v29

    goto/16 :goto_db

    .line 281
    :cond_1d2
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_supportTextColor:I

    if-ne v11, v4, :cond_1dc

    .line 282
    invoke-virtual {v10, v11}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v23

    goto/16 :goto_db

    .line 283
    :cond_1dc
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_supportTextErrorColor:I

    if-ne v11, v4, :cond_1e6

    .line 284
    invoke-virtual {v10, v11}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v26

    goto/16 :goto_db

    .line 285
    :cond_1e6
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_supportTextAppearance:I

    if-ne v11, v4, :cond_1fa

    .line 286
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    const/4 v6, 0x0

    invoke-virtual {v10, v11, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    move-object/from16 v0, p1

    invoke-virtual {v4, v0, v6}, Lcom/rey/material/widget/EditText$LabelView;->setTextAppearance(Landroid/content/Context;I)V

    goto/16 :goto_db

    .line 287
    :cond_1fa
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_supportEllipsize:I

    if-ne v11, v4, :cond_23d

    .line 288
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v24

    .line 289
    .local v24, "supportEllipsize":I
    packed-switch v24, :pswitch_data_5f6

    .line 303
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto/16 :goto_db

    .line 291
    :pswitch_211
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->START:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto/16 :goto_db

    .line 294
    :pswitch_21c
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto/16 :goto_db

    .line 297
    :pswitch_227
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto/16 :goto_db

    .line 300
    :pswitch_232
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    goto/16 :goto_db

    .line 307
    .end local v24    # "supportEllipsize":I
    :cond_23d
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_supportMaxLines:I

    if-ne v11, v4, :cond_24f

    .line 308
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    const/4 v6, 0x0

    invoke-virtual {v10, v11, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v6

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setMaxLines(I)V

    goto/16 :goto_db

    .line 309
    :cond_24f
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_supportLines:I

    if-ne v11, v4, :cond_261

    .line 310
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    const/4 v6, 0x0

    invoke-virtual {v10, v11, v6}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v6

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setLines(I)V

    goto/16 :goto_db

    .line 311
    :cond_261
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_supportSingleLine:I

    if-ne v11, v4, :cond_273

    .line 312
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    const/4 v6, 0x0

    invoke-virtual {v10, v11, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setSingleLine(Z)V

    goto/16 :goto_db

    .line 313
    :cond_273
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_supportMaxChars:I

    if-ne v11, v4, :cond_282

    .line 314
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    move-object/from16 v0, p0

    iput v4, v0, Lcom/rey/material/widget/EditText;->mSupportMaxChars:I

    goto/16 :goto_db

    .line 315
    :cond_282
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_helper:I

    if-ne v11, v4, :cond_28c

    .line 316
    invoke-virtual {v10, v11}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v27

    goto/16 :goto_db

    .line 317
    :cond_28c
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_error:I

    if-ne v11, v4, :cond_296

    .line 318
    invoke-virtual {v10, v11}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v25

    goto/16 :goto_db

    .line 319
    :cond_296
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_inputId:I

    if-ne v11, v4, :cond_2a8

    .line 320
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    const/4 v6, 0x0

    invoke-virtual {v10, v11, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/widget/EditText;->setId(I)V

    goto/16 :goto_db

    .line 321
    :cond_2a8
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_dividerColor:I

    if-ne v11, v4, :cond_2b2

    .line 322
    invoke-virtual {v10, v11}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v14

    goto/16 :goto_db

    .line 323
    :cond_2b2
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_dividerErrorColor:I

    if-ne v11, v4, :cond_2bc

    .line 324
    invoke-virtual {v10, v11}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v15

    goto/16 :goto_db

    .line 325
    :cond_2bc
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_dividerHeight:I

    if-ne v11, v4, :cond_2c7

    .line 326
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v5

    goto/16 :goto_db

    .line 327
    :cond_2c7
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_dividerPadding:I

    if-ne v11, v4, :cond_2d2

    .line 328
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v16

    goto/16 :goto_db

    .line 329
    :cond_2d2
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_dividerAnimDuration:I

    if-ne v11, v4, :cond_2dd

    .line 330
    const/4 v4, 0x0

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v9

    goto/16 :goto_db

    .line 331
    :cond_2dd
    sget v4, Lcom/rey/material/R$styleable;->EditText_et_dividerCompoundPadding:I

    if-ne v11, v4, :cond_db

    .line 332
    const/4 v4, 0x1

    invoke-virtual {v10, v11, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/rey/material/widget/EditText;->mDividerCompoundPadding:Z

    goto/16 :goto_db

    .line 335
    .end local v11    # "attr":I
    :cond_2ec
    invoke-virtual {v10}, Landroid/content/res/TypedArray;->recycle()V

    .line 337
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getId()I

    move-result v4

    if-nez v4, :cond_304

    .line 338
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-static {}, Lcom/rey/material/util/ViewUtil;->generateViewId()I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/widget/EditText;->setId(I)V

    .line 340
    :cond_304
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    if-nez v4, :cond_4e8

    .line 341
    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/rey/material/widget/EditText;->mDividerColors:Landroid/content/res/ColorStateList;

    .line 342
    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/rey/material/widget/EditText;->mDividerErrorColors:Landroid/content/res/ColorStateList;

    .line 344
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mDividerColors:Landroid/content/res/ColorStateList;

    if-nez v4, :cond_356

    .line 345
    const/4 v4, 0x2

    new-array v0, v4, [[I

    move-object/from16 v22, v0

    const/4 v4, 0x0

    const/4 v6, 0x1

    new-array v6, v6, [I

    const/4 v7, 0x0

    const v8, -0x101009c

    aput v8, v6, v7

    aput-object v6, v22, v4

    const/4 v4, 0x1

    const/4 v6, 0x2

    new-array v6, v6, [I

    fill-array-data v6, :array_602

    aput-object v6, v22, v4

    .line 349
    .local v22, "states":[[I
    const/4 v4, 0x2

    new-array v12, v4, [I

    const/4 v4, 0x0

    const/high16 v6, -0x1000000

    move-object/from16 v0, p1

    invoke-static {v0, v6}, Lcom/rey/material/util/ThemeUtil;->colorControlNormal(Landroid/content/Context;I)I

    move-result v6

    aput v6, v12, v4

    const/4 v4, 0x1

    const/high16 v6, -0x1000000

    move-object/from16 v0, p1

    invoke-static {v0, v6}, Lcom/rey/material/util/ThemeUtil;->colorControlActivated(Landroid/content/Context;I)I

    move-result v6

    aput v6, v12, v4

    .line 354
    .local v12, "colors":[I
    new-instance v4, Landroid/content/res/ColorStateList;

    move-object/from16 v0, v22

    invoke-direct {v4, v0, v12}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/EditText;->mDividerColors:Landroid/content/res/ColorStateList;

    .line 357
    .end local v12    # "colors":[I
    .end local v22    # "states":[[I
    :cond_356
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mDividerErrorColors:Landroid/content/res/ColorStateList;

    if-nez v4, :cond_36c

    .line 358
    const/high16 v4, -0x10000

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/rey/material/util/ThemeUtil;->colorAccent(Landroid/content/Context;I)I

    move-result v4

    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/EditText;->mDividerErrorColors:Landroid/content/res/ColorStateList;

    .line 360
    :cond_36c
    if-gez v5, :cond_36f

    .line 361
    const/4 v5, 0x0

    .line 363
    :cond_36f
    if-gez v16, :cond_373

    .line 364
    const/16 v16, 0x0

    .line 366
    :cond_373
    if-gez v9, :cond_37f

    .line 367
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const/high16 v6, 0x10e0000

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v9

    .line 369
    :cond_37f
    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lcom/rey/material/widget/EditText;->mDividerPadding:I

    .line 370
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/EditText;->mDividerPadding:I

    move/from16 v31, v0

    add-int v31, v31, v5

    move/from16 v0, v31

    invoke-virtual {v4, v6, v7, v8, v0}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 372
    new-instance v4, Lcom/rey/material/drawable/DividerDrawable;

    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/rey/material/widget/EditText;->mDividerCompoundPadding:Z

    if-eqz v6, :cond_4e2

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getTotalPaddingLeft()I

    move-result v6

    :goto_3a9
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/rey/material/widget/EditText;->mDividerCompoundPadding:Z

    if-eqz v7, :cond_4e5

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getTotalPaddingRight()I

    move-result v7

    :goto_3b7
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/rey/material/widget/EditText;->mDividerColors:Landroid/content/res/ColorStateList;

    invoke-direct/range {v4 .. v9}, Lcom/rey/material/drawable/DividerDrawable;-><init>(IIILandroid/content/res/ColorStateList;I)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    .line 373
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->isInEditMode()Z

    move-result v6

    invoke-virtual {v4, v6}, Lcom/rey/material/drawable/DividerDrawable;->setInEditMode(Z)V

    .line 374
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Lcom/rey/material/drawable/DividerDrawable;->setAnimEnable(Z)V

    .line 375
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-static {v4, v6}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 376
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Lcom/rey/material/drawable/DividerDrawable;->setAnimEnable(Z)V

    .line 403
    :cond_3e8
    :goto_3e8
    if-ltz v19, :cond_404

    .line 404
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getLabelView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v6}, Lcom/rey/material/drawable/DividerDrawable;->getPaddingLeft()I

    move-result v6

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v8}, Lcom/rey/material/drawable/DividerDrawable;->getPaddingRight()I

    move-result v8

    move/from16 v0, v19

    invoke-virtual {v4, v6, v7, v8, v0}, Lcom/rey/material/widget/EditText$LabelView;->setPadding(IIII)V

    .line 406
    :cond_404
    if-ltz v21, :cond_411

    .line 407
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getLabelView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    const/4 v6, 0x0

    move/from16 v0, v21

    int-to-float v7, v0

    invoke-virtual {v4, v6, v7}, Lcom/rey/material/widget/EditText$LabelView;->setTextSize(IF)V

    .line 409
    :cond_411
    if-eqz v20, :cond_41c

    .line 410
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getLabelView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    move-object/from16 v0, v20

    invoke-virtual {v4, v0}, Lcom/rey/material/widget/EditText$LabelView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 412
    :cond_41c
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/rey/material/widget/EditText;->mLabelEnable:Z

    if-eqz v4, :cond_463

    .line 413
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/rey/material/widget/EditText;->mLabelVisible:Z

    .line 414
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getLabelView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setText(Ljava/lang/CharSequence;)V

    .line 415
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getLabelView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    const/4 v6, 0x0

    new-instance v7, Landroid/view/ViewGroup$LayoutParams;

    const/4 v8, -0x1

    const/16 v31, -0x2

    move/from16 v0, v31

    invoke-direct {v7, v8, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v6, v7}, Lcom/rey/material/widget/EditText;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 416
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_56d

    const/4 v4, 0x1

    :goto_45d
    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v6}, Lcom/rey/material/widget/EditText;->setLabelVisible(ZZ)V

    .line 419
    :cond_463
    if-ltz v29, :cond_470

    .line 420
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    const/4 v6, 0x0

    move/from16 v0, v29

    int-to-float v7, v0

    invoke-virtual {v4, v6, v7}, Lcom/rey/material/widget/EditText$LabelView;->setTextSize(IF)V

    .line 422
    :cond_470
    if-eqz v23, :cond_570

    .line 423
    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/rey/material/widget/EditText;->mSupportColors:Landroid/content/res/ColorStateList;

    .line 427
    :cond_478
    :goto_478
    if-eqz v26, :cond_586

    .line 428
    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/rey/material/widget/EditText;->mSupportErrorColors:Landroid/content/res/ColorStateList;

    .line 432
    :cond_480
    :goto_480
    if-ltz v28, :cond_49c

    .line 433
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v6}, Lcom/rey/material/drawable/DividerDrawable;->getPaddingLeft()I

    move-result v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v7}, Lcom/rey/material/drawable/DividerDrawable;->getPaddingRight()I

    move-result v7

    const/4 v8, 0x0

    move/from16 v0, v28

    invoke-virtual {v4, v6, v0, v7, v8}, Lcom/rey/material/widget/EditText$LabelView;->setPadding(IIII)V

    .line 435
    :cond_49c
    if-nez v27, :cond_5a4

    if-nez v25, :cond_5a4

    .line 436
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v6

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getError()Ljava/lang/CharSequence;

    move-result-object v4

    if-nez v4, :cond_59e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mSupportColors:Landroid/content/res/ColorStateList;

    :goto_4ae
    invoke-virtual {v6, v4}, Lcom/rey/material/widget/EditText$LabelView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 442
    :goto_4b1
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/EditText;->mSupportMode:I

    if-eqz v4, :cond_4ce

    .line 443
    move-object/from16 v0, p0

    iget v4, v0, Lcom/rey/material/widget/EditText;->mSupportMode:I

    packed-switch v4, :pswitch_data_60a

    .line 453
    :goto_4be
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, -0x2

    invoke-direct {v6, v7, v8}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v6}, Lcom/rey/material/widget/EditText;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 456
    :cond_4ce
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    const/4 v7, -0x1

    const/4 v8, -0x2

    invoke-direct {v6, v7, v8}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v6}, Lcom/rey/material/widget/EditText;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 458
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->requestLayout()V

    .line 459
    return-void

    .line 372
    :cond_4e2
    const/4 v6, 0x0

    goto/16 :goto_3a9

    :cond_4e5
    const/4 v7, 0x0

    goto/16 :goto_3b7

    .line 379
    :cond_4e8
    if-gez v5, :cond_4ec

    if-ltz v16, :cond_53c

    .line 380
    :cond_4ec
    if-gez v5, :cond_4f6

    .line 381
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v4}, Lcom/rey/material/drawable/DividerDrawable;->getDividerHeight()I

    move-result v5

    .line 383
    :cond_4f6
    if-ltz v16, :cond_4fe

    .line 384
    move/from16 v0, v16

    move-object/from16 v1, p0

    iput v0, v1, Lcom/rey/material/widget/EditText;->mDividerPadding:I

    .line 386
    :cond_4fe
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/rey/material/widget/EditText;->mDividerPadding:I

    move/from16 v31, v0

    add-int v31, v31, v5

    move/from16 v0, v31

    invoke-virtual {v4, v6, v7, v8, v0}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 387
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v4, v5}, Lcom/rey/material/drawable/DividerDrawable;->setDividerHeight(I)V

    .line 388
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/rey/material/widget/EditText;->mDividerCompoundPadding:Z

    if-eqz v4, :cond_564

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getTotalPaddingLeft()I

    move-result v4

    :goto_52b
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/rey/material/widget/EditText;->mDividerCompoundPadding:Z

    if-eqz v6, :cond_566

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getTotalPaddingRight()I

    move-result v6

    :goto_539
    invoke-virtual {v7, v4, v6}, Lcom/rey/material/drawable/DividerDrawable;->setPadding(II)V

    .line 391
    :cond_53c
    if-eqz v14, :cond_542

    .line 392
    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/rey/material/widget/EditText;->mDividerColors:Landroid/content/res/ColorStateList;

    .line 394
    :cond_542
    if-eqz v15, :cond_548

    .line 395
    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/rey/material/widget/EditText;->mDividerErrorColors:Landroid/content/res/ColorStateList;

    .line 397
    :cond_548
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getError()Ljava/lang/CharSequence;

    move-result-object v4

    if-nez v4, :cond_568

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mDividerColors:Landroid/content/res/ColorStateList;

    :goto_556
    invoke-virtual {v6, v4}, Lcom/rey/material/drawable/DividerDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 399
    if-ltz v9, :cond_3e8

    .line 400
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v4, v9}, Lcom/rey/material/drawable/DividerDrawable;->setAnimationDuration(I)V

    goto/16 :goto_3e8

    .line 388
    :cond_564
    const/4 v4, 0x0

    goto :goto_52b

    :cond_566
    const/4 v6, 0x0

    goto :goto_539

    .line 397
    :cond_568
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mDividerErrorColors:Landroid/content/res/ColorStateList;

    goto :goto_556

    .line 416
    :cond_56d
    const/4 v4, 0x0

    goto/16 :goto_45d

    .line 424
    :cond_570
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mSupportColors:Landroid/content/res/ColorStateList;

    if-nez v4, :cond_478

    .line 425
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v6, Lcom/rey/material/R$color;->abc_secondary_text_material_light:I

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/EditText;->mSupportColors:Landroid/content/res/ColorStateList;

    goto/16 :goto_478

    .line 429
    :cond_586
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mSupportErrorColors:Landroid/content/res/ColorStateList;

    if-nez v4, :cond_480

    .line 430
    const/high16 v4, -0x10000

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/rey/material/util/ThemeUtil;->colorAccent(Landroid/content/Context;I)I

    move-result v4

    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/rey/material/widget/EditText;->mSupportErrorColors:Landroid/content/res/ColorStateList;

    goto/16 :goto_480

    .line 436
    :cond_59e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mSupportErrorColors:Landroid/content/res/ColorStateList;

    goto/16 :goto_4ae

    .line 437
    :cond_5a4
    if-eqz v27, :cond_5af

    .line 438
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/EditText;->setHelper(Ljava/lang/CharSequence;)V

    goto/16 :goto_4b1

    .line 440
    :cond_5af
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    goto/16 :goto_4b1

    .line 445
    :pswitch_5b8
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    const v6, 0x800005

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setGravity(I)V

    .line 446
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->length()I

    move-result v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/rey/material/widget/EditText;->updateCharCounter(I)V

    goto/16 :goto_4be

    .line 450
    :pswitch_5d5
    invoke-direct/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v4

    const v6, 0x800003

    invoke-virtual {v4, v6}, Lcom/rey/material/widget/EditText$LabelView;->setGravity(I)V

    goto/16 :goto_4be

    .line 210
    nop

    :pswitch_data_5e2
    .packed-switch 0x1
        :pswitch_e8
        :pswitch_fb
    .end packed-switch

    .line 253
    :pswitch_data_5ea
    .packed-switch 0x1
        :pswitch_163
        :pswitch_16e
        :pswitch_179
        :pswitch_184
    .end packed-switch

    .line 289
    :pswitch_data_5f6
    .packed-switch 0x1
        :pswitch_211
        :pswitch_21c
        :pswitch_227
        :pswitch_232
    .end packed-switch

    .line 345
    :array_602
    .array-data 4
        0x101009c
        0x101009e
    .end array-data

    .line 443
    :pswitch_data_60a
    .packed-switch 0x1
        :pswitch_5d5
        :pswitch_5d5
        :pswitch_5b8
    .end packed-switch
.end method

.method public beginBatchEdit()V
    .registers 2

    .prologue
    .line 1420
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->beginBatchEdit()V

    .line 1421
    return-void
.end method

.method public bringPointIntoView(I)Z
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 1428
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->bringPointIntoView(I)Z

    move-result v0

    return v0
.end method

.method public canCopy()Z
    .registers 2

    .prologue
    .line 3641
    invoke-direct {p0}, Lcom/rey/material/widget/EditText;->hasPasswordTransformationMethod()Z

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    if-lez v0, :cond_18

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->hasSelection()Z

    move-result v0

    if-eqz v0, :cond_18

    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method public canCut()Z
    .registers 2

    .prologue
    .line 3637
    invoke-direct {p0}, Lcom/rey/material/widget/EditText;->hasPasswordTransformationMethod()Z

    move-result v0

    if-nez v0, :cond_1e

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    if-lez v0, :cond_1e

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->hasSelection()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getKeyListener()Landroid/text/method/KeyListener;

    move-result-object v0

    if-eqz v0, :cond_1e

    const/4 v0, 0x1

    :goto_1d
    return v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method public canPaste()Z
    .registers 3

    .prologue
    .line 3645
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getKeyListener()Landroid/text/method/KeyListener;

    move-result-object v0

    if-eqz v0, :cond_26

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getSelectionStart()I

    move-result v0

    if-ltz v0, :cond_26

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getSelectionEnd()I

    move-result v0

    if-ltz v0, :cond_26

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "clipboard"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    invoke-virtual {v0}, Landroid/content/ClipboardManager;->hasPrimaryClip()Z

    move-result v0

    if-eqz v0, :cond_26

    const/4 v0, 0x1

    :goto_25
    return v0

    :cond_26
    const/4 v0, 0x0

    goto :goto_25
.end method

.method public cancelLongPress()V
    .registers 2

    .prologue
    .line 1432
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->cancelLongPress()V

    .line 1433
    return-void
.end method

.method public clearComposingText()V
    .registers 2

    .prologue
    .line 1441
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearComposingText()V

    .line 1442
    return-void
.end method

.method public clearError()V
    .registers 2

    .prologue
    .line 630
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 631
    return-void
.end method

.method public clearListSelection()V
    .registers 2

    .prologue
    .line 1188
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 1191
    :goto_4
    return-void

    .line 1190
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->clearListSelection()V

    goto :goto_4
.end method

.method public computeScroll()V
    .registers 2

    .prologue
    .line 1446
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->computeScroll()V

    .line 1447
    return-void
.end method

.method protected convertSelectionToString(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "selectedItem"    # Ljava/lang/Object;

    .prologue
    .line 720
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    packed-switch v0, :pswitch_data_1a

    .line 726
    const/4 v0, 0x0

    :goto_6
    return-object v0

    .line 722
    :pswitch_7
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superConvertSelectionToString(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_6

    .line 724
    :pswitch_10
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superConvertSelectionToString(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_6

    .line 720
    nop

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_7
        :pswitch_10
    .end packed-switch
.end method

.method protected convertToLocalHorizontalCoordinate(F)F
    .registers 4
    .param p1, "x"    # F

    .prologue
    .line 2109
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getTotalPaddingLeft()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr p1, v0

    .line 2111
    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 2112
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getTotalPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    int-to-float v0, v0

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 2113
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getScrollX()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p1, v0

    .line 2114
    return p1
.end method

.method public debug(I)V
    .registers 3
    .param p1, "depth"    # I

    .prologue
    .line 1451
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->debug(I)V

    .line 1452
    return-void
.end method

.method public didTouchFocusSelect()Z
    .registers 2

    .prologue
    .line 1461
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->didTouchFocusSelect()Z

    move-result v0

    return v0
.end method

.method public dismissDropDown()V
    .registers 2

    .prologue
    .line 1258
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 1261
    :goto_4
    return-void

    .line 1260
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    goto :goto_4
.end method

.method public endBatchEdit()V
    .registers 2

    .prologue
    .line 1465
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->endBatchEdit()V

    .line 1466
    return-void
.end method

.method public enoughToFilter()Z
    .registers 2

    .prologue
    .line 1165
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 1166
    const/4 v0, 0x0

    .line 1167
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->enoughToFilter()Z

    move-result v0

    goto :goto_5
.end method

.method public extendSelection(I)V
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 1338
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->extendSelection(I)V

    .line 1339
    return-void
.end method

.method public extractText(Landroid/view/inputmethod/ExtractedTextRequest;Landroid/view/inputmethod/ExtractedText;)Z
    .registers 4
    .param p1, "request"    # Landroid/view/inputmethod/ExtractedTextRequest;
    .param p2, "outText"    # Landroid/view/inputmethod/ExtractedText;

    .prologue
    .line 1474
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2}, Landroid/widget/EditText;->extractText(Landroid/view/inputmethod/ExtractedTextRequest;Landroid/view/inputmethod/ExtractedText;)Z

    move-result v0

    return v0
.end method

.method public findViewsWithText(Ljava/util/ArrayList;Ljava/lang/CharSequence;I)V
    .registers 6
    .param p2, "searched"    # Ljava/lang/CharSequence;
    .param p3, "flags"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/CharSequence;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 1480
    .local p1, "outViews":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/view/View;>;"
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_b

    .line 1481
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2, p3}, Landroid/widget/EditText;->findViewsWithText(Ljava/util/ArrayList;Ljava/lang/CharSequence;I)V

    .line 1482
    :cond_b
    return-void
.end method

.method public getAdapter()Landroid/widget/ListAdapter;
    .registers 2

    .prologue
    .line 1125
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 1126
    const/4 v0, 0x0

    .line 1127
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    goto :goto_5
.end method

.method public final getAutoLinkMask()I
    .registers 2

    .prologue
    .line 1492
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getAutoLinkMask()I

    move-result v0

    return v0
.end method

.method public getBaseline()I
    .registers 2

    .prologue
    .line 1497
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getBaseline()I

    move-result v0

    return v0
.end method

.method public getCompletionHint()Ljava/lang/CharSequence;
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 828
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-eqz v0, :cond_a

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_c

    .line 829
    :cond_a
    const/4 v0, 0x0

    .line 830
    :goto_b
    return-object v0

    :cond_c
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getCompletionHint()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_b
.end method

.method public getCompoundDrawablePadding()I
    .registers 2

    .prologue
    .line 1506
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundDrawablePadding()I

    move-result v0

    return v0
.end method

.method public getCompoundDrawables()[Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 1518
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 1523
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_d

    .line 1524
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 1526
    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_c
.end method

.method public getCompoundPaddingBottom()I
    .registers 2

    .prologue
    .line 1534
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundPaddingBottom()I

    move-result v0

    return v0
.end method

.method public getCompoundPaddingEnd()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 1543
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_d

    .line 1544
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundPaddingEnd()I

    move-result v0

    .line 1546
    :goto_c
    return v0

    :cond_d
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundPaddingRight()I

    move-result v0

    goto :goto_c
.end method

.method public getCompoundPaddingLeft()I
    .registers 2

    .prologue
    .line 1554
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundPaddingLeft()I

    move-result v0

    return v0
.end method

.method public getCompoundPaddingRight()I
    .registers 2

    .prologue
    .line 1562
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundPaddingRight()I

    move-result v0

    return v0
.end method

.method public getCompoundPaddingStart()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 1571
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_d

    .line 1572
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundPaddingStart()I

    move-result v0

    .line 1574
    :goto_c
    return v0

    :cond_d
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundPaddingLeft()I

    move-result v0

    goto :goto_c
.end method

.method public getCompoundPaddingTop()I
    .registers 2

    .prologue
    .line 1582
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCompoundPaddingTop()I

    move-result v0

    return v0
.end method

.method public final getCurrentHintTextColor()I
    .registers 2

    .prologue
    .line 1591
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCurrentHintTextColor()I

    move-result v0

    return v0
.end method

.method public final getCurrentTextColor()I
    .registers 2

    .prologue
    .line 1600
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCurrentTextColor()I

    move-result v0

    return v0
.end method

.method public getCustomSelectionActionModeCallback()Landroid/view/ActionMode$Callback;
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 1610
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_d

    .line 1611
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getCustomSelectionActionModeCallback()Landroid/view/ActionMode$Callback;

    move-result-object v0

    .line 1613
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getDropDownAnchor()I
    .registers 2

    .prologue
    .line 908
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 909
    const/4 v0, 0x0

    .line 910
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getDropDownAnchor()I

    move-result v0

    goto :goto_5
.end method

.method public getDropDownBackground()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 938
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 939
    const/4 v0, 0x0

    .line 940
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getDropDownBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_5
.end method

.method public getDropDownHeight()I
    .registers 2

    .prologue
    .line 877
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 878
    const/4 v0, 0x0

    .line 879
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getDropDownHeight()I

    move-result v0

    goto :goto_5
.end method

.method public getDropDownHorizontalOffset()I
    .registers 2

    .prologue
    .line 1022
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 1023
    const/4 v0, 0x0

    .line 1024
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getDropDownHorizontalOffset()I

    move-result v0

    goto :goto_5
.end method

.method public getDropDownVerticalOffset()I
    .registers 2

    .prologue
    .line 994
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 995
    const/4 v0, 0x0

    .line 996
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getDropDownVerticalOffset()I

    move-result v0

    goto :goto_5
.end method

.method public getDropDownWidth()I
    .registers 2

    .prologue
    .line 844
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 845
    const/4 v0, 0x0

    .line 846
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getDropDownWidth()I

    move-result v0

    goto :goto_5
.end method

.method public getEditableText()Landroid/text/Editable;
    .registers 2

    .prologue
    .line 1623
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getEditableText()Landroid/text/Editable;

    move-result-object v0

    return-object v0
.end method

.method public getEllipsize()Landroid/text/TextUtils$TruncateAt;
    .registers 2

    .prologue
    .line 1631
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getEllipsize()Landroid/text/TextUtils$TruncateAt;

    move-result-object v0

    return-object v0
.end method

.method public getError()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 623
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mSupportError:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getExtendedPaddingBottom()I
    .registers 2

    .prologue
    .line 1640
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getExtendedPaddingBottom()I

    move-result v0

    return v0
.end method

.method public getExtendedPaddingTop()I
    .registers 2

    .prologue
    .line 1649
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getExtendedPaddingTop()I

    move-result v0

    return v0
.end method

.method protected getFilter()Landroid/widget/Filter;
    .registers 2

    .prologue
    .line 775
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    packed-switch v0, :pswitch_data_1a

    .line 781
    const/4 v0, 0x0

    :goto_6
    return-object v0

    .line 777
    :pswitch_7
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superGetFilter()Landroid/widget/Filter;

    move-result-object v0

    goto :goto_6

    .line 779
    :pswitch_10
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superGetFilter()Landroid/widget/Filter;

    move-result-object v0

    goto :goto_6

    .line 775
    nop

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_7
        :pswitch_10
    .end packed-switch
.end method

.method public getFilters()[Landroid/text/InputFilter;
    .registers 2

    .prologue
    .line 1658
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getFilters()[Landroid/text/InputFilter;

    move-result-object v0

    return-object v0
.end method

.method public getFocusedRect(Landroid/graphics/Rect;)V
    .registers 3
    .param p1, "r"    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1663
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->getFocusedRect(Landroid/graphics/Rect;)V

    .line 1664
    return-void
.end method

.method public getFontFeatureSettings()Ljava/lang/String;
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 1674
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_d

    .line 1675
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getFontFeatureSettings()Ljava/lang/String;

    move-result-object v0

    .line 1676
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getFreezesText()Z
    .registers 2

    .prologue
    .line 1688
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getFreezesText()Z

    move-result v0

    return v0
.end method

.method public getGravity()I
    .registers 2

    .prologue
    .line 1698
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getGravity()I

    move-result v0

    return v0
.end method

.method public getHelper()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 594
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mSupportHelper:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getHighlightColor()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 1710
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 1711
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getHighlightColor()I

    move-result v0

    .line 1713
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getHint()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 1723
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public final getHintTextColors()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 1737
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getHintTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getImeActionId()I
    .registers 2

    .prologue
    .line 1747
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getImeActionId()I

    move-result v0

    return v0
.end method

.method public getImeActionLabel()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 1757
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getImeActionLabel()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getImeOptions()I
    .registers 2

    .prologue
    .line 1767
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getImeOptions()I

    move-result v0

    return v0
.end method

.method public getIncludeFontPadding()Z
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 1780
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_10

    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getIncludeFontPadding()Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public getInputExtras(Z)Landroid/os/Bundle;
    .registers 3
    .param p1, "create"    # Z

    .prologue
    .line 1794
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->getInputExtras(Z)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public getInputType()I
    .registers 2

    .prologue
    .line 1804
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getInputType()I

    move-result v0

    return v0
.end method

.method public final getKeyListener()Landroid/text/method/KeyListener;
    .registers 2

    .prologue
    .line 1819
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getKeyListener()Landroid/text/method/KeyListener;

    move-result-object v0

    return-object v0
.end method

.method public final getLayout()Landroid/text/Layout;
    .registers 2

    .prologue
    .line 1827
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getLayout()Landroid/text/Layout;

    move-result-object v0

    return-object v0
.end method

.method public getLetterSpacing()F
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 1839
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_d

    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getLetterSpacing()F

    move-result v0

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method protected getLineAtCoordinate(F)I
    .registers 4
    .param p1, "y"    # F

    .prologue
    .line 2118
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getTotalPaddingTop()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr p1, v0

    .line 2120
    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 2121
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getTotalPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    int-to-float v0, v0

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    .line 2122
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getScrollY()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p1, v0

    .line 2123
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getLayout()Landroid/text/Layout;

    move-result-object v0

    float-to-int v1, p1

    invoke-virtual {v0, v1}, Landroid/text/Layout;->getLineForVertical(I)I

    move-result v0

    return v0
.end method

.method public getLineBounds(ILandroid/graphics/Rect;)I
    .registers 4
    .param p1, "line"    # I
    .param p2, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 1852
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2}, Landroid/widget/EditText;->getLineBounds(ILandroid/graphics/Rect;)I

    move-result v0

    return v0
.end method

.method public getLineCount()I
    .registers 2

    .prologue
    .line 1860
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getLineCount()I

    move-result v0

    return v0
.end method

.method public getLineHeight()I
    .registers 2

    .prologue
    .line 1870
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getLineHeight()I

    move-result v0

    return v0
.end method

.method public getLineSpacingExtra()F
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 1885
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 1886
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getLineSpacingExtra()F

    move-result v0

    .line 1887
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getLineSpacingMultiplier()F
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 1902
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 1903
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getLineSpacingMultiplier()F

    move-result v0

    .line 1904
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public final getLinkTextColors()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 1917
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getLinkTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public final getLinksClickable()Z
    .registers 2

    .prologue
    .line 1929
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getLinksClickable()Z

    move-result v0

    return v0
.end method

.method public getListSelection()I
    .registers 2

    .prologue
    .line 1217
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 1218
    const/4 v0, 0x0

    .line 1219
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getListSelection()I

    move-result v0

    goto :goto_5
.end method

.method public getMarqueeRepeatLimit()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 1945
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 1946
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getMarqueeRepeatLimit()I

    move-result v0

    .line 1948
    :goto_c
    return v0

    :cond_d
    const/4 v0, -0x1

    goto :goto_c
.end method

.method public getMaxEms()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 1962
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 1963
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getMaxEms()I

    move-result v0

    .line 1965
    :goto_c
    return v0

    :cond_d
    const/4 v0, -0x1

    goto :goto_c
.end method

.method public getMaxHeight()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 1978
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 1979
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getMaxHeight()I

    move-result v0

    .line 1981
    :goto_c
    return v0

    :cond_d
    const/4 v0, -0x1

    goto :goto_c
.end method

.method public getMaxLines()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 1994
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 1995
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getMaxLines()I

    move-result v0

    .line 1997
    :goto_c
    return v0

    :cond_d
    const/4 v0, -0x1

    goto :goto_c
.end method

.method public getMaxWidth()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 2011
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 2012
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getMaxWidth()I

    move-result v0

    .line 2014
    :goto_c
    return v0

    :cond_d
    const/4 v0, -0x1

    goto :goto_c
.end method

.method public getMinEms()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 2028
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 2029
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getMinEms()I

    move-result v0

    .line 2031
    :goto_c
    return v0

    :cond_d
    const/4 v0, -0x1

    goto :goto_c
.end method

.method public getMinHeight()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 2044
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 2045
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getMinHeight()I

    move-result v0

    .line 2047
    :goto_c
    return v0

    :cond_d
    const/4 v0, -0x1

    goto :goto_c
.end method

.method public getMinLines()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 2060
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 2061
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getMinLines()I

    move-result v0

    .line 2063
    :goto_c
    return v0

    :cond_d
    const/4 v0, -0x1

    goto :goto_c
.end method

.method public getMinWidth()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 2077
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 2078
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getMinWidth()I

    move-result v0

    .line 2080
    :goto_c
    return v0

    :cond_d
    const/4 v0, -0x1

    goto :goto_c
.end method

.method public final getMovementMethod()Landroid/text/method/MovementMethod;
    .registers 2

    .prologue
    .line 2088
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getMovementMethod()Landroid/text/method/MovementMethod;

    move-result-object v0

    return-object v0
.end method

.method protected getOffsetAtCoordinate(IF)I
    .registers 4
    .param p1, "line"    # I
    .param p2, "x"    # F

    .prologue
    .line 2127
    invoke-virtual {p0, p2}, Lcom/rey/material/widget/EditText;->convertToLocalHorizontalCoordinate(F)F

    move-result p2

    .line 2128
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getLayout()Landroid/text/Layout;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/text/Layout;->getOffsetForHorizontal(IF)I

    move-result v0

    return v0
.end method

.method public getOffsetForPosition(FF)I
    .registers 6
    .param p1, "x"    # F
    .param p2, "y"    # F
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 2102
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getLayout()Landroid/text/Layout;

    move-result-object v2

    if-nez v2, :cond_8

    const/4 v1, -0x1

    .line 2105
    :goto_7
    return v1

    .line 2103
    :cond_8
    invoke-virtual {p0, p2}, Lcom/rey/material/widget/EditText;->getLineAtCoordinate(F)I

    move-result v0

    .line 2104
    .local v0, "line":I
    invoke-virtual {p0, v0, p1}, Lcom/rey/material/widget/EditText;->getOffsetAtCoordinate(IF)I

    move-result v1

    .line 2105
    .local v1, "offset":I
    goto :goto_7
.end method

.method public getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
    .registers 2

    .prologue
    .line 1100
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 1101
    const/4 v0, 0x0

    .line 1102
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object v0

    goto :goto_5
.end method

.method public getOnItemSelectedListener()Landroid/widget/AdapterView$OnItemSelectedListener;
    .registers 2

    .prologue
    .line 1113
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 1114
    const/4 v0, 0x0

    .line 1115
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getOnItemSelectedListener()Landroid/widget/AdapterView$OnItemSelectedListener;

    move-result-object v0

    goto :goto_5
.end method

.method public getPaint()Landroid/text/TextPaint;
    .registers 2

    .prologue
    .line 2136
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    return-object v0
.end method

.method public getPaintFlags()I
    .registers 2

    .prologue
    .line 2144
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getPaintFlags()I

    move-result v0

    return v0
.end method

.method public getPrivateImeOptions()Ljava/lang/String;
    .registers 2

    .prologue
    .line 2154
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getPrivateImeOptions()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSelectionEnd()I
    .registers 2

    .prologue
    .line 2161
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v0

    return v0
.end method

.method public getSelectionStart()I
    .registers 2

    .prologue
    .line 2168
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    return v0
.end method

.method public getShadowColor()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 2180
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 2181
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getShadowColor()I

    move-result v0

    .line 2183
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getShadowDx()F
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 2195
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 2196
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getShadowDx()F

    move-result v0

    .line 2198
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getShadowDy()F
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 2210
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 2211
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getShadowDy()F

    move-result v0

    .line 2213
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getShadowRadius()F
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 2227
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_d

    .line 2228
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getShadowRadius()F

    move-result v0

    .line 2230
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public final getShowSoftInputOnFocus()Z
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 2239
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_d

    .line 2240
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getShowSoftInputOnFocus()Z

    move-result v0

    .line 2241
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x1

    goto :goto_c
.end method

.method public getText()Landroid/text/Editable;
    .registers 2

    .prologue
    .line 1342
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    return-object v0
.end method

.method public final getTextColors()Landroid/content/res/ColorStateList;
    .registers 2

    .prologue
    .line 2253
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getTextLocale()Ljava/util/Locale;
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 2262
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_d

    .line 2263
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getTextLocale()Ljava/util/Locale;

    move-result-object v0

    .line 2265
    :goto_c
    return-object v0

    :cond_d
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    goto :goto_c
.end method

.method public getTextScaleX()F
    .registers 2

    .prologue
    .line 2273
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getTextScaleX()F

    move-result v0

    return v0
.end method

.method public getTextSize()F
    .registers 2

    .prologue
    .line 2280
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getTextSize()F

    move-result v0

    return v0
.end method

.method public getThreshold()I
    .registers 2

    .prologue
    .line 1039
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 1040
    const/4 v0, 0x0

    .line 1041
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getThreshold()I

    move-result v0

    goto :goto_5
.end method

.method public getTotalPaddingBottom()I
    .registers 3

    .prologue
    .line 2289
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getPaddingBottom()I

    move-result v0

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getTotalPaddingBottom()I

    move-result v1

    add-int/2addr v1, v0

    iget v0, p0, Lcom/rey/material/widget/EditText;->mSupportMode:I

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v0}, Lcom/rey/material/widget/EditText$LabelView;->getHeight()I

    move-result v0

    :goto_15
    add-int/2addr v0, v1

    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public getTotalPaddingEnd()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 2298
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_12

    .line 2299
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getPaddingEnd()I

    move-result v0

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getTotalPaddingEnd()I

    move-result v1

    add-int/2addr v0, v1

    .line 2301
    :goto_11
    return v0

    :cond_12
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getTotalPaddingRight()I

    move-result v0

    goto :goto_11
.end method

.method public getTotalPaddingLeft()I
    .registers 3

    .prologue
    .line 2309
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getPaddingLeft()I

    move-result v0

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getTotalPaddingLeft()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getTotalPaddingRight()I
    .registers 3

    .prologue
    .line 2317
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getPaddingRight()I

    move-result v0

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getTotalPaddingRight()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getTotalPaddingStart()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 2326
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_12

    .line 2327
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getPaddingStart()I

    move-result v0

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getTotalPaddingStart()I

    move-result v1

    add-int/2addr v0, v1

    .line 2329
    :goto_11
    return v0

    :cond_12
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getTotalPaddingLeft()I

    move-result v0

    goto :goto_11
.end method

.method public getTotalPaddingTop()I
    .registers 3

    .prologue
    .line 2338
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getPaddingTop()I

    move-result v0

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getTotalPaddingTop()I

    move-result v1

    add-int/2addr v1, v0

    iget-boolean v0, p0, Lcom/rey/material/widget/EditText;->mLabelEnable:Z

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v0}, Lcom/rey/material/widget/EditText$LabelView;->getHeight()I

    move-result v0

    :goto_15
    add-int/2addr v0, v1

    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public final getTransformationMethod()Landroid/text/method/TransformationMethod;
    .registers 2

    .prologue
    .line 2350
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object v0

    return-object v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 2364
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method

.method public getUrls()[Landroid/text/style/URLSpan;
    .registers 2

    .prologue
    .line 2375
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getUrls()[Landroid/text/style/URLSpan;

    move-result-object v0

    return-object v0
.end method

.method public getValidator()Landroid/widget/AutoCompleteTextView$Validator;
    .registers 2

    .prologue
    .line 1297
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 1298
    const/4 v0, 0x0

    .line 1299
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->getValidator()Landroid/widget/AutoCompleteTextView$Validator;

    move-result-object v0

    goto :goto_5
.end method

.method public hasOverlappingRendering()Z
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 2381
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_10

    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->hasOverlappingRendering()Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public hasSelection()Z
    .registers 2

    .prologue
    .line 2388
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->hasSelection()Z

    move-result v0

    return v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 135
    iput-boolean v1, p0, Lcom/rey/material/widget/EditText;->mLabelEnable:Z

    .line 136
    iput-boolean v1, p0, Lcom/rey/material/widget/EditText;->mLabelVisible:Z

    .line 137
    iput v1, p0, Lcom/rey/material/widget/EditText;->mSupportMode:I

    .line 138
    iput v1, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    .line 139
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/rey/material/widget/EditText;->mDividerCompoundPadding:Z

    .line 140
    const/4 v0, -0x1

    iput v0, p0, Lcom/rey/material/widget/EditText;->mDividerPadding:I

    .line 141
    iput-boolean v1, p0, Lcom/rey/material/widget/EditText;->mIsRtl:Z

    .line 143
    invoke-super {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/FrameLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 145
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 146
    sget v0, Lcom/rey/material/R$style;->Material_Widget_EditText:I

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/EditText;->applyStyle(I)V

    .line 147
    :cond_1f
    return-void
.end method

.method public isCursorVisible()Z
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 2400
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_e

    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->isCursorVisible()Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public isInputMethodTarget()Z
    .registers 2

    .prologue
    .line 2408
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->isInputMethodTarget()Z

    move-result v0

    return v0
.end method

.method public isPerformingCompletion()Z
    .registers 2

    .prologue
    .line 1240
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 1241
    const/4 v0, 0x0

    .line 1242
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->isPerformingCompletion()Z

    move-result v0

    goto :goto_5
.end method

.method public isPopupShowing()Z
    .registers 2

    .prologue
    .line 1177
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_6

    .line 1178
    const/4 v0, 0x0

    .line 1179
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->isPopupShowing()Z

    move-result v0

    goto :goto_5
.end method

.method public isSuggestionsEnabled()Z
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 2435
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_10

    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->isSuggestionsEnabled()Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public isTextSelectable()Z
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 2452
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_e

    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->isTextSelectable()Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public length()I
    .registers 2

    .prologue
    .line 2459
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    move-result v0

    return v0
.end method

.method public moveCursorToVisibleOffset()Z
    .registers 2

    .prologue
    .line 2471
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->moveCursorToVisibleOffset()Z

    move-result v0

    return v0
.end method

.method public onCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V
    .registers 4
    .param p1, "text"    # Landroid/view/inputmethod/CompletionInfo;

    .prologue
    .line 2485
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_c

    .line 2486
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalEditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalEditText;->superOnCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V

    .line 2491
    :goto_b
    return-void

    .line 2487
    :cond_c
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_19

    .line 2488
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superOnCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V

    goto :goto_b

    .line 2490
    :cond_19
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superOnCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V

    goto :goto_b
.end method

.method public onCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V
    .registers 4
    .param p1, "info"    # Landroid/view/inputmethod/CorrectionInfo;

    .prologue
    .line 2502
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_c

    .line 2503
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalEditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalEditText;->superOnCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V

    .line 2508
    :goto_b
    return-void

    .line 2504
    :cond_c
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_19

    .line 2505
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superOnCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V

    goto :goto_b

    .line 2507
    :cond_19
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superOnCommitCorrection(Landroid/view/inputmethod/CorrectionInfo;)V

    goto :goto_b
.end method

.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .registers 4
    .param p1, "outAttrs"    # Landroid/view/inputmethod/EditorInfo;

    .prologue
    .line 2512
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_d

    .line 2513
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalEditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalEditText;->superOnCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    .line 2517
    :goto_c
    return-object v0

    .line 2514
    :cond_d
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1b

    .line 2515
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superOnCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    goto :goto_c

    .line 2517
    :cond_1b
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superOnCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;

    move-result-object v0

    goto :goto_c
.end method

.method public onEditorAction(I)V
    .registers 4
    .param p1, "actionCode"    # I

    .prologue
    .line 2541
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_c

    .line 2542
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalEditText;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalEditText;->superOnEditorAction(I)V

    .line 2547
    :goto_b
    return-void

    .line 2543
    :cond_c
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_19

    .line 2544
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superOnEditorAction(I)V

    goto :goto_b

    .line 2546
    :cond_19
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superOnEditorAction(I)V

    goto :goto_b
.end method

.method public onFilterComplete(I)V
    .registers 4
    .param p1, "count"    # I

    .prologue
    .line 1247
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_d

    .line 1248
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superOnFilterComplete(I)V

    .line 1251
    :cond_c
    :goto_c
    return-void

    .line 1249
    :cond_d
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_c

    .line 1250
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superOnFilterComplete(I)V

    goto :goto_c
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 2551
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_d

    .line 2552
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalEditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalEditText;->superOnKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 2556
    :goto_c
    return v0

    .line 2553
    :cond_d
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1b

    .line 2554
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superOnKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_c

    .line 2556
    :cond_1b
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superOnKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_c
.end method

.method public onKeyMultiple(IILandroid/view/KeyEvent;)Z
    .registers 6
    .param p1, "keyCode"    # I
    .param p2, "repeatCount"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 2561
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_d

    .line 2562
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalEditText;

    invoke-virtual {v0, p1, p2, p3}, Lcom/rey/material/widget/EditText$InternalEditText;->superOnKeyMultiple(IILandroid/view/KeyEvent;)Z

    move-result v0

    .line 2566
    :goto_c
    return v0

    .line 2563
    :cond_d
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1b

    .line 2564
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0, p1, p2, p3}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superOnKeyMultiple(IILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_c

    .line 2566
    :cond_1b
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1, p2, p3}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superOnKeyMultiple(IILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_c
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 2571
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_d

    .line 2572
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalEditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalEditText;->superOnKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 2576
    :goto_c
    return v0

    .line 2573
    :cond_d
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1b

    .line 2574
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superOnKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_c

    .line 2576
    :cond_1b
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superOnKeyPreIme(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_c
.end method

.method public onKeyShortcut(ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 2581
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_d

    .line 2582
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalEditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalEditText;->superOnKeyShortcut(ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 2586
    :goto_c
    return v0

    .line 2583
    :cond_d
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1b

    .line 2584
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superOnKeyShortcut(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_c

    .line 2586
    :cond_1b
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superOnKeyShortcut(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_c
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 2591
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_d

    .line 2592
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalEditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalEditText;->superOnKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 2596
    :goto_c
    return v0

    .line 2593
    :cond_d
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1b

    .line 2594
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superOnKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_c

    .line 2596
    :cond_1b
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superOnKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_c
.end method

.method protected onLayout(ZIIII)V
    .registers 12
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 563
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getPaddingLeft()I

    move-result v1

    .line 564
    .local v1, "childLeft":I
    sub-int v4, p4, p2

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getPaddingRight()I

    move-result v5

    sub-int v2, v4, v5

    .line 565
    .local v2, "childRight":I
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getPaddingTop()I

    move-result v3

    .line 566
    .local v3, "childTop":I
    sub-int v4, p5, p3

    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->getPaddingBottom()I

    move-result v5

    sub-int v0, v4, v5

    .line 568
    .local v0, "childBottom":I
    iget-object v4, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    if-eqz v4, :cond_2f

    .line 569
    iget-object v4, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    iget-object v5, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v5}, Lcom/rey/material/widget/EditText$LabelView;->getMeasuredHeight()I

    move-result v5

    add-int/2addr v5, v3

    invoke-virtual {v4, v1, v3, v2, v5}, Lcom/rey/material/widget/EditText$LabelView;->layout(IIII)V

    .line 570
    iget-object v4, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v4}, Lcom/rey/material/widget/EditText$LabelView;->getMeasuredHeight()I

    move-result v4

    add-int/2addr v3, v4

    .line 573
    :cond_2f
    iget-object v4, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    if-eqz v4, :cond_47

    .line 574
    iget-object v4, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    iget-object v5, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v5}, Lcom/rey/material/widget/EditText$LabelView;->getMeasuredHeight()I

    move-result v5

    sub-int v5, v0, v5

    invoke-virtual {v4, v1, v5, v2, v0}, Lcom/rey/material/widget/EditText$LabelView;->layout(IIII)V

    .line 575
    iget-object v4, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v4}, Lcom/rey/material/widget/EditText$LabelView;->getMeasuredHeight()I

    move-result v4

    sub-int/2addr v0, v4

    .line 578
    :cond_47
    iget-object v4, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v4, v1, v3, v2, v0}, Landroid/widget/EditText;->layout(IIII)V

    .line 579
    return-void
.end method

.method protected onMeasure(II)V
    .registers 23
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 482
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v16

    .line 483
    .local v16, "widthMode":I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v17

    .line 484
    .local v17, "widthSize":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    .line 485
    .local v3, "heightMode":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    .line 487
    .local v4, "heightSize":I
    if-nez v16, :cond_15a

    move/from16 v14, p1

    .line 488
    .local v14, "tempWidthSpec":I
    :goto_14
    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-static/range {v18 .. v19}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    .line 490
    .local v13, "tempHeightSpec":I
    const/4 v8, 0x0

    .line 491
    .local v8, "labelWidth":I
    const/4 v7, 0x0

    .line 492
    .local v7, "labelHeight":I
    const/4 v6, 0x0

    .line 493
    .local v6, "inputWidth":I
    const/4 v5, 0x0

    .line 494
    .local v5, "inputHeight":I
    const/4 v12, 0x0

    .line 495
    .local v12, "supportWidth":I
    const/4 v11, 0x0

    .line 496
    .local v11, "supportHeight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    if-eqz v18, :cond_170

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/EditText$LabelView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v18

    if-eqz v18, :cond_170

    const/4 v9, 0x1

    .line 497
    .local v9, "measureLabelView":Z
    :goto_37
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    if-eqz v18, :cond_173

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/EditText$LabelView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v18

    if-eqz v18, :cond_173

    const/4 v10, 0x1

    .line 499
    .local v10, "measureSupportView":Z
    :goto_4c
    if-eqz v9, :cond_6d

    .line 500
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v14, v13}, Lcom/rey/material/widget/EditText$LabelView;->measure(II)V

    .line 501
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/EditText$LabelView;->getMeasuredWidth()I

    move-result v8

    .line 502
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/EditText$LabelView;->getMeasuredHeight()I

    move-result v7

    .line 505
    :cond_6d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v14, v13}, Landroid/widget/EditText;->measure(II)V

    .line 506
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/widget/EditText;->getMeasuredWidth()I

    move-result v6

    .line 507
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/widget/EditText;->getMeasuredHeight()I

    move-result v5

    .line 509
    if-eqz v10, :cond_ad

    .line 510
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v14, v13}, Lcom/rey/material/widget/EditText$LabelView;->measure(II)V

    .line 511
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/EditText$LabelView;->getMeasuredWidth()I

    move-result v12

    .line 512
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/EditText$LabelView;->getMeasuredHeight()I

    move-result v11

    .line 515
    :cond_ad
    const/4 v15, 0x0

    .line 516
    .local v15, "width":I
    const/4 v2, 0x0

    .line 518
    .local v2, "height":I
    sparse-switch v16, :sswitch_data_1dc

    .line 530
    :goto_b2
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getPaddingLeft()I

    move-result v18

    sub-int v18, v15, v18

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getPaddingRight()I

    move-result v19

    sub-int v6, v18, v19

    .line 531
    const/high16 v18, 0x40000000    # 2.0f

    move/from16 v0, v18

    invoke-static {v6, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v14

    .line 532
    if-eqz v9, :cond_eb

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/EditText$LabelView;->getWidth()I

    move-result v18

    move/from16 v0, v18

    if-eq v0, v6, :cond_eb

    .line 533
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v14, v13}, Lcom/rey/material/widget/EditText$LabelView;->measure(II)V

    .line 534
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/EditText$LabelView;->getMeasuredHeight()I

    move-result v7

    .line 537
    :cond_eb
    if-eqz v10, :cond_110

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/EditText$LabelView;->getWidth()I

    move-result v18

    move/from16 v0, v18

    if-eq v0, v6, :cond_110

    .line 538
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v14, v13}, Lcom/rey/material/widget/EditText$LabelView;->measure(II)V

    .line 539
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/rey/material/widget/EditText$LabelView;->getMeasuredHeight()I

    move-result v11

    .line 542
    :cond_110
    sparse-switch v3, :sswitch_data_1ea

    .line 554
    :goto_113
    move-object/from16 v0, p0

    invoke-virtual {v0, v15, v2}, Lcom/rey/material/widget/EditText;->setMeasuredDimension(II)V

    .line 556
    sub-int v18, v2, v7

    sub-int v18, v18, v11

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getPaddingTop()I

    move-result v19

    sub-int v18, v18, v19

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getPaddingBottom()I

    move-result v19

    sub-int v5, v18, v19

    .line 557
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/widget/EditText;->getMeasuredWidth()I

    move-result v18

    move/from16 v0, v18

    if-ne v0, v6, :cond_144

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/widget/EditText;->getMeasuredHeight()I

    move-result v18

    move/from16 v0, v18

    if-eq v0, v5, :cond_159

    .line 558
    :cond_144
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    move-object/from16 v18, v0

    const/high16 v19, 0x40000000    # 2.0f

    move/from16 v0, v19

    invoke-static {v5, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v19

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v0, v14, v1}, Landroid/widget/EditText;->measure(II)V

    .line 559
    :cond_159
    return-void

    .line 487
    .end local v2    # "height":I
    .end local v5    # "inputHeight":I
    .end local v6    # "inputWidth":I
    .end local v7    # "labelHeight":I
    .end local v8    # "labelWidth":I
    .end local v9    # "measureLabelView":Z
    .end local v10    # "measureSupportView":Z
    .end local v11    # "supportHeight":I
    .end local v12    # "supportWidth":I
    .end local v13    # "tempHeightSpec":I
    .end local v14    # "tempWidthSpec":I
    .end local v15    # "width":I
    :cond_15a
    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getPaddingLeft()I

    move-result v18

    sub-int v18, v17, v18

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getPaddingRight()I

    move-result v19

    sub-int v18, v18, v19

    move/from16 v0, v18

    move/from16 v1, v16

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v14

    goto/16 :goto_14

    .line 496
    .restart local v5    # "inputHeight":I
    .restart local v6    # "inputWidth":I
    .restart local v7    # "labelHeight":I
    .restart local v8    # "labelWidth":I
    .restart local v11    # "supportHeight":I
    .restart local v12    # "supportWidth":I
    .restart local v13    # "tempHeightSpec":I
    .restart local v14    # "tempWidthSpec":I
    :cond_170
    const/4 v9, 0x0

    goto/16 :goto_37

    .line 497
    .restart local v9    # "measureLabelView":Z
    :cond_173
    const/4 v10, 0x0

    goto/16 :goto_4c

    .line 520
    .restart local v2    # "height":I
    .restart local v10    # "measureSupportView":Z
    .restart local v15    # "width":I
    :sswitch_176
    invoke-static {v6, v12}, Ljava/lang/Math;->max(II)I

    move-result v18

    move/from16 v0, v18

    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    move-result v18

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getPaddingLeft()I

    move-result v19

    add-int v18, v18, v19

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getPaddingRight()I

    move-result v19

    add-int v15, v18, v19

    .line 521
    goto/16 :goto_b2

    .line 523
    :sswitch_18e
    invoke-static {v6, v12}, Ljava/lang/Math;->max(II)I

    move-result v18

    move/from16 v0, v18

    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    move-result v18

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getPaddingLeft()I

    move-result v19

    add-int v18, v18, v19

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getPaddingRight()I

    move-result v19

    add-int v18, v18, v19

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->min(II)I

    move-result v15

    .line 524
    goto/16 :goto_b2

    .line 526
    :sswitch_1aa
    move/from16 v15, v17

    goto/16 :goto_b2

    .line 544
    :sswitch_1ae
    add-int v18, v7, v5

    add-int v18, v18, v11

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getPaddingTop()I

    move-result v19

    add-int v18, v18, v19

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getPaddingBottom()I

    move-result v19

    add-int v2, v18, v19

    .line 545
    goto/16 :goto_113

    .line 547
    :sswitch_1c0
    add-int v18, v7, v5

    add-int v18, v18, v11

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getPaddingTop()I

    move-result v19

    add-int v18, v18, v19

    invoke-virtual/range {p0 .. p0}, Lcom/rey/material/widget/EditText;->getPaddingBottom()I

    move-result v19

    add-int v18, v18, v19

    move/from16 v0, v18

    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 548
    goto/16 :goto_113

    .line 550
    :sswitch_1d8
    move v2, v4

    goto/16 :goto_113

    .line 518
    nop

    :sswitch_data_1dc
    .sparse-switch
        -0x80000000 -> :sswitch_18e
        0x0 -> :sswitch_176
        0x40000000 -> :sswitch_1aa
    .end sparse-switch

    .line 542
    :sswitch_data_1ea
    .sparse-switch
        -0x80000000 -> :sswitch_1c0
        0x0 -> :sswitch_1ae
        0x40000000 -> :sswitch_1d8
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

    .line 464
    if-ne p1, v0, :cond_30

    .line 465
    .local v0, "rtl":Z
    :goto_5
    iget-boolean v1, p0, Lcom/rey/material/widget/EditText;->mIsRtl:Z

    if-eq v1, v0, :cond_2f

    .line 466
    iput-boolean v0, p0, Lcom/rey/material/widget/EditText;->mIsRtl:Z

    .line 468
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-lt v1, v4, :cond_2c

    .line 469
    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    if-eqz v1, :cond_1f

    .line 470
    iget-object v4, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    iget-boolean v1, p0, Lcom/rey/material/widget/EditText;->mIsRtl:Z

    if-eqz v1, :cond_32

    move v1, v2

    :goto_1c
    invoke-virtual {v4, v1}, Lcom/rey/material/widget/EditText$LabelView;->setTextDirection(I)V

    .line 472
    :cond_1f
    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    if-eqz v1, :cond_2c

    .line 473
    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    iget-boolean v4, p0, Lcom/rey/material/widget/EditText;->mIsRtl:Z

    if-eqz v4, :cond_34

    :goto_29
    invoke-virtual {v1, v2}, Lcom/rey/material/widget/EditText$LabelView;->setTextDirection(I)V

    .line 476
    :cond_2c
    invoke-virtual {p0}, Lcom/rey/material/widget/EditText;->requestLayout()V

    .line 478
    :cond_2f
    return-void

    .line 464
    .end local v0    # "rtl":Z
    :cond_30
    const/4 v0, 0x0

    goto :goto_5

    .restart local v0    # "rtl":Z
    :cond_32
    move v1, v3

    .line 470
    goto :goto_1c

    :cond_34
    move v2, v3

    .line 473
    goto :goto_29
.end method

.method protected onSelectionChanged(II)V
    .registers 4
    .param p1, "selStart"    # I
    .param p2, "selEnd"    # I

    .prologue
    .line 2611
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    if-nez v0, :cond_5

    .line 2623
    :cond_4
    :goto_4
    return-void

    .line 2614
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    instance-of v0, v0, Lcom/rey/material/widget/EditText$InternalEditText;

    if-eqz v0, :cond_1c

    .line 2615
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalEditText;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalEditText;->superOnSelectionChanged(II)V

    .line 2621
    :goto_12
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mOnSelectionChangedListener:Lcom/rey/material/widget/TextView$OnSelectionChangedListener;

    if-eqz v0, :cond_4

    .line 2622
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mOnSelectionChangedListener:Lcom/rey/material/widget/TextView$OnSelectionChangedListener;

    invoke-interface {v0, p0, p1, p2}, Lcom/rey/material/widget/TextView$OnSelectionChangedListener;->onSelectionChanged(Landroid/view/View;II)V

    goto :goto_4

    .line 2616
    :cond_1c
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    instance-of v0, v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    if-eqz v0, :cond_2a

    .line 2617
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superOnSelectionChanged(II)V

    goto :goto_12

    .line 2619
    :cond_2a
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superOnSelectionChanged(II)V

    goto :goto_12
.end method

.method public performCompletion()V
    .registers 2

    .prologue
    .line 1229
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 1232
    :goto_4
    return-void

    .line 1231
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->performCompletion()V

    goto :goto_4
.end method

.method protected performFiltering(Ljava/lang/CharSequence;I)V
    .registers 4
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "keyCode"    # I

    .prologue
    .line 741
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    packed-switch v0, :pswitch_data_16

    .line 749
    :goto_5
    return-void

    .line 743
    :pswitch_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superPerformFiltering(Ljava/lang/CharSequence;I)V

    goto :goto_5

    .line 746
    :pswitch_e
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superPerformFiltering(Ljava/lang/CharSequence;I)V

    goto :goto_5

    .line 741
    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_6
        :pswitch_e
    .end packed-switch
.end method

.method protected performFiltering(Ljava/lang/CharSequence;III)V
    .registers 7
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "end"    # I
    .param p4, "keyCode"    # I

    .prologue
    .line 792
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_c

    .line 793
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superPerformFiltering(Ljava/lang/CharSequence;III)V

    .line 794
    :cond_c
    return-void
.end method

.method public performValidation()V
    .registers 2

    .prologue
    .line 1311
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 1314
    :goto_4
    return-void

    .line 1313
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->performValidation()V

    goto :goto_4
.end method

.method public removeTextChangedListener(Landroid/text/TextWatcher;)V
    .registers 3
    .param p1, "watcher"    # Landroid/text/TextWatcher;

    .prologue
    .line 2631
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 2632
    return-void
.end method

.method protected replaceText(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 759
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    packed-switch v0, :pswitch_data_16

    .line 767
    :goto_5
    return-void

    .line 761
    :pswitch_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalAutoCompleteTextView;->superReplaceText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 764
    :pswitch_e
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$InternalMultiAutoCompleteTextView;->superReplaceText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 759
    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_6
        :pswitch_e
    .end packed-switch
.end method

.method public selectAll()V
    .registers 2

    .prologue
    .line 1349
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->selectAll()V

    .line 1350
    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/widget/ListAdapter;",
            ":",
            "Landroid/widget/Filterable;",
            ">(TT;)V"
        }
    .end annotation

    .prologue
    .line 1152
    .local p1, "adapter":Landroid/widget/ListAdapter;, "TT;"
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 1155
    :goto_4
    return-void

    .line 1154
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    goto :goto_4
.end method

.method public setAllCaps(Z)V
    .registers 4
    .param p1, "allCaps"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 2648
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_b

    .line 2649
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setAllCaps(Z)V

    .line 2650
    :cond_b
    return-void
.end method

.method public final setAutoLinkMask(I)V
    .registers 3
    .param p1, "mask"    # I

    .prologue
    .line 2660
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setAutoLinkMask(I)V

    .line 2661
    return-void
.end method

.method public setCompletionHint(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "hint"    # Ljava/lang/CharSequence;

    .prologue
    .line 811
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 814
    :goto_4
    return-void

    .line 813
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setCompletionHint(Ljava/lang/CharSequence;)V

    goto :goto_4
.end method

.method public setCompoundDrawablePadding(I)V
    .registers 7
    .param p1, "pad"    # I

    .prologue
    .line 2670
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setCompoundDrawablePadding(I)V

    .line 2671
    iget-boolean v0, p0, Lcom/rey/material/widget/EditText;->mDividerCompoundPadding:Z

    if-eqz v0, :cond_5c

    .line 2672
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getTotalPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getTotalPaddingRight()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/rey/material/drawable/DividerDrawable;->setPadding(II)V

    .line 2673
    iget-boolean v0, p0, Lcom/rey/material/widget/EditText;->mLabelEnable:Z

    if-eqz v0, :cond_3b

    .line 2674
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v1}, Lcom/rey/material/drawable/DividerDrawable;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v2}, Lcom/rey/material/widget/EditText$LabelView;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/DividerDrawable;->getPaddingRight()I

    move-result v3

    iget-object v4, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v4}, Lcom/rey/material/widget/EditText$LabelView;->getPaddingBottom()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/rey/material/widget/EditText$LabelView;->setPadding(IIII)V

    .line 2675
    :cond_3b
    iget v0, p0, Lcom/rey/material/widget/EditText;->mSupportMode:I

    if-eqz v0, :cond_5c

    .line 2676
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v1}, Lcom/rey/material/drawable/DividerDrawable;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v2}, Lcom/rey/material/widget/EditText$LabelView;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/DividerDrawable;->getPaddingRight()I

    move-result v3

    iget-object v4, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v4}, Lcom/rey/material/widget/EditText$LabelView;->getPaddingBottom()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/rey/material/widget/EditText$LabelView;->setPadding(IIII)V

    .line 2678
    :cond_5c
    return-void
.end method

.method public setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 10
    .param p1, "left"    # Landroid/graphics/drawable/Drawable;
    .param p2, "top"    # Landroid/graphics/drawable/Drawable;
    .param p3, "right"    # Landroid/graphics/drawable/Drawable;
    .param p4, "bottom"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 2695
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/widget/EditText;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2696
    iget-boolean v0, p0, Lcom/rey/material/widget/EditText;->mDividerCompoundPadding:Z

    if-eqz v0, :cond_5c

    .line 2697
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getTotalPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getTotalPaddingRight()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/rey/material/drawable/DividerDrawable;->setPadding(II)V

    .line 2698
    iget-boolean v0, p0, Lcom/rey/material/widget/EditText;->mLabelEnable:Z

    if-eqz v0, :cond_3b

    .line 2699
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v1}, Lcom/rey/material/drawable/DividerDrawable;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v2}, Lcom/rey/material/widget/EditText$LabelView;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/DividerDrawable;->getPaddingRight()I

    move-result v3

    iget-object v4, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v4}, Lcom/rey/material/widget/EditText$LabelView;->getPaddingBottom()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/rey/material/widget/EditText$LabelView;->setPadding(IIII)V

    .line 2700
    :cond_3b
    iget v0, p0, Lcom/rey/material/widget/EditText;->mSupportMode:I

    if-eqz v0, :cond_5c

    .line 2701
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v1}, Lcom/rey/material/drawable/DividerDrawable;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v2}, Lcom/rey/material/widget/EditText$LabelView;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    invoke-virtual {v3}, Lcom/rey/material/drawable/DividerDrawable;->getPaddingRight()I

    move-result v3

    iget-object v4, p0, Lcom/rey/material/widget/EditText;->mSupportView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v4}, Lcom/rey/material/widget/EditText$LabelView;->getPaddingBottom()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/rey/material/widget/EditText$LabelView;->setPadding(IIII)V

    .line 2703
    :cond_5c
    return-void
.end method

.method public setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 7
    .param p1, "start"    # Landroid/graphics/drawable/Drawable;
    .param p2, "top"    # Landroid/graphics/drawable/Drawable;
    .param p3, "end"    # Landroid/graphics/drawable/Drawable;
    .param p4, "bottom"    # Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 2721
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_c

    .line 2722
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/widget/EditText;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2725
    :goto_b
    return-void

    .line 2724
    :cond_c
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/widget/EditText;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_b
.end method

.method public setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V
    .registers 7
    .param p1, "start"    # I
    .param p2, "top"    # I
    .param p3, "end"    # I
    .param p4, "bottom"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 2768
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_c

    .line 2769
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/widget/EditText;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    .line 2772
    :goto_b
    return-void

    .line 2771
    :cond_c
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/widget/EditText;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    goto :goto_b
.end method

.method public setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 7
    .param p1, "start"    # Landroid/graphics/drawable/Drawable;
    .param p2, "top"    # Landroid/graphics/drawable/Drawable;
    .param p3, "end"    # Landroid/graphics/drawable/Drawable;
    .param p4, "bottom"    # Landroid/graphics/drawable/Drawable;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 2742
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_c

    .line 2743
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/widget/EditText;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2746
    :goto_b
    return-void

    .line 2745
    :cond_c
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/widget/EditText;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_b
.end method

.method public setCompoundDrawablesWithIntrinsicBounds(IIII)V
    .registers 6
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 2811
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/widget/EditText;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 2812
    return-void
.end method

.method public setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 6
    .param p1, "left"    # Landroid/graphics/drawable/Drawable;
    .param p2, "top"    # Landroid/graphics/drawable/Drawable;
    .param p3, "right"    # Landroid/graphics/drawable/Drawable;
    .param p4, "bottom"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 2789
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/widget/EditText;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 2790
    return-void
.end method

.method public setCursorVisible(Z)V
    .registers 3
    .param p1, "visible"    # Z

    .prologue
    .line 2823
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setCursorVisible(Z)V

    .line 2824
    return-void
.end method

.method public setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V
    .registers 4
    .param p1, "actionModeCallback"    # Landroid/view/ActionMode$Callback;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 2852
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_b

    .line 2853
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    .line 2854
    :cond_b
    return-void
.end method

.method public setDropDownAnchor(I)V
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 924
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 927
    :goto_4
    return-void

    .line 926
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setDropDownAnchor(I)V

    goto :goto_4
.end method

.method public setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 952
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 955
    :goto_4
    return-void

    .line 954
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_4
.end method

.method public setDropDownBackgroundResource(I)V
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 966
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 969
    :goto_4
    return-void

    .line 968
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setDropDownBackgroundResource(I)V

    goto :goto_4
.end method

.method public setDropDownHeight(I)V
    .registers 3
    .param p1, "height"    # I

    .prologue
    .line 894
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 897
    :goto_4
    return-void

    .line 896
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setDropDownHeight(I)V

    goto :goto_4
.end method

.method public setDropDownHorizontalOffset(I)V
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 1008
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 1011
    :goto_4
    return-void

    .line 1010
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setDropDownHorizontalOffset(I)V

    goto :goto_4
.end method

.method public setDropDownVerticalOffset(I)V
    .registers 3
    .param p1, "offset"    # I

    .prologue
    .line 980
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 983
    :goto_4
    return-void

    .line 982
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setDropDownVerticalOffset(I)V

    goto :goto_4
.end method

.method public setDropDownWidth(I)V
    .registers 3
    .param p1, "width"    # I

    .prologue
    .line 860
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 863
    :goto_4
    return-void

    .line 862
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setDropDownWidth(I)V

    goto :goto_4
.end method

.method public final setEditableFactory(Landroid/text/Editable$Factory;)V
    .registers 3
    .param p1, "factory"    # Landroid/text/Editable$Factory;

    .prologue
    .line 2860
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setEditableFactory(Landroid/text/Editable$Factory;)V

    .line 2861
    return-void
.end method

.method public setElegantTextHeight(Z)V
    .registers 4
    .param p1, "elegant"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 2874
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 2875
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setElegantTextHeight(Z)V

    .line 2876
    :cond_b
    return-void
.end method

.method public setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    .registers 3
    .param p1, "ellipsis"    # Landroid/text/TextUtils$TruncateAt;

    .prologue
    .line 1367
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 1368
    return-void
.end method

.method public setEms(I)V
    .registers 3
    .param p1, "ems"    # I

    .prologue
    .line 2889
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setEms(I)V

    .line 2890
    return-void
.end method

.method public setEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 1331
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 1332
    return-void
.end method

.method public setError(Ljava/lang/CharSequence;)V
    .registers 8
    .param p1, "error"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 602
    iput-object p1, p0, Lcom/rey/material/widget/EditText;->mSupportError:Ljava/lang/CharSequence;

    .line 604
    iget v0, p0, Lcom/rey/material/widget/EditText;->mSupportMode:I

    if-eq v0, v4, :cond_d

    iget v0, p0, Lcom/rey/material/widget/EditText;->mSupportMode:I

    if-eq v0, v5, :cond_d

    .line 617
    :goto_c
    return-void

    .line 607
    :cond_d
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mSupportError:Ljava/lang/CharSequence;

    if-eqz v0, :cond_44

    .line 608
    invoke-direct {p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mSupportErrorColors:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/EditText$LabelView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 609
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mDividerErrorColors:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/DividerDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 610
    invoke-direct {p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v1

    iget v0, p0, Lcom/rey/material/widget/EditText;->mSupportMode:I

    if-ne v0, v4, :cond_2f

    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mSupportError:Ljava/lang/CharSequence;

    :goto_2b
    invoke-virtual {v1, v0}, Lcom/rey/material/widget/EditText$LabelView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_c

    :cond_2f
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/CharSequence;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/rey/material/widget/EditText;->mSupportHelper:Ljava/lang/CharSequence;

    aput-object v3, v0, v2

    const-string v2, ", "

    aput-object v2, v0, v4

    iget-object v2, p0, Lcom/rey/material/widget/EditText;->mSupportError:Ljava/lang/CharSequence;

    aput-object v2, v0, v5

    invoke-static {v0}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_2b

    .line 613
    :cond_44
    invoke-direct {p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mSupportColors:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/EditText$LabelView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 614
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mDivider:Lcom/rey/material/drawable/DividerDrawable;

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mDividerColors:Landroid/content/res/ColorStateList;

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/DividerDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 615
    invoke-direct {p0}, Lcom/rey/material/widget/EditText;->getSupportView()Lcom/rey/material/widget/EditText$LabelView;

    move-result-object v0

    iget-object v1, p0, Lcom/rey/material/widget/EditText;->mSupportHelper:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lcom/rey/material/widget/EditText$LabelView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_c
.end method

.method public setExtractedText(Landroid/view/inputmethod/ExtractedText;)V
    .registers 3
    .param p1, "text"    # Landroid/view/inputmethod/ExtractedText;

    .prologue
    .line 2897
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setExtractedText(Landroid/view/inputmethod/ExtractedText;)V

    .line 2898
    return-void
.end method

.method public setFilters([Landroid/text/InputFilter;)V
    .registers 3
    .param p1, "filters"    # [Landroid/text/InputFilter;

    .prologue
    .line 2907
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 2908
    return-void
.end method

.method public setFontFeatureSettings(Ljava/lang/String;)V
    .registers 4
    .param p1, "fontFeatureSettings"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 2923
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 2924
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setFontFeatureSettings(Ljava/lang/String;)V

    .line 2925
    :cond_b
    return-void
.end method

.method public setFreezesText(Z)V
    .registers 3
    .param p1, "freezesText"    # Z

    .prologue
    .line 2941
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setFreezesText(Z)V

    .line 2942
    return-void
.end method

.method public setGravity(I)V
    .registers 3
    .param p1, "gravity"    # I

    .prologue
    .line 2953
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setGravity(I)V

    .line 2954
    return-void
.end method

.method public setHelper(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "helper"    # Ljava/lang/CharSequence;

    .prologue
    .line 586
    iput-object p1, p0, Lcom/rey/material/widget/EditText;->mSupportHelper:Ljava/lang/CharSequence;

    .line 587
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mSupportError:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 588
    return-void
.end method

.method public setHighlightColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 2962
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHighlightColor(I)V

    .line 2963
    return-void
.end method

.method public final setHint(I)V
    .registers 3
    .param p1, "resid"    # I

    .prologue
    .line 2985
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(I)V

    .line 2986
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    if-eqz v0, :cond_e

    .line 2987
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$LabelView;->setText(I)V

    .line 2988
    :cond_e
    return-void
.end method

.method public final setHint(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "hint"    # Ljava/lang/CharSequence;

    .prologue
    .line 2973
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 2974
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    if-eqz v0, :cond_e

    .line 2975
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mLabelView:Lcom/rey/material/widget/EditText$LabelView;

    invoke-virtual {v0, p1}, Lcom/rey/material/widget/EditText$LabelView;->setText(Ljava/lang/CharSequence;)V

    .line 2976
    :cond_e
    return-void
.end method

.method public final setHintTextColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 3015
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 3016
    return-void
.end method

.method public final setHintTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p1, "colors"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 3001
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    .line 3002
    return-void
.end method

.method public setHorizontallyScrolling(Z)V
    .registers 3
    .param p1, "whether"    # Z

    .prologue
    .line 3025
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHorizontallyScrolling(Z)V

    .line 3026
    return-void
.end method

.method public setImeActionLabel(Ljava/lang/CharSequence;I)V
    .registers 4
    .param p1, "label"    # Ljava/lang/CharSequence;
    .param p2, "actionId"    # I

    .prologue
    .line 3039
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2}, Landroid/widget/EditText;->setImeActionLabel(Ljava/lang/CharSequence;I)V

    .line 3040
    return-void
.end method

.method public setImeOptions(I)V
    .registers 3
    .param p1, "imeOptions"    # I

    .prologue
    .line 3051
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 3052
    return-void
.end method

.method public setIncludeFontPadding(Z)V
    .registers 3
    .param p1, "includepad"    # Z

    .prologue
    .line 3064
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setIncludeFontPadding(Z)V

    .line 3065
    return-void
.end method

.method public setInputExtras(I)V
    .registers 3
    .param p1, "xmlResId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3079
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setInputExtras(I)V

    .line 3080
    return-void
.end method

.method public setInputType(I)V
    .registers 3
    .param p1, "type"    # I

    .prologue
    .line 3098
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setInputType(I)V

    .line 3099
    return-void
.end method

.method public setKeyListener(Landroid/text/method/KeyListener;)V
    .registers 3
    .param p1, "input"    # Landroid/text/method/KeyListener;

    .prologue
    .line 3124
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setKeyListener(Landroid/text/method/KeyListener;)V

    .line 3125
    return-void
.end method

.method public setLetterSpacing(F)V
    .registers 4
    .param p1, "letterSpacing"    # F

    .prologue
    .line 3137
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    .line 3138
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setLetterSpacing(F)V

    .line 3139
    :cond_b
    return-void
.end method

.method public setLineSpacing(FF)V
    .registers 4
    .param p1, "add"    # F
    .param p2, "mult"    # F

    .prologue
    .line 3149
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2}, Landroid/widget/EditText;->setLineSpacing(FF)V

    .line 3150
    return-void
.end method

.method public setLines(I)V
    .registers 3
    .param p1, "lines"    # I

    .prologue
    .line 3161
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setLines(I)V

    .line 3162
    return-void
.end method

.method public final setLinkTextColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 3189
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setLinkTextColor(I)V

    .line 3190
    return-void
.end method

.method public final setLinkTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p1, "colors"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 3175
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setLinkTextColor(Landroid/content/res/ColorStateList;)V

    .line 3176
    return-void
.end method

.method public final setLinksClickable(Z)V
    .registers 3
    .param p1, "whether"    # Z

    .prologue
    .line 3201
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setLinksClickable(Z)V

    .line 3202
    return-void
.end method

.method public setListSelection(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 1200
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 1203
    :goto_4
    return-void

    .line 1202
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setListSelection(I)V

    goto :goto_4
.end method

.method public setMarqueeRepeatLimit(I)V
    .registers 3
    .param p1, "marqueeLimit"    # I

    .prologue
    .line 3213
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setMarqueeRepeatLimit(I)V

    .line 3214
    return-void
.end method

.method public setMaxEms(I)V
    .registers 3
    .param p1, "maxems"    # I

    .prologue
    .line 3222
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setMaxEms(I)V

    .line 3223
    return-void
.end method

.method public setMaxHeight(I)V
    .registers 3
    .param p1, "maxHeight"    # I

    .prologue
    .line 3234
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setMaxHeight(I)V

    .line 3235
    return-void
.end method

.method public setMaxLines(I)V
    .registers 3
    .param p1, "maxlines"    # I

    .prologue
    .line 3245
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setMaxLines(I)V

    .line 3246
    return-void
.end method

.method public setMaxWidth(I)V
    .registers 3
    .param p1, "maxpixels"    # I

    .prologue
    .line 3254
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setMaxWidth(I)V

    .line 3255
    return-void
.end method

.method public setMinEms(I)V
    .registers 3
    .param p1, "minems"    # I

    .prologue
    .line 3263
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setMinEms(I)V

    .line 3264
    return-void
.end method

.method public setMinHeight(I)V
    .registers 3
    .param p1, "minHeight"    # I

    .prologue
    .line 3274
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setMinHeight(I)V

    .line 3275
    return-void
.end method

.method public setMinLines(I)V
    .registers 3
    .param p1, "minlines"    # I

    .prologue
    .line 3288
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setMinLines(I)V

    .line 3289
    return-void
.end method

.method public setMinWidth(I)V
    .registers 3
    .param p1, "minpixels"    # I

    .prologue
    .line 3297
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setMinWidth(I)V

    .line 3298
    return-void
.end method

.method public final setMovementMethod(Landroid/text/method/MovementMethod;)V
    .registers 3
    .param p1, "movement"    # Landroid/text/method/MovementMethod;

    .prologue
    .line 3312
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 3313
    return-void
.end method

.method public setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V
    .registers 3
    .param p1, "l"    # Landroid/widget/TextView$OnEditorActionListener;

    .prologue
    .line 3324
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 3325
    return-void
.end method

.method public setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V
    .registers 3
    .param p1, "l"    # Landroid/view/View$OnFocusChangeListener;

    .prologue
    .line 3345
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 3346
    return-void
.end method

.method public setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    .registers 3
    .param p1, "l"    # Landroid/widget/AdapterView$OnItemClickListener;

    .prologue
    .line 1074
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 1077
    :goto_4
    return-void

    .line 1076
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    goto :goto_4
.end method

.method public setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V
    .registers 3
    .param p1, "l"    # Landroid/widget/AdapterView$OnItemSelectedListener;

    .prologue
    .line 1087
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 1090
    :goto_4
    return-void

    .line 1089
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    goto :goto_4
.end method

.method public setOnKeyListener(Landroid/view/View$OnKeyListener;)V
    .registers 3
    .param p1, "l"    # Landroid/view/View$OnKeyListener;

    .prologue
    .line 3335
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 3336
    return-void
.end method

.method public setOnSelectionChangedListener(Lcom/rey/material/widget/TextView$OnSelectionChangedListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/rey/material/widget/TextView$OnSelectionChangedListener;

    .prologue
    .line 2600
    iput-object p1, p0, Lcom/rey/material/widget/EditText;->mOnSelectionChangedListener:Lcom/rey/material/widget/TextView$OnSelectionChangedListener;

    .line 2601
    return-void
.end method

.method public setRawInputType(I)V
    .registers 3
    .param p1, "type"    # I

    .prologue
    .line 3356
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setRawInputType(I)V

    .line 3357
    return-void
.end method

.method public setScroller(Landroid/widget/Scroller;)V
    .registers 3
    .param p1, "s"    # Landroid/widget/Scroller;

    .prologue
    .line 3360
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setScroller(Landroid/widget/Scroller;)V

    .line 3361
    return-void
.end method

.method public setSelectAllOnFocus(Z)V
    .registers 3
    .param p1, "selectAllOnFocus"    # Z

    .prologue
    .line 3370
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setSelectAllOnFocus(Z)V

    .line 3371
    return-void
.end method

.method public setSelected(Z)V
    .registers 3
    .param p1, "selected"    # Z

    .prologue
    .line 3375
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setSelected(Z)V

    .line 3376
    return-void
.end method

.method public setSelection(I)V
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 1374
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 1375
    return-void
.end method

.method public setSelection(II)V
    .registers 4
    .param p1, "start"    # I
    .param p2, "stop"    # I

    .prologue
    .line 1381
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2}, Landroid/widget/EditText;->setSelection(II)V

    .line 1382
    return-void
.end method

.method public setShadowLayer(FFFI)V
    .registers 6
    .param p1, "radius"    # F
    .param p2, "dx"    # F
    .param p3, "dy"    # F
    .param p4, "color"    # I

    .prologue
    .line 3395
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/widget/EditText;->setShadowLayer(FFFI)V

    .line 3396
    return-void
.end method

.method public final setShowSoftInputOnFocus(Z)V
    .registers 3
    .param p1, "show"    # Z

    .prologue
    .line 3403
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setShowSoftInputOnFocus(Z)V

    .line 3404
    return-void
.end method

.method public setSingleLine()V
    .registers 2

    .prologue
    .line 3413
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->setSingleLine()V

    .line 3414
    return-void
.end method

.method public final setSpannableFactory(Landroid/text/Spannable$Factory;)V
    .registers 3
    .param p1, "factory"    # Landroid/text/Spannable$Factory;

    .prologue
    .line 3420
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setSpannableFactory(Landroid/text/Spannable$Factory;)V

    .line 3421
    return-void
.end method

.method public final setText(I)V
    .registers 3
    .param p1, "resid"    # I

    .prologue
    .line 3424
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(I)V

    .line 3425
    return-void
.end method

.method public final setText(ILandroid/widget/TextView$BufferType;)V
    .registers 4
    .param p1, "resid"    # I
    .param p2, "type"    # Landroid/widget/TextView$BufferType;

    .prologue
    .line 3432
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2}, Landroid/widget/EditText;->setText(ILandroid/widget/TextView$BufferType;)V

    .line 3433
    return-void
.end method

.method public final setText(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 3436
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 3437
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "type"    # Landroid/widget/TextView$BufferType;

    .prologue
    .line 1385
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 1386
    return-void
.end method

.method public final setText([CII)V
    .registers 5
    .param p1, "text"    # [C
    .param p2, "start"    # I
    .param p3, "len"    # I

    .prologue
    .line 3428
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2, p3}, Landroid/widget/EditText;->setText([CII)V

    .line 3429
    return-void
.end method

.method public setTextAppearance(Landroid/content/Context;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resid"    # I

    .prologue
    .line 3444
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2}, Landroid/widget/EditText;->setTextAppearance(Landroid/content/Context;I)V

    .line 3445
    return-void
.end method

.method public setTextColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 3471
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTextColor(I)V

    .line 3472
    return-void
.end method

.method public setTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p1, "colors"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 3458
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 3459
    return-void
.end method

.method public setTextIsSelectable(Z)V
    .registers 4
    .param p1, "selectable"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 3500
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_b

    .line 3501
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTextIsSelectable(Z)V

    .line 3502
    :cond_b
    return-void
.end method

.method public final setTextKeepState(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 3513
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTextKeepState(Ljava/lang/CharSequence;)V

    .line 3514
    return-void
.end method

.method public final setTextKeepState(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "type"    # Landroid/widget/TextView$BufferType;

    .prologue
    .line 3523
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2}, Landroid/widget/EditText;->setTextKeepState(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 3524
    return-void
.end method

.method public setTextLocale(Ljava/util/Locale;)V
    .registers 4
    .param p1, "locale"    # Ljava/util/Locale;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 3537
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_b

    .line 3538
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTextLocale(Ljava/util/Locale;)V

    .line 3539
    :cond_b
    return-void
.end method

.method public setTextScaleX(F)V
    .registers 3
    .param p1, "size"    # F

    .prologue
    .line 3547
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTextScaleX(F)V

    .line 3548
    return-void
.end method

.method public setTextSize(F)V
    .registers 3
    .param p1, "size"    # F

    .prologue
    .line 3560
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTextSize(F)V

    .line 3561
    return-void
.end method

.method public setTextSize(IF)V
    .registers 4
    .param p1, "unit"    # I
    .param p2, "size"    # F

    .prologue
    .line 3573
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2}, Landroid/widget/EditText;->setTextSize(IF)V

    .line 3574
    return-void
.end method

.method public setThreshold(I)V
    .registers 3
    .param p1, "threshold"    # I

    .prologue
    .line 1061
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 1064
    :goto_4
    return-void

    .line 1063
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setThreshold(I)V

    goto :goto_4
.end method

.method public setTokenizer(Landroid/widget/MultiAutoCompleteTextView$Tokenizer;)V
    .registers 4
    .param p1, "t"    # Landroid/widget/MultiAutoCompleteTextView$Tokenizer;

    .prologue
    .line 1322
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_6

    .line 1325
    :goto_5
    return-void

    .line 1324
    :cond_6
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/MultiAutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/MultiAutoCompleteTextView;->setTokenizer(Landroid/widget/MultiAutoCompleteTextView$Tokenizer;)V

    goto :goto_5
.end method

.method public final setTransformationMethod(Landroid/text/method/TransformationMethod;)V
    .registers 3
    .param p1, "method"    # Landroid/text/method/TransformationMethod;

    .prologue
    .line 3584
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 3585
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .registers 3
    .param p1, "tf"    # Landroid/graphics/Typeface;

    .prologue
    .line 3614
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 3615
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;I)V
    .registers 4
    .param p1, "tf"    # Landroid/graphics/Typeface;
    .param p2, "style"    # I

    .prologue
    .line 3597
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    invoke-virtual {v0, p1, p2}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 3598
    return-void
.end method

.method public setValidator(Landroid/widget/AutoCompleteTextView$Validator;)V
    .registers 3
    .param p1, "validator"    # Landroid/widget/AutoCompleteTextView$Validator;

    .prologue
    .line 1283
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 1286
    :goto_4
    return-void

    .line 1285
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p1}, Landroid/widget/AutoCompleteTextView;->setValidator(Landroid/widget/AutoCompleteTextView$Validator;)V

    goto :goto_4
.end method

.method public showDropDown()V
    .registers 2

    .prologue
    .line 1268
    iget v0, p0, Lcom/rey/material/widget/EditText;->mAutoCompleteMode:I

    if-nez v0, :cond_5

    .line 1271
    :goto_4
    return-void

    .line 1270
    :cond_5
    iget-object v0, p0, Lcom/rey/material/widget/EditText;->mInputView:Landroid/widget/EditText;

    check-cast v0, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->showDropDown()V

    goto :goto_4
.end method
