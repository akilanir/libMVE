.class public Lcom/bignerdranch/android/multiselector/SwappingHolder;
.super Lcom/bignerdranch/android/multiselector/MultiSelectorBindingHolder;
.source "SwappingHolder.java"

# interfaces
.implements Lcom/bignerdranch/android/multiselector/SelectableHolder;


# instance fields
.field private mDefaultModeBackgroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mDefaultModeStateListAnimator:Landroid/animation/StateListAnimator;

.field private mIsSelectable:Z

.field private mMultiSelector:Lcom/bignerdranch/android/multiselector/MultiSelector;

.field private mSelectionModeBackgroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mSelectionModeStateListAnimator:Landroid/animation/StateListAnimator;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 74
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/bignerdranch/android/multiselector/SwappingHolder;-><init>(Landroid/view/View;Lcom/bignerdranch/android/multiselector/MultiSelector;)V

    .line 75
    return-void
.end method

.method public constructor <init>(Landroid/view/View;Lcom/bignerdranch/android/multiselector/MultiSelector;)V
    .registers 5
    .param p1, "itemView"    # Landroid/view/View;
    .param p2, "multiSelector"    # Lcom/bignerdranch/android/multiselector/MultiSelector;

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Lcom/bignerdranch/android/multiselector/MultiSelectorBindingHolder;-><init>(Landroid/view/View;Lcom/bignerdranch/android/multiselector/MultiSelector;)V

    .line 34
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mIsSelectable:Z

    .line 54
    iput-object p2, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mMultiSelector:Lcom/bignerdranch/android/multiselector/MultiSelector;

    .line 55
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_20

    .line 56
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/bignerdranch/android/multiselector/SwappingHolder;->getRaiseStateListAnimator(Landroid/content/Context;)Landroid/animation/StateListAnimator;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bignerdranch/android/multiselector/SwappingHolder;->setSelectionModeStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 57
    invoke-virtual {p1}, Landroid/view/View;->getStateListAnimator()Landroid/animation/StateListAnimator;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bignerdranch/android/multiselector/SwappingHolder;->setDefaultModeStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 61
    :cond_20
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/bignerdranch/android/multiselector/SwappingHolder;->getAccentStateDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Lcom/bignerdranch/android/multiselector/SwappingHolder;->setSelectionModeBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 63
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 62
    invoke-virtual {p0, v0}, Lcom/bignerdranch/android/multiselector/SwappingHolder;->setDefaultModeBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 65
    return-void
.end method

