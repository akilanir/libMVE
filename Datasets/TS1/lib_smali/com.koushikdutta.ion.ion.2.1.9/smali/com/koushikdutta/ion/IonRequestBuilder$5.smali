.class Lcom/koushikdutta/ion/IonRequestBuilder$5;
.super Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;
.source "IonRequestBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/DataSink;ZLjava/lang/Object;Ljava/lang/Runnable;)Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform",
        "<TT;>;"
    }
.end annotation


# instance fields
.field self:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform",
            "<TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

.field final synthetic val$close:Z

.field final synthetic val$result:Ljava/lang/Object;

.field final synthetic val$sink:Lcom/koushikdutta/async/DataSink;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder;Ljava/lang/Runnable;ZLcom/koushikdutta/async/DataSink;Ljava/lang/Object;)V
    .registers 6
    .param p1, "this$0"    # Lcom/koushikdutta/ion/IonRequestBuilder;
    .param p2, "x0"    # Ljava/lang/Runnable;

    .prologue
    .line 609
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$5;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iput-boolean p3, p0, Lcom/koushikdutta/ion/IonRequestBuilder$5;->val$close:Z

    iput-object p4, p0, Lcom/koushikdutta/ion/IonRequestBuilder$5;->val$sink:Lcom/koushikdutta/async/DataSink;

    iput-object p5, p0, Lcom/koushikdutta/ion/IonRequestBuilder$5;->val$result:Ljava/lang/Object;

    invoke-direct {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;Ljava/lang/Runnable;)V

    .line 617
    iput-object p0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$5;->self:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    return-void
.end method


# virtual methods
.method protected cleanup()V
    .registers 2

    .prologue
    .line 612
    invoke-super {p0}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->cleanup()V

    .line 613
    iget-boolean v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$5;->val$close:Z

    if-eqz v0, :cond_c

    .line 614
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$5;->val$sink:Lcom/koushikdutta/async/DataSink;

    invoke-interface {v0}, Lcom/koushikdutta/async/DataSink;->end()V

    .line 615
    :cond_c
    return-void
.end method

.method protected transform(Lcom/koushikdutta/ion/Loader$LoaderEmitter;)V
    .registers 5
    .param p1, "emitter"    # Lcom/koushikdutta/ion/Loader$LoaderEmitter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 620
    invoke-super {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->transform(Lcom/koushikdutta/ion/Loader$LoaderEmitter;)V

    .line 621
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$5;->emitter:Lcom/koushikdutta/async/DataEmitter;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$5;->val$sink:Lcom/koushikdutta/async/DataSink;

    new-instance v2, Lcom/koushikdutta/ion/IonRequestBuilder$5$1;

    invoke-direct {v2, p0}, Lcom/koushikdutta/ion/IonRequestBuilder$5$1;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder$5;)V

    invoke-static {v0, v1, v2}, Lcom/koushikdutta/async/Util;->pump(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 627
    return-void
.end method

.method protected bridge synthetic transform(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 609
    check-cast p1, Lcom/koushikdutta/ion/Loader$LoaderEmitter;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder$5;->transform(Lcom/koushikdutta/ion/Loader$LoaderEmitter;)V

    return-void
.end method
