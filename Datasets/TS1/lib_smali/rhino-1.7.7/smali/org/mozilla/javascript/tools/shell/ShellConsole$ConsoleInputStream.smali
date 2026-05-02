.class Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;
.super Ljava/io/InputStream;
.source "ShellConsole.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/mozilla/javascript/tools/shell/ShellConsole;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConsoleInputStream"
.end annotation


# static fields
.field private static final EMPTY:[B


# instance fields
.field private atEOF:Z

.field private buffer:[B

.field private final console:Lorg/mozilla/javascript/tools/shell/ShellConsole;

.field private final cs:Ljava/nio/charset/Charset;

.field private cursor:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 193
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->EMPTY:[B

    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/tools/shell/ShellConsole;Ljava/nio/charset/Charset;)V
    .registers 4
    .param p1, "console"    # Lorg/mozilla/javascript/tools/shell/ShellConsole;
    .param p2, "cs"    # Ljava/nio/charset/Charset;

    .prologue
    .line 200
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 196
    sget-object v0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->EMPTY:[B

    iput-object v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->buffer:[B

    .line 197
    const/4 v0, -0x1

    iput v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cursor:I

    .line 198
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->atEOF:Z

    .line 201
    iput-object p1, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->console:Lorg/mozilla/javascript/tools/shell/ShellConsole;

    .line 202
    iput-object p2, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cs:Ljava/nio/charset/Charset;

    .line 203
    return-void
.end method

.method private ensureInput()Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 242
    iget-boolean v2, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->atEOF:Z

    if-eqz v2, :cond_7

    .line 252
    :goto_6
    return v0

    .line 245
    :cond_7
    iget v2, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cursor:I

    if-ltz v2, :cond_12

    iget v2, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cursor:I

    iget-object v3, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->buffer:[B

    array-length v3, v3

    if-le v2, v3, :cond_1e

    .line 246
    :cond_12
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->readNextLine()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1c

    .line 247
    iput-boolean v1, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->atEOF:Z

    goto :goto_6

    .line 250
    :cond_1c
    iput v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cursor:I

    :cond_1e
    move v0, v1

    .line 252
    goto :goto_6
.end method

.method private readNextLine()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 256
    iget-object v1, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->console:Lorg/mozilla/javascript/tools/shell/ShellConsole;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/tools/shell/ShellConsole;->readLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 257
    .local v0, "line":Ljava/lang/String;
    if-eqz v0, :cond_15

    .line 258
    iget-object v1, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cs:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->buffer:[B

    .line 259
    iget-object v1, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->buffer:[B

    array-length v1, v1

    .line 262
    :goto_14
    return v1

    .line 261
    :cond_15
    sget-object v1, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->EMPTY:[B

    iput-object v1, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->buffer:[B

    .line 262
    const/4 v1, -0x1

    goto :goto_14
.end method


# virtual methods
.method public declared-synchronized read()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 231
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->ensureInput()Z
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_25

    move-result v0

    if-nez v0, :cond_a

    .line 232
    const/4 v0, -0x1

    .line 238
    :goto_8
    monitor-exit p0

    return v0

    .line 234
    :cond_a
    :try_start_a
    iget v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cursor:I

    iget-object v1, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->buffer:[B

    array-length v1, v1

    if-ne v0, v1, :cond_1a

    .line 235
    iget v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cursor:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cursor:I

    .line 236
    const/16 v0, 0xa

    goto :goto_8

    .line 238
    :cond_1a
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->buffer:[B

    iget v1, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cursor:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cursor:I

    aget-byte v0, v0, v1
    :try_end_24
    .catchall {:try_start_a .. :try_end_24} :catchall_25

    goto :goto_8

    .line 231
    :catchall_25
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized read([BII)I
    .registers 10
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 208
    monitor-enter p0

    if-nez p1, :cond_c

    .line 209
    :try_start_3
    new-instance v3, Ljava/lang/NullPointerException;

    invoke-direct {v3}, Ljava/lang/NullPointerException;-><init>()V

    throw v3
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_9

    .line 208
    :catchall_9
    move-exception v3

    monitor-exit p0

    throw v3

    .line 210
    :cond_c
    if-ltz p2, :cond_14

    if-ltz p3, :cond_14

    :try_start_10
    array-length v3, p1

    sub-int/2addr v3, p2

    if-le p3, v3, :cond_1a

    .line 211
    :cond_14
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v3}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v3
    :try_end_1a
    .catchall {:try_start_10 .. :try_end_1a} :catchall_9

    .line 212
    :cond_1a
    if-nez p3, :cond_1f

    .line 213
    const/4 v1, 0x0

    .line 226
    :goto_1d
    monitor-exit p0

    return v1

    .line 215
    :cond_1f
    :try_start_1f
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->ensureInput()Z

    move-result v3

    if-nez v3, :cond_27

    .line 216
    const/4 v1, -0x1

    goto :goto_1d

    .line 218
    :cond_27
    iget-object v3, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->buffer:[B

    array-length v3, v3

    iget v4, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cursor:I

    sub-int/2addr v3, v4

    invoke-static {p3, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 219
    .local v1, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_32
    if-ge v0, v1, :cond_42

    .line 220
    add-int v3, p2, v0

    iget-object v4, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->buffer:[B

    iget v5, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cursor:I

    add-int/2addr v5, v0

    aget-byte v4, v4, v5

    aput-byte v4, p1, v3

    .line 219
    add-int/lit8 v0, v0, 0x1

    goto :goto_32

    .line 222
    :cond_42
    if-ge v1, p3, :cond_4d

    .line 223
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "n":I
    .local v2, "n":I
    add-int v3, p2, v1

    const/16 v4, 0xa

    aput-byte v4, p1, v3

    move v1, v2

    .line 225
    .end local v2    # "n":I
    .restart local v1    # "n":I
    :cond_4d
    iget v3, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cursor:I

    add-int/2addr v3, v1

    iput v3, p0, Lorg/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream;->cursor:I
    :try_end_52
    .catchall {:try_start_1f .. :try_end_52} :catchall_9

    goto :goto_1d
.end method
