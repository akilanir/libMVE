.class Lcom/octo/android/robospice/SpiceManager$2;
.super Lcom/octo/android/robospice/request/SpiceRequest;
.source "SpiceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/SpiceManager;->addListenerIfPending(Ljava/lang/Class;Ljava/lang/Object;Lcom/octo/android/robospice/request/listener/RequestListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/request/SpiceRequest",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/SpiceManager;


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;)V
    .registers 3

    .prologue
    .line 404
    .local p2, "x0":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iput-object p1, p0, Lcom/octo/android/robospice/SpiceManager$2;->this$0:Lcom/octo/android/robospice/SpiceManager;

    invoke-direct {p0, p2}, Lcom/octo/android/robospice/request/SpiceRequest;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public loadDataFromNetwork()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 408
    const/4 v0, 0x0

    return-object v0
.end method
