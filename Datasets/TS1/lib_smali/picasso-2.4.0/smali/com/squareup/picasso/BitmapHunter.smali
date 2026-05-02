.class Lcom/squareup/picasso/BitmapHunter;
.super Ljava/lang/Object;
.source "BitmapHunter.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final DECODE_LOCK:Ljava/lang/Object;

.field private static final ERRORING_HANDLER:Lcom/squareup/picasso/RequestHandler;

.field private static final NAME_BUILDER:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/StringBuilder;",
            ">;"
        }
    .end annotation
.end field

.field private static final SEQUENCE_GENERATOR:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field action:Lcom/squareup/picasso/Action;

.field actions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/squareup/picasso/Action;",
            ">;"
        }
    .end annotation
.end field

.field final cache:Lcom/squareup/picasso/Cache;

.field final data:Lcom/squareup/picasso/Request;

.field final dispatcher:Lcom/squareup/picasso/Dispatcher;

.field exception:Ljava/lang/Exception;

.field exifRotation:I

.field future:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field final key:Ljava/lang/String;

.field loadedFrom:Lcom/squareup/picasso/Picasso$LoadedFrom;

.field final picasso:Lcom/squareup/picasso/Picasso;

.field priority:Lcom/squareup/picasso/Picasso$Priority;

.field final requestHandler:Lcom/squareup/picasso/RequestHandler;

.field result:Landroid/graphics/Bitmap;

.field retryCount:I

.field final sequence:I

.field final skipMemoryCache:Z

.field final stats:Lcom/squareup/picasso/Stats;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/squareup/picasso/BitmapHunter;->DECODE_LOCK:Ljava/lang/Object;

    .line 49
    new-instance v0, Lcom/squareup/picasso/BitmapHunter$1;

    invoke-direct {v0}, Lcom/squareup/picasso/BitmapHunter$1;-><init>()V

    sput-object v0, Lcom/squareup/picasso/BitmapHunter;->NAME_BUILDER:Ljava/lang/ThreadLocal;

    .line 55
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lcom/squareup/picasso/BitmapHunter;->SEQUENCE_GENERATOR:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 57
    new-instance v0, Lcom/squareup/picasso/BitmapHunter$2;

    invoke-direct {v0}, Lcom/squareup/picasso/BitmapHunter$2;-><init>()V

    sput-object v0, Lcom/squareup/picasso/BitmapHunter;->ERRORING_HANDLER:Lcom/squareup/picasso/RequestHandler;

    return-void
.end method

.method constructor <init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Dispatcher;Lcom/squareup/picasso/Cache;Lcom/squareup/picasso/Stats;Lcom/squareup/picasso/Action;Lcom/squareup/picasso/RequestHandler;)V
    .registers 8
    .param p1, "picasso"    # Lcom/squareup/picasso/Picasso;
    .param p2, "dispatcher"    # Lcom/squareup/picasso/Dispatcher;
    .param p3, "cache"    # Lcom/squareup/picasso/Cache;
    .param p4, "stats"    # Lcom/squareup/picasso/Stats;
    .param p5, "action"    # Lcom/squareup/picasso/Action;
    .param p6, "requestHandler"    # Lcom/squareup/picasso/RequestHandler;

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    sget-object v0, Lcom/squareup/picasso/BitmapHunter;->SEQUENCE_GENERATOR:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    iput v0, p0, Lcom/squareup/picasso/BitmapHunter;->sequence:I

    .line 90
    iput-object p1, p0, Lcom/squareup/picasso/BitmapHunter;->picasso:Lcom/squareup/picasso/Picasso;

    .line 91
    iput-object p2, p0, Lcom/squareup/picasso/BitmapHunter;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    .line 92
    iput-object p3, p0, Lcom/squareup/picasso/BitmapHunter;->cache:Lcom/squareup/picasso/Cache;

    .line 93
    iput-object p4, p0, Lcom/squareup/picasso/BitmapHunter;->stats:Lcom/squareup/picasso/Stats;

    .line 94
    iput-object p5, p0, Lcom/squareup/picasso/BitmapHunter;->action:Lcom/squareup/picasso/Action;

    .line 95
    invoke-virtual {p5}, Lcom/squareup/picasso/Action;->getKey()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->key:Ljava/lang/String;

    .line 96
    invoke-virtual {p5}, Lcom/squareup/picasso/Action;->getRequest()Lcom/squareup/picasso/Request;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->data:Lcom/squareup/picasso/Request;

    .line 97
    invoke-virtual {p5}, Lcom/squareup/picasso/Action;->getPriority()Lcom/squareup/picasso/Picasso$Priority;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->priority:Lcom/squareup/picasso/Picasso$Priority;

    .line 98
    iget-boolean v0, p5, Lcom/squareup/picasso/Action;->skipCache:Z

    iput-boolean v0, p0, Lcom/squareup/picasso/BitmapHunter;->skipMemoryCache:Z

    .line 99
    iput-object p6, p0, Lcom/squareup/picasso/BitmapHunter;->requestHandler:Lcom/squareup/picasso/RequestHandler;

    .line 100
    invoke-virtual {p6}, Lcom/squareup/picasso/RequestHandler;->getRetryCount()I

    move-result v0

    iput v0, p0, Lcom/squareup/picasso/BitmapHunter;->retryCount:I

    .line 101
    return-void
.end method

