.class public Lcom/drew/lang/RandomAccessFileReader;
.super Lcom/drew/lang/RandomAccessReader;
.source "RandomAccessFileReader.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private _currentIndex:I

.field private final _file:Ljava/io/RandomAccessFile;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field private final _length:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    const-class v0, Lcom/drew/lang/RandomAccessFileReader;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/drew/lang/RandomAccessFileReader;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Ljava/io/RandomAccessFile;)V
    .registers 4
    .param p1, "file"    # Ljava/io/RandomAccessFile;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/SuppressWarnings;
        justification = "Design intent"
        value = "EI_EXPOSE_REP2"
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-direct {p0}, Lcom/drew/lang/RandomAccessReader;-><init>()V

    .line 46
    if-nez p1, :cond_b

    .line 47
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 49
    :cond_b
    iput-object p1, p0, Lcom/drew/lang/RandomAccessFileReader;->_file:Ljava/io/RandomAccessFile;

    .line 50
    iget-object v0, p0, Lcom/drew/lang/RandomAccessFileReader;->_file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/drew/lang/RandomAccessFileReader;->_length:J

    .line 51
    return-void
.end method

.method private seek(I)V
    .registers 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    iget v0, p0, Lcom/drew/lang/RandomAccessFileReader;->_currentIndex:I

    if-ne p1, v0, :cond_5

    .line 97
    :goto_4
    return-void

    .line 95
    :cond_5
    iget-object v0, p0, Lcom/drew/lang/RandomAccessFileReader;->_file:Ljava/io/RandomAccessFile;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 96
    iput p1, p0, Lcom/drew/lang/RandomAccessFileReader;->_currentIndex:I

    goto :goto_4
.end method


# virtual methods
.method protected getByte(I)B
    .registers 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    iget v1, p0, Lcom/drew/lang/RandomAccessFileReader;->_currentIndex:I

    if-eq p1, v1, :cond_7

    .line 63
    invoke-direct {p0, p1}, Lcom/drew/lang/RandomAccessFileReader;->seek(I)V

    .line 65
    :cond_7
    iget-object v1, p0, Lcom/drew/lang/RandomAccessFileReader;->_file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->read()I

    move-result v0

    .line 66
    .local v0, "b":I
    if-gez v0, :cond_17

    .line 67
    new-instance v1, Lcom/drew/lang/BufferBoundsException;

    const-string v2, "Unexpected end of file encountered."

    invoke-direct {v1, v2}, Lcom/drew/lang/BufferBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 68
    :cond_17
    sget-boolean v1, Lcom/drew/lang/RandomAccessFileReader;->$assertionsDisabled:Z

    if-nez v1, :cond_25

    const/16 v1, 0xff

    if-le v0, v1, :cond_25

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 69
    :cond_25
    iget v1, p0, Lcom/drew/lang/RandomAccessFileReader;->_currentIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/drew/lang/RandomAccessFileReader;->_currentIndex:I

    .line 70
    int-to-byte v1, v0

    return v1
.end method

.method public getBytes(II)[B
    .registers 7
    .param p1, "index"    # I
    .param p2, "count"    # I
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-virtual {p0, p1, p2}, Lcom/drew/lang/RandomAccessFileReader;->validateIndex(II)V

    .line 79
    iget v2, p0, Lcom/drew/lang/RandomAccessFileReader;->_currentIndex:I

    if-eq p1, v2, :cond_a

    .line 80
    invoke-direct {p0, p1}, Lcom/drew/lang/RandomAccessFileReader;->seek(I)V

    .line 82
    :cond_a
    new-array v0, p2, [B

    .line 83
    .local v0, "bytes":[B
    iget-object v2, p0, Lcom/drew/lang/RandomAccessFileReader;->_file:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v0}, Ljava/io/RandomAccessFile;->read([B)I

    move-result v1

    .line 84
    .local v1, "bytesRead":I
    iget v2, p0, Lcom/drew/lang/RandomAccessFileReader;->_currentIndex:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/drew/lang/RandomAccessFileReader;->_currentIndex:I

    .line 85
    if-eq v1, p2, :cond_21

    .line 86
    new-instance v2, Lcom/drew/lang/BufferBoundsException;

    const-string v3, "Unexpected end of file encountered."

    invoke-direct {v2, v3}, Lcom/drew/lang/BufferBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 87
    :cond_21
    return-object v0
.end method

.method public getLength()J
    .registers 3

    .prologue
    .line 56
    iget-wide v0, p0, Lcom/drew/lang/RandomAccessFileReader;->_length:J

    return-wide v0
.end method

.method protected isValidIndex(II)Z
    .registers 7
    .param p1, "index"    # I
    .param p2, "bytesRequested"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 102
    if-ltz p2, :cond_12

    if-ltz p1, :cond_12

    int-to-long v0, p1

    int-to-long v2, p2

    add-long/2addr v0, v2

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    iget-wide v2, p0, Lcom/drew/lang/RandomAccessFileReader;->_length:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method protected validateIndex(II)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "bytesRequested"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    invoke-virtual {p0, p1, p2}, Lcom/drew/lang/RandomAccessFileReader;->isValidIndex(II)Z

    move-result v0

    if-nez v0, :cond_e

    .line 111
    new-instance v0, Lcom/drew/lang/BufferBoundsException;

    iget-wide v1, p0, Lcom/drew/lang/RandomAccessFileReader;->_length:J

    invoke-direct {v0, p1, p2, v1, v2}, Lcom/drew/lang/BufferBoundsException;-><init>(IIJ)V

    throw v0

    .line 112
    :cond_e
    return-void
.end method
