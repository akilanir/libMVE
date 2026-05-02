.class Lcom/koushikdutta/ion/IonRequestBuilder$6;
.super Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;
.source "IonRequestBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder;->execute(Lcom/koushikdutta/async/parser/AsyncParser;Ljava/lang/Runnable;)Lcom/koushikdutta/ion/future/ResponseFuture;
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

.field final synthetic val$parser:Lcom/koushikdutta/async/parser/AsyncParser;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder;Ljava/lang/Runnable;Lcom/koushikdutta/async/parser/AsyncParser;)V
    .registers 4
    .param p1, "this$0"    # Lcom/koushikdutta/ion/IonRequestBuilder;
    .param p2, "x0"    # Ljava/lang/Runnable;

    .prologue
    .line 653
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$6;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iput-object p3, p0, Lcom/koushikdutta/ion/IonRequestBuilder$6;->val$parser:Lcom/koushikdutta/async/parser/AsyncParser;

    invoke-direct {p0, p1, p2}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder;Ljava/lang/Runnable;)V

    .line 654
    iput-object p0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$6;->self:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    return-void
.end method


# virtual methods
.method protected transform(Lcom/koushikdutta/ion/Loader$LoaderEmitter;)V
    .registers 4
    .param p1, "emitter"    # Lcom/koushikdutta/ion/Loader$LoaderEmitter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 657
    invoke-super {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->transform(Lcom/koushikdutta/ion/Loader$LoaderEmitter;)V

    .line 658
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$6;->val$parser:Lcom/koushikdutta/async/parser/AsyncParser;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$6;->emitter:Lcom/koushikdutta/async/DataEmitter;

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/parser/AsyncParser;->parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;

    move-result-object v0

    new-instance v1, Lcom/koushikdutta/ion/IonRequestBuilder$6$1;

    invoke-direct {v1, p0}, Lcom/koushikdutta/ion/IonRequestBuilder$6$1;-><init>(Lcom/koushikdutta/ion/IonRequestBuilder$6;)V

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/future/Future;->setCallback(Lcom/koushikdutta/async/future/FutureCallback;)Lcom/koushikdutta/async/future/Future;

    .line 664
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
    .line 653
    check-cast p1, Lcom/koushikdutta/ion/Loader$LoaderEmitter;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/IonRequestBuilder$6;->transform(Lcom/koushikdutta/ion/Loader$LoaderEmitter;)V

    return-void
.end method
