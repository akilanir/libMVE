.class public Lcom/sun/mail/imap/protocol/BASE64MailboxDecoder;
.super Ljava/lang/Object;
.source "BASE64MailboxDecoder.java"


# static fields
.field static final pem_array:[C

.field private static final pem_convert_array:[B


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 175
    const/16 v1, 0x40

    new-array v1, v1, [C

    fill-array-data v1, :array_30

    sput-object v1, Lcom/sun/mail/imap/protocol/BASE64MailboxDecoder;->pem_array:[C

    .line 186
    const/16 v1, 0x100

    new-array v1, v1, [B

    sput-object v1, Lcom/sun/mail/imap/protocol/BASE64MailboxDecoder;->pem_convert_array:[B

    .line 189
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    const/16 v1, 0xff

    if-ge v0, v1, :cond_1c

    .line 190
    sget-object v1, Lcom/sun/mail/imap/protocol/BASE64MailboxDecoder;->pem_convert_array:[B

    const/4 v2, -0x1

    aput-byte v2, v1, v0

    .line 189
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 191
    :cond_1c
    const/4 v0, 0x0

    :goto_1d
    sget-object v1, Lcom/sun/mail/imap/protocol/BASE64MailboxDecoder;->pem_array:[C

    array-length v1, v1

    if-ge v0, v1, :cond_2e

    .line 192
    sget-object v1, Lcom/sun/mail/imap/protocol/BASE64MailboxDecoder;->pem_convert_array:[B

    sget-object v2, Lcom/sun/mail/imap/protocol/BASE64MailboxDecoder;->pem_array:[C

    aget-char v2, v2, v0

    int-to-byte v3, v0

    aput-byte v3, v1, v2

    .line 191
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d

    .line 193
    :cond_2e
    return-void

    .line 175
    nop

    :array_30
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x2bs
        0x2cs
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static base64decode([CILjava/text/CharacterIterator;)I
    .registers 15
    .param p0, "buffer"    # [C
    .param p1, "offset"    # I
    .param p2, "iter"    # Ljava/text/CharacterIterator;

    .prologue
    .line 88
    const/4 v3, 0x1

    .line 89
    .local v3, "firsttime":Z
    const/4 v4, -0x1

    .line 93
    .local v4, "leftover":I
    :cond_2
    :goto_2
    invoke-interface {p2}, Ljava/text/CharacterIterator;->next()C

    move-result v10

    int-to-byte v6, v10

    .line 94
    .local v6, "orig_0":B
    const/4 v10, -0x1

    if-ne v6, v10, :cond_b

    .line 165
    :cond_a
    :goto_a
    return p1

    .line 95
    :cond_b
    const/16 v10, 0x2d

    if-ne v6, v10, :cond_19

    .line 96
    if-eqz v3, :cond_a

    .line 98
    add-int/lit8 v5, p1, 0x1

    .end local p1    # "offset":I
    .local v5, "offset":I
    const/16 v10, 0x26

    aput-char v10, p0, p1

    move p1, v5

    .end local v5    # "offset":I
    .restart local p1    # "offset":I
    goto :goto_a

    .line 103
    :cond_19
    const/4 v3, 0x0

    .line 106
    invoke-interface {p2}, Ljava/text/CharacterIterator;->next()C

    move-result v10

    int-to-byte v7, v10

    .line 107
    .local v7, "orig_1":B
    const/4 v10, -0x1

    if-eq v7, v10, :cond_a

    const/16 v10, 0x2d

    if-eq v7, v10, :cond_a

    .line 111
    sget-object v10, Lcom/sun/mail/imap/protocol/BASE64MailboxDecoder;->pem_convert_array:[B

    and-int/lit16 v11, v6, 0xff

    aget-byte v0, v10, v11

    .line 112
    .local v0, "a":B
    sget-object v10, Lcom/sun/mail/imap/protocol/BASE64MailboxDecoder;->pem_convert_array:[B

    and-int/lit16 v11, v7, 0xff

    aget-byte v1, v10, v11

    .line 114
    .local v1, "b":B
    shl-int/lit8 v10, v0, 0x2

    and-int/lit16 v10, v10, 0xfc

    ushr-int/lit8 v11, v1, 0x4

    and-int/lit8 v11, v11, 0x3

    or-int/2addr v10, v11

    int-to-byte v2, v10

    .line 117
    .local v2, "current":B
    const/4 v10, -0x1

    if-eq v4, v10, :cond_ab

    .line 118
    add-int/lit8 v5, p1, 0x1

    .end local p1    # "offset":I
    .restart local v5    # "offset":I
    shl-int/lit8 v10, v4, 0x8

    and-int/lit16 v11, v2, 0xff

    or-int/2addr v10, v11

    int-to-char v10, v10

    aput-char v10, p0, p1

    .line 119
    const/4 v4, -0x1

    move p1, v5

    .line 124
    .end local v5    # "offset":I
    .restart local p1    # "offset":I
    :goto_4b
    invoke-interface {p2}, Ljava/text/CharacterIterator;->next()C

    move-result v10

    int-to-byte v8, v10

    .line 125
    .local v8, "orig_2":B
    const/16 v10, 0x3d

    if-eq v8, v10, :cond_2

    .line 127
    const/4 v10, -0x1

    if-eq v8, v10, :cond_a

    const/16 v10, 0x2d

    if-eq v8, v10, :cond_a

    .line 132
    move v0, v1

    .line 133
    sget-object v10, Lcom/sun/mail/imap/protocol/BASE64MailboxDecoder;->pem_convert_array:[B

    and-int/lit16 v11, v8, 0xff

    aget-byte v1, v10, v11

    .line 134
    shl-int/lit8 v10, v0, 0x4

    and-int/lit16 v10, v10, 0xf0

    ushr-int/lit8 v11, v1, 0x2

    and-int/lit8 v11, v11, 0xf

    or-int/2addr v10, v11

    int-to-byte v2, v10

    .line 137
    const/4 v10, -0x1

    if-eq v4, v10, :cond_ae

    .line 138
    add-int/lit8 v5, p1, 0x1

    .end local p1    # "offset":I
    .restart local v5    # "offset":I
    shl-int/lit8 v10, v4, 0x8

    and-int/lit16 v11, v2, 0xff

    or-int/2addr v10, v11

    int-to-char v10, v10

    aput-char v10, p0, p1

    .line 139
    const/4 v4, -0x1

    move p1, v5

    .line 144
    .end local v5    # "offset":I
    .restart local p1    # "offset":I
    :goto_7b
    invoke-interface {p2}, Ljava/text/CharacterIterator;->next()C

    move-result v10

    int-to-byte v9, v10

    .line 145
    .local v9, "orig_3":B
    const/16 v10, 0x3d

    if-eq v9, v10, :cond_2

    .line 147
    const/4 v10, -0x1

    if-eq v9, v10, :cond_a

    const/16 v10, 0x2d

    if-eq v9, v10, :cond_a

    .line 152
    move v0, v1

    .line 153
    sget-object v10, Lcom/sun/mail/imap/protocol/BASE64MailboxDecoder;->pem_convert_array:[B

    and-int/lit16 v11, v9, 0xff

    aget-byte v1, v10, v11

    .line 154
    shl-int/lit8 v10, v0, 0x6

    and-int/lit16 v10, v10, 0xc0

    and-int/lit8 v11, v1, 0x3f

    or-int/2addr v10, v11

    int-to-byte v2, v10

    .line 157
    const/4 v10, -0x1

    if-eq v4, v10, :cond_b1

    .line 158
    add-int/lit8 v5, p1, 0x1

    .end local p1    # "offset":I
    .restart local v5    # "offset":I
    shl-int/lit8 v10, v4, 0x8

    and-int/lit16 v11, v2, 0xff

    or-int/2addr v10, v11

    int-to-char v10, v10

    aput-char v10, p0, p1

    .line 159
    const/4 v4, -0x1

    move p1, v5

    .end local v5    # "offset":I
    .restart local p1    # "offset":I
    goto/16 :goto_2

    .line 121
    .end local v8    # "orig_2":B
    .end local v9    # "orig_3":B
    :cond_ab
    and-int/lit16 v4, v2, 0xff

    goto :goto_4b

    .line 141
    .restart local v8    # "orig_2":B
    :cond_ae
    and-int/lit16 v4, v2, 0xff

    goto :goto_7b

    .line 161
    .restart local v9    # "orig_3":B
    :cond_b1
    and-int/lit16 v4, v2, 0xff

    goto/16 :goto_2
.end method

.method public static decode(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "original"    # Ljava/lang/String;

    .prologue
    .line 57
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_9

    .line 81
    .end local p0    # "original":Ljava/lang/String;
    :cond_8
    :goto_8
    return-object p0

    .line 60
    .restart local p0    # "original":Ljava/lang/String;
    :cond_9
    const/4 v1, 0x0

    .line 61
    .local v1, "changedString":Z
    const/4 v3, 0x0

    .line 63
    .local v3, "copyTo":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    new-array v2, v6, [C

    .line 64
    .local v2, "chars":[C
    new-instance v5, Ljava/text/StringCharacterIterator;

    invoke-direct {v5, p0}, Ljava/text/StringCharacterIterator;-><init>(Ljava/lang/String;)V

    .line 66
    .local v5, "iter":Ljava/text/StringCharacterIterator;
    invoke-virtual {v5}, Ljava/text/StringCharacterIterator;->first()C

    move-result v0

    .local v0, "c":C
    move v4, v3

    .end local v3    # "copyTo":I
    .local v4, "copyTo":I
    :goto_1b
    const v6, 0xffff

    if-eq v0, v6, :cond_34

    .line 69
    const/16 v6, 0x26

    if-ne v0, v6, :cond_2f

    .line 70
    const/4 v1, 0x1

    .line 71
    invoke-static {v2, v4, v5}, Lcom/sun/mail/imap/protocol/BASE64MailboxDecoder;->base64decode([CILjava/text/CharacterIterator;)I

    move-result v3

    .line 67
    .end local v4    # "copyTo":I
    .restart local v3    # "copyTo":I
    :goto_29
    invoke-virtual {v5}, Ljava/text/StringCharacterIterator;->next()C

    move-result v0

    move v4, v3

    .end local v3    # "copyTo":I
    .restart local v4    # "copyTo":I
    goto :goto_1b

    .line 73
    :cond_2f
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "copyTo":I
    .restart local v3    # "copyTo":I
    aput-char v0, v2, v4

    goto :goto_29

    .line 78
    .end local v3    # "copyTo":I
    .restart local v4    # "copyTo":I
    :cond_34
    if-eqz v1, :cond_8

    .line 79
    new-instance p0, Ljava/lang/String;

    .end local p0    # "original":Ljava/lang/String;
    const/4 v6, 0x0

    invoke-direct {p0, v2, v6, v4}, Ljava/lang/String;-><init>([CII)V

    goto :goto_8
.end method
