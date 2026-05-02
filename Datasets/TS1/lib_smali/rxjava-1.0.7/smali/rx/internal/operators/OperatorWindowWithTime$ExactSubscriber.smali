.class final Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;
.super Lrx/Subscriber;
.source "OperatorWindowWithTime.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorWindowWithTime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ExactSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/Subscriber",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final child:Lrx/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Subscriber",
            "<-",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field emitting:Z

.field final guard:Ljava/lang/Object;

.field queue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field volatile state:Lrx/internal/operators/OperatorWindowWithTime$State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorWindowWithTime$State",
            "<TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lrx/internal/operators/OperatorWindowWithTime;

.field final worker:Lrx/Scheduler$Worker;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorWindowWithTime;Lrx/Subscriber;Lrx/Scheduler$Worker;)V
    .registers 5
    .param p3, "worker"    # Lrx/Scheduler$Worker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lrx/Observable",
            "<TT;>;>;",
            "Lrx/Scheduler$Worker;",
            ")V"
        }
    .end annotation

    .prologue
    .line 120
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    .local p2, "child":Lrx/Subscriber;, "Lrx/Subscriber<-Lrx/Observable<TT;>;>;"
    iput-object p1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    .line 121
    invoke-direct {p0, p2}, Lrx/Subscriber;-><init>(Lrx/Subscriber;)V

    .line 122
    new-instance v0, Lrx/observers/SerializedSubscriber;

    invoke-direct {v0, p2}, Lrx/observers/SerializedSubscriber;-><init>(Lrx/Subscriber;)V

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->child:Lrx/Subscriber;

    .line 123
    iput-object p3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->worker:Lrx/Scheduler$Worker;

    .line 124
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    .line 125
    invoke-static {}, Lrx/internal/operators/OperatorWindowWithTime$State;->empty()Lrx/internal/operators/OperatorWindowWithTime$State;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    .line 126
    return-void
.end method


# virtual methods
.method complete()V
    .registers 3

    .prologue
    .line 245
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    iget-object v0, v1, Lrx/internal/operators/OperatorWindowWithTime$State;->consumer:Lrx/Observer;

    .line 246
    .local v0, "s":Lrx/Observer;, "Lrx/Observer<TT;>;"
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    invoke-virtual {v1}, Lrx/internal/operators/OperatorWindowWithTime$State;->clear()Lrx/internal/operators/OperatorWindowWithTime$State;

    move-result-object v1

    iput-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    .line 247
    if-eqz v0, :cond_11

    .line 248
    invoke-interface {v0}, Lrx/Observer;->onCompleted()V

    .line 250
    :cond_11
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v1}, Lrx/Subscriber;->onCompleted()V

    .line 251
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->unsubscribe()V

    .line 252
    return-void
.end method

.method drain(Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    .local p1, "queue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    if-nez p1, :cond_3

    .line 196
    :cond_2
    :goto_2
    return-void

    .line 179
    :cond_3
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 180
    .local v1, "o":Ljava/lang/Object;
    sget-object v3, Lrx/internal/operators/OperatorWindowWithTime;->NEXT_SUBJECT:Ljava/lang/Object;

    if-ne v1, v3, :cond_19

    .line 181
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->replaceSubject()V

    goto :goto_7

    .line 183
    :cond_19
    sget-object v3, Lrx/internal/operators/OperatorWindowWithTime;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v3, v1}, Lrx/internal/operators/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 184
    sget-object v3, Lrx/internal/operators/OperatorWindowWithTime;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v3, v1}, Lrx/internal/operators/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {p0, v3}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->error(Ljava/lang/Throwable;)V

    goto :goto_2

    .line 187
    :cond_2b
    sget-object v3, Lrx/internal/operators/OperatorWindowWithTime;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v3, v1}, Lrx/internal/operators/NotificationLite;->isCompleted(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_37

    .line 188
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->complete()V

    goto :goto_2

    .line 192
    :cond_37
    move-object v2, v1

    .line 193
    .local v2, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v2}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitValue(Ljava/lang/Object;)V

    goto :goto_7
