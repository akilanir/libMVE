.class Lcom/koushikdutta/ion/gson/GsonSerializer$1;
.super Lcom/koushikdutta/async/future/TransformFuture;
.source "GsonSerializer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/gson/GsonSerializer;->parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/async/future/TransformFuture",
        "<TT;",
        "Lcom/koushikdutta/async/ByteBufferList;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/koushikdutta/ion/gson/GsonSerializer;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/gson/GsonSerializer;)V
    .registers 2
    .param p1, "this$0"    # Lcom/koushikdutta/ion/gson/GsonSerializer;

    .prologue
    .line 39
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonSerializer$1;, "Lcom/koushikdutta/ion/gson/GsonSerializer.1;"
    iput-object p1, p0, Lcom/koushikdutta/ion/gson/GsonSerializer$1;->this$0:Lcom/koushikdutta/ion/gson/GsonSerializer;

    invoke-direct {p0}, Lcom/koushikdutta/async/future/TransformFuture;-><init>()V

    return-void
.end method


# virtual methods
.method protected transform(Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 7
    .param p1, "result"    # Lcom/koushikdutta/async/ByteBufferList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonSerializer$1;, "Lcom/koushikdutta/ion/gson/GsonSerializer.1;"
    new-instance v0, Lcom/koushikdutta/async/stream/ByteBufferListInputStream;

    invoke-direct {v0, p1}, Lcom/koushikdutta/async/stream/ByteBufferListInputStream;-><init>(Lcom/koushikdutta/async/ByteBufferList;)V

    .line 43
    .local v0, "bin":Lcom/koushikdutta/async/stream/ByteBufferListInputStream;
    iget-object v2, p0, Lcom/koushikdutta/ion/gson/GsonSerializer$1;->this$0:Lcom/koushikdutta/ion/gson/GsonSerializer;

    iget-object v2, v2, Lcom/koushikdutta/ion/gson/GsonSerializer;->gson:Lcom/google/gson/Gson;

    new-instance v3, Lcom/google/gson/stream/JsonReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v4}, Lcom/google/gson/stream/JsonReader;-><init>(Ljava/io/Reader;)V

    iget-object v4, p0, Lcom/koushikdutta/ion/gson/GsonSerializer$1;->this$0:Lcom/koushikdutta/ion/gson/GsonSerializer;

    iget-object v4, v4, Lcom/koushikdutta/ion/gson/GsonSerializer;->type:Ljava/lang/reflect/Type;

    invoke-virtual {v2, v3, v4}, Lcom/google/gson/Gson;->fromJson(Lcom/google/gson/stream/JsonReader;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v1

    .line 44
    .local v1, "ret":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, v1}, Lcom/koushikdutta/ion/gson/GsonSerializer$1;->setComplete(Ljava/lang/Object;)Z

    .line 45
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
    .line 39
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonSerializer$1;, "Lcom/koushikdutta/ion/gson/GsonSerializer.1;"
    check-cast p1, Lcom/koushikdutta/async/ByteBufferList;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/gson/GsonSerializer$1;->transform(Lcom/koushikdutta/async/ByteBufferList;)V

    return-void
.end method
