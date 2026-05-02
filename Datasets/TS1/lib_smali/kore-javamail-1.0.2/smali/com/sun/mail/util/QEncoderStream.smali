.class public Lcom/sun/mail/util/QEncoderStream;
.super Lcom/sun/mail/util/QPEncoderStream;
.source "QEncoderStream.java"


# static fields
.field private static TEXT_SPECIALS:Ljava/lang/String;

.field private static WORD_SPECIALS:Ljava/lang/String;


# instance fields
.field private specials:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 55
    const-string v0, "=_?\"#$%&\'(),.:;<>@[\\]^`{|}~"

    sput-object v0, Lcom/sun/mail/util/QEncoderStream;->WORD_SPECIALS:Ljava/lang/String;

    .line 56
    const-string v0, "=_?"

    sput-object v0, Lcom/sun/mail/util/QEncoderStream;->TEXT_SPECIALS:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;Z)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "encodingWord"    # Z

    .prologue
    .line 65
    const v0, 0x7fffffff

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/util/QPEncoderStream;-><init>(Ljava/io/OutputStream;I)V

    .line 72
    if-eqz p2, :cond_d

    sget-object v0, Lcom/sun/mail/util/QEncoderStream;->WORD_SPECIALS:Ljava/lang/String;

    :goto_a
    iput-object v0, p0, Lcom/sun/mail/util/QEncoderStream;->specials:Ljava/lang/String;

    .line 73
    return-void

    .line 72
    :cond_d
    sget-object v0, Lcom/sun/mail/util/QEncoderStream;->TEXT_SPECIALS:Ljava/lang/String;

    goto :goto_a
.end method

.method public static encodedLength([BZ)I
    .registers 7
    .param p0, "b"    # [B
    .param p1, "encodingWord"    # Z

    .prologue
    .line 95
    const/4 v2, 0x0

    .line 96
    .local v2, "len":I
    if-eqz p1, :cond_20

    sget-object v3, Lcom/sun/mail/util/QEncoderStream;->WORD_SPECIALS:Ljava/lang/String;

    .line 97
    .local v3, "specials":Ljava/lang/String;
    :goto_5
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    array-length v4, p0

    if-ge v1, v4, :cond_26

    .line 98
    aget-byte v4, p0, v1

    and-int/lit16 v0, v4, 0xff

    .line 99
    .local v0, "c":I
    const/16 v4, 0x20

    if-lt v0, v4, :cond_1b

    const/16 v4, 0x7f

    if-ge v0, v4, :cond_1b

    invoke-virtual {v3, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-ltz v4, :cond_23

    .line 101
    :cond_1b
    add-int/lit8 v2, v2, 0x3

    .line 97
    :goto_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 96
    .end local v0    # "c":I
    .end local v1    # "i":I
    .end local v3    # "specials":Ljava/lang/String;
    :cond_20
    sget-object v3, Lcom/sun/mail/util/QEncoderStream;->TEXT_SPECIALS:Ljava/lang/String;

    goto :goto_5

    .line 103
    .restart local v0    # "c":I
    .restart local v1    # "i":I
    .restart local v3    # "specials":Ljava/lang/String;
    :cond_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    .line 105
    .end local v0    # "c":I
    :cond_26
    return v2
.end method


# virtual methods
.method public write(I)V
    .registers 4
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v0, 0x20

    const/4 v1, 0x0

    .line 81
    and-int/lit16 p1, p1, 0xff

    .line 82
    if-ne p1, v0, :cond_d

    .line 83
    const/16 v0, 0x5f

    invoke-virtual {p0, v0, v1}, Lcom/sun/mail/util/QEncoderStream;->output(IZ)V

    .line 89
    :goto_c
    return-void

    .line 84
    :cond_d
    if-lt p1, v0, :cond_1b

    const/16 v0, 0x7f

    if-ge p1, v0, :cond_1b

    iget-object v0, p0, Lcom/sun/mail/util/QEncoderStream;->specials:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_20

    .line 86
    :cond_1b
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/sun/mail/util/QEncoderStream;->output(IZ)V

    goto :goto_c

    .line 88
    :cond_20
    invoke-virtual {p0, p1, v1}, Lcom/sun/mail/util/QEncoderStream;->output(IZ)V

    goto :goto_c
.end method
