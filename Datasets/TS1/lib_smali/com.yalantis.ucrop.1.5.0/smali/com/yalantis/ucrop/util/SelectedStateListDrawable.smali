.class public Lcom/yalantis/ucrop/util/SelectedStateListDrawable;
.super Landroid/graphics/drawable/StateListDrawable;
.source "SelectedStateListDrawable.java"


# instance fields
.field private mSelectionColor:I


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;I)V
    .registers 6
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "selectionColor"    # I

    .prologue
    const/4 v2, 0x0

    .line 15
    invoke-direct {p0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 16
    iput p2, p0, Lcom/yalantis/ucrop/util/SelectedStateListDrawable;->mSelectionColor:I

    .line 17
    const/4 v0, 0x1

    new-array v0, v0, [I

    const v1, 0x10100a1

    aput v1, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/yalantis/ucrop/util/SelectedStateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 18
    new-array v0, v2, [I

    invoke-virtual {p0, v0, p1}, Lcom/yalantis/ucrop/util/SelectedStateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 19
    return-void
.end method


# virtual methods
.method public isStateful()Z
    .registers 2

    .prologue
    .line 39
    const/4 v0, 0x1

    return v0
.end method

.method protected onStateChange([I)Z
    .registers 9
    .param p1, "states"    # [I

    .prologue
    .line 23
    const/4 v2, 0x0

    .line 24
    .local v2, "isStatePressedInArray":Z
    move-object v0, p1

    .local v0, "arr$":[I
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_4
    if-ge v1, v3, :cond_11

    aget v4, v0, v1

    .line 25
    .local v4, "state":I
    const v5, 0x10100a1

    if-ne v4, v5, :cond_e

    .line 26
    const/4 v2, 0x1

    .line 24
    :cond_e
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 29
    .end local v4    # "state":I
    :cond_11
    if-eqz v2, :cond_1f

    .line 30
    iget v5, p0, Lcom/yalantis/ucrop/util/SelectedStateListDrawable;->mSelectionColor:I

    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-super {p0, v5, v6}, Landroid/graphics/drawable/StateListDrawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 34
    :goto_1a
    invoke-super {p0, p1}, Landroid/graphics/drawable/StateListDrawable;->onStateChange([I)Z

    move-result v5

    return v5

    .line 32
    :cond_1f
    invoke-super {p0}, Landroid/graphics/drawable/StateListDrawable;->clearColorFilter()V

    goto :goto_1a
.end method
