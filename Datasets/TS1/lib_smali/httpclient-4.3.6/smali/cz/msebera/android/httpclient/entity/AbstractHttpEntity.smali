.class public abstract Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;
.super Ljava/lang/Object;
.source "AbstractHttpEntity.java"

# interfaces
.implements Lcz/msebera/android/httpclient/HttpEntity;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# static fields
.field protected static final OUTPUT_BUFFER_SIZE:I = 0x1000


# instance fields
.field protected chunked:Z

.field protected contentEncoding:Lcz/msebera/android/httpclient/Header;

.field protected contentType:Lcz/msebera/android/httpclient/Header;


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
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
    .line 189
    return-void
.end method

.method public getContentEncoding()Lcz/msebera/android/httpclient/Header;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;->contentEncoding:Lcz/msebera/android/httpclient/Header;

    return-object v0
.end method

.method public getContentType()Lcz/msebera/android/httpclient/Header;
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;->contentType:Lcz/msebera/android/httpclient/Header;

    return-object v0
.end method

.method public isChunked()Z
    .registers 2

    .prologue
    .line 100
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;->chunked:Z

    return v0
.end method

.method public setChunked(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 177
    iput-boolean p1, p0, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;->chunked:Z

    .line 178
    return-void
.end method

.method public setContentEncoding(Lcz/msebera/android/httpclient/Header;)V
    .registers 2
    .param p1, "contentEncoding"    # Lcz/msebera/android/httpclient/Header;

    .prologue
    .line 142
    iput-object p1, p0, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;->contentEncoding:Lcz/msebera/android/httpclient/Header;

    .line 143
    return-void
.end method

.method public setContentEncoding(Ljava/lang/String;)V
    .registers 4
    .param p1, "ceString"    # Ljava/lang/String;

    .prologue
    .line 154
    const/4 v0, 0x0

    .line 155
    .local v0, "h":Lcz/msebera/android/httpclient/Header;
    if-eqz p1, :cond_a

    .line 156
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicHeader;

    .end local v0    # "h":Lcz/msebera/android/httpclient/Header;
    const-string v1, "Content-Encoding"

    invoke-direct {v0, v1, p1}, Lcz/msebera/android/httpclient/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .restart local v0    # "h":Lcz/msebera/android/httpclient/Header;
    :cond_a
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;->setContentEncoding(Lcz/msebera/android/httpclient/Header;)V

    .line 159
    return-void
.end method

.method public setContentType(Lcz/msebera/android/httpclient/Header;)V
    .registers 2
    .param p1, "contentType"    # Lcz/msebera/android/httpclient/Header;

    .prologue
    .line 113
    iput-object p1, p0, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;->contentType:Lcz/msebera/android/httpclient/Header;

    .line 114
    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .registers 4
    .param p1, "ctString"    # Ljava/lang/String;

    .prologue
    .line 125
    const/4 v0, 0x0

    .line 126
    .local v0, "h":Lcz/msebera/android/httpclient/Header;
    if-eqz p1, :cond_a

    .line 127
    new-instance v0, Lcz/msebera/android/httpclient/message/BasicHeader;

    .end local v0    # "h":Lcz/msebera/android/httpclient/Header;
    const-string v1, "Content-Type"

    invoke-direct {v0, v1, p1}, Lcz/msebera/android/httpclient/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .restart local v0    # "h":Lcz/msebera/android/httpclient/Header;
    :cond_a
    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;->setContentType(Lcz/msebera/android/httpclient/Header;)V

    .line 130
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    const/16 v5, 0x2c

    .line 193
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 194
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/16 v3, 0x5b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 195
    iget-object v3, p0, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;->contentType:Lcz/msebera/android/httpclient/Header;

    if-eqz v3, :cond_21

    .line 196
    const-string v3, "Content-Type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    iget-object v3, p0, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;->contentType:Lcz/msebera/android/httpclient/Header;

    invoke-interface {v3}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 200
    :cond_21
    iget-object v3, p0, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;->contentEncoding:Lcz/msebera/android/httpclient/Header;

    if-eqz v3, :cond_36

    .line 201
    const-string v3, "Content-Encoding: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    iget-object v3, p0, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;->contentEncoding:Lcz/msebera/android/httpclient/Header;

    invoke-interface {v3}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 205
    :cond_36
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;->getContentLength()J

    move-result-wide v0

    .line 206
    .local v0, "len":J
    const-wide/16 v3, 0x0

    cmp-long v3, v0, v3

    if-ltz v3, :cond_4b

    .line 207
    const-string v3, "Content-Length: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 209
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 211
    :cond_4b
    const-string v3, "Chunked: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    iget-boolean v3, p0, Lcz/msebera/android/httpclient/entity/AbstractHttpEntity;->chunked:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 213
    const/16 v3, 0x5d

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 214
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
