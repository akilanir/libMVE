.class public Lorg/ligi/axt/extensions/WindowManagerAXT;
.super Ljava/lang/Object;
.source "WindowManagerAXT.java"


# instance fields
.field private final windowManager:Landroid/view/WindowManager;


# direct methods
.method public constructor <init>(Landroid/view/WindowManager;)V
    .registers 2
    .param p1, "windowManager"    # Landroid/view/WindowManager;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lorg/ligi/axt/extensions/WindowManagerAXT;->windowManager:Landroid/view/WindowManager;

    .line 14
    return-void
.end method


# virtual methods
.method public getLargestSide()I
    .registers 4

    .prologue
    .line 31
    invoke-virtual {p0}, Lorg/ligi/axt/extensions/WindowManagerAXT;->getSizeAsPointCorrectly()Landroid/graphics/Point;

    move-result-object v0

    .line 32
    .local v0, "sizeAsPoint":Landroid/graphics/Point;
    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v2, v0, Landroid/graphics/Point;->y:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    return v1
.end method

.method public getSizeAsPointCorrectly()Landroid/graphics/Point;
    .registers 5

    .prologue
    .line 18
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 19
    .local v1, "result":Landroid/graphics/Point;
    iget-object v2, p0, Lorg/ligi/axt/extensions/WindowManagerAXT;->windowManager:Landroid/view/WindowManager;

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 20
    .local v0, "defaultDisplay":Landroid/view/Display;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xc

    if-le v2, v3, :cond_15

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 27
    :goto_14
    return-object v1

    .line 25
    :cond_15
    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Point;->set(II)V

    goto :goto_14
.end method

.method public getSmallestSide()I
    .registers 4

    .prologue
    .line 37
    invoke-virtual {p0}, Lorg/ligi/axt/extensions/WindowManagerAXT;->getSizeAsPointCorrectly()Landroid/graphics/Point;

    move-result-object v0

    .line 38
    .local v0, "sizeAsPoint":Landroid/graphics/Point;
    iget v1, v0, Landroid/graphics/Point;->x:I

    iget v2, v0, Landroid/graphics/Point;->y:I

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    return v1
.end method
