.class public Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;
.super Landroid/widget/MultiAutoCompleteTextView;
.source "AppCompatMultiAutoCompleteTextView.java"

# interfaces
.implements Landroid/support/v4/view/TintableBackgroundView;


# static fields
.field private static final TINT_ATTRS:[I


# instance fields
.field private mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

.field private mTintManager:Landroid/support/v7/internal/widget/TintManager;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->TINT_ATTRS:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x10100d4
        0x1010176
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 55
    sget v0, Landroid/support/v7/appcompat/R$attr;->autoCompleteTextViewStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 59
    invoke-static {p1}, Landroid/support/v7/internal/widget/TintContextWrapper;->wrap(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, v2, p2, p3}, Landroid/widget/MultiAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 61
    sget-boolean v2, Landroid/support/v7/internal/widget/TintManager;->SHOULD_BE_USED:Z

    if-eqz v2, :cond_45

    .line 62
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->TINT_ATTRS:[I

    invoke-static {v2, p2, v3, p3, v4}, Landroid/support/v7/internal/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/internal/widget/TintTypedArray;

    move-result-object v0

    .line 64
    .local v0, "a":Landroid/support/v7/internal/widget/TintTypedArray;
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getTintManager()Landroid/support/v7/internal/widget/TintManager;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    .line 66
    invoke-virtual {v0, v4}, Landroid/support/v7/internal/widget/TintTypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_35

    .line 67
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->getTintManager()Landroid/support/v7/internal/widget/TintManager;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v0, v4, v3}, Landroid/support/v7/internal/widget/TintTypedArray;->getResourceId(II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/support/v7/internal/widget/TintManager;->getTintList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    .line 68
    .local v1, "tint":Landroid/content/res/ColorStateList;
    if-eqz v1, :cond_35

    .line 69
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V

    .line 72
    .end local v1    # "tint":Landroid/content/res/ColorStateList;
    :cond_35
    invoke-virtual {v0, v5}, Landroid/support/v7/internal/widget/TintTypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_42

    .line 73
    invoke-virtual {v0, v5}, Landroid/support/v7/internal/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 75
    :cond_42
    invoke-virtual {v0}, Landroid/support/v7/internal/widget/TintTypedArray;->recycle()V

    .line 77
    .end local v0    # "a":Landroid/support/v7/internal/widget/TintTypedArray;
    :cond_45
    return-void
.end method

.method private applySupportBackgroundTint()V
    .registers 2

    .prologue
    .line 154
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_f

    .line 155
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    invoke-static {p0, v0}, Landroid/support/v7/internal/widget/TintManager;->tintViewBackground(Landroid/view/View;Landroid/support/v7/internal/widget/TintInfo;)V

    .line 157
    :cond_f
    return-void
.end method


# virtual methods
.method protected drawableStateChanged()V
    .registers 1

    .prologue
    .line 149
    invoke-super {p0}, Landroid/widget/MultiAutoCompleteTextView;->drawableStateChanged()V

    .line 150
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->applySupportBackgroundTint()V

    .line 151
    return-void
.end method

.method public getSupportBackgroundTintList()Landroid/content/res/ColorStateList;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iget-object v0, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public getSupportBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 144
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iget-object v0, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public setDropDownBackgroundResource(I)V
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 81
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    if-eqz v0, :cond_e

    .line 82
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mTintManager:Landroid/support/v7/internal/widget/TintManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 86
    :goto_d
    return-void

    .line 84
    :cond_e
    invoke-super {p0, p1}, Landroid/widget/MultiAutoCompleteTextView;->setDropDownBackgroundResource(I)V

    goto :goto_d
.end method

.method public setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .registers 4
    .param p1, "tint"    # Landroid/content/res/ColorStateList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 97
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-nez v0, :cond_b

    .line 98
    new-instance v0, Landroid/support/v7/internal/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/internal/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    .line 100
    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iput-object p1, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    .line 101
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v7/internal/widget/TintInfo;->mHasTintList:Z

    .line 103
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->applySupportBackgroundTint()V

    .line 104
    return-void
.end method

.method public setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 4
    .param p1, "tintMode"    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 126
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    if-nez v0, :cond_b

    .line 127
    new-instance v0, Landroid/support/v7/internal/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/internal/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    .line 129
    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    iput-object p1, v0, Landroid/support/v7/internal/widget/TintInfo;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    .line 130
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->mBackgroundTint:Landroid/support/v7/internal/widget/TintInfo;

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v7/internal/widget/TintInfo;->mHasTintMode:Z

    .line 132
    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatMultiAutoCompleteTextView;->applySupportBackgroundTint()V

    .line 133
    return-void
.end method
