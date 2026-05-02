.class public abstract Lorg/apache/http/entity/AbstractHttpEntity;
.super Ljava/lang/Object;
.source "AbstractHttpEntity.java"

# interfaces
.implements Lorg/apache/http/HttpEntity;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field protected chunked:Z

.field protected contentEncoding:Lorg/apache/http/Header;

.field protected contentType:Lorg/apache/http/Header;


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    return-void
.end method


# virtual methods
.method public consumeContent()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 183
    return-void
.end method

.method public getContentEncoding()Lorg/apache/http/Header;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lorg/apache/http/entity/AbstractHttpEntity;->contentEncoding:Lorg/apache/http/Header;

    return-object v0
.end method

.method public getContentType()Lorg/apache/http/Header;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/http/entity/AbstractHttpEntity;->contentType:Lorg/apache/http/Header;

    return-object v0
.end method

.method public isChunked()Z
    .registers 2

    .prologue
    .line 94
    iget-boolean v0, p0, Lorg/apache/http/entity/AbstractHttpEntity;->chunked:Z

    return v0
.end method

.method public setChunked(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 171
    iput-boolean p1, p0, Lorg/apache/http/entity/AbstractHttpEntity;->chunked:Z

    .line 172
    return-void
.end method

.method public setContentEncoding(Ljava/lang/String;)V
    .registers 4
    .param p1, "ceString"    # Ljava/lang/String;

    .prologue
    .line 148
    const/4 v0, 0x0

    .line 149
    .local v0, "h":Lorg/apache/http/Header;
    if-eqz p1, :cond_a

    .line 150
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    .end local v0    # "h":Lorg/apache/http/Header;
    const-string v1, "Content-Encoding"

    invoke-direct {v0, v1, p1}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    .restart local v0    # "h":Lorg/apache/http/Header;
    :cond_a
    invoke-virtual {p0, v0}, Lorg/apache/http/entity/AbstractHttpEntity;->setContentEncoding(Lorg/apache/http/Header;)V

    .line 153
    return-void
.end method

.method public setContentEncoding(Lorg/apache/http/Header;)V
    .registers 2
    .param p1, "contentEncoding"    # Lorg/apache/http/Header;

    .prologue
    .line 136
    iput-object p1, p0, Lorg/apache/http/entity/AbstractHttpEntity;->contentEncoding:Lorg/apache/http/Header;

    .line 137
    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .registers 4
    .param p1, "ctString"    # Ljava/lang/String;

    .prologue
    .line 119
    const/4 v0, 0x0

    .line 120
    .local v0, "h":Lorg/apache/http/Header;
    if-eqz p1, :cond_a

    .line 121
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    .end local v0    # "h":Lorg/apache/http/Header;
    const-string v1, "Content-Type"

    invoke-direct {v0, v1, p1}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .restart local v0    # "h":Lorg/apache/http/Header;
    :cond_a
    invoke-virtual {p0, v0}, Lorg/apache/http/entity/AbstractHttpEntity;->setContentType(Lorg/apache/http/Header;)V

    .line 124
    return-void
.end method

.method public setContentType(Lorg/apache/http/Header;)V
    .registers 2
    .param p1, "contentType"    # Lorg/apache/http/Header;

    .prologue
    .line 107
    iput-object p1, p0, Lorg/apache/http/entity/AbstractHttpEntity;->contentType:Lorg/apache/http/Header;

    .line 108
    return-void
.end method
