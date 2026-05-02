.class Lcom/nispok/snackbar/DisplayCompatImplPreHoneycombMR2;
.super Lcom/nispok/snackbar/DisplayCompat$Impl;
.source "DisplayCompatImplPreHoneycombMR2.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Lcom/nispok/snackbar/DisplayCompat$Impl;-><init>()V

    return-void
.end method


# virtual methods
.method getRealSize(Landroid/view/Display;Landroid/graphics/Point;)V
    .registers 4
    .param p1, "display"    # Landroid/view/Display;
    .param p2, "outSize"    # Landroid/graphics/Point;

    .prologue
    .line 16
    invoke-virtual {p1}, Landroid/view/Display;->getWidth()I

    move-result v0

    iput v0, p2, Landroid/graphics/Point;->x:I

    .line 17
    invoke-virtual {p1}, Landroid/view/Display;->getHeight()I

    move-result v0

    iput v0, p2, Landroid/graphics/Point;->y:I

    .line 18
    return-void
.end method

.method getSize(Landroid/view/Display;Landroid/graphics/Point;)V
    .registers 4
    .param p1, "display"    # Landroid/view/Display;
    .param p2, "outSize"    # Landroid/graphics/Point;

    .prologue
    .line 10
    invoke-virtual {p1}, Landroid/view/Display;->getWidth()I

    move-result v0

    iput v0, p2, Landroid/graphics/Point;->x:I

    .line 11
    invoke-virtual {p1}, Landroid/view/Display;->getHeight()I

    move-result v0

    iput v0, p2, Landroid/graphics/Point;->y:I

    .line 12
    return-void
.end method