.method private static getAccentStateDrawable(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x1

    .line 78
    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    .line 79
    .local v3, "typedValue":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    .line 80
    .local v2, "theme":Landroid/content/res/Resources$Theme;
    sget v4, Lcom/bignerdranch/android/multiselector/R$attr;->colorAccent:I

    invoke-virtual {v2, v4, v3, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 82
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    iget v4, v3, Landroid/util/TypedValue;->data:I

    invoke-direct {v0, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 84
    .local v0, "colorDrawable":Landroid/graphics/drawable/Drawable;
    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 85
    .local v1, "stateListDrawable":Landroid/graphics/drawable/StateListDrawable;
    new-array v4, v5, [I

    const/4 v5, 0x0

    const v6, 0x10102fe

    aput v6, v4, v5

    invoke-virtual {v1, v4, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 86
    sget-object v4, Landroid/util/StateSet;->WILD_CARD:[I

    const/4 v5, 0x0

    invoke-virtual {v1, v4, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 88
    return-object v1
.end method

.method private static getRaiseStateListAnimator(Landroid/content/Context;)Landroid/animation/StateListAnimator;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 92
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_d

    .line 93
    sget v0, Lcom/bignerdranch/android/multiselector/R$anim;->raise:I

    invoke-static {p0, v0}, Landroid/animation/AnimatorInflater;->loadStateListAnimator(Landroid/content/Context;I)Landroid/animation/StateListAnimator;

    move-result-object v0

    .line 95
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method private refreshChrome()V
    .registers 5

    .prologue
    .line 267
    iget-boolean v2, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mIsSelectable:Z

    if-eqz v2, :cond_27

    iget-object v1, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mSelectionModeBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 269
    .local v1, "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    :goto_6
    iget-object v2, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 270
    if-eqz v1, :cond_10

    .line 271
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    .line 274
    :cond_10
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_26

    .line 275
    iget-boolean v2, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mIsSelectable:Z

    if-eqz v2, :cond_2a

    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mSelectionModeStateListAnimator:Landroid/animation/StateListAnimator;

    .line 278
    .local v0, "animator":Landroid/animation/StateListAnimator;
    :goto_1c
    iget-object v2, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 279
    if-eqz v0, :cond_26

    .line 280
    invoke-virtual {v0}, Landroid/animation/StateListAnimator;->jumpToCurrentState()V

    .line 283
    .end local v0    # "animator":Landroid/animation/StateListAnimator;
    :cond_26
    return-void

    .line 267
    .end local v1    # "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    :cond_27
    iget-object v1, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mDefaultModeBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_6

    .line 275
    .restart local v1    # "backgroundDrawable":Landroid/graphics/drawable/Drawable;
    :cond_2a
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mDefaultModeStateListAnimator:Landroid/animation/StateListAnimator;

    goto :goto_1c
.end method


# virtual methods
.method public getDefaultModeBackgroundDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mDefaultModeBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getDefaultModeStateListAnimator()Landroid/animation/StateListAnimator;
    .registers 2

    .prologue
    .line 188
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mDefaultModeStateListAnimator:Landroid/animation/StateListAnimator;

    return-object v0
.end method

.method public getSelectionModeBackgroundDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 107
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mSelectionModeBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getSelectionModeStateListAnimator()Landroid/animation/StateListAnimator;
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mSelectionModeStateListAnimator:Landroid/animation/StateListAnimator;

    return-object v0
.end method

.method public isActivated()Z
    .registers 2

    .prologue
    .line 223
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isActivated()Z

    move-result v0

    return v0
.end method

.method public isSelectable()Z
    .registers 2

    .prologue
    .line 243
    iget-boolean v0, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mIsSelectable:Z

    return v0
.end method

.method public setActivated(Z)V
    .registers 3
    .param p1, "isActivated"    # Z

    .prologue
    .line 233
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setActivated(Z)V

    .line 234
    return-void
.end method

.method public setDefaultModeBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "defaultModeBackgroundDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 139
    iput-object p1, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mDefaultModeBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 141
    iget-boolean v0, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mIsSelectable:Z

    if-nez v0, :cond_d

    .line 142
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->itemView:Landroid/view/View;

    iget-object v1, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mDefaultModeBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 144
    :cond_d
    return-void
.end method

.method public setDefaultModeStateListAnimator(I)V
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 198
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_13

    .line 199
    iget-object v1, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->itemView:Landroid/view/View;

    .line 200
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/animation/AnimatorInflater;->loadStateListAnimator(Landroid/content/Context;I)Landroid/animation/StateListAnimator;

    move-result-object v0

    .line 202
    .local v0, "animator":Landroid/animation/StateListAnimator;
    invoke-virtual {p0, v0}, Lcom/bignerdranch/android/multiselector/SwappingHolder;->setDefaultModeStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 205
    .end local v0    # "animator":Landroid/animation/StateListAnimator;
    :cond_13
    return-void
.end method

.method public setDefaultModeStateListAnimator(Landroid/animation/StateListAnimator;)V
    .registers 2
    .param p1, "defaultModeStateListAnimator"    # Landroid/animation/StateListAnimator;

    .prologue
    .line 213
    iput-object p1, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mDefaultModeStateListAnimator:Landroid/animation/StateListAnimator;

    .line 214
    return-void
.end method

.method public setSelectable(Z)V
    .registers 4
    .param p1, "isSelectable"    # Z

    .prologue
    .line 258
    iget-boolean v1, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mIsSelectable:Z

    if-eq p1, v1, :cond_d

    const/4 v0, 0x1

    .line 259
    .local v0, "changed":Z
    :goto_5
    iput-boolean p1, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mIsSelectable:Z

    .line 261
    if-eqz v0, :cond_c

    .line 262
    invoke-direct {p0}, Lcom/bignerdranch/android/multiselector/SwappingHolder;->refreshChrome()V

    .line 264
    :cond_c
    return-void

    .line 258
    .end local v0    # "changed":Z
    :cond_d
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setSelectionModeBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "selectionModeBackgroundDrawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 116
    iput-object p1, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mSelectionModeBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 118
    iget-boolean v0, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mIsSelectable:Z

    if-eqz v0, :cond_b

    .line 119
    iget-object v0, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 121
    :cond_b
    return-void
.end method

.method public setSelectionModeStateListAnimator(I)V
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 172
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_13

    .line 173
    iget-object v1, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->itemView:Landroid/view/View;

    .line 174
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/animation/AnimatorInflater;->loadStateListAnimator(Landroid/content/Context;I)Landroid/animation/StateListAnimator;

    move-result-object v0

    .line 176
    .local v0, "animator":Landroid/animation/StateListAnimator;
    invoke-virtual {p0, v0}, Lcom/bignerdranch/android/multiselector/SwappingHolder;->setSelectionModeStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 178
    .end local v0    # "animator":Landroid/animation/StateListAnimator;
    :cond_13
    return-void
.end method

.method public setSelectionModeStateListAnimator(Landroid/animation/StateListAnimator;)V
    .registers 2
    .param p1, "selectionModeStateListAnimator"    # Landroid/animation/StateListAnimator;

    .prologue
    .line 162
    iput-object p1, p0, Lcom/bignerdranch/android/multiselector/SwappingHolder;->mSelectionModeStateListAnimator:Landroid/animation/StateListAnimator;

    .line 163
    return-void
.end method
