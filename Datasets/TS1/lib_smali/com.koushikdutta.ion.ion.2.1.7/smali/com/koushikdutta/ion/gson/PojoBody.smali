.class public Lcom/koushikdutta/ion/gson/PojoBody;
.super Ljava/lang/Object;
.source "PojoBody.java"

# interfaces
.implements Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/koushikdutta/async/http/body/AsyncHttpRequestBody",
        "<TT;>;"
    }
.end annotation


# static fields
.field public static final CONTENT_TYPE:Ljava/lang/String; = "application/json"


# instance fields
.field bodyBytes:[B

.field gson:Lcom/google/gson/Gson;

.field pojo:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field type:Ljava/lang/reflect/Type;


# direct methods
.method public constructor <init>(Lcom/google/gson/Gson;Ljava/lang/Object;Lcom/google/gson/reflect/TypeToken;)V
    .registers 6
    .param p1, "gson"    # Lcom/google/gson/Gson;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/Gson;",
            "TT;",
            "Lcom/google/gson/reflect/TypeToken",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p0, "this":Lcom/koushikdutta/ion/gson/PojoBody;, "Lcom/koushikdutta/ion/gson/PojoBody<TT;>;"
    .local p2, "pojo":Ljava/lang/Object;, "TT;"
    .local p3, "token":Lcom/google/gson/reflect/TypeToken;, "Lcom/google/gson/reflect/TypeToken<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p2, p0, Lcom/koushikdutta/ion/gson/PojoBody;->pojo:Ljava/lang/Object;

    .line 26
    if-eqz p3, :cond_d

    .line 27
    invoke-virtual {p3}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/ion/gson/PojoBody;->type:Ljava/lang/reflect/Type;

    .line 28
    :cond_d
    iput-object p1, p0, Lcom/koushikdutta/ion/gson/PojoBody;->gson:Lcom/google/gson/Gson;

    .line 30
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-nez v0, :cond_1d

    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_25

    .line 31
    :cond_1d
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "must provide a non-primitive type"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 32
    :cond_25
    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "this":Lcom/koushikdutta/ion/gson/PojoBody;, "Lcom/koushikdutta/ion/gson/PojoBody<TT;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/gson/PojoBody;->pojo:Ljava/lang/Object;

    return-object v0
.end method

.method getBodyBytes()[B
    .registers 6

    .prologue
    .line 35
    .local p0, "this":Lcom/koushikdutta/ion/gson/PojoBody;, "Lcom/koushikdutta/ion/gson/PojoBody<TT;>;"
    iget-object v2, p0, Lcom/koushikdutta/ion/gson/PojoBody;->bodyBytes:[B

    if-eqz v2, :cond_7

    .line 36
    iget-object v2, p0, Lcom/koushikdutta/ion/gson/PojoBody;->bodyBytes:[B

    .line 51
    :goto_6
    return-object v2

    .line 37
    :cond_7
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 38
    .local v0, "bout":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-direct {v1, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 39
    .local v1, "out":Ljava/io/OutputStreamWriter;
    iget-object v2, p0, Lcom/koushikdutta/ion/gson/PojoBody;->type:Ljava/lang/reflect/Type;

    if-nez v2, :cond_2b

    .line 40
    iget-object v2, p0, Lcom/koushikdutta/ion/gson/PojoBody;->gson:Lcom/google/gson/Gson;

    iget-object v3, p0, Lcom/koushikdutta/ion/gson/PojoBody;->pojo:Ljava/lang/Object;

    invoke-virtual {v2, v3, v1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;Ljava/lang/Appendable;)V

    .line 44
    :goto_1c
    :try_start_1c
    invoke-virtual {v1}, Ljava/io/OutputStreamWriter;->flush()V

    .line 45
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->flush()V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_22} :catch_35

    .line 50
    :goto_22
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    iput-object v2, p0, Lcom/koushikdutta/ion/gson/PojoBody;->bodyBytes:[B

    .line 51
    iget-object v2, p0, Lcom/koushikdutta/ion/gson/PojoBody;->bodyBytes:[B

    goto :goto_6

    .line 42
    :cond_2b
    iget-object v2, p0, Lcom/koushikdutta/ion/gson/PojoBody;->gson:Lcom/google/gson/Gson;

    iget-object v3, p0, Lcom/koushikdutta/ion/gson/PojoBody;->pojo:Ljava/lang/Object;

    iget-object v4, p0, Lcom/koushikdutta/ion/gson/PojoBody;->type:Ljava/lang/reflect/Type;

    invoke-virtual {v2, v3, v4, v1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;Ljava/lang/reflect/Type;Ljava/lang/Appendable;)V

    goto :goto_1c

    .line 47
    :catch_35
    move-exception v2

    goto :goto_22
.end method

.method public getContentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 66
    .local p0, "this":Lcom/koushikdutta/ion/gson/PojoBody;, "Lcom/koushikdutta/ion/gson/PojoBody<TT;>;"
    const-string v0, "application/json"

    return-object v0
.end method

.method public length()I
    .registers 2

    .prologue
    .line 76
    .local p0, "this":Lcom/koushikdutta/ion/gson/PojoBody;, "Lcom/koushikdutta/ion/gson/PojoBody<TT;>;"
    invoke-virtual {p0}, Lcom/koushikdutta/ion/gson/PojoBody;->getBodyBytes()[B

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public parse(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 3
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p2, "completed"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 62
    .local p0, "this":Lcom/koushikdutta/ion/gson/PojoBody;, "Lcom/koushikdutta/ion/gson/PojoBody<TT;>;"
    return-void
.end method

.method public readFullyOnRequest()Z
    .registers 2

    .prologue
    .line 71
    .local p0, "this":Lcom/koushikdutta/ion/gson/PojoBody;, "Lcom/koushikdutta/ion/gson/PojoBody<TT;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public write(Lcom/koushikdutta/async/http/AsyncHttpRequest;Lcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 5
    .param p1, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p2, "sink"    # Lcom/koushikdutta/async/DataSink;
    .param p3, "completed"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 56
    .local p0, "this":Lcom/koushikdutta/ion/gson/PojoBody;, "Lcom/koushikdutta/ion/gson/PojoBody<TT;>;"
    invoke-virtual {p0}, Lcom/koushikdutta/ion/gson/PojoBody;->getBodyBytes()[B

    move-result-object v0

    invoke-static {p2, v0, p3}, Lcom/koushikdutta/async/Util;->writeAll(Lcom/koushikdutta/async/DataSink;[BLcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 57
    return-void
.end method
