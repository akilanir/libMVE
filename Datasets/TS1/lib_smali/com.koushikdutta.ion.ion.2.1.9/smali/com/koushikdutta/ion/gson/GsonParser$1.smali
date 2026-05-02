.class Lcom/koushikdutta/ion/gson/GsonParser$1;
.super Lcom/koushikdutta/async/future/TransformFuture;
.source "GsonParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/koushikdutta/ion/gson/GsonParser;->parse(Lcom/koushikdutta/async/DataEmitter;)Lcom/koushikdutta/async/future/Future;
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
.field final synthetic this$0:Lcom/koushikdutta/ion/gson/GsonParser;

.field final synthetic val$charset:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/koushikdutta/ion/gson/GsonParser;Ljava/lang/String;)V
    .registers 3
    .param p1, "this$0"    # Lcom/koushikdutta/ion/gson/GsonParser;

    .prologue
    .line 41
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonParser$1;, "Lcom/koushikdutta/ion/gson/GsonParser.1;"
    iput-object p1, p0, Lcom/koushikdutta/ion/gson/GsonParser$1;->this$0:Lcom/koushikdutta/ion/gson/GsonParser;

    iput-object p2, p0, Lcom/koushikdutta/ion/gson/GsonParser$1;->val$charset:Ljava/lang/String;

    invoke-direct {p0}, Lcom/koushikdutta/async/future/TransformFuture;-><init>()V

    return-void
.end method


# virtual methods
.method protected transform(Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 9
    .param p1, "result"    # Lcom/koushikdutta/async/ByteBufferList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 44
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonParser$1;, "Lcom/koushikdutta/ion/gson/GsonParser.1;"
    new-instance v3, Lcom/google/gson/JsonParser;

    invoke-direct {v3}, Lcom/google/gson/JsonParser;-><init>()V

    .line 45
    .local v3, "parser":Lcom/google/gson/JsonParser;
    new-instance v0, Lcom/koushikdutta/async/stream/ByteBufferListInputStream;

    invoke-direct {v0, p1}, Lcom/koushikdutta/async/stream/ByteBufferListInputStream;-><init>(Lcom/koushikdutta/async/ByteBufferList;)V

    .line 47
    .local v0, "bis":Lcom/koushikdutta/async/stream/ByteBufferListInputStream;
    iget-object v4, p0, Lcom/koushikdutta/ion/gson/GsonParser$1;->this$0:Lcom/koushikdutta/ion/gson/GsonParser;

    iget-object v4, v4, Lcom/koushikdutta/ion/gson/GsonParser;->forcedCharset:Ljava/nio/charset/Charset;

    if-eqz v4, :cond_36

    .line 48
    new-instance v1, Ljava/io/InputStreamReader;

    iget-object v4, p0, Lcom/koushikdutta/ion/gson/GsonParser$1;->this$0:Lcom/koushikdutta/ion/gson/GsonParser;

    iget-object v4, v4, Lcom/koushikdutta/ion/gson/GsonParser;->forcedCharset:Ljava/nio/charset/Charset;

    invoke-direct {v1, v0, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    .line 53
    .local v1, "isr":Ljava/io/InputStreamReader;
    :goto_19
    new-instance v4, Lcom/google/gson/stream/JsonReader;

    invoke-direct {v4, v1}, Lcom/google/gson/stream/JsonReader;-><init>(Ljava/io/Reader;)V

    invoke-virtual {v3, v4}, Lcom/google/gson/JsonParser;->parse(Lcom/google/gson/stream/JsonReader;)Lcom/google/gson/JsonElement;

    move-result-object v2

    .line 54
    .local v2, "parsed":Lcom/google/gson/JsonElement;
    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->isJsonNull()Z

    move-result v4

    if-nez v4, :cond_2e

    invoke-virtual {v2}, Lcom/google/gson/JsonElement;->isJsonPrimitive()Z

    move-result v4

    if-eqz v4, :cond_48

    .line 55
    :cond_2e
    new-instance v4, Lcom/google/gson/JsonParseException;

    const-string v5, "unable to parse json"

    invoke-direct {v4, v5}, Lcom/google/gson/JsonParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 49
    .end local v1    # "isr":Ljava/io/InputStreamReader;
    .end local v2    # "parsed":Lcom/google/gson/JsonElement;
    :cond_36
    iget-object v4, p0, Lcom/koushikdutta/ion/gson/GsonParser$1;->val$charset:Ljava/lang/String;

    if-eqz v4, :cond_42

    .line 50
    new-instance v1, Ljava/io/InputStreamReader;

    iget-object v4, p0, Lcom/koushikdutta/ion/gson/GsonParser$1;->val$charset:Ljava/lang/String;

    invoke-direct {v1, v0, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .restart local v1    # "isr":Ljava/io/InputStreamReader;
    goto :goto_19

    .line 52
    .end local v1    # "isr":Ljava/io/InputStreamReader;
    :cond_42
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .restart local v1    # "isr":Ljava/io/InputStreamReader;
    goto :goto_19

    .line 56
    .restart local v2    # "parsed":Lcom/google/gson/JsonElement;
    :cond_48
    iget-object v4, p0, Lcom/koushikdutta/ion/gson/GsonParser$1;->this$0:Lcom/koushikdutta/ion/gson/GsonParser;

    iget-object v4, v4, Lcom/koushikdutta/ion/gson/GsonParser;->clazz:Ljava/lang/Class;

    invoke-virtual {v4, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7f

    .line 57
    new-instance v4, Ljava/lang/ClassCastException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " can not be casted to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/koushikdutta/ion/gson/GsonParser$1;->this$0:Lcom/koushikdutta/ion/gson/GsonParser;

    iget-object v6, v6, Lcom/koushikdutta/ion/gson/GsonParser;->clazz:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 58
    :cond_7f
    const/4 v4, 0x0

    invoke-virtual {p0, v4, v2}, Lcom/koushikdutta/ion/gson/GsonParser$1;->setComplete(Ljava/lang/Exception;Ljava/lang/Object;)Z

    .line 59
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
    .line 41
    .local p0, "this":Lcom/koushikdutta/ion/gson/GsonParser$1;, "Lcom/koushikdutta/ion/gson/GsonParser.1;"
    check-cast p1, Lcom/koushikdutta/async/ByteBufferList;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/koushikdutta/ion/gson/GsonParser$1;->transform(Lcom/koushikdutta/async/ByteBufferList;)V

    return-void
.end method
