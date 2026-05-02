.class Lcom/google/android/apps/muzei/api/MuzeiArtSource$1;
.super Landroid/os/Handler;
.source "MuzeiArtSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/muzei/api/MuzeiArtSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/android/apps/muzei/api/MuzeiArtSource;


# direct methods
.method constructor <init>(Lcom/google/android/apps/muzei/api/MuzeiArtSource;)V
    .registers 2

    .prologue
    .line 267
    iput-object p1, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource$1;->this$0:Lcom/google/android/apps/muzei/api/MuzeiArtSource;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 270
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 271
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_12

    .line 272
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource$1;->this$0:Lcom/google/android/apps/muzei/api/MuzeiArtSource;

    # invokes: Lcom/google/android/apps/muzei/api/MuzeiArtSource;->publishCurrentState()V
    invoke-static {v0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->access$000(Lcom/google/android/apps/muzei/api/MuzeiArtSource;)V

    .line 273
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource$1;->this$0:Lcom/google/android/apps/muzei/api/MuzeiArtSource;

    # invokes: Lcom/google/android/apps/muzei/api/MuzeiArtSource;->saveState()V
    invoke-static {v0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->access$100(Lcom/google/android/apps/muzei/api/MuzeiArtSource;)V

    .line 275
    :cond_12
    return-void
.end method
