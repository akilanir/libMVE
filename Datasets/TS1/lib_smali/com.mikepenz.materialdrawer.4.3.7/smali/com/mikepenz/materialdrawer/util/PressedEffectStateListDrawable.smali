.class public Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;
.super Landroid/graphics/drawable/StateListDrawable;
.source "PressedEffectStateListDrawable.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "InlinedApi"
    }
.end annotation


# instance fields
.field private color:I

.field private selectionColor:I


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;II)V
    .registers 7
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "color"    # I
    .param p3, "selectionColor"    # I

    .prologue
    const/4 v2, 0x0

    .line 20
    invoke-direct {p0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 22
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 24
    const/4 v0, 0x1

    new-array v0, v0, [I

    const v1, 0x10100a1

    aput v1, v0, v2

    invoke-virtual {p0, v0, p1}, Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 25
    new-array v0, v2, [I

    invoke-virtual {p0, v0, p1}, Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 27
    iput p2, p0, Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;->color:I

    .line 28
    iput p3, p0, Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;->selectionColor:I

    .line 29
    return-void
.end method


# virtual methods
.method public isStateful()Z
    .registers 2

    .prologue
    .line 49
    const/4 v0, 0x1

    return v0
.end method

.method protected onStateChange([I)Z
    .registers 7
    .param p1, "states"    # [I

    .prologue
    .line 33
    const/4 v0, 0x0

    .line 34
    .local v0, "isStatePressedInArray":Z
    array-length v3, p1

    const/4 v2, 0x0

    :goto_3
    if-ge v2, v3, :cond_10

    aget v1, p1, v2

    .line 35
    .local v1, "state":I
    const v4, 0x10100a1

    if-ne v1, v4, :cond_d

    .line 36
    const/4 v0, 0x1

    .line 34
    :cond_d
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 39
    .end local v1    # "state":I
    :cond_10
    if-eqz v0, :cond_1e

    .line 40
    iget v2, p0, Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;->selectionColor:I

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-super {p0, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 44
    :goto_19
    invoke-super {p0, p1}, Landroid/graphics/drawable/StateListDrawable;->onStateChange([I)Z

    move-result v2

    return v2

    .line 42
    :cond_1e
    iget v2, p0, Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;->color:I

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-super {p0, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_19
.end method
