.class Lorg/ini4j/spi/IniSource;
.super Ljava/lang/Object;
.source "IniSource.java"


# static fields
.field private static final ESCAPE_CHAR:C = '\\'

.field public static final INCLUDE_BEGIN:C = '<'

.field public static final INCLUDE_END:C = '>'

.field public static final INCLUDE_OPTIONAL:C = '?'


# instance fields
.field private _base:Ljava/net/URL;

.field private _chain:Lorg/ini4j/spi/IniSource;

.field private final _commentChars:Ljava/lang/String;

.field private final _config:Lorg/ini4j/Config;

.field private final _handler:Lorg/ini4j/spi/HandlerBase;

.field private final _reader:Ljava/io/LineNumberReader;


# direct methods
.method constructor <init>(Ljava/io/InputStream;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V
    .registers 7
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "handler"    # Lorg/ini4j/spi/HandlerBase;
    .param p3, "comments"    # Ljava/lang/String;
    .param p4, "config"    # Lorg/ini4j/Config;

    .prologue
    .line 42
    new-instance v0, Lorg/ini4j/spi/UnicodeInputStreamReader;

    invoke-virtual {p4}, Lorg/ini4j/Config;->getFileEncoding()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lorg/ini4j/spi/UnicodeInputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {p0, v0, p2, p3, p4}, Lorg/ini4j/spi/IniSource;-><init>(Ljava/io/Reader;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V

    .line 43
    return-void
.end method

.method constructor <init>(Ljava/io/Reader;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V
    .registers 6
    .param p1, "input"    # Ljava/io/Reader;
    .param p2, "handler"    # Lorg/ini4j/spi/HandlerBase;
    .param p3, "comments"    # Ljava/lang/String;
    .param p4, "config"    # Lorg/ini4j/Config;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/io/LineNumberReader;

    invoke-direct {v0, p1}, Ljava/io/LineNumberReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lorg/ini4j/spi/IniSource;->_reader:Ljava/io/LineNumberReader;

    .line 48
    iput-object p2, p0, Lorg/ini4j/spi/IniSource;->_handler:Lorg/ini4j/spi/HandlerBase;

    .line 49
    iput-object p3, p0, Lorg/ini4j/spi/IniSource;->_commentChars:Ljava/lang/String;

    .line 50
    iput-object p4, p0, Lorg/ini4j/spi/IniSource;->_config:Lorg/ini4j/Config;

    .line 51
    return-void
.end method

.method constructor <init>(Ljava/net/URL;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V
    .registers 8
    .param p1, "input"    # Ljava/net/URL;
    .param p2, "handler"    # Lorg/ini4j/spi/HandlerBase;
    .param p3, "comments"    # Ljava/lang/String;
    .param p4, "config"    # Lorg/ini4j/Config;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    new-instance v0, Lorg/ini4j/spi/UnicodeInputStreamReader;

    invoke-virtual {p1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {p4}, Lorg/ini4j/Config;->getFileEncoding()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/ini4j/spi/UnicodeInputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {p0, v0, p2, p3, p4}, Lorg/ini4j/spi/IniSource;-><init>(Ljava/io/Reader;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V

    .line 56
    iput-object p1, p0, Lorg/ini4j/spi/IniSource;->_base:Ljava/net/URL;

    .line 57
    return-void
.end method

.method private close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 98
    iget-object v0, p0, Lorg/ini4j/spi/IniSource;->_reader:Ljava/io/LineNumberReader;

    invoke-virtual {v0}, Ljava/io/LineNumberReader;->close()V

    .line 99
    return-void
.end method

.method private countEndingEscapes(Ljava/lang/String;)I
    .registers 6
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 103
    const/4 v0, 0x0

    .line 105
    .local v0, "escapeCount":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .local v1, "i":I
    :goto_7
    if-ltz v1, :cond_16

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x5c

    if-ne v2, v3, :cond_16

    .line 107
    add-int/lit8 v0, v0, 0x1

    .line 105
    add-int/lit8 v1, v1, -0x1

    goto :goto_7

    .line 110
    :cond_16
    return v0
.end method

.method private handleComment(Ljava/lang/StringBuilder;)V
    .registers 4
    .param p1, "buff"    # Ljava/lang/StringBuilder;

    .prologue
    .line 115
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-eqz v0, :cond_20

    .line 117
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 118
    iget-object v0, p0, Lorg/ini4j/spi/IniSource;->_handler:Lorg/ini4j/spi/HandlerBase;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/ini4j/spi/HandlerBase;->handleComment(Ljava/lang/String;)V

    .line 119
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 121
    :cond_20
    return-void
.end method

.method private handleInclude(Ljava/lang/String;)Ljava/lang/String;
    .registers 9
    .param p1, "input"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 125
    move-object v0, p1

    .line 127
    .local v0, "line":Ljava/lang/String;
    iget-object v4, p0, Lorg/ini4j/spi/IniSource;->_config:Lorg/ini4j/Config;

    invoke-virtual {v4}, Lorg/ini4j/Config;->isInclude()Z

    move-result v4

    if-eqz v4, :cond_65

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x2

    if-le v4, v5, :cond_65

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x3c

    if-ne v4, v5, :cond_65

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x3e

    if-ne v4, v5, :cond_65

    .line 129
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 130
    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x3f

    if-ne v4, v5, :cond_3f

    move v2, v3

    .line 132
    .local v2, "optional":Z
    :cond_3f
    if-eqz v2, :cond_49

    .line 134
    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 137
    :cond_49
    iget-object v3, p0, Lorg/ini4j/spi/IniSource;->_base:Ljava/net/URL;

    if-nez v3, :cond_66

    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 139
    .local v1, "loc":Ljava/net/URL;
    :goto_52
    if-eqz v2, :cond_7a

    .line 143
    :try_start_54
    new-instance v3, Lorg/ini4j/spi/IniSource;

    iget-object v4, p0, Lorg/ini4j/spi/IniSource;->_handler:Lorg/ini4j/spi/HandlerBase;

    iget-object v5, p0, Lorg/ini4j/spi/IniSource;->_commentChars:Ljava/lang/String;

    iget-object v6, p0, Lorg/ini4j/spi/IniSource;->_config:Lorg/ini4j/Config;

    invoke-direct {v3, v1, v4, v5, v6}, Lorg/ini4j/spi/IniSource;-><init>(Ljava/net/URL;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V

    iput-object v3, p0, Lorg/ini4j/spi/IniSource;->_chain:Lorg/ini4j/spi/IniSource;
    :try_end_61
    .catch Ljava/io/IOException; {:try_start_54 .. :try_end_61} :catch_6e
    .catchall {:try_start_54 .. :try_end_61} :catchall_74

    .line 151
    invoke-virtual {p0}, Lorg/ini4j/spi/IniSource;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 161
    .end local v1    # "loc":Ljava/net/URL;
    .end local v2    # "optional":Z
    :cond_65
    :goto_65
    return-object v0

    .line 137
    .restart local v2    # "optional":Z
    :cond_66
    new-instance v1, Ljava/net/URL;

    iget-object v3, p0, Lorg/ini4j/spi/IniSource;->_base:Ljava/net/URL;

    invoke-direct {v1, v3, v0}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    goto :goto_52

    .line 145
    .restart local v1    # "loc":Ljava/net/URL;
    :catch_6e
    move-exception v3

    .line 151
    invoke-virtual {p0}, Lorg/ini4j/spi/IniSource;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 152
    goto :goto_65

    .line 151
    :catchall_74
    move-exception v3

    invoke-virtual {p0}, Lorg/ini4j/spi/IniSource;->readLine()Ljava/lang/String;

    move-result-object v0

    throw v3

    .line 156
    :cond_7a
    new-instance v3, Lorg/ini4j/spi/IniSource;

    iget-object v4, p0, Lorg/ini4j/spi/IniSource;->_handler:Lorg/ini4j/spi/HandlerBase;

    iget-object v5, p0, Lorg/ini4j/spi/IniSource;->_commentChars:Ljava/lang/String;

    iget-object v6, p0, Lorg/ini4j/spi/IniSource;->_config:Lorg/ini4j/Config;

    invoke-direct {v3, v1, v4, v5, v6}, Lorg/ini4j/spi/IniSource;-><init>(Ljava/net/URL;Lorg/ini4j/spi/HandlerBase;Ljava/lang/String;Lorg/ini4j/Config;)V

    iput-object v3, p0, Lorg/ini4j/spi/IniSource;->_chain:Lorg/ini4j/spi/IniSource;

    .line 157
    invoke-virtual {p0}, Lorg/ini4j/spi/IniSource;->readLine()Ljava/lang/String;

    move-result-object v0

    goto :goto_65
.end method

.method private readLineLocal()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 166
    invoke-direct {p0}, Lorg/ini4j/spi/IniSource;->readLineSkipComments()Ljava/lang/String;

    move-result-object v0

    .line 168
    .local v0, "line":Ljava/lang/String;
    if-nez v0, :cond_a

    .line 170
    invoke-direct {p0}, Lorg/ini4j/spi/IniSource;->close()V

    .line 177
    :goto_9
    return-object v0

    .line 174
    :cond_a
    invoke-direct {p0, v0}, Lorg/ini4j/spi/IniSource;->handleInclude(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_9
.end method

.method private readLineSkipComments()Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 183
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 184
    .local v1, "comment":Ljava/lang/StringBuilder;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 186
    .local v0, "buff":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/ini4j/spi/IniSource;->_reader:Ljava/io/LineNumberReader;

    invoke-virtual {v3}, Ljava/io/LineNumberReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .local v2, "line":Ljava/lang/String;
    :goto_11
    if-eqz v2, :cond_65

    .line 188
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 189
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_27

    .line 191
    invoke-direct {p0, v1}, Lorg/ini4j/spi/IniSource;->handleComment(Ljava/lang/StringBuilder;)V

    .line 186
    :goto_20
    iget-object v3, p0, Lorg/ini4j/spi/IniSource;->_reader:Ljava/io/LineNumberReader;

    invoke-virtual {v3}, Ljava/io/LineNumberReader;->readLine()Ljava/lang/String;

    move-result-object v2

    goto :goto_11

    .line 193
    :cond_27
    iget-object v3, p0, Lorg/ini4j/spi/IniSource;->_commentChars:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-ltz v3, :cond_4b

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-nez v3, :cond_4b

    .line 195
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    iget-object v3, p0, Lorg/ini4j/spi/IniSource;->_config:Lorg/ini4j/Config;

    invoke-virtual {v3}, Lorg/ini4j/Config;->getLineSeparator()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_20

    .line 200
    :cond_4b
    invoke-direct {p0, v1}, Lorg/ini4j/spi/IniSource;->handleComment(Ljava/lang/StringBuilder;)V

    .line 201
    iget-object v3, p0, Lorg/ini4j/spi/IniSource;->_config:Lorg/ini4j/Config;

    invoke-virtual {v3}, Lorg/ini4j/Config;->isEscapeNewline()Z

    move-result v3

    if-eqz v3, :cond_5e

    invoke-direct {p0, v2}, Lorg/ini4j/spi/IniSource;->countEndingEscapes(Ljava/lang/String;)I

    move-result v3

    and-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_71

    .line 203
    :cond_5e
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 214
    :cond_65
    if-nez v2, :cond_70

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_70

    .line 216
    invoke-direct {p0, v1}, Lorg/ini4j/spi/IniSource;->handleComment(Ljava/lang/StringBuilder;)V

    .line 219
    :cond_70
    return-object v2

    .line 209
    :cond_71
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v5, v3}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_20
.end method


# virtual methods
.method getLineNumber()I
    .registers 3

    .prologue
    .line 63
    iget-object v1, p0, Lorg/ini4j/spi/IniSource;->_chain:Lorg/ini4j/spi/IniSource;

    if-nez v1, :cond_b

    .line 65
    iget-object v1, p0, Lorg/ini4j/spi/IniSource;->_reader:Ljava/io/LineNumberReader;

    invoke-virtual {v1}, Ljava/io/LineNumberReader;->getLineNumber()I

    move-result v0

    .line 72
    .local v0, "ret":I
    :goto_a
    return v0

    .line 69
    .end local v0    # "ret":I
    :cond_b
    iget-object v1, p0, Lorg/ini4j/spi/IniSource;->_chain:Lorg/ini4j/spi/IniSource;

    invoke-virtual {v1}, Lorg/ini4j/spi/IniSource;->getLineNumber()I

    move-result v0

    .restart local v0    # "ret":I
    goto :goto_a
.end method

.method readLine()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    iget-object v1, p0, Lorg/ini4j/spi/IniSource;->_chain:Lorg/ini4j/spi/IniSource;

    if-nez v1, :cond_9

    .line 81
    invoke-direct {p0}, Lorg/ini4j/spi/IniSource;->readLineLocal()Ljava/lang/String;

    move-result-object v0

    .line 93
    .local v0, "line":Ljava/lang/String;
    :cond_8
    :goto_8
    return-object v0

    .line 85
    .end local v0    # "line":Ljava/lang/String;
    :cond_9
    iget-object v1, p0, Lorg/ini4j/spi/IniSource;->_chain:Lorg/ini4j/spi/IniSource;

    invoke-virtual {v1}, Lorg/ini4j/spi/IniSource;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 86
    .restart local v0    # "line":Ljava/lang/String;
    if-nez v0, :cond_8

    .line 88
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/ini4j/spi/IniSource;->_chain:Lorg/ini4j/spi/IniSource;

    .line 89
    invoke-virtual {p0}, Lorg/ini4j/spi/IniSource;->readLine()Ljava/lang/String;

    move-result-object v0

    goto :goto_8
.end method
