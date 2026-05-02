.class Lfreemarker/template/SimpleSequence$SynchronizedSequence;
.super Lfreemarker/template/SimpleSequence;
.source "SimpleSequence.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/template/SimpleSequence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SynchronizedSequence"
.end annotation


# instance fields
.field private final this$0:Lfreemarker/template/SimpleSequence;


# direct methods
.method private constructor <init>(Lfreemarker/template/SimpleSequence;)V
    .registers 2

    .prologue
    .line 256
    invoke-direct {p0}, Lfreemarker/template/SimpleSequence;-><init>()V

    iput-object p1, p0, Lfreemarker/template/SimpleSequence$SynchronizedSequence;->this$0:Lfreemarker/template/SimpleSequence;

    return-void
.end method

.method constructor <init>(Lfreemarker/template/SimpleSequence;Lfreemarker/template/SimpleSequence$1;)V
    .registers 3
    .param p1, "x0"    # Lfreemarker/template/SimpleSequence;
    .param p2, "x1"    # Lfreemarker/template/SimpleSequence$1;

    .prologue
    .line 256
    invoke-direct {p0, p1}, Lfreemarker/template/SimpleSequence$SynchronizedSequence;-><init>(Lfreemarker/template/SimpleSequence;)V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 259
    iget-object v1, p0, Lfreemarker/template/SimpleSequence$SynchronizedSequence;->this$0:Lfreemarker/template/SimpleSequence;

    monitor-enter v1

    .line 260
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/SimpleSequence$SynchronizedSequence;->this$0:Lfreemarker/template/SimpleSequence;

    invoke-virtual {v0, p1}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V

    .line 261
    monitor-exit v1

    .line 262
    return-void

    .line 261
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 265
    iget-object v1, p0, Lfreemarker/template/SimpleSequence$SynchronizedSequence;->this$0:Lfreemarker/template/SimpleSequence;

    monitor-enter v1

    .line 266
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/SimpleSequence$SynchronizedSequence;->this$0:Lfreemarker/template/SimpleSequence;

    invoke-virtual {v0, p1}, Lfreemarker/template/SimpleSequence;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 267
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public size()I
    .registers 3

    .prologue
    .line 271
    iget-object v1, p0, Lfreemarker/template/SimpleSequence$SynchronizedSequence;->this$0:Lfreemarker/template/SimpleSequence;

    monitor-enter v1

    .line 272
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/SimpleSequence$SynchronizedSequence;->this$0:Lfreemarker/template/SimpleSequence;

    invoke-virtual {v0}, Lfreemarker/template/SimpleSequence;->size()I

    move-result v0

    monitor-exit v1

    return v0

    .line 273
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public toList()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 276
    iget-object v1, p0, Lfreemarker/template/SimpleSequence$SynchronizedSequence;->this$0:Lfreemarker/template/SimpleSequence;

    monitor-enter v1

    .line 277
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/SimpleSequence$SynchronizedSequence;->this$0:Lfreemarker/template/SimpleSequence;

    invoke-virtual {v0}, Lfreemarker/template/SimpleSequence;->toList()Ljava/util/List;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 278
    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method
