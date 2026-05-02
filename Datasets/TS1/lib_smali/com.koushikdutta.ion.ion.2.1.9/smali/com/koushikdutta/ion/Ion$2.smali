.class Lcom/koushikdutta/ion/Ion$2;
.super Ljava/lang/Object;
.source "Ion.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/Ion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/Ion;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/Ion;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/ion/Ion;

    .prologue
    .line 268
    iput-object p1, p0, Lcom/koushikdutta/ion/Ion$2;->this$0:Lcom/koushikdutta/ion/Ion;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 271
    iget-object v6, p0, Lcom/koushikdutta/ion/Ion$2;->this$0:Lcom/koushikdutta/ion/Ion;

    invoke-static {v6}, Lcom/koushikdutta/ion/BitmapFetcher;->shouldDeferImageView(Lcom/koushikdutta/ion/Ion;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 297
    :cond_9
    :goto_9
    return-void

    .line 273
    :cond_a
    const/4 v1, 0x0

    .line 274
    .local v1, "deferred":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/ion/DeferredLoadBitmap;>;"
    iget-object v6, p0, Lcom/koushikdutta/ion/Ion$2;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v6, v6, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    invoke-virtual {v6}, Lcom/koushikdutta/async/util/HashList;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_17
    :goto_17
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 275
    .local v4, "key":Ljava/lang/String;
    iget-object v6, p0, Lcom/koushikdutta/ion/Ion$2;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v6, v6, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    invoke-virtual {v6, v4}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 276
    .local v5, "owner":Ljava/lang/Object;
    instance-of v6, v5, Lcom/koushikdutta/ion/DeferredLoadBitmap;

    if-eqz v6, :cond_17

    move-object v2, v5

    .line 277
    check-cast v2, Lcom/koushikdutta/ion/DeferredLoadBitmap;

    .line 278
    .local v2, "deferredLoadBitmap":Lcom/koushikdutta/ion/DeferredLoadBitmap;
    if-nez v1, :cond_39

    .line 279
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "deferred":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/ion/DeferredLoadBitmap;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 280
    .restart local v1    # "deferred":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/koushikdutta/ion/DeferredLoadBitmap;>;"
    :cond_39
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_17

    .line 284
    .end local v2    # "deferredLoadBitmap":Lcom/koushikdutta/ion/DeferredLoadBitmap;
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "owner":Ljava/lang/Object;
    :cond_3d
    if-eqz v1, :cond_9

    .line 286
    const/4 v0, 0x0

    .line 287
    .local v0, "count":I
    # getter for: Lcom/koushikdutta/ion/Ion;->DEFERRED_COMPARATOR:Ljava/util/Comparator;
    invoke-static {}, Lcom/koushikdutta/ion/Ion;->access$000()Ljava/util/Comparator;

    move-result-object v6

    invoke-static {v1, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 288
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_4b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/koushikdutta/ion/DeferredLoadBitmap;

    .line 289
    .restart local v2    # "deferredLoadBitmap":Lcom/koushikdutta/ion/DeferredLoadBitmap;
    iget-object v6, p0, Lcom/koushikdutta/ion/Ion$2;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v6, v6, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v7, v2, Lcom/koushikdutta/ion/DeferredLoadBitmap;->key:Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;Ljava/lang/Object;)V

    .line 290
    iget-object v6, p0, Lcom/koushikdutta/ion/Ion$2;->this$0:Lcom/koushikdutta/ion/Ion;

    iget-object v6, v6, Lcom/koushikdutta/ion/Ion;->bitmapsPending:Lcom/koushikdutta/async/util/HashList;

    iget-object v7, v2, Lcom/koushikdutta/ion/DeferredLoadBitmap;->fetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    iget-object v7, v7, Lcom/koushikdutta/ion/BitmapFetcher;->bitmapKey:Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Lcom/koushikdutta/async/util/HashList;->tag(Ljava/lang/String;Ljava/lang/Object;)V

    .line 291
    iget-object v6, v2, Lcom/koushikdutta/ion/DeferredLoadBitmap;->fetcher:Lcom/koushikdutta/ion/BitmapFetcher;

    invoke-virtual {v6}, Lcom/koushikdutta/ion/BitmapFetcher;->execute()V

    .line 292
    add-int/lit8 v0, v0, 0x1

    .line 294
    const/4 v6, 0x5

    if-le v0, v6, :cond_4b

    goto :goto_9
.end method
