.class public abstract Lcom/octo/android/robospice/request/SpiceRequest;
.super Ljava/lang/Object;
.source "SpiceRequest.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<RESU",
        "LT:Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/octo/android/robospice/request/SpiceRequest",
        "<TRESU",
        "LT;",
        ">;>;"
    }
.end annotation


# static fields
.field public static final PRIORITY_HIGH:I = 0x0

.field public static final PRIORITY_LOW:I = 0x64

.field public static final PRIORITY_NORMAL:I = 0x32


# instance fields
.field private future:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<*>;"
        }
    .end annotation
.end field

.field private isAggregatable:Z

.field private isCanceled:Z

.field private priority:I

.field private progress:Lcom/octo/android/robospice/request/listener/RequestProgress;

.field private requestCancellationListener:Lcom/octo/android/robospice/request/listener/RequestCancellationListener;

.field private requestProgressListener:Lcom/octo/android/robospice/request/listener/RequestProgressListener;

.field private final resultType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TRESU",
            "LT;",
            ">;"
        }
    .end annotation
.end field

.field private retryPolicy:Lcom/octo/android/robospice/retry/RetryPolicy;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TRESU",
            "LT;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TRESULT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->isCanceled:Z

    .line 33
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->isAggregatable:Z

    .line 34
    const/16 v0, 0x32

    iput v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->priority:I

    .line 35
    new-instance v0, Lcom/octo/android/robospice/request/listener/RequestProgress;

    sget-object v1, Lcom/octo/android/robospice/request/listener/RequestStatus;->PENDING:Lcom/octo/android/robospice/request/listener/RequestStatus;

    invoke-direct {v0, v1}, Lcom/octo/android/robospice/request/listener/RequestProgress;-><init>(Lcom/octo/android/robospice/request/listener/RequestStatus;)V

    iput-object v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->progress:Lcom/octo/android/robospice/request/listener/RequestProgress;

    .line 38
    new-instance v0, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;

    invoke-direct {v0}, Lcom/octo/android/robospice/retry/DefaultRetryPolicy;-><init>()V

    iput-object v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->retryPolicy:Lcom/octo/android/robospice/retry/RetryPolicy;

    .line 41
    invoke-direct {p0}, Lcom/octo/android/robospice/request/SpiceRequest;->checkInnerClassDeclarationToPreventMemoryLeak()V

    .line 42
    iput-object p1, p0, Lcom/octo/android/robospice/request/SpiceRequest;->resultType:Ljava/lang/Class;

    .line 43
    return-void
.end method

.method private checkInnerClassDeclarationToPreventMemoryLeak()V
    .registers 4

    .prologue
    .line 84
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isMemberClass()Z

    move-result v0

    if-eqz v0, :cond_45

    const-class v0, Landroid/content/Context;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_45

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v0

    if-nez v0, :cond_45

    .line 85
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Requests must be either non-inner classes or a static inner member class of Context : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_45
    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 3

    .prologue
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    const/4 v1, 0x1

    .line 96
    iput-boolean v1, p0, Lcom/octo/android/robospice/request/SpiceRequest;->isCanceled:Z

    .line 98
    iget-object v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->future:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_c

    .line 99
    iget-object v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->future:Ljava/util/concurrent/Future;

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 102
    :cond_c
    iget-object v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->requestCancellationListener:Lcom/octo/android/robospice/request/listener/RequestCancellationListener;

    if-eqz v0, :cond_15

    .line 103
    iget-object v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->requestCancellationListener:Lcom/octo/android/robospice/request/listener/RequestCancellationListener;

    invoke-interface {v0}, Lcom/octo/android/robospice/request/listener/RequestCancellationListener;->onRequestCancelled()V

    .line 105
    :cond_15
    return-void
.end method

.method public compareTo(Lcom/octo/android/robospice/request/SpiceRequest;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/SpiceRequest",
            "<TRESU",
            "LT;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 155
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    .local p1, "other":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    if-ne p0, p1, :cond_4

    .line 156
    const/4 v0, 0x0

    .line 159
    :goto_3
    return v0

    :cond_4
    iget v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->priority:I

    iget v1, p1, Lcom/octo/android/robospice/request/SpiceRequest;->priority:I

    sub-int/2addr v0, v1

    goto :goto_3
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 23
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    check-cast p1, Lcom/octo/android/robospice/request/SpiceRequest;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/octo/android/robospice/request/SpiceRequest;->compareTo(Lcom/octo/android/robospice/request/SpiceRequest;)I

    move-result v0

    return v0
.end method

.method public getPriority()I
    .registers 2

    .prologue
    .line 77
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    iget v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->priority:I

    return v0
.end method

.method getProgress()Lcom/octo/android/robospice/request/listener/RequestProgress;
    .registers 2

    .prologue
    .line 113
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->progress:Lcom/octo/android/robospice/request/listener/RequestProgress;

    return-object v0
.end method

.method public getResultType()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<TRESU",
            "LT;",
            ">;"
        }
    .end annotation

    .prologue
    .line 92
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->resultType:Ljava/lang/Class;

    return-object v0
.end method

.method public getRetryPolicy()Lcom/octo/android/robospice/retry/RetryPolicy;
    .registers 2

    .prologue
    .line 46
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->retryPolicy:Lcom/octo/android/robospice/retry/RetryPolicy;

    return-object v0
.end method