.method static applyCustomTransformations(Ljava/util/List;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 13
    .param p1, "result"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/picasso/Transformation;",
            ">;",
            "Landroid/graphics/Bitmap;",
            ")",
            "Landroid/graphics/Bitmap;"
        }
    .end annotation

    .prologue
    .local p0, "transformations":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/picasso/Transformation;>;"
    const/4 v7, 0x0

    .line 361
    const/4 v3, 0x0

    .local v3, "i":I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "count":I
    :goto_6
    if-ge v3, v1, :cond_61

    .line 362
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/squareup/picasso/Transformation;

    .line 365
    .local v6, "transformation":Lcom/squareup/picasso/Transformation;
    :try_start_e
    invoke-interface {v6, p1}, Lcom/squareup/picasso/Transformation;->transform(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_11} :catch_55

    move-result-object v4

    .line 376
    .local v4, "newResult":Landroid/graphics/Bitmap;
    if-nez v4, :cond_6e

    .line 377
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Transformation "

    .line 378
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 379
    invoke-interface {v6}, Lcom/squareup/picasso/Transformation;->key()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " returned null after "

    .line 380
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 381
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " previous transformation(s).\n\nTransformation list:\n"

    .line 382
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 383
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_3b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_62

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/squareup/picasso/Transformation;

    .line 384
    .local v5, "t":Lcom/squareup/picasso/Transformation;
    invoke-interface {v5}, Lcom/squareup/picasso/Transformation;->key()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3b

    .line 366
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    .end local v4    # "newResult":Landroid/graphics/Bitmap;
    .end local v5    # "t":Lcom/squareup/picasso/Transformation;
    :catch_55
    move-exception v2

    .line 367
    .local v2, "e":Ljava/lang/RuntimeException;
    sget-object v8, Lcom/squareup/picasso/Picasso;->HANDLER:Landroid/os/Handler;

    new-instance v9, Lcom/squareup/picasso/BitmapHunter$3;

    invoke-direct {v9, v6, v2}, Lcom/squareup/picasso/BitmapHunter$3;-><init>(Lcom/squareup/picasso/Transformation;Ljava/lang/RuntimeException;)V

    invoke-virtual {v8, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-object p1, v7

    .line 419
    .end local v2    # "e":Ljava/lang/RuntimeException;
    .end local v6    # "transformation":Lcom/squareup/picasso/Transformation;
    .end local p1    # "result":Landroid/graphics/Bitmap;
    :cond_61
    :goto_61
    return-object p1

    .line 386
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    .restart local v4    # "newResult":Landroid/graphics/Bitmap;
    .restart local v6    # "transformation":Lcom/squareup/picasso/Transformation;
    .restart local p1    # "result":Landroid/graphics/Bitmap;
    :cond_62
    sget-object v8, Lcom/squareup/picasso/Picasso;->HANDLER:Landroid/os/Handler;

    new-instance v9, Lcom/squareup/picasso/BitmapHunter$4;

    invoke-direct {v9, v0}, Lcom/squareup/picasso/BitmapHunter$4;-><init>(Ljava/lang/StringBuilder;)V

    invoke-virtual {v8, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-object p1, v7

    .line 391
    goto :goto_61

    .line 394
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_6e
    if-ne v4, p1, :cond_82

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v8

    if-eqz v8, :cond_82

    .line 395
    sget-object v8, Lcom/squareup/picasso/Picasso;->HANDLER:Landroid/os/Handler;

    new-instance v9, Lcom/squareup/picasso/BitmapHunter$5;

    invoke-direct {v9, v6}, Lcom/squareup/picasso/BitmapHunter$5;-><init>(Lcom/squareup/picasso/Transformation;)V

    invoke-virtual {v8, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-object p1, v7

    .line 402
    goto :goto_61

    .line 406
    :cond_82
    if-eq v4, p1, :cond_96

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v8

    if-nez v8, :cond_96

    .line 407
    sget-object v8, Lcom/squareup/picasso/Picasso;->HANDLER:Landroid/os/Handler;

    new-instance v9, Lcom/squareup/picasso/BitmapHunter$6;

    invoke-direct {v9, v6}, Lcom/squareup/picasso/BitmapHunter$6;-><init>(Lcom/squareup/picasso/Transformation;)V

    invoke-virtual {v8, v9}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-object p1, v7

    .line 414
    goto :goto_61

    .line 417
    :cond_96
    move-object p1, v4

    .line 361
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_6
.end method

.method private computeNewPriority()Lcom/squareup/picasso/Picasso$Priority;
    .registers 11

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 242
    sget-object v5, Lcom/squareup/picasso/Picasso$Priority;->LOW:Lcom/squareup/picasso/Picasso$Priority;

    .line 244
    .local v5, "newPriority":Lcom/squareup/picasso/Picasso$Priority;
    iget-object v9, p0, Lcom/squareup/picasso/BitmapHunter;->actions:Ljava/util/List;

    if-eqz v9, :cond_1c

    iget-object v9, p0, Lcom/squareup/picasso/BitmapHunter;->actions:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_1c

    move v2, v7

    .line 245
    .local v2, "hasMultiple":Z
    :goto_11
    iget-object v9, p0, Lcom/squareup/picasso/BitmapHunter;->action:Lcom/squareup/picasso/Action;

    if-nez v9, :cond_17

    if-eqz v2, :cond_1e

    :cond_17
    move v1, v7

    .line 248
    .local v1, "hasAny":Z
    :goto_18
    if-nez v1, :cond_20

    move-object v6, v5

    .line 266
    .end local v5    # "newPriority":Lcom/squareup/picasso/Picasso$Priority;
    .local v6, "newPriority":Lcom/squareup/picasso/Picasso$Priority;
    :goto_1b
    return-object v6

    .end local v1    # "hasAny":Z
    .end local v2    # "hasMultiple":Z
    .end local v6    # "newPriority":Lcom/squareup/picasso/Picasso$Priority;
    .restart local v5    # "newPriority":Lcom/squareup/picasso/Picasso$Priority;
    :cond_1c
    move v2, v8

    .line 244
    goto :goto_11

    .restart local v2    # "hasMultiple":Z
    :cond_1e
    move v1, v8

    .line 245
    goto :goto_18

    .line 252
    .restart local v1    # "hasAny":Z
    :cond_20
    iget-object v7, p0, Lcom/squareup/picasso/BitmapHunter;->action:Lcom/squareup/picasso/Action;

    if-eqz v7, :cond_2a

    .line 253
    iget-object v7, p0, Lcom/squareup/picasso/BitmapHunter;->action:Lcom/squareup/picasso/Action;

    invoke-virtual {v7}, Lcom/squareup/picasso/Action;->getPriority()Lcom/squareup/picasso/Picasso$Priority;

    move-result-object v5

    .line 256
    :cond_2a
    if-eqz v2, :cond_4f

    .line 258
    const/4 v3, 0x0

    .local v3, "i":I
    iget-object v7, p0, Lcom/squareup/picasso/BitmapHunter;->actions:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v4

    .local v4, "n":I
    :goto_33
    if-ge v3, v4, :cond_4f

    .line 259
    iget-object v7, p0, Lcom/squareup/picasso/BitmapHunter;->actions:Ljava/util/List;

    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/squareup/picasso/Action;

    invoke-virtual {v7}, Lcom/squareup/picasso/Action;->getPriority()Lcom/squareup/picasso/Picasso$Priority;

    move-result-object v0

    .line 260
    .local v0, "actionPriority":Lcom/squareup/picasso/Picasso$Priority;
    invoke-virtual {v0}, Lcom/squareup/picasso/Picasso$Priority;->ordinal()I

    move-result v7

    invoke-virtual {v5}, Lcom/squareup/picasso/Picasso$Priority;->ordinal()I

    move-result v8

    if-le v7, v8, :cond_4c

    .line 261
    move-object v5, v0

    .line 258
    :cond_4c
    add-int/lit8 v3, v3, 0x1

    goto :goto_33

    .end local v0    # "actionPriority":Lcom/squareup/picasso/Picasso$Priority;
    .end local v3    # "i":I
    .end local v4    # "n":I
    :cond_4f
    move-object v6, v5

    .line 266
    .end local v5    # "newPriority":Lcom/squareup/picasso/Picasso$Priority;
    .restart local v6    # "newPriority":Lcom/squareup/picasso/Picasso$Priority;
    goto :goto_1b
.end method

.method static forRequest(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Dispatcher;Lcom/squareup/picasso/Cache;Lcom/squareup/picasso/Stats;Lcom/squareup/picasso/Action;)Lcom/squareup/picasso/BitmapHunter;
    .registers 25
    .param p0, "picasso"    # Lcom/squareup/picasso/Picasso;
    .param p1, "dispatcher"    # Lcom/squareup/picasso/Dispatcher;
    .param p2, "cache"    # Lcom/squareup/picasso/Cache;
    .param p3, "stats"    # Lcom/squareup/picasso/Stats;
    .param p4, "action"    # Lcom/squareup/picasso/Action;

    .prologue
    .line 345
    invoke-virtual/range {p4 .. p4}, Lcom/squareup/picasso/Action;->getRequest()Lcom/squareup/picasso/Request;

    move-result-object v18

    .line 346
    .local v18, "request":Lcom/squareup/picasso/Request;
    invoke-virtual/range {p0 .. p0}, Lcom/squareup/picasso/Picasso;->getRequestHandlers()Ljava/util/List;

    move-result-object v19

    .line 350
    .local v19, "requestHandlers":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/picasso/RequestHandler;>;"
    const/16 v17, 0x0

    .local v17, "i":I
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v16

    .local v16, "count":I
    :goto_e
    move/from16 v0, v17

    move/from16 v1, v16

    if-ge v0, v1, :cond_39

    .line 351
    move-object/from16 v0, v19

    move/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/squareup/picasso/RequestHandler;

    .line 352
    .local v8, "requestHandler":Lcom/squareup/picasso/RequestHandler;
    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Lcom/squareup/picasso/RequestHandler;->canHandleRequest(Lcom/squareup/picasso/Request;)Z

    move-result v2

    if-eqz v2, :cond_36

    .line 353
    new-instance v2, Lcom/squareup/picasso/BitmapHunter;

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    invoke-direct/range {v2 .. v8}, Lcom/squareup/picasso/BitmapHunter;-><init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Dispatcher;Lcom/squareup/picasso/Cache;Lcom/squareup/picasso/Stats;Lcom/squareup/picasso/Action;Lcom/squareup/picasso/RequestHandler;)V

    .line 357
    .end local v8    # "requestHandler":Lcom/squareup/picasso/RequestHandler;
    :goto_35
    return-object v2

    .line 350
    .restart local v8    # "requestHandler":Lcom/squareup/picasso/RequestHandler;
    :cond_36
    add-int/lit8 v17, v17, 0x1

    goto :goto_e

    .line 357
    .end local v8    # "requestHandler":Lcom/squareup/picasso/RequestHandler;
    :cond_39
    new-instance v9, Lcom/squareup/picasso/BitmapHunter;

    sget-object v15, Lcom/squareup/picasso/BitmapHunter;->ERRORING_HANDLER:Lcom/squareup/picasso/RequestHandler;

    move-object/from16 v10, p0

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v13, p3

    move-object/from16 v14, p4

    invoke-direct/range {v9 .. v15}, Lcom/squareup/picasso/BitmapHunter;-><init>(Lcom/squareup/picasso/Picasso;Lcom/squareup/picasso/Dispatcher;Lcom/squareup/picasso/Cache;Lcom/squareup/picasso/Stats;Lcom/squareup/picasso/Action;Lcom/squareup/picasso/RequestHandler;)V

    move-object v2, v9

    goto :goto_35
.end method

.method static transformResult(Lcom/squareup/picasso/Request;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .registers 26
    .param p0, "data"    # Lcom/squareup/picasso/Request;
    .param p1, "result"    # Landroid/graphics/Bitmap;
    .param p2, "exifRotation"    # I

    .prologue
    .line 423
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v11

    .line 424
    .local v11, "inWidth":I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    .line 426
    .local v10, "inHeight":I
    const/4 v3, 0x0

    .line 427
    .local v3, "drawX":I
    const/4 v4, 0x0

    .line 428
    .local v4, "drawY":I
    move v5, v11

    .line 429
    .local v5, "drawWidth":I
    move v6, v10

    .line 431
    .local v6, "drawHeight":I
    new-instance v7, Landroid/graphics/Matrix;

    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 433
    .local v7, "matrix":Landroid/graphics/Matrix;
    invoke-virtual/range {p0 .. p0}, Lcom/squareup/picasso/Request;->needsMatrixTransform()Z

    move-result v2

    if-eqz v2, :cond_6f

    .line 434
    move-object/from16 v0, p0

    iget v0, v0, Lcom/squareup/picasso/Request;->targetWidth:I

    move/from16 v19, v0

    .line 435
    .local v19, "targetWidth":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/squareup/picasso/Request;->targetHeight:I

    move/from16 v17, v0

    .line 437
    .local v17, "targetHeight":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/squareup/picasso/Request;->rotationDegrees:F

    move/from16 v18, v0

    .line 438
    .local v18, "targetRotation":F
    const/4 v2, 0x0

    cmpl-float v2, v18, v2

    if-eqz v2, :cond_41

    .line 439
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/squareup/picasso/Request;->hasRotationPivot:Z

    if-eqz v2, :cond_88

    .line 440
    move-object/from16 v0, p0

    iget v2, v0, Lcom/squareup/picasso/Request;->rotationPivotX:F

    move-object/from16 v0, p0

    iget v8, v0, Lcom/squareup/picasso/Request;->rotationPivotY:F

    move/from16 v0, v18

    invoke-virtual {v7, v0, v2, v8}, Landroid/graphics/Matrix;->setRotate(FFF)V

    .line 446
    :cond_41
    :goto_41
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/squareup/picasso/Request;->centerCrop:Z

    if-eqz v2, :cond_a3

    .line 447
    move/from16 v0, v19

    int-to-float v2, v0

    int-to-float v8, v11

    div-float v20, v2, v8

    .line 448
    .local v20, "widthRatio":F
    move/from16 v0, v17

    int-to-float v2, v0

    int-to-float v8, v10

    div-float v9, v2, v8

    .line 450
    .local v9, "heightRatio":F
    cmpl-float v2, v20, v9

    if-lez v2, :cond_8e

    .line 451
    move/from16 v14, v20

    .line 452
    .local v14, "scale":F
    int-to-float v2, v10

    div-float v8, v9, v20

    mul-float/2addr v2, v8

    float-to-double v0, v2

    move-wide/from16 v21, v0

    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v21

    move-wide/from16 v0, v21

    double-to-int v13, v0

    .line 453
    .local v13, "newSize":I
    sub-int v2, v10, v13

    div-int/lit8 v4, v2, 0x2

    .line 454
    move v6, v13

    .line 461
    :goto_6c
    invoke-virtual {v7, v14, v14}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 480
    .end local v9    # "heightRatio":F
    .end local v13    # "newSize":I
    .end local v14    # "scale":F
    .end local v17    # "targetHeight":I
    .end local v18    # "targetRotation":F
    .end local v19    # "targetWidth":I
    .end local v20    # "widthRatio":F
    :cond_6f
    :goto_6f
    if-eqz p2, :cond_77

    .line 481
    move/from16 v0, p2

    int-to-float v2, v0

    invoke-virtual {v7, v2}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 484
    :cond_77
    const/4 v8, 0x1

    move-object/from16 v2, p1

    .line 485
    invoke-static/range {v2 .. v8}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v12

    .line 486
    .local v12, "newResult":Landroid/graphics/Bitmap;
    move-object/from16 v0, p1

    if-eq v12, v0, :cond_87

    .line 487
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 488
    move-object/from16 p1, v12

    .line 491
    :cond_87
    return-object p1

    .line 442
    .end local v12    # "newResult":Landroid/graphics/Bitmap;
    .restart local v17    # "targetHeight":I
    .restart local v18    # "targetRotation":F
    .restart local v19    # "targetWidth":I
    :cond_88
    move/from16 v0, v18

    invoke-virtual {v7, v0}, Landroid/graphics/Matrix;->setRotate(F)V

    goto :goto_41

    .line 456
    .restart local v9    # "heightRatio":F
    .restart local v20    # "widthRatio":F
    :cond_8e
    move v14, v9

    .line 457
    .restart local v14    # "scale":F
    int-to-float v2, v11

    div-float v8, v20, v9

    mul-float/2addr v2, v8

    float-to-double v0, v2

    move-wide/from16 v21, v0

    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v21

    move-wide/from16 v0, v21

    double-to-int v13, v0

    .line 458
    .restart local v13    # "newSize":I
    sub-int v2, v11, v13

    div-int/lit8 v3, v2, 0x2

    .line 459
    move v5, v13

    goto :goto_6c

    .line 462
    .end local v9    # "heightRatio":F
    .end local v13    # "newSize":I
    .end local v14    # "scale":F
    .end local v20    # "widthRatio":F
    :cond_a3
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/squareup/picasso/Request;->centerInside:Z

    if-eqz v2, :cond_c1

    .line 463
    move/from16 v0, v19

    int-to-float v2, v0

    int-to-float v8, v11

    div-float v20, v2, v8

    .line 464
    .restart local v20    # "widthRatio":F
    move/from16 v0, v17

    int-to-float v2, v0

    int-to-float v8, v10

    div-float v9, v2, v8

    .line 465
    .restart local v9    # "heightRatio":F
    cmpg-float v2, v20, v9

    if-gez v2, :cond_bf

    move/from16 v14, v20

    .line 466
    .restart local v14    # "scale":F
    :goto_bb
    invoke-virtual {v7, v14, v14}, Landroid/graphics/Matrix;->preScale(FF)Z

    goto :goto_6f

    .end local v14    # "scale":F
    :cond_bf
    move v14, v9

    .line 465
    goto :goto_bb

    .line 467
    .end local v9    # "heightRatio":F
    .end local v20    # "widthRatio":F
    :cond_c1
    if-nez v19, :cond_c5

    if-eqz v17, :cond_6f

    :cond_c5
    move/from16 v0, v19

    if-ne v0, v11, :cond_cd

    move/from16 v0, v17

    if-eq v0, v10, :cond_6f

    .line 472
    :cond_cd
    if-eqz v19, :cond_e3

    move/from16 v0, v19

    int-to-float v2, v0

    int-to-float v8, v11

    div-float v15, v2, v8

    .line 474
    .local v15, "sx":F
    :goto_d5
    if-eqz v17, :cond_ea

    move/from16 v0, v17

    int-to-float v2, v0

    int-to-float v8, v10

    div-float v16, v2, v8

    .line 476
    .local v16, "sy":F
    :goto_dd
    move/from16 v0, v16

    invoke-virtual {v7, v15, v0}, Landroid/graphics/Matrix;->preScale(FF)Z

    goto :goto_6f

    .line 472
    .end local v15    # "sx":F
    .end local v16    # "sy":F
    :cond_e3
    move/from16 v0, v17

    int-to-float v2, v0

    int-to-float v8, v10

    div-float v15, v2, v8

    goto :goto_d5

    .line 474
    .restart local v15    # "sx":F
    :cond_ea
    move/from16 v0, v19

    int-to-float v2, v0

    int-to-float v8, v11

    div-float v16, v2, v8

    goto :goto_dd
.end method

.method static updateThreadName(Lcom/squareup/picasso/Request;)V
    .registers 5
    .param p0, "data"    # Lcom/squareup/picasso/Request;

    .prologue
    .line 334
    invoke-virtual {p0}, Lcom/squareup/picasso/Request;->getName()Ljava/lang/String;

    move-result-object v1

    .line 336
    .local v1, "name":Ljava/lang/String;
    sget-object v2, Lcom/squareup/picasso/BitmapHunter;->NAME_BUILDER:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/StringBuilder;

    .line 337
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v2, "Picasso-"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->ensureCapacity(I)V

    .line 338
    const-string v2, "Picasso-"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    invoke-virtual {v0, v2, v3, v1}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 341
    return-void
.end method


# virtual methods
.method attach(Lcom/squareup/picasso/Action;)V
    .registers 9
    .param p1, "action"    # Lcom/squareup/picasso/Action;

    .prologue
    .line 190
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->picasso:Lcom/squareup/picasso/Picasso;

    iget-boolean v1, v3, Lcom/squareup/picasso/Picasso;->loggingEnabled:Z

    .line 191
    .local v1, "loggingEnabled":Z
    iget-object v2, p1, Lcom/squareup/picasso/Action;->request:Lcom/squareup/picasso/Request;

    .line 193
    .local v2, "request":Lcom/squareup/picasso/Request;
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->action:Lcom/squareup/picasso/Action;

    if-nez v3, :cond_3a

    .line 194
    iput-object p1, p0, Lcom/squareup/picasso/BitmapHunter;->action:Lcom/squareup/picasso/Action;

    .line 195
    if-eqz v1, :cond_27

    .line 196
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->actions:Ljava/util/List;

    if-eqz v3, :cond_1a

    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->actions:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_28

    .line 197
    :cond_1a
    const-string v3, "Hunter"

    const-string v4, "joined"

    invoke-virtual {v2}, Lcom/squareup/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "to empty hunter"

    invoke-static {v3, v4, v5, v6}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    :cond_27
    :goto_27
    return-void

    .line 199
    :cond_28
    const-string v3, "Hunter"

    const-string v4, "joined"

    invoke-virtual {v2}, Lcom/squareup/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "to "

    invoke-static {p0, v6}, Lcom/squareup/picasso/Utils;->getLogIdsForHunter(Lcom/squareup/picasso/BitmapHunter;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v4, v5, v6}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_27

    .line 205
    :cond_3a
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->actions:Ljava/util/List;

    if-nez v3, :cond_46

    .line 206
    new-instance v3, Ljava/util/ArrayList;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->actions:Ljava/util/List;

    .line 209
    :cond_46
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->actions:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    if-eqz v1, :cond_5e

    .line 212
    const-string v3, "Hunter"

    const-string v4, "joined"

    invoke-virtual {v2}, Lcom/squareup/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "to "

    invoke-static {p0, v6}, Lcom/squareup/picasso/Utils;->getLogIdsForHunter(Lcom/squareup/picasso/BitmapHunter;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v4, v5, v6}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    :cond_5e
    invoke-virtual {p1}, Lcom/squareup/picasso/Action;->getPriority()Lcom/squareup/picasso/Picasso$Priority;

    move-result-object v0

    .line 216
    .local v0, "actionPriority":Lcom/squareup/picasso/Picasso$Priority;
    invoke-virtual {v0}, Lcom/squareup/picasso/Picasso$Priority;->ordinal()I

    move-result v3

    iget-object v4, p0, Lcom/squareup/picasso/BitmapHunter;->priority:Lcom/squareup/picasso/Picasso$Priority;

    invoke-virtual {v4}, Lcom/squareup/picasso/Picasso$Priority;->ordinal()I

    move-result v4

    if-le v3, v4, :cond_27

    .line 217
    iput-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->priority:Lcom/squareup/picasso/Picasso$Priority;

    goto :goto_27
.end method

.method cancel()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 270
    iget-object v1, p0, Lcom/squareup/picasso/BitmapHunter;->action:Lcom/squareup/picasso/Action;

    if-nez v1, :cond_1e

    iget-object v1, p0, Lcom/squareup/picasso/BitmapHunter;->actions:Ljava/util/List;

    if-eqz v1, :cond_11

    iget-object v1, p0, Lcom/squareup/picasso/BitmapHunter;->actions:Ljava/util/List;

    .line 271
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1e

    :cond_11
    iget-object v1, p0, Lcom/squareup/picasso/BitmapHunter;->future:Ljava/util/concurrent/Future;

    if-eqz v1, :cond_1e

    iget-object v1, p0, Lcom/squareup/picasso/BitmapHunter;->future:Ljava/util/concurrent/Future;

    .line 273
    invoke-interface {v1, v0}, Ljava/util/concurrent/Future;->cancel(Z)Z

    move-result v1

    if-eqz v1, :cond_1e

    const/4 v0, 0x1

    :cond_1e
    return v0
.end method

.method detach(Lcom/squareup/picasso/Action;)V
    .registers 7
    .param p1, "action"    # Lcom/squareup/picasso/Action;

    .prologue
    .line 222
    const/4 v0, 0x0

    .line 223
    .local v0, "detached":Z
    iget-object v1, p0, Lcom/squareup/picasso/BitmapHunter;->action:Lcom/squareup/picasso/Action;

    if-ne v1, p1, :cond_33

    .line 224
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/squareup/picasso/BitmapHunter;->action:Lcom/squareup/picasso/Action;

    .line 225
    const/4 v0, 0x1

    .line 232
    :cond_9
    :goto_9
    if-eqz v0, :cond_19

    invoke-virtual {p1}, Lcom/squareup/picasso/Action;->getPriority()Lcom/squareup/picasso/Picasso$Priority;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/picasso/BitmapHunter;->priority:Lcom/squareup/picasso/Picasso$Priority;

    if-ne v1, v2, :cond_19

    .line 233
    invoke-direct {p0}, Lcom/squareup/picasso/BitmapHunter;->computeNewPriority()Lcom/squareup/picasso/Picasso$Priority;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/picasso/BitmapHunter;->priority:Lcom/squareup/picasso/Picasso$Priority;

    .line 236
    :cond_19
    iget-object v1, p0, Lcom/squareup/picasso/BitmapHunter;->picasso:Lcom/squareup/picasso/Picasso;

    iget-boolean v1, v1, Lcom/squareup/picasso/Picasso;->loggingEnabled:Z

    if-eqz v1, :cond_32

    .line 237
    const-string v1, "Hunter"

    const-string v2, "removed"

    iget-object v3, p1, Lcom/squareup/picasso/Action;->request:Lcom/squareup/picasso/Request;

    invoke-virtual {v3}, Lcom/squareup/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v3

    const-string v4, "from "

    invoke-static {p0, v4}, Lcom/squareup/picasso/Utils;->getLogIdsForHunter(Lcom/squareup/picasso/BitmapHunter;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    :cond_32
    return-void

    .line 226
    :cond_33
    iget-object v1, p0, Lcom/squareup/picasso/BitmapHunter;->actions:Ljava/util/List;

    if-eqz v1, :cond_9

    .line 227
    iget-object v1, p0, Lcom/squareup/picasso/BitmapHunter;->actions:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_9
.end method

.method getAction()Lcom/squareup/picasso/Action;
    .registers 2

    .prologue
    .line 310
    iget-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->action:Lcom/squareup/picasso/Action;

    return-object v0
.end method

.method getActions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/picasso/Action;",
            ">;"
        }
    .end annotation

    .prologue
    .line 318
    iget-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->actions:Ljava/util/List;

    return-object v0
.end method

.method getData()Lcom/squareup/picasso/Request;
    .registers 2

    .prologue
    .line 306
    iget-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->data:Lcom/squareup/picasso/Request;

    return-object v0
.end method

.method getException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 322
    iget-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 302
    iget-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->key:Ljava/lang/String;

    return-object v0
.end method

.method getLoadedFrom()Lcom/squareup/picasso/Picasso$LoadedFrom;
    .registers 2

    .prologue
    .line 326
    iget-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->loadedFrom:Lcom/squareup/picasso/Picasso$LoadedFrom;

    return-object v0
.end method

.method getPicasso()Lcom/squareup/picasso/Picasso;
    .registers 2

    .prologue
    .line 314
    iget-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->picasso:Lcom/squareup/picasso/Picasso;

    return-object v0
.end method

.method getPriority()Lcom/squareup/picasso/Picasso$Priority;
    .registers 2

    .prologue
    .line 330
    iget-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->priority:Lcom/squareup/picasso/Picasso$Priority;

    return-object v0
.end method

.method getResult()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 298
    iget-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->result:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method hunt()Landroid/graphics/Bitmap;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    const/4 v0, 0x0

    .line 140
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-boolean v3, p0, Lcom/squareup/picasso/BitmapHunter;->skipMemoryCache:Z

    if-nez v3, :cond_2f

    .line 141
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->cache:Lcom/squareup/picasso/Cache;

    iget-object v4, p0, Lcom/squareup/picasso/BitmapHunter;->key:Ljava/lang/String;

    invoke-interface {v3, v4}, Lcom/squareup/picasso/Cache;->get(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 142
    if-eqz v0, :cond_2f

    .line 143
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->stats:Lcom/squareup/picasso/Stats;

    invoke-virtual {v3}, Lcom/squareup/picasso/Stats;->dispatchCacheHit()V

    .line 144
    sget-object v3, Lcom/squareup/picasso/Picasso$LoadedFrom;->MEMORY:Lcom/squareup/picasso/Picasso$LoadedFrom;

    iput-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->loadedFrom:Lcom/squareup/picasso/Picasso$LoadedFrom;

    .line 145
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->picasso:Lcom/squareup/picasso/Picasso;

    iget-boolean v3, v3, Lcom/squareup/picasso/Picasso;->loggingEnabled:Z

    if-eqz v3, :cond_2d

    .line 146
    const-string v3, "Hunter"

    const-string v4, "decoded"

    iget-object v5, p0, Lcom/squareup/picasso/BitmapHunter;->data:Lcom/squareup/picasso/Request;

    invoke-virtual {v5}, Lcom/squareup/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "from cache"

    invoke-static {v3, v4, v5, v6}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_2d
    move-object v1, v0

    .line 186
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    :goto_2e
    return-object v1

    .line 152
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_2f
    iget-object v4, p0, Lcom/squareup/picasso/BitmapHunter;->data:Lcom/squareup/picasso/Request;

    iget v3, p0, Lcom/squareup/picasso/BitmapHunter;->retryCount:I

    if-nez v3, :cond_d2

    const/4 v3, 0x1

    :goto_36
    iput-boolean v3, v4, Lcom/squareup/picasso/Request;->loadFromLocalCacheOnly:Z

    .line 153
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->requestHandler:Lcom/squareup/picasso/RequestHandler;

    iget-object v4, p0, Lcom/squareup/picasso/BitmapHunter;->data:Lcom/squareup/picasso/Request;

    invoke-virtual {v3, v4}, Lcom/squareup/picasso/RequestHandler;->load(Lcom/squareup/picasso/Request;)Lcom/squareup/picasso/RequestHandler$Result;

    move-result-object v2

    .line 154
    .local v2, "result":Lcom/squareup/picasso/RequestHandler$Result;
    if-eqz v2, :cond_52

    .line 155
    invoke-virtual {v2}, Lcom/squareup/picasso/RequestHandler$Result;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 156
    invoke-virtual {v2}, Lcom/squareup/picasso/RequestHandler$Result;->getLoadedFrom()Lcom/squareup/picasso/Picasso$LoadedFrom;

    move-result-object v3

    iput-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->loadedFrom:Lcom/squareup/picasso/Picasso$LoadedFrom;

    .line 157
    invoke-virtual {v2}, Lcom/squareup/picasso/RequestHandler$Result;->getExifOrientation()I

    move-result v3

    iput v3, p0, Lcom/squareup/picasso/BitmapHunter;->exifRotation:I

    .line 160
    :cond_52
    if-eqz v0, :cond_cf

    .line 161
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->picasso:Lcom/squareup/picasso/Picasso;

    iget-boolean v3, v3, Lcom/squareup/picasso/Picasso;->loggingEnabled:Z

    if-eqz v3, :cond_67

    .line 162
    const-string v3, "Hunter"

    const-string v4, "decoded"

    iget-object v5, p0, Lcom/squareup/picasso/BitmapHunter;->data:Lcom/squareup/picasso/Request;

    invoke-virtual {v5}, Lcom/squareup/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    :cond_67
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->stats:Lcom/squareup/picasso/Stats;

    invoke-virtual {v3, v0}, Lcom/squareup/picasso/Stats;->dispatchBitmapDecoded(Landroid/graphics/Bitmap;)V

    .line 165
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->data:Lcom/squareup/picasso/Request;

    invoke-virtual {v3}, Lcom/squareup/picasso/Request;->needsTransformation()Z

    move-result v3

    if-nez v3, :cond_78

    iget v3, p0, Lcom/squareup/picasso/BitmapHunter;->exifRotation:I

    if-eqz v3, :cond_cf

    .line 166
    :cond_78
    sget-object v4, Lcom/squareup/picasso/BitmapHunter;->DECODE_LOCK:Ljava/lang/Object;

    monitor-enter v4

    .line 167
    :try_start_7b
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->data:Lcom/squareup/picasso/Request;

    invoke-virtual {v3}, Lcom/squareup/picasso/Request;->needsMatrixTransform()Z

    move-result v3

    if-nez v3, :cond_87

    iget v3, p0, Lcom/squareup/picasso/BitmapHunter;->exifRotation:I

    if-eqz v3, :cond_a2

    .line 168
    :cond_87
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->data:Lcom/squareup/picasso/Request;

    iget v5, p0, Lcom/squareup/picasso/BitmapHunter;->exifRotation:I

    invoke-static {v3, v0, v5}, Lcom/squareup/picasso/BitmapHunter;->transformResult(Lcom/squareup/picasso/Request;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 169
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->picasso:Lcom/squareup/picasso/Picasso;

    iget-boolean v3, v3, Lcom/squareup/picasso/Picasso;->loggingEnabled:Z

    if-eqz v3, :cond_a2

    .line 170
    const-string v3, "Hunter"

    const-string v5, "transformed"

    iget-object v6, p0, Lcom/squareup/picasso/BitmapHunter;->data:Lcom/squareup/picasso/Request;

    invoke-virtual {v6}, Lcom/squareup/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v5, v6}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    :cond_a2
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->data:Lcom/squareup/picasso/Request;

    invoke-virtual {v3}, Lcom/squareup/picasso/Request;->hasCustomTransformations()Z

    move-result v3

    if-eqz v3, :cond_c7

    .line 174
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->data:Lcom/squareup/picasso/Request;

    iget-object v3, v3, Lcom/squareup/picasso/Request;->transformations:Ljava/util/List;

    invoke-static {v3, v0}, Lcom/squareup/picasso/BitmapHunter;->applyCustomTransformations(Ljava/util/List;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 175
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->picasso:Lcom/squareup/picasso/Picasso;

    iget-boolean v3, v3, Lcom/squareup/picasso/Picasso;->loggingEnabled:Z

    if-eqz v3, :cond_c7

    .line 176
    const-string v3, "Hunter"

    const-string v5, "transformed"

    iget-object v6, p0, Lcom/squareup/picasso/BitmapHunter;->data:Lcom/squareup/picasso/Request;

    invoke-virtual {v6}, Lcom/squareup/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v6

    const-string v7, "from custom transformations"

    invoke-static {v3, v5, v6, v7}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    :cond_c7
    monitor-exit v4
    :try_end_c8
    .catchall {:try_start_7b .. :try_end_c8} :catchall_d5

    .line 180
    if-eqz v0, :cond_cf

    .line 181
    iget-object v3, p0, Lcom/squareup/picasso/BitmapHunter;->stats:Lcom/squareup/picasso/Stats;

    invoke-virtual {v3, v0}, Lcom/squareup/picasso/Stats;->dispatchBitmapTransformed(Landroid/graphics/Bitmap;)V

    :cond_cf
    move-object v1, v0

    .line 186
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v1    # "bitmap":Landroid/graphics/Bitmap;
    goto/16 :goto_2e

    .line 152
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "result":Lcom/squareup/picasso/RequestHandler$Result;
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_d2
    const/4 v3, 0x0

    goto/16 :goto_36

    .line 179
    .restart local v2    # "result":Lcom/squareup/picasso/RequestHandler$Result;
    :catchall_d5
    move-exception v3

    :try_start_d6
    monitor-exit v4
    :try_end_d7
    .catchall {:try_start_d6 .. :try_end_d7} :catchall_d5

    throw v3
.end method

.method isCancelled()Z
    .registers 2

    .prologue
    .line 277
    iget-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->future:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->future:Ljava/util/concurrent/Future;

    invoke-interface {v0}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public run()V
    .registers 6

    .prologue
    .line 105
    :try_start_0
    iget-object v2, p0, Lcom/squareup/picasso/BitmapHunter;->data:Lcom/squareup/picasso/Request;

    invoke-static {v2}, Lcom/squareup/picasso/BitmapHunter;->updateThreadName(Lcom/squareup/picasso/Request;)V

    .line 107
    iget-object v2, p0, Lcom/squareup/picasso/BitmapHunter;->picasso:Lcom/squareup/picasso/Picasso;

    iget-boolean v2, v2, Lcom/squareup/picasso/Picasso;->loggingEnabled:Z

    if-eqz v2, :cond_16

    .line 108
    const-string v2, "Hunter"

    const-string v3, "executing"

    invoke-static {p0}, Lcom/squareup/picasso/Utils;->getLogIdsForHunter(Lcom/squareup/picasso/BitmapHunter;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/squareup/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    :cond_16
    invoke-virtual {p0}, Lcom/squareup/picasso/BitmapHunter;->hunt()Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/squareup/picasso/BitmapHunter;->result:Landroid/graphics/Bitmap;

    .line 113
    iget-object v2, p0, Lcom/squareup/picasso/BitmapHunter;->result:Landroid/graphics/Bitmap;

    if-nez v2, :cond_2f

    .line 114
    iget-object v2, p0, Lcom/squareup/picasso/BitmapHunter;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v2, p0}, Lcom/squareup/picasso/Dispatcher;->dispatchFailed(Lcom/squareup/picasso/BitmapHunter;)V
    :try_end_25
    .catch Lcom/squareup/picasso/Downloader$ResponseException; {:try_start_0 .. :try_end_25} :catch_35
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_25} :catch_47
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_25} :catch_59
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_25} :catch_87
    .catchall {:try_start_0 .. :try_end_25} :catchall_99

    .line 133
    :goto_25
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    const-string v3, "Picasso-Idle"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 135
    :goto_2e
    return-void

    .line 116
    :cond_2f
    :try_start_2f
    iget-object v2, p0, Lcom/squareup/picasso/BitmapHunter;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v2, p0}, Lcom/squareup/picasso/Dispatcher;->dispatchComplete(Lcom/squareup/picasso/BitmapHunter;)V
    :try_end_34
    .catch Lcom/squareup/picasso/Downloader$ResponseException; {:try_start_2f .. :try_end_34} :catch_35
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_34} :catch_47
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2f .. :try_end_34} :catch_59
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_34} :catch_87
    .catchall {:try_start_2f .. :try_end_34} :catchall_99

    goto :goto_25

    .line 118
    :catch_35
    move-exception v0

    .line 119
    .local v0, "e":Lcom/squareup/picasso/Downloader$ResponseException;
    :try_start_36
    iput-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->exception:Ljava/lang/Exception;

    .line 120
    iget-object v2, p0, Lcom/squareup/picasso/BitmapHunter;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v2, p0}, Lcom/squareup/picasso/Dispatcher;->dispatchFailed(Lcom/squareup/picasso/BitmapHunter;)V
    :try_end_3d
    .catchall {:try_start_36 .. :try_end_3d} :catchall_99

    .line 133
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    const-string v3, "Picasso-Idle"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto :goto_2e

    .line 121
    .end local v0    # "e":Lcom/squareup/picasso/Downloader$ResponseException;
    :catch_47
    move-exception v0

    .line 122
    .local v0, "e":Ljava/io/IOException;
    :try_start_48
    iput-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->exception:Ljava/lang/Exception;

    .line 123
    iget-object v2, p0, Lcom/squareup/picasso/BitmapHunter;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v2, p0}, Lcom/squareup/picasso/Dispatcher;->dispatchRetry(Lcom/squareup/picasso/BitmapHunter;)V
    :try_end_4f
    .catchall {:try_start_48 .. :try_end_4f} :catchall_99

    .line 133
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    const-string v3, "Picasso-Idle"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto :goto_2e

    .line 124
    .end local v0    # "e":Ljava/io/IOException;
    :catch_59
    move-exception v0

    .line 125
    .local v0, "e":Ljava/lang/OutOfMemoryError;
    :try_start_5a
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 126
    .local v1, "writer":Ljava/io/StringWriter;
    iget-object v2, p0, Lcom/squareup/picasso/BitmapHunter;->stats:Lcom/squareup/picasso/Stats;

    invoke-virtual {v2}, Lcom/squareup/picasso/Stats;->createSnapshot()Lcom/squareup/picasso/StatsSnapshot;

    move-result-object v2

    new-instance v3, Ljava/io/PrintWriter;

    invoke-direct {v3, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {v2, v3}, Lcom/squareup/picasso/StatsSnapshot;->dump(Ljava/io/PrintWriter;)V

    .line 127
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput-object v2, p0, Lcom/squareup/picasso/BitmapHunter;->exception:Ljava/lang/Exception;

    .line 128
    iget-object v2, p0, Lcom/squareup/picasso/BitmapHunter;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v2, p0}, Lcom/squareup/picasso/Dispatcher;->dispatchFailed(Lcom/squareup/picasso/BitmapHunter;)V
    :try_end_7d
    .catchall {:try_start_5a .. :try_end_7d} :catchall_99

    .line 133
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    const-string v3, "Picasso-Idle"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto :goto_2e

    .line 129
    .end local v0    # "e":Ljava/lang/OutOfMemoryError;
    .end local v1    # "writer":Ljava/io/StringWriter;
    :catch_87
    move-exception v0

    .line 130
    .local v0, "e":Ljava/lang/Exception;
    :try_start_88
    iput-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->exception:Ljava/lang/Exception;

    .line 131
    iget-object v2, p0, Lcom/squareup/picasso/BitmapHunter;->dispatcher:Lcom/squareup/picasso/Dispatcher;

    invoke-virtual {v2, p0}, Lcom/squareup/picasso/Dispatcher;->dispatchFailed(Lcom/squareup/picasso/BitmapHunter;)V
    :try_end_8f
    .catchall {:try_start_88 .. :try_end_8f} :catchall_99

    .line 133
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    const-string v3, "Picasso-Idle"

    invoke-virtual {v2, v3}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto :goto_2e

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_99
    move-exception v2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    const-string v4, "Picasso-Idle"

    invoke-virtual {v3, v4}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    throw v2
