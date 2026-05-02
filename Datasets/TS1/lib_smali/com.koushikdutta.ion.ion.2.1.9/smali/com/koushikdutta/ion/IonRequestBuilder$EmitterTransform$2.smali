.class Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$2;
.super Ljava/lang/Object;
.source "IonRequestBuilder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->transform(Lcom/koushikdutta/ion/Loader$LoaderEmitter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

.field final synthetic val$headers:Lcom/koushikdutta/ion/HeadersResponse;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;Lcom/koushikdutta/ion/HeadersResponse;)V
    .registers 3
    .param p1, "this$1"    # Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    .prologue
    .line 503
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$2;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform.2;"
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$2;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iput-object p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$2;->val$headers:Lcom/koushikdutta/ion/HeadersResponse;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 506
    .local p0, "this":Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$2;, "Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform.2;"
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$2;->this$1:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v0, v0, Lcom/koushikdutta/ion/IonRequestBuilder;->headersCallback:Lcom/koushikdutta/ion/HeadersCallback;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform$2;->val$headers:Lcom/koushikdutta/ion/HeadersResponse;

    invoke-interface {v0, v1}, Lcom/koushikdutta/ion/HeadersCallback;->onHeaders(Lcom/koushikdutta/ion/HeadersResponse;)V

    .line 507
    return-void
.end method
