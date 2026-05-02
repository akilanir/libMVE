.class Lorg/ini4j/spi/UnicodeInputStreamReader;
.super Ljava/io/Reader;
.source "UnicodeInputStreamReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    }
.end annotation


# static fields
.field private static final BOM_SIZE:I = 0x4


# instance fields
.field private final _defaultEncoding:Ljava/nio/charset/Charset;

.field private _reader:Ljava/io/InputStreamReader;

.field private final _stream:Ljava/io/PushbackInputStream;


# direct methods
.method constructor <init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "defaultEnc"    # Ljava/nio/charset/Charset;

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/io/Reader;-><init>()V

    .line 101
    new-instance v0, Ljava/io/PushbackInputStream;

    const/4 v1, 0x4

    invoke-direct {v0, p1, v1}, Ljava/io/PushbackInputStream;-><init>(Ljava/io/InputStream;I)V

    iput-object v0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_stream:Ljava/io/PushbackInputStream;

    .line 102
    iput-object p2, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_defaultEncoding:Ljava/nio/charset/Charset;

    .line 103
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-virtual {p0}, Lorg/ini4j/spi/UnicodeInputStreamReader;->init()V

    .line 108
    iget-object v0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_reader:Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Ljava/io/InputStreamReader;->close()V

    .line 109
    return-void
.end method

.method protected init()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    iget-object v5, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_reader:Ljava/io/InputStreamReader;

    if-eqz v5, :cond_5

    .line 154
    :goto_4
    return-void

    .line 130
    :cond_5
    const/4 v5, 0x4

    new-array v1, v5, [B

    .line 134
    .local v1, "data":[B
    iget-object v5, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_stream:Ljava/io/PushbackInputStream;

    const/4 v6, 0x0

    array-length v7, v1

    invoke-virtual {v5, v1, v6, v7}, Ljava/io/PushbackInputStream;->read([BII)I

    move-result v3

    .line 135
    .local v3, "n":I
    # invokes: Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->find([B)Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    invoke-static {v1}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->access$000([B)Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    move-result-object v0

    .line 137
    .local v0, "bom":Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    if-nez v0, :cond_2c

    .line 139
    iget-object v2, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_defaultEncoding:Ljava/nio/charset/Charset;

    .line 140
    .local v2, "encoding":Ljava/nio/charset/Charset;
    move v4, v3

    .line 148
    .local v4, "unread":I
    :goto_19
    if-lez v4, :cond_22

    .line 150
    iget-object v5, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_stream:Ljava/io/PushbackInputStream;

    sub-int v6, v3, v4

    invoke-virtual {v5, v1, v6, v4}, Ljava/io/PushbackInputStream;->unread([BII)V

    .line 153
    :cond_22
    new-instance v5, Ljava/io/InputStreamReader;

    iget-object v6, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_stream:Ljava/io/PushbackInputStream;

    invoke-direct {v5, v6, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    iput-object v5, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_reader:Ljava/io/InputStreamReader;

    goto :goto_4

    .line 144
    .end local v2    # "encoding":Ljava/nio/charset/Charset;
    .end local v4    # "unread":I
    :cond_2c
    # getter for: Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_charset:Ljava/nio/charset/Charset;
    invoke-static {v0}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->access$100(Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;)Ljava/nio/charset/Charset;

    move-result-object v2

    .line 145
    .restart local v2    # "encoding":Ljava/nio/charset/Charset;
    array-length v5, v1

    # getter for: Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_bytes:[B
    invoke-static {v0}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->access$200(Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;)[B

    move-result-object v6

    array-length v6, v6

    sub-int v4, v5, v6

    .restart local v4    # "unread":I
    goto :goto_19
.end method

.method public read([CII)I
    .registers 5
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    invoke-virtual {p0}, Lorg/ini4j/spi/UnicodeInputStreamReader;->init()V

    .line 115
    iget-object v0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader;->_reader:Ljava/io/InputStreamReader;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStreamReader;->read([CII)I

    move-result v0

    return v0
.end method