.method public isAggregatable()Z
    .registers 2

    .prologue
    .line 121
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    iget-boolean v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->isAggregatable:Z

    return v0
.end method

.method public isCancelled()Z
    .registers 2

    .prologue
    .line 117
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    iget-boolean v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->isCanceled:Z

    return v0
.end method

.method public abstract loadDataFromNetwork()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TRESU",
            "LT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected publishProgress()V
    .registers 3

    .prologue
    .line 137
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->requestProgressListener:Lcom/octo/android/robospice/request/listener/RequestProgressListener;

    if-eqz v0, :cond_b

    .line 139
    iget-object v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->requestProgressListener:Lcom/octo/android/robospice/request/listener/RequestProgressListener;

    iget-object v1, p0, Lcom/octo/android/robospice/request/SpiceRequest;->progress:Lcom/octo/android/robospice/request/listener/RequestProgress;

    invoke-interface {v0, v1}, Lcom/octo/android/robospice/request/listener/RequestProgressListener;->onRequestProgressUpdate(Lcom/octo/android/robospice/request/listener/RequestProgress;)V

    .line 141
    :cond_b
    return-void
.end method

.method protected publishProgress(F)V
    .registers 4
    .param p1, "progress"    # F

    .prologue
    .line 144
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->progress:Lcom/octo/android/robospice/request/listener/RequestProgress;

    sget-object v1, Lcom/octo/android/robospice/request/listener/RequestStatus;->LOADING_FROM_NETWORK:Lcom/octo/android/robospice/request/listener/RequestStatus;

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/request/listener/RequestProgress;->setStatus(Lcom/octo/android/robospice/request/listener/RequestStatus;)V

    .line 145
    iget-object v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->progress:Lcom/octo/android/robospice/request/listener/RequestProgress;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/listener/RequestProgress;->setProgress(F)V

    .line 146
    invoke-virtual {p0}, Lcom/octo/android/robospice/request/SpiceRequest;->publishProgress()V

    .line 147
    return-void
.end method

.method public setAggregatable(Z)V
    .registers 2
    .param p1, "isAggregatable"    # Z

    .prologue
    .line 125
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    iput-boolean p1, p0, Lcom/octo/android/robospice/request/SpiceRequest;->isAggregatable:Z

    .line 126
    return-void
.end method

.method protected setFuture(Ljava/util/concurrent/Future;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    .local p1, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<*>;"
    iput-object p1, p0, Lcom/octo/android/robospice/request/SpiceRequest;->future:Ljava/util/concurrent/Future;

    .line 130
    return-void
.end method

.method public setPriority(I)V
    .registers 4
    .param p1, "priority"    # I

    .prologue
    .line 70
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    if-gez p1, :cond_a

    .line 71
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Priority must be positive."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_a
    iput p1, p0, Lcom/octo/android/robospice/request/SpiceRequest;->priority:I

    .line 74
    return-void
.end method

.method public setRequestCancellationListener(Lcom/octo/android/robospice/request/listener/RequestCancellationListener;)V
    .registers 2
    .param p1, "requestCancellationListener"    # Lcom/octo/android/robospice/request/listener/RequestCancellationListener;

    .prologue
    .line 150
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    iput-object p1, p0, Lcom/octo/android/robospice/request/SpiceRequest;->requestCancellationListener:Lcom/octo/android/robospice/request/listener/RequestCancellationListener;

    .line 151
    return-void
.end method

.method protected setRequestProgressListener(Lcom/octo/android/robospice/request/listener/RequestProgressListener;)V
    .registers 2
    .param p1, "requestProgressListener"    # Lcom/octo/android/robospice/request/listener/RequestProgressListener;

    .prologue
    .line 133
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    iput-object p1, p0, Lcom/octo/android/robospice/request/SpiceRequest;->requestProgressListener:Lcom/octo/android/robospice/request/listener/RequestProgressListener;

    .line 134
    return-void
.end method

.method public setRetryPolicy(Lcom/octo/android/robospice/retry/RetryPolicy;)V
    .registers 2
    .param p1, "retryPolicy"    # Lcom/octo/android/robospice/retry/RetryPolicy;

    .prologue
    .line 57
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    iput-object p1, p0, Lcom/octo/android/robospice/request/SpiceRequest;->retryPolicy:Lcom/octo/android/robospice/retry/RetryPolicy;

    .line 58
    return-void
.end method

.method setStatus(Lcom/octo/android/robospice/request/listener/RequestStatus;)V
    .registers 3
    .param p1, "status"    # Lcom/octo/android/robospice/request/listener/RequestStatus;

    .prologue
    .line 108
    .local p0, "this":Lcom/octo/android/robospice/request/SpiceRequest;, "Lcom/octo/android/robospice/request/SpiceRequest<TRESULT;>;"
    new-instance v0, Lcom/octo/android/robospice/request/listener/RequestProgress;

    invoke-direct {v0, p1}, Lcom/octo/android/robospice/request/listener/RequestProgress;-><init>(Lcom/octo/android/robospice/request/listener/RequestStatus;)V

    iput-object v0, p0, Lcom/octo/android/robospice/request/SpiceRequest;->progress:Lcom/octo/android/robospice/request/listener/RequestProgress;

    .line 109
    invoke-virtual {p0}, Lcom/octo/android/robospice/request/SpiceRequest;->publishProgress()V

    .line 110
    return-void
.end method
