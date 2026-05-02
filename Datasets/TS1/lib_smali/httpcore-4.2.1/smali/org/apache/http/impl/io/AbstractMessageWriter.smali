.class public abstract Lorg/apache/http/impl/io/AbstractMessageWriter;
.super Ljava/lang/Object;
.source "AbstractMessageWriter.java"

# interfaces
.implements Lorg/apache/http/io/HttpMessageWriter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lorg/apache/http/HttpMessage;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/apache/http/io/HttpMessageWriter",
        "<TT;>;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field protected final lineBuf:Lorg/apache/http/util/CharArrayBuffer;

.field protected final lineFormatter:Lorg/apache/http/message/LineFormatter;

.field protected final sessionBuffer:Lorg/apache/http/io/SessionOutputBuffer;


# direct methods
.method public constructor <init>(Lorg/apache/http/io/SessionOutputBuffer;Lorg/apache/http/message/LineFormatter;Lorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "buffer"    # Lorg/apache/http/io/SessionOutputBuffer;
    .param p2, "formatter"    # Lorg/apache/http/message/LineFormatter;
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 67
    .local p0, "this":Lorg/apache/http/impl/io/AbstractMessageWriter;, "Lorg/apache/http/impl/io/AbstractMessageWriter<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    if-nez p1, :cond_d

    .line 69
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Session input buffer may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_d
    iput-object p1, p0, Lorg/apache/http/impl/io/AbstractMessageWriter;->sessionBuffer:Lorg/apache/http/io/SessionOutputBuffer;

    .line 72
    new-instance v0, Lorg/apache/http/util/CharArrayBuffer;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/http/impl/io/AbstractMessageWriter;->lineBuf:Lorg/apache/http/util/CharArrayBuffer;

    .line 73
    if-eqz p2, :cond_1d

    .end local p2    # "formatter":Lorg/apache/http/message/LineFormatter;
    :goto_1a
    iput-object p2, p0, Lorg/apache/http/impl/io/AbstractMessageWriter;->lineFormatter:Lorg/apache/http/message/LineFormatter;

    .line 75
    return-void

    .line 73
    .restart local p2    # "formatter":Lorg/apache/http/message/LineFormatter;
    :cond_1d
    sget-object p2, Lorg/apache/http/message/BasicLineFormatter;->DEFAULT:Lorg/apache/http/message/BasicLineFormatter;

    goto :goto_1a
.end method


# virtual methods
.method public write(Lorg/apache/http/HttpMessage;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 87
    .local p0, "this":Lorg/apache/http/impl/io/AbstractMessageWriter;, "Lorg/apache/http/impl/io/AbstractMessageWriter<TT;>;"
    .local p1, "message":Lorg/apache/http/HttpMessage;, "TT;"
    if-nez p1, :cond_a

    .line 88
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "HTTP message may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 90
    :cond_a
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/io/AbstractMessageWriter;->writeHeadLine(Lorg/apache/http/HttpMessage;)V

    .line 91
    invoke-interface {p1}, Lorg/apache/http/HttpMessage;->headerIterator()Lorg/apache/http/HeaderIterator;

    move-result-object v1

    .local v1, "it":Lorg/apache/http/HeaderIterator;
    :goto_11
    invoke-interface {v1}, Lorg/apache/http/HeaderIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_29

    .line 92
    invoke-interface {v1}, Lorg/apache/http/HeaderIterator;->nextHeader()Lorg/apache/http/Header;

    move-result-object v0

    .line 93
    .local v0, "header":Lorg/apache/http/Header;
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractMessageWriter;->sessionBuffer:Lorg/apache/http/io/SessionOutputBuffer;

    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractMessageWriter;->lineFormatter:Lorg/apache/http/message/LineFormatter;

    iget-object v4, p0, Lorg/apache/http/impl/io/AbstractMessageWriter;->lineBuf:Lorg/apache/http/util/CharArrayBuffer;

    invoke-interface {v3, v4, v0}, Lorg/apache/http/message/LineFormatter;->formatHeader(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/Header;)Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/http/io/SessionOutputBuffer;->writeLine(Lorg/apache/http/util/CharArrayBuffer;)V

    goto :goto_11

    .line 96
    .end local v0    # "header":Lorg/apache/http/Header;
    :cond_29
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractMessageWriter;->lineBuf:Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->clear()V

    .line 97
    iget-object v2, p0, Lorg/apache/http/impl/io/AbstractMessageWriter;->sessionBuffer:Lorg/apache/http/io/SessionOutputBuffer;

    iget-object v3, p0, Lorg/apache/http/impl/io/AbstractMessageWriter;->lineBuf:Lorg/apache/http/util/CharArrayBuffer;

    invoke-interface {v2, v3}, Lorg/apache/http/io/SessionOutputBuffer;->writeLine(Lorg/apache/http/util/CharArrayBuffer;)V

    .line 98
    return-void
.end method

.method protected abstract writeHeadLine(Lorg/apache/http/HttpMessage;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
