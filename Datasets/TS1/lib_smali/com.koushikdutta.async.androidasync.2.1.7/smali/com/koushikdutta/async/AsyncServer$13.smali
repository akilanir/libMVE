.class Lcom/koushikdutta/async/AsyncServer$13;
.super Ljava/lang/Thread;
.source "AsyncServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/async/AsyncServer;->run(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/async/AsyncServer;

.field final synthetic val$queue:Ljava/util/PriorityQueue;

.field final synthetic val$selector:Lcom/koushikdutta/async/SelectorWrapper;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/AsyncServer;Ljava/lang/String;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V
    .registers 5
    .param p2, "x0"    # Ljava/lang/String;

    .prologue
    .line 567
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncServer$13;->this$0:Lcom/koushikdutta/async/AsyncServer;

    iput-object p3, p0, Lcom/koushikdutta/async/AsyncServer$13;->val$selector:Lcom/koushikdutta/async/SelectorWrapper;

    iput-object p4, p0, Lcom/koushikdutta/async/AsyncServer$13;->val$queue:Ljava/util/PriorityQueue;

    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 569
    iget-object v0, p0, Lcom/koushikdutta/async/AsyncServer$13;->this$0:Lcom/koushikdutta/async/AsyncServer;

    iget-object v1, p0, Lcom/koushikdutta/async/AsyncServer$13;->val$selector:Lcom/koushikdutta/async/SelectorWrapper;

    iget-object v2, p0, Lcom/koushikdutta/async/AsyncServer$13;->val$queue:Ljava/util/PriorityQueue;

    # invokes: Lcom/koushikdutta/async/AsyncServer;->run(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V
    invoke-static {v0, v1, v2}, Lcom/koushikdutta/async/AsyncServer;->access$700(Lcom/koushikdutta/async/AsyncServer;Lcom/koushikdutta/async/SelectorWrapper;Ljava/util/PriorityQueue;)V

    .line 570
    return-void
.end method
