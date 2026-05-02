.class public Lorg/apache/http/entity/EntityTemplate;
.super Lorg/apache/http/entity/AbstractHttpEntity;
.source "EntityTemplate.java"


# instance fields
.field private final contentproducer:Lorg/apache/http/entity/ContentProducer;


# direct methods
.method public constructor <init>(Lorg/apache/http/entity/ContentProducer;)V
    .registers 4
    .param p1, "contentproducer"    # Lorg/apache/http/entity/ContentProducer;

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/http/entity/AbstractHttpEntity;-><init>()V

    .line 48
    if-nez p1, :cond_d

    .line 49
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Content producer may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_d
    iput-object p1, p0, Lorg/apache/http/entity/EntityTemplate;->contentproducer:Lorg/apache/http/entity/ContentProducer;

    .line 52
    return-void
.end method


# virtual methods
.method public getContent()Ljava/io/InputStream;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 60
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0, v0}, Lorg/apache/http/entity/EntityTemplate;->writeTo(Ljava/io/OutputStream;)V

    .line 61
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v1
.end method

.method public getContentLength()J
    .registers 3

    .prologue
    .line 55
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public isRepeatable()Z
    .registers 2

    .prologue
    .line 65
    const/4 v0, 0x1

    return v0
.end method

.method public isStreaming()Z
    .registers 2

    .prologue
    .line 76
    const/4 v0, 0x0

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    if-nez p1, :cond_a

    .line 70
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Output stream may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_a
    iget-object v0, p0, Lorg/apache/http/entity/EntityTemplate;->contentproducer:Lorg/apache/http/entity/ContentProducer;

    invoke-interface {v0, p1}, Lorg/apache/http/entity/ContentProducer;->writeTo(Ljava/io/OutputStream;)V

    .line 73
    return-void
.end method
