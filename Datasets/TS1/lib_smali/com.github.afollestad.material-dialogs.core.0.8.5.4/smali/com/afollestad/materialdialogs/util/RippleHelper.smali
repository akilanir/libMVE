.class public Lcom/afollestad/materialdialogs/util/RippleHelper;
.super Ljava/lang/Object;
.source "RippleHelper.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applyColor(Landroid/graphics/drawable/Drawable;I)V
    .registers 3
    .param p0, "d"    # Landroid/graphics/drawable/Drawable;
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 17
    instance-of v0, p0, Landroid/graphics/drawable/RippleDrawable;

    if-eqz v0, :cond_d

    .line 18
    check-cast p0, Landroid/graphics/drawable/RippleDrawable;

    .end local p0    # "d":Landroid/graphics/drawable/Drawable;
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/RippleDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 19
    :cond_d
    return-void
.end method
