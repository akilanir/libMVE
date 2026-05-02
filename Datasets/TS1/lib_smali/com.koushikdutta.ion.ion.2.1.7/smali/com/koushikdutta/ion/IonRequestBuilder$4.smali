.class Lcom/koushikdutta/ion/IonRequestBuilder$4;
.super Ljava/lang/Object;
.source "IonRequestBuilder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/IonRequestBuilder;->resolveAndLoadRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

.field final synthetic val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

.field final synthetic val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/IonRequestBuilder;Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V
    .registers 4

    .prologue
    .line 367
    iput-object p1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iput-object p2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iput-object p3, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 370
    iget-object v0, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->this$0:Lcom/koushikdutta/ion/IonRequestBuilder;

    iget-object v1, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->val$request:Lcom/koushikdutta/async/http/AsyncHttpRequest;

    iget-object v2, p0, Lcom/koushikdutta/ion/IonRequestBuilder$4;->val$ret:Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/ion/IonRequestBuilder;->invokeLoadRequest(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/ion/IonRequestBuilder$EmitterTransform;)V

    .line 371
    return-void
.end method
