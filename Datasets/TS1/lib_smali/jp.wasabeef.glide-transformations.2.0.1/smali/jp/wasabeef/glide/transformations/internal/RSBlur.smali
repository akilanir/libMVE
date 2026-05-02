.class public Ljp/wasabeef/glide/transformations/internal/RSBlur;
.super Ljava/lang/Object;
.source "RSBlur.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static blur(Landroid/content/Context;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "radius"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/renderscript/RSRuntimeException;
        }
    .end annotation

    .prologue
    .line 33
    const/4 v3, 0x0

    .line 35
    .local v3, "rs":Landroid/renderscript/RenderScript;
    :try_start_1
    invoke-static {p0}, Landroid/renderscript/RenderScript;->create(Landroid/content/Context;)Landroid/renderscript/RenderScript;

    move-result-object v3

    .line 36
    new-instance v4, Landroid/renderscript/RenderScript$RSMessageHandler;

    invoke-direct {v4}, Landroid/renderscript/RenderScript$RSMessageHandler;-><init>()V

    invoke-virtual {v3, v4}, Landroid/renderscript/RenderScript;->setMessageHandler(Landroid/renderscript/RenderScript$RSMessageHandler;)V

    .line 37
    sget-object v4, Landroid/renderscript/Allocation$MipmapControl;->MIPMAP_NONE:Landroid/renderscript/Allocation$MipmapControl;

    const/4 v5, 0x1

    .line 38
    invoke-static {v3, p1, v4, v5}, Landroid/renderscript/Allocation;->createFromBitmap(Landroid/renderscript/RenderScript;Landroid/graphics/Bitmap;Landroid/renderscript/Allocation$MipmapControl;I)Landroid/renderscript/Allocation;

    move-result-object v1

    .line 40
    .local v1, "input":Landroid/renderscript/Allocation;
    invoke-virtual {v1}, Landroid/renderscript/Allocation;->getType()Landroid/renderscript/Type;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/renderscript/Allocation;->createTyped(Landroid/renderscript/RenderScript;Landroid/renderscript/Type;)Landroid/renderscript/Allocation;

    move-result-object v2

    .line 41
    .local v2, "output":Landroid/renderscript/Allocation;
    invoke-static {v3}, Landroid/renderscript/Element;->U8_4(Landroid/renderscript/RenderScript;)Landroid/renderscript/Element;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/renderscript/ScriptIntrinsicBlur;->create(Landroid/renderscript/RenderScript;Landroid/renderscript/Element;)Landroid/renderscript/ScriptIntrinsicBlur;

    move-result-object v0

    .line 43
    .local v0, "blur":Landroid/renderscript/ScriptIntrinsicBlur;
    invoke-virtual {v0, v1}, Landroid/renderscript/ScriptIntrinsicBlur;->setInput(Landroid/renderscript/Allocation;)V

    .line 44
    int-to-float v4, p2

    invoke-virtual {v0, v4}, Landroid/renderscript/ScriptIntrinsicBlur;->setRadius(F)V

    .line 45
    invoke-virtual {v0, v2}, Landroid/renderscript/ScriptIntrinsicBlur;->forEach(Landroid/renderscript/Allocation;)V

    .line 46
    invoke-virtual {v2, p1}, Landroid/renderscript/Allocation;->copyTo(Landroid/graphics/Bitmap;)V
    :try_end_31
    .catchall {:try_start_1 .. :try_end_31} :catchall_37

    .line 48
    if-eqz v3, :cond_36

    .line 49
    invoke-virtual {v3}, Landroid/renderscript/RenderScript;->destroy()V

    .line 53
    :cond_36
    return-object p1

    .line 48
    .end local v0    # "blur":Landroid/renderscript/ScriptIntrinsicBlur;
    .end local v1    # "input":Landroid/renderscript/Allocation;
    .end local v2    # "output":Landroid/renderscript/Allocation;
    :catchall_37
    move-exception v4

    if-eqz v3, :cond_3d

    .line 49
    invoke-virtual {v3}, Landroid/renderscript/RenderScript;->destroy()V

    :cond_3d
    throw v4
.end method
