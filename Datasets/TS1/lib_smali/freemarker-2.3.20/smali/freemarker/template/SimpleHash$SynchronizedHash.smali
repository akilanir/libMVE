.class Lfreemarker/template/SimpleHash$SynchronizedHash;
.super Lfreemarker/template/SimpleHash;
.source "SimpleHash.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/template/SimpleHash;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SynchronizedHash"
.end annotation


# instance fields
.field private final this$0:Lfreemarker/template/SimpleHash;


# direct methods
.method private constructor <init>(Lfreemarker/template/SimpleHash;)V
    .registers 2

    .prologue
    .line 326
    invoke-direct {p0}, Lfreemarker/template/SimpleHash;-><init>()V

    iput-object p1, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    return-void
.end method

.method constructor <init>(Lfreemarker/template/SimpleHash;Lfreemarker/template/SimpleHash$1;)V
    .registers 3
    .param p1, "x0"    # Lfreemarker/template/SimpleHash;
    .param p2, "x1"    # Lfreemarker/template/SimpleHash$1;

    .prologue
    .line 326
    invoke-direct {p0, p1}, Lfreemarker/template/SimpleHash$SynchronizedHash;-><init>(Lfreemarker/template/SimpleHash;)V

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 341
    iget-object v1, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    monitor-enter v1

    .line 342
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    invoke-virtual {v0, p1}, Lfreemarker/template/SimpleHash;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 343
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public isEmpty()Z
    .registers 3

    .prologue
    .line 329
    iget-object v1, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    monitor-enter v1

    .line 330
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    invoke-virtual {v0}, Lfreemarker/template/SimpleHash;->isEmpty()Z

    move-result v0

    monitor-exit v1

    return v0

    .line 331
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 3

    .prologue
    .line 359
    iget-object v1, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    monitor-enter v1

    .line 360
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    invoke-virtual {v0}, Lfreemarker/template/SimpleHash;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 361
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 335
    iget-object v1, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    monitor-enter v1

    .line 336
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    invoke-virtual {v0, p1, p2}, Lfreemarker/template/SimpleHash;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 337
    monitor-exit v1

    .line 338
    return-void

    .line 337
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public remove(Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 347
    iget-object v1, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    monitor-enter v1

    .line 348
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    invoke-virtual {v0, p1}, Lfreemarker/template/SimpleHash;->remove(Ljava/lang/String;)V

    .line 349
    monitor-exit v1

    .line 350
    return-void

    .line 349
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public size()I
    .registers 3

    .prologue
    .line 353
    iget-object v1, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    monitor-enter v1

    .line 354
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    invoke-virtual {v0}, Lfreemarker/template/SimpleHash;->size()I

    move-result v0

    monitor-exit v1

    return v0

    .line 355
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public toMap()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 371
    iget-object v1, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    monitor-enter v1

    .line 372
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    invoke-virtual {v0}, Lfreemarker/template/SimpleHash;->toMap()Ljava/util/Map;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 373
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 3

    .prologue
    .line 365
    iget-object v1, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    monitor-enter v1

    .line 366
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/SimpleHash$SynchronizedHash;->this$0:Lfreemarker/template/SimpleHash;

    invoke-virtual {v0}, Lfreemarker/template/SimpleHash;->values()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 367
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method
