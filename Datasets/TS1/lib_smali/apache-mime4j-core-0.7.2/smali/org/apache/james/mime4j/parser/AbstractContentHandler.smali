.class public abstract Lorg/apache/james/mime4j/parser/AbstractContentHandler;
.super Ljava/lang/Object;
.source "AbstractContentHandler.java"

# interfaces
.implements Lorg/apache/james/mime4j/parser/ContentHandler;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public body(Lorg/apache/james/mime4j/stream/BodyDescriptor;Ljava/io/InputStream;)V
    .registers 3
    .param p1, "bd"    # Lorg/apache/james/mime4j/stream/BodyDescriptor;
    .param p2, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    return-void
.end method

.method public endBodyPart()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;
        }
    .end annotation

    .prologue
    .line 46
    return-void
.end method

.method public endHeader()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;
        }
    .end annotation

    .prologue
    .line 49
    return-void
.end method

.method public endMessage()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;
        }
    .end annotation

    .prologue
    .line 52
    return-void
.end method

.method public endMultipart()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;
        }
    .end annotation

    .prologue
    .line 36
    return-void
.end method

.method public epilogue(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    return-void
.end method

.method public field(Lorg/apache/james/mime4j/stream/Field;)V
    .registers 2
    .param p1, "field"    # Lorg/apache/james/mime4j/stream/Field;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;
        }
    .end annotation

    .prologue
    .line 58
    return-void
.end method

.method public preamble(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    return-void
.end method

.method public raw(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    return-void
.end method

.method public startBodyPart()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;
        }
    .end annotation

    .prologue
    .line 64
    return-void
.end method

.method public startHeader()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;
        }
    .end annotation

    .prologue
    .line 67
    return-void
.end method

.method public startMessage()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;
        }
    .end annotation

    .prologue
    .line 70
    return-void
.end method

.method public startMultipart(Lorg/apache/james/mime4j/stream/BodyDescriptor;)V
    .registers 2
    .param p1, "bd"    # Lorg/apache/james/mime4j/stream/BodyDescriptor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/james/mime4j/MimeException;
        }
    .end annotation

    .prologue
    .line 39
    return-void
.end method
