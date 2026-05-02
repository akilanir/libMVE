.class Landroid/support/v7/widget/AppCompatTextHelper;
.super Ljava/lang/Object;
.source "AppCompatTextHelper.java"


# static fields
.field private static final TEXT_APPEARANCE_ATTRS:[I

.field private static final VIEW_ATTRS:[I


# instance fields
.field private mDrawableBottomTint:Landroid/support/v7/widget/TintInfo;

.field private mDrawableLeftTint:Landroid/support/v7/widget/TintInfo;

.field private mDrawableRightTint:Landroid/support/v7/widget/TintInfo;

.field private mDrawableTopTint:Landroid/support/v7/widget/TintInfo;

.field final mView:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 39
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_14

    sput-object v0, Landroid/support/v7/widget/AppCompatTextHelper;->VIEW_ATTRS:[I

    .line 42
    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    sget v2, Landroid/support/v7/appcompat/R$attr;->textAllCaps:I

    aput v2, v0, v1

    sput-object v0, Landroid/support/v7/widget/AppCompatTextHelper;->TEXT_APPEARANCE_ATTRS:[I

    return-void

    .line 39
    nop

    :array_14
    .array-data 4
        0x1010034
        0x101016f
        0x101016d
        0x1010170
        0x101016e
    .end array-data
.end method

.method constructor <init>(Landroid/widget/TextView;)V
    .registers 2
    .param p1, "view"    # Landroid/widget/TextView;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    .line 53
    return-void
.end method

.method static create(Landroid/widget/TextView;)Landroid/support/v7/widget/AppCompatTextHelper;
    .registers 3
    .param p0, "textView"    # Landroid/widget/TextView;

    .prologue
    .line 33
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_c

    .line 34
    new-instance v0, Landroid/support/v7/widget/AppCompatTextHelperV17;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/AppCompatTextHelperV17;-><init>(Landroid/widget/TextView;)V

    .line 36
    :goto_b
    return-object v0

    :cond_c
    new-instance v0, Landroid/support/v7/widget/AppCompatTextHelper;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/AppCompatTextHelper;-><init>(Landroid/widget/TextView;)V

    goto :goto_b
.end method

.method protected static createTintInfo(Landroid/content/Context;Landroid/support/v7/widget/AppCompatDrawableManager;I)Landroid/support/v7/widget/TintInfo;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "drawableManager"    # Landroid/support/v7/widget/AppCompatDrawableManager;
    .param p2, "drawableId"    # I

    .prologue
    .line 144
    invoke-virtual {p1, p0, p2}, Landroid/support/v7/widget/AppCompatDrawableManager;->getTintList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 145
    .local v1, "tintList":Landroid/content/res/ColorStateList;
    if-eqz v1, :cond_11

    .line 146
    new-instance v0, Landroid/support/v7/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/widget/TintInfo;-><init>()V

    .line 147
    .local v0, "tintInfo":Landroid/support/v7/widget/TintInfo;
    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/support/v7/widget/TintInfo;->mHasTintList:Z

    .line 148
    iput-object v1, v0, Landroid/support/v7/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    .line 151
    .end local v0    # "tintInfo":Landroid/support/v7/widget/TintInfo;
    :goto_10
    return-object v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method


# virtual methods
.method final applyCompoundDrawableTint(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;)V
    .registers 4
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "info"    # Landroid/support/v7/widget/TintInfo;

    .prologue
    .line 137
    if-eqz p1, :cond_d

    if-eqz p2, :cond_d

    .line 138
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getDrawableState()[I

    move-result-object v0

    invoke-static {p1, p2, v0}, Landroid/support/v7/widget/AppCompatDrawableManager;->tintDrawable(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;[I)V

    .line 140
    :cond_d
    return-void
.end method

.method applyCompoundDrawablesTints()V
    .registers 4

    .prologue
    .line 126
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableLeftTint:Landroid/support/v7/widget/TintInfo;

    if-nez v1, :cond_10

    iget-object v1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableTopTint:Landroid/support/v7/widget/TintInfo;

    if-nez v1, :cond_10

    iget-object v1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableRightTint:Landroid/support/v7/widget/TintInfo;

    if-nez v1, :cond_10

    iget-object v1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableBottomTint:Landroid/support/v7/widget/TintInfo;

    if-eqz v1, :cond_36

    .line 128
    :cond_10
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 129
    .local v0, "compoundDrawables":[Landroid/graphics/drawable/Drawable;
    const/4 v1, 0x0

    aget-object v1, v0, v1

    iget-object v2, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableLeftTint:Landroid/support/v7/widget/TintInfo;

    invoke-virtual {p0, v1, v2}, Landroid/support/v7/widget/AppCompatTextHelper;->applyCompoundDrawableTint(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;)V

    .line 130
    const/4 v1, 0x1

    aget-object v1, v0, v1

    iget-object v2, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableTopTint:Landroid/support/v7/widget/TintInfo;

    invoke-virtual {p0, v1, v2}, Landroid/support/v7/widget/AppCompatTextHelper;->applyCompoundDrawableTint(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;)V

    .line 131
    const/4 v1, 0x2

    aget-object v1, v0, v1

    iget-object v2, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableRightTint:Landroid/support/v7/widget/TintInfo;

    invoke-virtual {p0, v1, v2}, Landroid/support/v7/widget/AppCompatTextHelper;->applyCompoundDrawableTint(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;)V

    .line 132
    const/4 v1, 0x3

    aget-object v1, v0, v1

    iget-object v2, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableBottomTint:Landroid/support/v7/widget/TintInfo;

    invoke-virtual {p0, v1, v2}, Landroid/support/v7/widget/AppCompatTextHelper;->applyCompoundDrawableTint(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;)V

    .line 134
    .end local v0    # "compoundDrawables":[Landroid/graphics/drawable/Drawable;
    :cond_36
    return-void
.end method

.method loadFromAttributes(Landroid/util/AttributeSet;I)V
    .registers 15
    .param p1, "attrs"    # Landroid/util/AttributeSet;
    .param p2, "defStyleAttr"    # I

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, -0x1

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 56
    iget-object v6, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v4

    .line 57
    .local v4, "context":Landroid/content/Context;
    invoke-static {}, Landroid/support/v7/widget/AppCompatDrawableManager;->get()Landroid/support/v7/widget/AppCompatDrawableManager;

    move-result-object v5

    .line 60
    .local v5, "drawableManager":Landroid/support/v7/widget/AppCompatDrawableManager;
    sget-object v6, Landroid/support/v7/widget/AppCompatTextHelper;->VIEW_ATTRS:[I

    invoke-virtual {v4, p1, v6, p2, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 61
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v7, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 64
    .local v2, "ap":I
    invoke-virtual {v0, v8}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_29

    .line 65
    invoke-virtual {v0, v8, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    invoke-static {v4, v5, v6}, Landroid/support/v7/widget/AppCompatTextHelper;->createTintInfo(Landroid/content/Context;Landroid/support/v7/widget/AppCompatDrawableManager;I)Landroid/support/v7/widget/TintInfo;

    move-result-object v6

    iput-object v6, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableLeftTint:Landroid/support/v7/widget/TintInfo;

    .line 67
    :cond_29
    invoke-virtual {v0, v10}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_39

    .line 68
    invoke-virtual {v0, v10, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    invoke-static {v4, v5, v6}, Landroid/support/v7/widget/AppCompatTextHelper;->createTintInfo(Landroid/content/Context;Landroid/support/v7/widget/AppCompatDrawableManager;I)Landroid/support/v7/widget/TintInfo;

    move-result-object v6

    iput-object v6, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableTopTint:Landroid/support/v7/widget/TintInfo;

    .line 70
    :cond_39
    invoke-virtual {v0, v11}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_49

    .line 71
    invoke-virtual {v0, v11, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    invoke-static {v4, v5, v6}, Landroid/support/v7/widget/AppCompatTextHelper;->createTintInfo(Landroid/content/Context;Landroid/support/v7/widget/AppCompatDrawableManager;I)Landroid/support/v7/widget/TintInfo;

    move-result-object v6

    iput-object v6, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableRightTint:Landroid/support/v7/widget/TintInfo;

    .line 73
    :cond_49
    const/4 v6, 0x4

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_5b

    .line 74
    const/4 v6, 0x4

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    invoke-static {v4, v5, v6}, Landroid/support/v7/widget/AppCompatTextHelper;->createTintInfo(Landroid/content/Context;Landroid/support/v7/widget/AppCompatDrawableManager;I)Landroid/support/v7/widget/TintInfo;

    move-result-object v6

    iput-object v6, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mDrawableBottomTint:Landroid/support/v7/widget/TintInfo;

    .line 76
    :cond_5b
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 78
    iget-object v6, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object v6

    instance-of v6, v6, Landroid/text/method/PasswordTransformationMethod;

    if-nez v6, :cond_9a

    .line 83
    const/4 v1, 0x0

    .line 86
    .local v1, "allCaps":Z
    if-eq v2, v9, :cond_82

    .line 87
    sget-object v6, Landroid/support/v7/appcompat/R$styleable;->TextAppearance:[I

    invoke-virtual {v4, v2, v6}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v3

    .line 89
    .local v3, "appearance":Landroid/content/res/TypedArray;
    sget v6, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_textAllCaps:I

    invoke-virtual {v3, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_7f

    .line 90
    sget v6, Landroid/support/v7/appcompat/R$styleable;->TextAppearance_textAllCaps:I

    invoke-virtual {v3, v6, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 92
    :cond_7f
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    .line 96
    .end local v3    # "appearance":Landroid/content/res/TypedArray;
    :cond_82
    sget-object v6, Landroid/support/v7/widget/AppCompatTextHelper;->TEXT_APPEARANCE_ATTRS:[I

    invoke-virtual {v4, p1, v6, p2, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 97
    invoke-virtual {v0, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_92

    .line 98
    invoke-virtual {v0, v7, v7}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 100
    :cond_92
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 102
    if-eqz v1, :cond_9a

    .line 103
    invoke-virtual {p0, v8}, Landroid/support/v7/widget/AppCompatTextHelper;->setAllCaps(Z)V

    .line 106
    .end local v1    # "allCaps":Z
    :cond_9a
    return-void
.end method

.method onSetTextAppearance(Landroid/content/Context;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resId"    # I

    .prologue
    const/4 v2, 0x0

    .line 109
    sget-object v1, Landroid/support/v7/widget/AppCompatTextHelper;->TEXT_APPEARANCE_ATTRS:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 110
    .local v0, "appearance":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    if-eqz v1, :cond_11

    .line 114
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/AppCompatTextHelper;->setAllCaps(Z)V

    .line 116
    :cond_11
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 117
    return-void
.end method

.method setAllCaps(Z)V
    .registers 5
    .param p1, "allCaps"    # Z

    .prologue
    .line 120
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    if-eqz p1, :cond_13

    new-instance v0, Landroid/support/v7/text/AllCapsTransformationMethod;

    iget-object v2, p0, Landroid/support/v7/widget/AppCompatTextHelper;->mView:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/support/v7/text/AllCapsTransformationMethod;-><init>(Landroid/content/Context;)V

    :goto_f
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 123
    return-void

    .line 120
    :cond_13
    const/4 v0, 0x0

    goto :goto_f
.end method
