.class Lcom/nispok/snackbar/DisplayCompat;
.super Ljava/lang/Object;
.source "DisplayCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nispok/snackbar/DisplayCompat$Impl;
    }
.end annotation


# static fields
.field private static final IMPL:Lcom/nispok/snackbar/DisplayCompat$Impl;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 18
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_e

    .line 19
    new-instance v0, Lcom/nispok/snackbar/DisplayCompatImplJBMR1;

    invoke-direct {v0}, Lcom/nispok/snackbar/DisplayCompatImplJBMR1;-><init>()V

    sput-object v0, Lcom/nispok/snackbar/DisplayCompat;->IMPL:Lcom/nispok/snackbar/DisplayCompat$Impl;

    .line 25
    :goto_d
    return-void

    .line 20
    :cond_e
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xd

    if-lt v0, v1, :cond_1c

    .line 21
    new-instance v0, Lcom/nispok/snackbar/DisplayCompatImplHoneycombMR2;

    invoke-direct {v0}, Lcom/nispok/snackbar/DisplayCompatImplHoneycombMR2;-><init>()V

    sput-object v0, Lcom/nispok/snackbar/DisplayCompat;->IMPL:Lcom/nispok/snackbar/DisplayCompat$Impl;

    goto :goto_d

    .line 23
    :cond_1c
    new-instance v0, Lcom/nispok/snackbar/DisplayCompatImplPreHoneycombMR2;

    invoke-direct {v0}, Lcom/nispok/snackbar/DisplayCompatImplPreHoneycombMR2;-><init>()V

    sput-object v0, Lcom/nispok/snackbar/DisplayCompat;->IMPL:Lcom/nispok/snackbar/DisplayCompat$Impl;

    goto :goto_d
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    return-void
.end method

.method public static getRealSize(Landroid/view/Display;Landroid/graphics/Point;)V
    .registers 3
    .param p0, "display"    # Landroid/view/Display;
    .param p1, "outSize"    # Landroid/graphics/Point;

    .prologue
    .line 32
    sget-object v0, Lcom/nispok/snackbar/DisplayCompat;->IMPL:Lcom/nispok/snackbar/DisplayCompat$Impl;

    invoke-virtual {v0, p0, p1}, Lcom/nispok/snackbar/DisplayCompat$Impl;->getRealSize(Landroid/view/Display;Landroid/graphics/Point;)V

    .line 33
    return-void
.end method

.method public static getSize(Landroid/view/Display;Landroid/graphics/Point;)V
    .registers 3
    .param p0, "display"    # Landroid/view/Display;
    .param p1, "outSize"    # Landroid/graphics/Point;

    .prologue
    .line 28
    sget-object v0, Lcom/nispok/snackbar/DisplayCompat;->IMPL:Lcom/nispok/snackbar/DisplayCompat$Impl;

    invoke-virtual {v0, p0, p1}, Lcom/nispok/snackbar/DisplayCompat$Impl;->getSize(Landroid/view/Display;Landroid/graphics/Point;)V

    .line 29
    return-void
.end method

.method public static getWidthFromPercentage(Landroid/app/Activity;Ljava/lang/Float;)I
    .registers 6
    .param p0, "targetActivity"    # Landroid/app/Activity;
    .param p1, "mMaxWidthPercentage"    # Ljava/lang/Float;

    .prologue
    .line 36
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 37
    .local v1, "display":Landroid/view/Display;
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 38
    .local v0, "dispSize":Landroid/graphics/Point;
    invoke-static {v1, v0}, Lcom/nispok/snackbar/DisplayCompat;->getRealSize(Landroid/view/Display;Landroid/graphics/Point;)V

    .line 40
    iget v2, v0, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v3

    mul-float/2addr v2, v3

    float-to-int v2, v2

    return v2
.end method
