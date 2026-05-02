.class Lcom/nispok/snackbar/DisplayCompatImplJBMR1;
.super Lcom/nispok/snackbar/DisplayCompat$Impl;
.source "DisplayCompatImplJBMR1.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x11
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/nispok/snackbar/DisplayCompat$Impl;-><init>()V

    return-void
.end method


# virtual methods
.method getRealSize(Landroid/view/Display;Landroid/graphics/Point;)V
    .registers 3
    .param p1, "display"    # Landroid/view/Display;
    .param p2, "outSize"    # Landroid/graphics/Point;

    .prologue
    .line 17
    invoke-virtual {p1, p2}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 18
    return-void
.end method

.method getSize(Landroid/view/Display;Landroid/graphics/Point;)V
    .registers 3
    .param p1, "display"    # Landroid/view/Display;
    .param p2, "outSize"    # Landroid/graphics/Point;

    .prologue
    .line 12
    invoke-virtual {p1, p2}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 13
    return-void
.end method
