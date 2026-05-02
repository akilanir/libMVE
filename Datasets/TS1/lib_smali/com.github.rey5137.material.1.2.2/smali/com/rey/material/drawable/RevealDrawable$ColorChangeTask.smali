.class public Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;
.super Ljava/lang/Object;
.source "RevealDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/RevealDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ColorChangeTask"
.end annotation


# instance fields
.field public final color:I

.field public final duration:I

.field public final interpolator:Landroid/view/animation/Interpolator;

.field public final isOut:Z

.field public final x:F

.field public final y:F


# direct methods
.method public constructor <init>(IILandroid/view/animation/Interpolator;FFZ)V
    .registers 7
    .param p1, "color"    # I
    .param p2, "duration"    # I
    .param p3, "interpolator"    # Landroid/view/animation/Interpolator;
    .param p4, "x"    # F
    .param p5, "y"    # F
    .param p6, "out"    # Z

    .prologue
    .line 284
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 285
    iput p1, p0, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->color:I

    .line 286
    iput p2, p0, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->duration:I

    .line 287
    if-nez p3, :cond_e

    new-instance p3, Landroid/view/animation/DecelerateInterpolator;

    .end local p3    # "interpolator":Landroid/view/animation/Interpolator;
    invoke-direct {p3}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    :cond_e
    iput-object p3, p0, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->interpolator:Landroid/view/animation/Interpolator;

    .line 288
    iput p4, p0, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->x:F

    .line 289
    iput p5, p0, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->y:F

    .line 290
    iput-boolean p6, p0, Lcom/rey/material/drawable/RevealDrawable$ColorChangeTask;->isOut:Z

    .line 291
    return-void
.end method