.end method

.method emitValue(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 207
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    .line 208
    .local v0, "s":Lrx/internal/operators/OperatorWindowWithTime$State;, "Lrx/internal/operators/OperatorWindowWithTime$State<TT;>;"
    iget-object v1, v0, Lrx/internal/operators/OperatorWindowWithTime$State;->consumer:Lrx/Observer;

    if-nez v1, :cond_b

    .line 209
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->replaceSubject()V

    .line 210
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    .line 212
    :cond_b
    iget-object v1, v0, Lrx/internal/operators/OperatorWindowWithTime$State;->consumer:Lrx/Observer;

    invoke-interface {v1, p1}, Lrx/Observer;->onNext(Ljava/lang/Object;)V

    .line 213
    iget v1, v0, Lrx/internal/operators/OperatorWindowWithTime$State;->count:I

    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    iget v2, v2, Lrx/internal/operators/OperatorWindowWithTime;->size:I

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_26

    .line 214
    iget-object v1, v0, Lrx/internal/operators/OperatorWindowWithTime$State;->consumer:Lrx/Observer;

    invoke-interface {v1}, Lrx/Observer;->onCompleted()V

    .line 215
    invoke-virtual {v0}, Lrx/internal/operators/OperatorWindowWithTime$State;->clear()Lrx/internal/operators/OperatorWindowWithTime$State;

    move-result-object v0

    .line 219
    :goto_23
    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    .line 220
    return-void

    .line 217
    :cond_26
    invoke-virtual {v0}, Lrx/internal/operators/OperatorWindowWithTime$State;->next()Lrx/internal/operators/OperatorWindowWithTime$State;

    move-result-object v0

    goto :goto_23
.end method

.method error(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 236
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    iget-object v0, v1, Lrx/internal/operators/OperatorWindowWithTime$State;->consumer:Lrx/Observer;

    .line 237
    .local v0, "s":Lrx/Observer;, "Lrx/Observer<TT;>;"
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    invoke-virtual {v1}, Lrx/internal/operators/OperatorWindowWithTime$State;->clear()Lrx/internal/operators/OperatorWindowWithTime$State;

    move-result-object v1

    iput-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    .line 238
    if-eqz v0, :cond_11

    .line 239
    invoke-interface {v0, p1}, Lrx/Observer;->onError(Ljava/lang/Throwable;)V

    .line 241
    :cond_11
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v1, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 242
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->unsubscribe()V

    .line 243
    return-void
.end method

.method nextWindow()V
    .registers 7

    .prologue
    .line 289
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 290
    :try_start_3
    iget-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    if-eqz v3, :cond_1b

    .line 291
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    if-nez v3, :cond_12

    .line 292
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 294
    :cond_12
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    sget-object v5, Lrx/internal/operators/OperatorWindowWithTime;->NEXT_SUBJECT:Ljava/lang/Object;

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 295
    monitor-exit v4

    .line 327
    :cond_1a
    :goto_1a
    return-void

    .line 297
    :cond_1b
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 298
    .local v0, "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v3, 0x0

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 299
    const/4 v3, 0x1

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 300
    monitor-exit v4
    :try_end_24
    .catchall {:try_start_3 .. :try_end_24} :catchall_4b

    .line 301
    const/4 v1, 0x1

    .line 302
    .local v1, "once":Z
    const/4 v2, 0x0

    .line 305
    .local v2, "skipFinal":Z
    :cond_26
    :try_start_26
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->drain(Ljava/util/List;)V

    .line 306
    if-eqz v1, :cond_2f

    .line 307
    const/4 v1, 0x0

    .line 308
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->replaceSubject()V

    .line 310
    :cond_2f
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4
    :try_end_32
    .catchall {:try_start_26 .. :try_end_32} :catchall_67

    .line 311
    :try_start_32
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 312
    const/4 v3, 0x0

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 313
    if-nez v0, :cond_4e

    .line 314
    const/4 v3, 0x0

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 315
    const/4 v2, 0x1

    .line 316
    monitor-exit v4
    :try_end_3e
    .catchall {:try_start_32 .. :try_end_3e} :catchall_64

    .line 321
    if-nez v2, :cond_1a

    .line 322
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 323
    const/4 v3, 0x0

    :try_start_44
    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 324
    monitor-exit v4

    goto :goto_1a

    :catchall_48
    move-exception v3

    monitor-exit v4
    :try_end_4a
    .catchall {:try_start_44 .. :try_end_4a} :catchall_48

    throw v3

    .line 300
    .end local v0    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v1    # "once":Z
    .end local v2    # "skipFinal":Z
    :catchall_4b
    move-exception v3

    :try_start_4c
    monitor-exit v4
    :try_end_4d
    .catchall {:try_start_4c .. :try_end_4d} :catchall_4b

    throw v3

    .line 318
    .restart local v0    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .restart local v1    # "once":Z
    .restart local v2    # "skipFinal":Z
    :cond_4e
    :try_start_4e
    monitor-exit v4
    :try_end_4f
    .catchall {:try_start_4e .. :try_end_4f} :catchall_64

    .line 319
    :try_start_4f
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v3}, Lrx/Subscriber;->isUnsubscribed()Z
    :try_end_54
    .catchall {:try_start_4f .. :try_end_54} :catchall_67

    move-result v3

    if-eqz v3, :cond_26

    .line 321
    if-nez v2, :cond_1a

    .line 322
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 323
    const/4 v3, 0x0

    :try_start_5d
    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 324
    monitor-exit v4

    goto :goto_1a

    :catchall_61
    move-exception v3

    monitor-exit v4
    :try_end_63
    .catchall {:try_start_5d .. :try_end_63} :catchall_61

    throw v3

    .line 318
    :catchall_64
    move-exception v3

    :try_start_65
    monitor-exit v4
    :try_end_66
    .catchall {:try_start_65 .. :try_end_66} :catchall_64

    :try_start_66
    throw v3
    :try_end_67
    .catchall {:try_start_66 .. :try_end_67} :catchall_67

    .line 321
    :catchall_67
    move-exception v3

    if-nez v2, :cond_71

    .line 322
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 323
    const/4 v5, 0x0

    :try_start_6e
    iput-boolean v5, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 324
    monitor-exit v4
    :try_end_71
    .catchall {:try_start_6e .. :try_end_71} :catchall_72

    :cond_71
    throw v3

    :catchall_72
    move-exception v3

    :try_start_73
    monitor-exit v4
    :try_end_74
    .catchall {:try_start_73 .. :try_end_74} :catchall_72

    throw v3
.end method

.method public onCompleted()V
    .registers 6

    .prologue
    .line 256
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v3

    .line 257
    :try_start_3
    iget-boolean v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    if-eqz v2, :cond_1f

    .line 258
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    if-nez v2, :cond_12

    .line 259
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 261
    :cond_12
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    sget-object v4, Lrx/internal/operators/OperatorWindowWithTime;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v4}, Lrx/internal/operators/NotificationLite;->completed()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    monitor-exit v3

    .line 275
    :goto_1e
    return-void

    .line 264
    :cond_1f
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 265
    .local v1, "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v2, 0x0

    iput-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 266
    const/4 v2, 0x1

    iput-boolean v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 267
    monitor-exit v3
    :try_end_28
    .catchall {:try_start_3 .. :try_end_28} :catchall_2f

    .line 269
    :try_start_28
    invoke-virtual {p0, v1}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->drain(Ljava/util/List;)V
    :try_end_2b
    .catch Ljava/lang/Throwable; {:try_start_28 .. :try_end_2b} :catch_32

    .line 274
    invoke-virtual {p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->complete()V

    goto :goto_1e

    .line 267
    .end local v1    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :catchall_2f
    move-exception v2

    :try_start_30
    monitor-exit v3
    :try_end_31
    .catchall {:try_start_30 .. :try_end_31} :catchall_2f

    throw v2

    .line 270
    .restart local v1    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :catch_32
    move-exception v0

    .line 271
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->error(Ljava/lang/Throwable;)V

    goto :goto_1e
.end method

.method public onError(Ljava/lang/Throwable;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 224
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    iget-object v1, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v1

    .line 225
    :try_start_3
    iget-boolean v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    if-eqz v0, :cond_15

    .line 227
    sget-object v0, Lrx/internal/operators/OperatorWindowWithTime;->nl:Lrx/internal/operators/NotificationLite;

    invoke-virtual {v0, p1}, Lrx/internal/operators/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 228
    monitor-exit v1

    .line 234
    :goto_14
    return-void

    .line 230
    :cond_15
    const/4 v0, 0x0

    iput-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 231
    const/4 v0, 0x1

    iput-boolean v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 232
    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_20

    .line 233
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->error(Ljava/lang/Throwable;)V

    goto :goto_14

    .line 232
    :catchall_20
    move-exception v0

    :try_start_21
    monitor-exit v1
    :try_end_22
    .catchall {:try_start_21 .. :try_end_22} :catchall_20

    throw v0
.end method

.method public onNext(Ljava/lang/Object;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 136
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 137
    :try_start_3
    iget-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    if-eqz v3, :cond_19

    .line 138
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    if-nez v3, :cond_12

    .line 139
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 141
    :cond_12
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    monitor-exit v4

    .line 174
    :cond_18
    :goto_18
    return-void

    .line 144
    :cond_19
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 145
    .local v0, "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v3, 0x0

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 146
    const/4 v3, 0x1

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 147
    monitor-exit v4
    :try_end_22
    .catchall {:try_start_3 .. :try_end_22} :catchall_49

    .line 148
    const/4 v1, 0x1

    .line 149
    .local v1, "once":Z
    const/4 v2, 0x0

    .line 152
    .local v2, "skipFinal":Z
    :cond_24
    :try_start_24
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->drain(Ljava/util/List;)V

    .line 153
    if-eqz v1, :cond_2d

    .line 154
    const/4 v1, 0x0

    .line 155
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitValue(Ljava/lang/Object;)V

    .line 157
    :cond_2d
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4
    :try_end_30
    .catchall {:try_start_24 .. :try_end_30} :catchall_65

    .line 158
    :try_start_30
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 159
    const/4 v3, 0x0

    iput-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->queue:Ljava/util/List;

    .line 160
    if-nez v0, :cond_4c

    .line 161
    const/4 v3, 0x0

    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 162
    const/4 v2, 0x1

    .line 163
    monitor-exit v4
    :try_end_3c
    .catchall {:try_start_30 .. :try_end_3c} :catchall_62

    .line 168
    if-nez v2, :cond_18

    .line 169
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 170
    const/4 v3, 0x0

    :try_start_42
    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 171
    monitor-exit v4

    goto :goto_18

    :catchall_46
    move-exception v3

    monitor-exit v4
    :try_end_48
    .catchall {:try_start_42 .. :try_end_48} :catchall_46

    throw v3

    .line 147
    .end local v0    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v1    # "once":Z
    .end local v2    # "skipFinal":Z
    :catchall_49
    move-exception v3

    :try_start_4a
    monitor-exit v4
    :try_end_4b
    .catchall {:try_start_4a .. :try_end_4b} :catchall_49

    throw v3

    .line 165
    .restart local v0    # "localQueue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .restart local v1    # "once":Z
    .restart local v2    # "skipFinal":Z
    :cond_4c
    :try_start_4c
    monitor-exit v4
    :try_end_4d
    .catchall {:try_start_4c .. :try_end_4d} :catchall_62

    .line 166
    :try_start_4d
    iget-object v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v3}, Lrx/Subscriber;->isUnsubscribed()Z
    :try_end_52
    .catchall {:try_start_4d .. :try_end_52} :catchall_65

    move-result v3

    if-eqz v3, :cond_24

    .line 168
    if-nez v2, :cond_18

    .line 169
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 170
    const/4 v3, 0x0

    :try_start_5b
    iput-boolean v3, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 171
    monitor-exit v4

    goto :goto_18

    :catchall_5f
    move-exception v3

    monitor-exit v4
    :try_end_61
    .catchall {:try_start_5b .. :try_end_61} :catchall_5f

    throw v3

    .line 165
    :catchall_62
    move-exception v3

    :try_start_63
    monitor-exit v4
    :try_end_64
    .catchall {:try_start_63 .. :try_end_64} :catchall_62

    :try_start_64
    throw v3
    :try_end_65
    .catchall {:try_start_64 .. :try_end_65} :catchall_65

    .line 168
    :catchall_65
    move-exception v3

    if-nez v2, :cond_6f

    .line 169
    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->guard:Ljava/lang/Object;

    monitor-enter v4

    .line 170
    const/4 v5, 0x0

    :try_start_6c
    iput-boolean v5, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->emitting:Z

    .line 171
    monitor-exit v4
    :try_end_6f
    .catchall {:try_start_6c .. :try_end_6f} :catchall_70

    :cond_6f
    throw v3

    :catchall_70
    move-exception v3

    :try_start_71
    monitor-exit v4
    :try_end_72
    .catchall {:try_start_71 .. :try_end_72} :catchall_70

    throw v3
.end method

.method public onStart()V
    .registers 3

    .prologue
    .line 130
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->request(J)V

    .line 131
    return-void
.end method

.method replaceSubject()V
    .registers 4

    .prologue
    .line 198
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    iget-object v1, v2, Lrx/internal/operators/OperatorWindowWithTime$State;->consumer:Lrx/Observer;

    .line 199
    .local v1, "s":Lrx/Observer;, "Lrx/Observer<TT;>;"
    if-eqz v1, :cond_9

    .line 200
    invoke-interface {v1}, Lrx/Observer;->onCompleted()V

    .line 202
    :cond_9
    invoke-static {}, Lrx/internal/operators/BufferUntilSubscriber;->create()Lrx/internal/operators/BufferUntilSubscriber;

    move-result-object v0

    .line 203
    .local v0, "bus":Lrx/internal/operators/BufferUntilSubscriber;, "Lrx/internal/operators/BufferUntilSubscriber<TT;>;"
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    invoke-virtual {v2, v0, v0}, Lrx/internal/operators/OperatorWindowWithTime$State;->create(Lrx/Observer;Lrx/Observable;)Lrx/internal/operators/OperatorWindowWithTime$State;

    move-result-object v2

    iput-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->state:Lrx/internal/operators/OperatorWindowWithTime$State;

    .line 204
    iget-object v2, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->child:Lrx/Subscriber;

    invoke-virtual {v2, v0}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 205
    return-void
.end method

.method scheduleExact()V
    .registers 8

    .prologue
    .line 278
    .local p0, "this":Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;, "Lrx/internal/operators/OperatorWindowWithTime<TT;>.ExactSubscriber;"
    iget-object v0, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->worker:Lrx/Scheduler$Worker;

    new-instance v1, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber$1;

    invoke-direct {v1, p0}, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber$1;-><init>(Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;)V

    const-wide/16 v2, 0x0

    iget-object v4, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    iget-wide v4, v4, Lrx/internal/operators/OperatorWindowWithTime;->timespan:J

    iget-object v6, p0, Lrx/internal/operators/OperatorWindowWithTime$ExactSubscriber;->this$0:Lrx/internal/operators/OperatorWindowWithTime;

    iget-object v6, v6, Lrx/internal/operators/OperatorWindowWithTime;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v6}, Lrx/Scheduler$Worker;->schedulePeriodically(Lrx/functions/Action0;JJLjava/util/concurrent/TimeUnit;)Lrx/Subscription;

    .line 286
    return-void
.end method
