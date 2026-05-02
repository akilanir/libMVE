.class Lcom/octo/android/robospice/SpiceManager$3;
.super Lcom/octo/android/robospice/request/SpiceRequest;
.source "SpiceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/octo/android/robospice/SpiceManager;->putInCache(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Object;Lcom/octo/android/robospice/request/listener/RequestListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/SpiceManager;

.field final synthetic val$data:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/octo/android/robospice/SpiceManager;Ljava/lang/Class;Ljava/lang/Object;)V
    .registers 4
    .param p2, "x0"    # Ljava/lang/Class;

    .prologue
    .line 539
    iput-object p1, p0, Lcom/octo/android/robospice/SpiceManager$3;->this$0:Lcom/octo/android/robospice/SpiceManager;

    iput-object p3, p0, Lcom/octo/android/robospice/SpiceManager$3;->val$data:Ljava/lang/Object;

    invoke-direct {p0, p2}, Lcom/octo/android/robospice/request/SpiceRequest;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public loadDataFromNetwork()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 542
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceManager$3;->val$data:Ljava/lang/Object;

    return-object v0
.end method
