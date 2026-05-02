.class Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder$1;
.super Ljava/lang/Object;
.source "IonDrawable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;)V
    .registers 2

    .prologue
    .line 186
    iput-object p1, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder$1;->this$1:Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 190
    :try_start_0
    iget-object v1, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder$1;->this$1:Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;

    iget-object v1, v1, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->gifDecoder:Lcom/koushikdutta/ion/gif/GifDecoder;

    invoke-virtual {v1}, Lcom/koushikdutta/ion/gif/GifDecoder;->nextFrame()Lcom/koushikdutta/ion/gif/GifFrame;
    :try_end_7
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_7} :catch_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_7} :catch_1c

    .line 198
    :goto_7
    sget-object v1, Lcom/koushikdutta/ion/Ion;->mainHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder$1;->this$1:Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;

    iget-object v2, v2, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->postLoad:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 199
    return-void

    .line 192
    :catch_11
    move-exception v0

    .line 193
    .local v0, "e":Ljava/lang/OutOfMemoryError;
    iget-object v1, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder$1;->this$1:Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;

    new-instance v2, Ljava/lang/Exception;

    invoke-direct {v2, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    iput-object v2, v1, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->exception:Ljava/lang/Exception;

    goto :goto_7

    .line 195
    .end local v0    # "e":Ljava/lang/OutOfMemoryError;
    :catch_1c
    move-exception v0

    .line 196
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder$1;->this$1:Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;

    iput-object v0, v1, Lcom/koushikdutta/ion/IonDrawable$IonGifDecoder;->exception:Ljava/lang/Exception;

    goto :goto_7
.end method
