.class public abstract Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;
.super Lcom/octo/android/robospice/request/SpiceRequest;
.source "RetrofitSpiceRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/octo/android/robospice/request/SpiceRequest",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private retrofitedInterfaceClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TR;>;"
        }
    .end annotation
.end field

.field private service:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Class",
            "<TR;>;)V"
        }
    .end annotation

    .prologue
    .line 20
    .local p0, "this":Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;, "Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest<TT;TR;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "retrofitedInterfaceClass":Ljava/lang/Class;, "Ljava/lang/Class<TR;>;"
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/request/SpiceRequest;-><init>(Ljava/lang/Class;)V

    .line 21
    iput-object p2, p0, Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;->retrofitedInterfaceClass:Ljava/lang/Class;

    .line 22
    return-void
.end method


# virtual methods
.method public getRetrofitedInterfaceClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 25
    .local p0, "this":Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;, "Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest<TT;TR;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;->retrofitedInterfaceClass:Ljava/lang/Class;

    return-object v0
.end method

.method public getService()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;, "Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest<TT;TR;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;->service:Ljava/lang/Object;

    return-object v0
.end method

.method public setService(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;, "Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest<TT;TR;>;"
    .local p1, "service":Ljava/lang/Object;, "TR;"
    iput-object p1, p0, Lcom/octo/android/robospice/request/retrofit/RetrofitSpiceRequest;->service:Ljava/lang/Object;

    .line 30
    return-void
.end method
