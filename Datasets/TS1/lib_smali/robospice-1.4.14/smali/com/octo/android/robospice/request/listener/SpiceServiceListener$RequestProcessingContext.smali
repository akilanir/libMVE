.class public Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
.super Ljava/lang/Object;
.source "SpiceServiceListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/octo/android/robospice/request/listener/SpiceServiceListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RequestProcessingContext"
.end annotation


# instance fields
.field private executionThread:Ljava/lang/Thread;

.field private requestListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;"
        }
    .end annotation
.end field

.field private requestProgress:Lcom/octo/android/robospice/request/listener/RequestProgress;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getExecutionThread()Ljava/lang/Thread;
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->executionThread:Ljava/lang/Thread;

    return-object v0
.end method

.method public getRequestListeners()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 62
    iget-object v0, p0, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->requestListeners:Ljava/util/Set;

    return-object v0
.end method

.method public getRequestProgress()Lcom/octo/android/robospice/request/listener/RequestProgress;
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->requestProgress:Lcom/octo/android/robospice/request/listener/RequestProgress;

    return-object v0
.end method

.method public setExecutionThread(Ljava/lang/Thread;)V
    .registers 2
    .param p1, "executionThread"    # Ljava/lang/Thread;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->executionThread:Ljava/lang/Thread;

    .line 43
    return-void
.end method

.method public setRequestListeners(Ljava/util/Set;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p1, "requestListeners":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    iput-object p1, p0, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->requestListeners:Ljava/util/Set;

    .line 59
    return-void
.end method

.method public setRequestProgress(Lcom/octo/android/robospice/request/listener/RequestProgress;)V
    .registers 2
    .param p1, "requestProgress"    # Lcom/octo/android/robospice/request/listener/RequestProgress;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;->requestProgress:Lcom/octo/android/robospice/request/listener/RequestProgress;

    .line 51
    return-void
.end method
