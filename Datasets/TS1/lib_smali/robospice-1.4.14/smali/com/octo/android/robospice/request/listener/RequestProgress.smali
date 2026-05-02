.class public Lcom/octo/android/robospice/request/listener/RequestProgress;
.super Ljava/lang/Object;
.source "RequestProgress.java"


# instance fields
.field private progress:F

.field private status:Lcom/octo/android/robospice/request/listener/RequestStatus;


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/request/listener/RequestStatus;)V
    .registers 3
    .param p1, "status"    # Lcom/octo/android/robospice/request/listener/RequestStatus;

    .prologue
    .line 9
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/octo/android/robospice/request/listener/RequestProgress;-><init>(Lcom/octo/android/robospice/request/listener/RequestStatus;F)V

    .line 10
    return-void
.end method

.method public constructor <init>(Lcom/octo/android/robospice/request/listener/RequestStatus;F)V
    .registers 3
    .param p1, "status"    # Lcom/octo/android/robospice/request/listener/RequestStatus;
    .param p2, "progress"    # F

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/octo/android/robospice/request/listener/RequestProgress;->status:Lcom/octo/android/robospice/request/listener/RequestStatus;

    .line 14
    iput p2, p0, Lcom/octo/android/robospice/request/listener/RequestProgress;->progress:F

    .line 15
    return-void
.end method


# virtual methods
.method public getProgress()F
    .registers 2

    .prologue
    .line 26
    iget v0, p0, Lcom/octo/android/robospice/request/listener/RequestProgress;->progress:F

    return v0
.end method

.method public getStatus()Lcom/octo/android/robospice/request/listener/RequestStatus;
    .registers 2

    .prologue
    .line 18
    iget-object v0, p0, Lcom/octo/android/robospice/request/listener/RequestProgress;->status:Lcom/octo/android/robospice/request/listener/RequestStatus;

    return-object v0
.end method

.method public setProgress(F)V
    .registers 2
    .param p1, "progress"    # F

    .prologue
    .line 30
    iput p1, p0, Lcom/octo/android/robospice/request/listener/RequestProgress;->progress:F

    .line 31
    return-void
.end method

.method public setStatus(Lcom/octo/android/robospice/request/listener/RequestStatus;)V
    .registers 2
    .param p1, "status"    # Lcom/octo/android/robospice/request/listener/RequestStatus;

    .prologue
    .line 22
    iput-object p1, p0, Lcom/octo/android/robospice/request/listener/RequestProgress;->status:Lcom/octo/android/robospice/request/listener/RequestStatus;

    .line 23
    return-void
.end method
