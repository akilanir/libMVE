.class Lretrofit/OkHttpCall$ExceptionCatchingRequestBody$1;
.super Lokio/ForwardingSource;
.source "OkHttpCall.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lretrofit/OkHttpCall$ExceptionCatchingRequestBody;->source()Lokio/BufferedSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lretrofit/OkHttpCall$ExceptionCatchingRequestBody;


# direct methods
.method constructor <init>(Lretrofit/OkHttpCall$ExceptionCatchingRequestBody;Lokio/Source;)V
    .registers 3
    .param p1, "this$0"    # Lretrofit/OkHttpCall$ExceptionCatchingRequestBody;
    .param p2, "x0"    # Lokio/Source;

    .prologue
    .line 217
    iput-object p1, p0, Lretrofit/OkHttpCall$ExceptionCatchingRequestBody$1;->this$0:Lretrofit/OkHttpCall$ExceptionCatchingRequestBody;

    invoke-direct {p0, p2}, Lokio/ForwardingSource;-><init>(Lokio/Source;)V

    return-void
.end method


# virtual methods
.method public read(Lokio/Buffer;J)J
    .registers 7
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 220
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Lokio/ForwardingSource;->read(Lokio/Buffer;J)J
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-wide v1

    return-wide v1

    .line 221
    :catch_5
    move-exception v0

    .line 222
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lretrofit/OkHttpCall$ExceptionCatchingRequestBody$1;->this$0:Lretrofit/OkHttpCall$ExceptionCatchingRequestBody;

    # setter for: Lretrofit/OkHttpCall$ExceptionCatchingRequestBody;->thrownException:Ljava/io/IOException;
    invoke-static {v1, v0}, Lretrofit/OkHttpCall$ExceptionCatchingRequestBody;->access$202(Lretrofit/OkHttpCall$ExceptionCatchingRequestBody;Ljava/io/IOException;)Ljava/io/IOException;

    .line 223
    throw v0
.end method
