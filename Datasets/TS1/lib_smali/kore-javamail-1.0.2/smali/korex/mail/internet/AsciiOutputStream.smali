.class public Lkorex/mail/internet/AsciiOutputStream;
.super Ljava/io/OutputStream;
.source "AsciiOutputStream.java"


# instance fields
.field private ascii:I

.field private badEOL:Z

.field private breakOnNonAscii:Z

.field private checkEOL:Z

.field private lastb:I

.field private linelen:I

.field private longLine:Z

.field private non_ascii:I

.field private ret:I


# direct methods
.method public constructor <init>(ZZ)V
    .registers 4
    .param p1, "breakOnNonAscii"    # Z
    .param p2, "encodeEolStrict"    # Z

    .prologue
    const/4 v0, 0x0

    .line 27
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 19
    iput v0, p0, Lkorex/mail/internet/AsciiOutputStream;->ascii:I

    iput v0, p0, Lkorex/mail/internet/AsciiOutputStream;->non_ascii:I

    .line 20
    iput v0, p0, Lkorex/mail/internet/AsciiOutputStream;->linelen:I

    .line 21
    iput-boolean v0, p0, Lkorex/mail/internet/AsciiOutputStream;->longLine:Z

    .line 22
    iput-boolean v0, p0, Lkorex/mail/internet/AsciiOutputStream;->badEOL:Z

    .line 23
    iput-boolean v0, p0, Lkorex/mail/internet/AsciiOutputStream;->checkEOL:Z

    .line 24
    iput v0, p0, Lkorex/mail/internet/AsciiOutputStream;->lastb:I

    .line 25
    iput v0, p0, Lkorex/mail/internet/AsciiOutputStream;->ret:I

    .line 28
    iput-boolean p1, p0, Lkorex/mail/internet/AsciiOutputStream;->breakOnNonAscii:Z

    .line 29
    if-eqz p2, :cond_1b

    if-eqz p1, :cond_1b

    const/4 v0, 0x1

    :cond_1b
    iput-boolean v0, p0, Lkorex/mail/internet/AsciiOutputStream;->checkEOL:Z

    .line 30
    return-void
.end method

.method private final check(I)V
    .registers 6
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/16 v2, 0xd

    const/16 v1, 0xa

    .line 52
    and-int/lit16 p1, p1, 0xff

    .line 53
    iget-boolean v0, p0, Lkorex/mail/internet/AsciiOutputStream;->checkEOL:Z

    if-eqz v0, :cond_19

    iget v0, p0, Lkorex/mail/internet/AsciiOutputStream;->lastb:I

    if-ne v0, v2, :cond_11

    if-ne p1, v1, :cond_17

    :cond_11
    iget v0, p0, Lkorex/mail/internet/AsciiOutputStream;->lastb:I

    if-eq v0, v2, :cond_19

    if-ne p1, v1, :cond_19

    .line 55
    :cond_17
    iput-boolean v3, p0, Lkorex/mail/internet/AsciiOutputStream;->badEOL:Z

    .line 57
    :cond_19
    if-eq p1, v2, :cond_1d

    if-ne p1, v1, :cond_39

    .line 58
    :cond_1d
    const/4 v0, 0x0

    iput v0, p0, Lkorex/mail/internet/AsciiOutputStream;->linelen:I

    .line 66
    :cond_20
    :goto_20
    invoke-static {p1}, Lkorex/mail/internet/MimeUtility;->nonascii(I)Z

    move-result v0

    if-eqz v0, :cond_48

    .line 67
    iget v0, p0, Lkorex/mail/internet/AsciiOutputStream;->non_ascii:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lkorex/mail/internet/AsciiOutputStream;->non_ascii:I

    .line 68
    iget-boolean v0, p0, Lkorex/mail/internet/AsciiOutputStream;->breakOnNonAscii:Z

    if-eqz v0, :cond_4e

    .line 69
    const/4 v0, 0x3

    iput v0, p0, Lkorex/mail/internet/AsciiOutputStream;->ret:I

    .line 70
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    .line 60
    :cond_39
    iget v0, p0, Lkorex/mail/internet/AsciiOutputStream;->linelen:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lkorex/mail/internet/AsciiOutputStream;->linelen:I

    .line 61
    iget v0, p0, Lkorex/mail/internet/AsciiOutputStream;->linelen:I

    const/16 v1, 0x3e6

    if-le v0, v1, :cond_20

    .line 63
    iput-boolean v3, p0, Lkorex/mail/internet/AsciiOutputStream;->longLine:Z

    goto :goto_20

    .line 73
    :cond_48
    iget v0, p0, Lkorex/mail/internet/AsciiOutputStream;->ascii:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lkorex/mail/internet/AsciiOutputStream;->ascii:I

    .line 75
    :cond_4e
    iput p1, p0, Lkorex/mail/internet/AsciiOutputStream;->lastb:I

    .line 76
    return-void
.end method


# virtual methods
.method public disableBreakOnNonAscii()V
    .registers 2

    .prologue
    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lkorex/mail/internet/AsciiOutputStream;->breakOnNonAscii:Z

    .line 34
    return-void
.end method

.method public getAscii()I
    .registers 5

    .prologue
    const/4 v0, 0x3

    const/4 v1, 0x2

    .line 82
    iget v2, p0, Lkorex/mail/internet/AsciiOutputStream;->ret:I

    if-eqz v2, :cond_9

    .line 83
    iget v0, p0, Lkorex/mail/internet/AsciiOutputStream;->ret:I

    .line 103
    :cond_8
    :goto_8
    return v0

    .line 89
    :cond_9
    iget-boolean v2, p0, Lkorex/mail/internet/AsciiOutputStream;->badEOL:Z

    if-nez v2, :cond_8

    .line 91
    iget v2, p0, Lkorex/mail/internet/AsciiOutputStream;->non_ascii:I

    if-nez v2, :cond_19

    .line 93
    iget-boolean v0, p0, Lkorex/mail/internet/AsciiOutputStream;->longLine:Z

    if-eqz v0, :cond_17

    move v0, v1

    .line 94
    goto :goto_8

    .line 96
    :cond_17
    const/4 v0, 0x1

    goto :goto_8

    .line 99
    :cond_19
    iget v2, p0, Lkorex/mail/internet/AsciiOutputStream;->ascii:I

    iget v3, p0, Lkorex/mail/internet/AsciiOutputStream;->non_ascii:I

    if-le v2, v3, :cond_8

    move v0, v1

    .line 101
    goto :goto_8
.end method

.method public write(I)V
    .registers 2
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lkorex/mail/internet/AsciiOutputStream;->check(I)V

    .line 38
    return-void
.end method

.method public write([B)V
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lkorex/mail/internet/AsciiOutputStream;->write([BII)V

    .line 42
    return-void
.end method

.method public write([BII)V
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    add-int/2addr p3, p2

    .line 46
    move v0, p2

    .local v0, "i":I
    :goto_2
    if-ge v0, p3, :cond_c

    .line 47
    aget-byte v1, p1, v0

    invoke-direct {p0, v1}, Lkorex/mail/internet/AsciiOutputStream;->check(I)V

    .line 46
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 49
    :cond_c
    return-void
.end method