.end method

.method shouldRetry(ZLandroid/net/NetworkInfo;)Z
    .registers 6
    .param p1, "airplaneMode"    # Z
    .param p2, "info"    # Landroid/net/NetworkInfo;

    .prologue
    const/4 v1, 0x0

    .line 285
    iget v2, p0, Lcom/squareup/picasso/BitmapHunter;->retryCount:I

    if-lez v2, :cond_9

    const/4 v0, 0x1

    .line 286
    .local v0, "hasRetries":Z
    :goto_6
    if-nez v0, :cond_b

    .line 290
    :goto_8
    return v1

    .end local v0    # "hasRetries":Z
    :cond_9
    move v0, v1

    .line 285
    goto :goto_6

    .line 289
    .restart local v0    # "hasRetries":Z
    :cond_b
    iget v1, p0, Lcom/squareup/picasso/BitmapHunter;->retryCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/squareup/picasso/BitmapHunter;->retryCount:I

    .line 290
    iget-object v1, p0, Lcom/squareup/picasso/BitmapHunter;->requestHandler:Lcom/squareup/picasso/RequestHandler;

    invoke-virtual {v1, p1, p2}, Lcom/squareup/picasso/RequestHandler;->shouldRetry(ZLandroid/net/NetworkInfo;)Z

    move-result v1

    goto :goto_8
.end method

.method shouldSkipMemoryCache()Z
    .registers 2

    .prologue
    .line 281
    iget-boolean v0, p0, Lcom/squareup/picasso/BitmapHunter;->skipMemoryCache:Z

    return v0
.end method

.method supportsReplay()Z
    .registers 2

    .prologue
    .line 294
    iget-object v0, p0, Lcom/squareup/picasso/BitmapHunter;->requestHandler:Lcom/squareup/picasso/RequestHandler;

    invoke-virtual {v0}, Lcom/squareup/picasso/RequestHandler;->supportsReplay()Z

    move-result v0

    return v0
.end method
