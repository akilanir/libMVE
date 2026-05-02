.class Lcom/koushikdutta/ion/BitmapCallback$2;
.super Ljava/lang/Object;
.source "BitmapCallback.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/BitmapCallback;->report(Ljava/lang/Exception;Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/BitmapCallback;

.field final synthetic val$e:Ljava/lang/Exception;

.field final synthetic val$info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/BitmapCallback;Lcom/koushikdutta/ion/bitmap/BitmapInfo;Ljava/lang/Exception;)V
    .registers 4
    .param p1, "this$0"    # Lcom/koushikdutta/ion/BitmapCallback;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->this$0:Lcom/koushikdutta/ion/BitmapCallback;

    iput-object p2, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->val$info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    iput-object p3, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->val$e:Ljava/lang/Exception;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 108
    iget-object v3, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->val$info:Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .line 109
    .local v3, "result":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    if-nez v3, :cond_44

    .line 111
    new-instance v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;

    .end local v3    # "result":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    iget-object v4, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->this$0:Lcom/koushikdutta/ion/BitmapCallback;

    iget-object v4, v4, Lcom/koushikdutta/ion/BitmapCallback;->key:Ljava/lang/String;

    new-instance v5, Landroid/graphics/Point;

    invoke-direct {v5}, Landroid/graphics/Point;-><init>()V

    invoke-direct {v3, v4, v6, v6, v5}, Lcom/koushikdutta/ion/bitmap/BitmapInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/graphics/Point;)V

    .line 112
    .restart local v3    # "result":Lcom/koushikdutta/ion/bitmap/BitmapInfo;
    iget-object v4, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->val$e:Ljava/lang/Exception;

    iput-object v4, v3, Lcom/koushikdutta/ion/bitmap/BitmapInfo;->exception:Ljava/lang/Exception;

    .line 113
    iget-object v4, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->val$e:Ljava/lang/Exception;

    instance-of v4, v4, Ljava/util/concurrent/CancellationException;

    if-nez v4, :cond_28

    .line 114
    iget-object v4, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->this$0:Lcom/koushikdutta/ion/BitmapCallback;

    iget-object v4, v4, Lcom/koushikdutta/ion/BitmapCallback;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v4}, Lcom/koushikdutta/ion/Ion;->getBitmapCache()Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->put(Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    .line 122
    :cond_28
    :goto_28
    iget-object v4, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->this$0:Lcom/koushikdutta/ion/BitmapCallback;

    iget-object v4, v4, Lcom/koushikdutta/ion/BitmapCallback;->ion:Lcom/koushikdutta/ion/Ion;

    iget-object v4, v4, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v5, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->this$0:Lcom/koushikdutta/ion/BitmapCallback;

    iget-object v5, v5, Lcom/koushikdutta/ion/BitmapCallback;->key:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/koushikdutta/async/util/HashList;->remove(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 123
    .local v1, "callbacks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/async/future/FutureCallback<Lcom/koushikdutta/ion/bitmap/BitmapInfo;>;>;"
    if-eqz v1, :cond_3e

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_64

    .line 124
    :cond_3e
    iget-object v4, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->this$0:Lcom/koushikdutta/ion/BitmapCallback;

    invoke-virtual {v4}, Lcom/koushikdutta/ion/BitmapCallback;->onReported()V

    .line 132
    :goto_43
    return-void

    .line 115
    .end local v1    # "callbacks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/async/future/FutureCallback<Lcom/koushikdutta/ion/bitmap/BitmapInfo;>;>;"
    :cond_44
    iget-object v4, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->this$0:Lcom/koushikdutta/ion/BitmapCallback;

    invoke-virtual {v4}, Lcom/koushikdutta/ion/BitmapCallback;->put()Z

    move-result v4

    if-eqz v4, :cond_58

    .line 116
    iget-object v4, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->this$0:Lcom/koushikdutta/ion/BitmapCallback;

    iget-object v4, v4, Lcom/koushikdutta/ion/BitmapCallback;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v4}, Lcom/koushikdutta/ion/Ion;->getBitmapCache()Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->put(Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    goto :goto_28

    .line 119
    :cond_58
    iget-object v4, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->this$0:Lcom/koushikdutta/ion/BitmapCallback;

    iget-object v4, v4, Lcom/koushikdutta/ion/BitmapCallback;->ion:Lcom/koushikdutta/ion/Ion;

    invoke-virtual {v4}, Lcom/koushikdutta/ion/Ion;->getBitmapCache()Lcom/koushikdutta/ion/bitmap/IonBitmapCache;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/koushikdutta/ion/bitmap/IonBitmapCache;->putSoft(Lcom/koushikdutta/ion/bitmap/BitmapInfo;)V

    goto :goto_28

    .line 128
    .restart local v1    # "callbacks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/async/future/FutureCallback<Lcom/koushikdutta/ion/bitmap/BitmapInfo;>;>;"
    :cond_64
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_68
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/koushikdutta/async/future/FutureCallback;

    .line 129
    .local v0, "callback":Lcom/koushikdutta/async/future/FutureCallback;, "Lcom/koushikdutta/async/future/FutureCallback<Lcom/koushikdutta/ion/bitmap/BitmapInfo;>;"
    iget-object v4, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->val$e:Ljava/lang/Exception;

    invoke-interface {v0, v4, v3}, Lcom/koushikdutta/async/future/FutureCallback;->onCompleted(Ljava/lang/Exception;Ljava/lang/Object;)V

    goto :goto_68

    .line 131
    .end local v0    # "callback":Lcom/koushikdutta/async/future/FutureCallback;, "Lcom/koushikdutta/async/future/FutureCallback<Lcom/koushikdutta/ion/bitmap/BitmapInfo;>;"
    :cond_7a
    iget-object v4, p0, Lcom/koushikdutta/ion/BitmapCallback$2;->this$0:Lcom/koushikdutta/ion/BitmapCallback;

    invoke-virtual {v4}, Lcom/koushikdutta/ion/BitmapCallback;->onReported()V

    goto :goto_43
.end method
