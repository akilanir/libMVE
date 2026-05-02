.class public Lcom/rey/material/drawable/RippleDrawable$Mask;
.super Ljava/lang/Object;
.source "RippleDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/RippleDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Mask"
.end annotation


# static fields
.field public static final TYPE_OVAL:I = 0x1

.field public static final TYPE_RECTANGLE:I


# instance fields
.field final bottom:I

.field final cornerRadius:[F

.field final left:I

.field final right:I

.field final top:I

.field final type:I


# direct methods
.method public constructor <init>(IIIIIIIII)V
    .registers 13
    .param p1, "type"    # I
    .param p2, "topLeftCornerRadius"    # I
    .param p3, "topRightCornerRadius"    # I
    .param p4, "bottomRightCornerRadius"    # I
    .param p5, "bottomLeftCornerRadius"    # I
    .param p6, "left"    # I
    .param p7, "top"    # I
    .param p8, "right"    # I
    .param p9, "bottom"    # I

    .prologue
    .line 472
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 465
    const/16 v0, 0x8

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/rey/material/drawable/RippleDrawable$Mask;->cornerRadius:[F

    .line 473
    iput p1, p0, Lcom/rey/material/drawable/RippleDrawable$Mask;->type:I

    .line 475
    iget-object v0, p0, Lcom/rey/material/drawable/RippleDrawable$Mask;->cornerRadius:[F

    const/4 v1, 0x0

    int-to-float v2, p2

    aput v2, v0, v1

    .line 476
    iget-object v0, p0, Lcom/rey/material/drawable/RippleDrawable$Mask;->cornerRadius:[F

    const/4 v1, 0x1

    int-to-float v2, p2

    aput v2, v0, v1

    .line 478
    iget-object v0, p0, Lcom/rey/material/drawable/RippleDrawable$Mask;->cornerRadius:[F

    const/4 v1, 0x2

    int-to-float v2, p3

    aput v2, v0, v1

    .line 479
    iget-object v0, p0, Lcom/rey/material/drawable/RippleDrawable$Mask;->cornerRadius:[F

    const/4 v1, 0x3

    int-to-float v2, p3

    aput v2, v0, v1

    .line 481
    iget-object v0, p0, Lcom/rey/material/drawable/RippleDrawable$Mask;->cornerRadius:[F

    const/4 v1, 0x4

    int-to-float v2, p4

    aput v2, v0, v1

    .line 482
    iget-object v0, p0, Lcom/rey/material/drawable/RippleDrawable$Mask;->cornerRadius:[F

    const/4 v1, 0x5

    int-to-float v2, p4

    aput v2, v0, v1

    .line 484
    iget-object v0, p0, Lcom/rey/material/drawable/RippleDrawable$Mask;->cornerRadius:[F

    const/4 v1, 0x6

    int-to-float v2, p5

    aput v2, v0, v1

    .line 485
    iget-object v0, p0, Lcom/rey/material/drawable/RippleDrawable$Mask;->cornerRadius:[F

    const/4 v1, 0x7

    int-to-float v2, p5

    aput v2, v0, v1

    .line 487
    iput p6, p0, Lcom/rey/material/drawable/RippleDrawable$Mask;->left:I

    .line 488
    iput p7, p0, Lcom/rey/material/drawable/RippleDrawable$Mask;->top:I

    .line 489
    iput p8, p0, Lcom/rey/material/drawable/RippleDrawable$Mask;->right:I

    .line 490
    iput p9, p0, Lcom/rey/material/drawable/RippleDrawable$Mask;->bottom:I

    .line 491
    return-void
.end method
