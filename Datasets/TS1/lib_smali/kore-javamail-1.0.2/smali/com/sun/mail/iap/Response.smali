.class public Lcom/sun/mail/iap/Response;
.super Ljava/lang/Object;
.source "Response.java"


# static fields
.field private static ASTRING_CHAR_DELIM:Ljava/lang/String; = null

.field private static ATOM_CHAR_DELIM:Ljava/lang/String; = null

.field public static final BAD:I = 0xc

.field public static final BYE:I = 0x10

.field public static final CONTINUATION:I = 0x1

.field public static final NO:I = 0x8

.field public static final OK:I = 0x4

.field public static final SYNTHETIC:I = 0x20

.field public static final TAGGED:I = 0x2

.field public static final TAG_MASK:I = 0x3

.field public static final TYPE_MASK:I = 0x1c

.field public static final UNTAGGED:I = 0x3

.field private static final increment:I = 0x64


# instance fields
.field protected buffer:[B

.field protected index:I

.field protected pindex:I

.field protected size:I

.field protected tag:Ljava/lang/String;

.field protected type:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 87
    const-string v0, " (){%*\"\\]"

    sput-object v0, Lcom/sun/mail/iap/Response;->ATOM_CHAR_DELIM:Ljava/lang/String;

    .line 94
    const-string v0, " (){%*\"\\"

    sput-object v0, Lcom/sun/mail/iap/Response;->ASTRING_CHAR_DELIM:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/sun/mail/iap/Protocol;)V
    .registers 6
    .param p1, "p"    # Lcom/sun/mail/iap/Protocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object v3, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    .line 59
    const/4 v2, 0x0

    iput v2, p0, Lcom/sun/mail/iap/Response;->type:I

    .line 60
    iput-object v3, p0, Lcom/sun/mail/iap/Response;->tag:Ljava/lang/String;

    .line 108
    invoke-virtual {p1}, Lcom/sun/mail/iap/Protocol;->getResponseBuffer()Lcom/sun/mail/iap/ByteArray;

    move-result-object v0

    .line 109
    .local v0, "ba":Lcom/sun/mail/iap/ByteArray;
    invoke-virtual {p1}, Lcom/sun/mail/iap/Protocol;->getInputStream()Lcom/sun/mail/iap/ResponseInputStream;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/sun/mail/iap/ResponseInputStream;->readResponse(Lcom/sun/mail/iap/ByteArray;)Lcom/sun/mail/iap/ByteArray;

    move-result-object v1

    .line 110
    .local v1, "response":Lcom/sun/mail/iap/ByteArray;
    invoke-virtual {v1}, Lcom/sun/mail/iap/ByteArray;->getBytes()[B

    move-result-object v2

    iput-object v2, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    .line 111
    invoke-virtual {v1}, Lcom/sun/mail/iap/ByteArray;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    iput v2, p0, Lcom/sun/mail/iap/Response;->size:I

    .line 113
    invoke-direct {p0}, Lcom/sun/mail/iap/Response;->parse()V

    .line 114
    return-void
.end method

.method public constructor <init>(Lcom/sun/mail/iap/Response;)V
    .registers 4
    .param p1, "r"    # Lcom/sun/mail/iap/Response;

    .prologue
    const/4 v1, 0x0

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object v1, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    .line 59
    const/4 v0, 0x0

    iput v0, p0, Lcom/sun/mail/iap/Response;->type:I

    .line 60
    iput-object v1, p0, Lcom/sun/mail/iap/Response;->tag:Ljava/lang/String;

    .line 120
    iget v0, p1, Lcom/sun/mail/iap/Response;->index:I

    iput v0, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 121
    iget v0, p1, Lcom/sun/mail/iap/Response;->size:I

    iput v0, p0, Lcom/sun/mail/iap/Response;->size:I

    .line 122
    iget-object v0, p1, Lcom/sun/mail/iap/Response;->buffer:[B

    iput-object v0, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    .line 123
    iget v0, p1, Lcom/sun/mail/iap/Response;->type:I

    iput v0, p0, Lcom/sun/mail/iap/Response;->type:I

    .line 124
    iget-object v0, p1, Lcom/sun/mail/iap/Response;->tag:Ljava/lang/String;

    iput-object v0, p0, Lcom/sun/mail/iap/Response;->tag:Ljava/lang/String;

    .line 125
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object v1, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    .line 59
    const/4 v0, 0x0

    iput v0, p0, Lcom/sun/mail/iap/Response;->type:I

    .line 60
    iput-object v1, p0, Lcom/sun/mail/iap/Response;->tag:Ljava/lang/String;

    .line 97
    invoke-static {p1}, Lcom/sun/mail/util/ASCIIUtility;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    .line 98
    iget-object v0, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    array-length v0, v0

    iput v0, p0, Lcom/sun/mail/iap/Response;->size:I

    .line 99
    invoke-direct {p0}, Lcom/sun/mail/iap/Response;->parse()V

    .line 100
    return-void
.end method

.method public static byeResponse(Ljava/lang/Exception;)Lcom/sun/mail/iap/Response;
    .registers 6
    .param p0, "ex"    # Ljava/lang/Exception;

    .prologue
    const/16 v4, 0x20

    .line 132
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "* BYE JavaMail Exception: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 133
    .local v0, "err":Ljava/lang/String;
    const/16 v2, 0xd

    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 134
    new-instance v1, Lcom/sun/mail/iap/Response;

    invoke-direct {v1, v0}, Lcom/sun/mail/iap/Response;-><init>(Ljava/lang/String;)V

    .line 135
    .local v1, "r":Lcom/sun/mail/iap/Response;
    iget v2, v1, Lcom/sun/mail/iap/Response;->type:I

    or-int/lit8 v2, v2, 0x20

    iput v2, v1, Lcom/sun/mail/iap/Response;->type:I

    .line 136
    return-object v1
.end method

.method private parse()V
    .registers 5

    .prologue
    .line 140
    const/4 v2, 0x0

    iput v2, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 142
    iget v2, p0, Lcom/sun/mail/iap/Response;->size:I

    if-nez v2, :cond_8

    .line 174
    :goto_7
    return-void

    .line 144
    :cond_8
    iget-object v2, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v3, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v2, v2, v3

    const/16 v3, 0x2b

    if-ne v2, v3, :cond_1f

    .line 145
    iget v2, p0, Lcom/sun/mail/iap/Response;->type:I

    or-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/sun/mail/iap/Response;->type:I

    .line 146
    iget v2, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/sun/mail/iap/Response;->index:I

    goto :goto_7

    .line 148
    :cond_1f
    iget-object v2, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v3, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v2, v2, v3

    const/16 v3, 0x2a

    if-ne v2, v3, :cond_52

    .line 149
    iget v2, p0, Lcom/sun/mail/iap/Response;->type:I

    or-int/lit8 v2, v2, 0x3

    iput v2, p0, Lcom/sun/mail/iap/Response;->type:I

    .line 150
    iget v2, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 158
    :cond_35
    :goto_35
    iget v0, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 159
    .local v0, "mark":I
    invoke-virtual {p0}, Lcom/sun/mail/iap/Response;->readAtom()Ljava/lang/String;

    move-result-object v1

    .line 160
    .local v1, "s":Ljava/lang/String;
    if-nez v1, :cond_3f

    .line 161
    const-string v1, ""

    .line 162
    :cond_3f
    const-string v2, "OK"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_67

    .line 163
    iget v2, p0, Lcom/sun/mail/iap/Response;->type:I

    or-int/lit8 v2, v2, 0x4

    iput v2, p0, Lcom/sun/mail/iap/Response;->type:I

    .line 173
    :goto_4d
    iget v2, p0, Lcom/sun/mail/iap/Response;->index:I

    iput v2, p0, Lcom/sun/mail/iap/Response;->pindex:I

    goto :goto_7

    .line 152
    .end local v0    # "mark":I
    .end local v1    # "s":Ljava/lang/String;
    :cond_52
    iget v2, p0, Lcom/sun/mail/iap/Response;->type:I

    or-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/sun/mail/iap/Response;->type:I

    .line 153
    invoke-virtual {p0}, Lcom/sun/mail/iap/Response;->readAtom()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sun/mail/iap/Response;->tag:Ljava/lang/String;

    .line 154
    iget-object v2, p0, Lcom/sun/mail/iap/Response;->tag:Ljava/lang/String;

    if-nez v2, :cond_35

    .line 155
    const-string v2, ""

    iput-object v2, p0, Lcom/sun/mail/iap/Response;->tag:Ljava/lang/String;

    goto :goto_35

    .line 164
    .restart local v0    # "mark":I
    .restart local v1    # "s":Ljava/lang/String;
    :cond_67
    const-string v2, "NO"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_76

    .line 165
    iget v2, p0, Lcom/sun/mail/iap/Response;->type:I

    or-int/lit8 v2, v2, 0x8

    iput v2, p0, Lcom/sun/mail/iap/Response;->type:I

    goto :goto_4d

    .line 166
    :cond_76
    const-string v2, "BAD"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_85

    .line 167
    iget v2, p0, Lcom/sun/mail/iap/Response;->type:I

    or-int/lit8 v2, v2, 0xc

    iput v2, p0, Lcom/sun/mail/iap/Response;->type:I

    goto :goto_4d

    .line 168
    :cond_85
    const-string v2, "BYE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_94

    .line 169
    iget v2, p0, Lcom/sun/mail/iap/Response;->type:I

    or-int/lit8 v2, v2, 0x10

    iput v2, p0, Lcom/sun/mail/iap/Response;->type:I

    goto :goto_4d

    .line 171
    :cond_94
    iput v0, p0, Lcom/sun/mail/iap/Response;->index:I

    goto :goto_4d
.end method

.method private parseString(ZZ)Ljava/lang/Object;
    .registers 13
    .param p1, "parseAtoms"    # Z
    .param p2, "returnString"    # Z

    .prologue
    const/16 v9, 0x22

    const/4 v4, 0x0

    .line 407
    invoke-virtual {p0}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 409
    iget-object v6, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v7, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v0, v6, v7

    .line 410
    .local v0, "b":B
    if-ne v0, v9, :cond_67

    .line 411
    iget v6, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 412
    iget v5, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 413
    .local v5, "start":I
    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 415
    .local v1, "copyto":I
    :goto_18
    iget v6, p0, Lcom/sun/mail/iap/Response;->index:I

    iget v7, p0, Lcom/sun/mail/iap/Response;->size:I

    if-ge v6, v7, :cond_47

    iget-object v6, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v7, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v0, v6, v7

    if-eq v0, v9, :cond_47

    .line 416
    const/16 v6, 0x5c

    if-ne v0, v6, :cond_30

    .line 417
    iget v6, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 418
    :cond_30
    iget v6, p0, Lcom/sun/mail/iap/Response;->index:I

    if-eq v6, v1, :cond_3e

    .line 421
    iget-object v6, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget-object v7, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v8, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v7, v7, v8

    aput-byte v7, v6, v1

    .line 423
    :cond_3e
    add-int/lit8 v1, v1, 0x1

    .line 424
    iget v6, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/sun/mail/iap/Response;->index:I

    goto :goto_18

    .line 426
    :cond_47
    iget v6, p0, Lcom/sun/mail/iap/Response;->index:I

    iget v7, p0, Lcom/sun/mail/iap/Response;->size:I

    if-lt v6, v7, :cond_4e

    .line 471
    .end local v1    # "copyto":I
    .end local v5    # "start":I
    :cond_4d
    :goto_4d
    return-object v4

    .line 432
    .restart local v1    # "copyto":I
    .restart local v5    # "start":I
    :cond_4e
    iget v6, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 434
    if-eqz p2, :cond_5d

    .line 435
    iget-object v6, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    invoke-static {v6, v5, v1}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v4

    goto :goto_4d

    .line 437
    :cond_5d
    new-instance v4, Lcom/sun/mail/iap/ByteArray;

    iget-object v6, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    sub-int v7, v1, v5

    invoke-direct {v4, v6, v5, v7}, Lcom/sun/mail/iap/ByteArray;-><init>([BII)V

    goto :goto_4d

    .line 438
    .end local v1    # "copyto":I
    .end local v5    # "start":I
    :cond_67
    const/16 v6, 0x7b

    if-ne v0, v6, :cond_a8

    .line 439
    iget v6, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v5, v6, 0x1

    iput v5, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 441
    .restart local v5    # "start":I
    :goto_71
    iget-object v6, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v7, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v6, v6, v7

    const/16 v7, 0x7d

    if-eq v6, v7, :cond_82

    .line 442
    iget v6, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/sun/mail/iap/Response;->index:I

    goto :goto_71

    .line 444
    :cond_82
    const/4 v2, 0x0

    .line 446
    .local v2, "count":I
    :try_start_83
    iget-object v6, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v7, p0, Lcom/sun/mail/iap/Response;->index:I

    invoke-static {v6, v5, v7}, Lcom/sun/mail/util/ASCIIUtility;->parseInt([BII)I
    :try_end_8a
    .catch Ljava/lang/NumberFormatException; {:try_start_83 .. :try_end_8a} :catch_9e

    move-result v2

    .line 452
    iget v6, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v5, v6, 0x3

    .line 453
    add-int v6, v5, v2

    iput v6, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 455
    if-eqz p2, :cond_a0

    .line 456
    iget-object v6, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    add-int v7, v5, v2

    invoke-static {v6, v5, v7}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v4

    goto :goto_4d

    .line 447
    :catch_9e
    move-exception v3

    .line 449
    .local v3, "nex":Ljava/lang/NumberFormatException;
    goto :goto_4d

    .line 458
    .end local v3    # "nex":Ljava/lang/NumberFormatException;
    :cond_a0
    new-instance v4, Lcom/sun/mail/iap/ByteArray;

    iget-object v6, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    invoke-direct {v4, v6, v5, v2}, Lcom/sun/mail/iap/ByteArray;-><init>([BII)V

    goto :goto_4d

    .line 459
    .end local v2    # "count":I
    .end local v5    # "start":I
    :cond_a8
    if-eqz p1, :cond_be

    .line 460
    iget v5, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 462
    .restart local v5    # "start":I
    sget-object v6, Lcom/sun/mail/iap/Response;->ASTRING_CHAR_DELIM:Ljava/lang/String;

    invoke-direct {p0, v6}, Lcom/sun/mail/iap/Response;->readDelimString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 463
    .local v4, "s":Ljava/lang/String;
    if-nez p2, :cond_4d

    .line 466
    new-instance v4, Lcom/sun/mail/iap/ByteArray;

    .end local v4    # "s":Ljava/lang/String;
    iget-object v6, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v7, p0, Lcom/sun/mail/iap/Response;->index:I

    invoke-direct {v4, v6, v5, v7}, Lcom/sun/mail/iap/ByteArray;-><init>([BII)V

    goto :goto_4d

    .line 467
    .end local v5    # "start":I
    :cond_be
    const/16 v6, 0x4e

    if-eq v0, v6, :cond_c6

    const/16 v6, 0x6e

    if-ne v0, v6, :cond_4d

    .line 468
    :cond_c6
    iget v6, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v6, v6, 0x3

    iput v6, p0, Lcom/sun/mail/iap/Response;->index:I

    goto :goto_4d
.end method

.method private readDelimString(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "delim"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x20

    .line 226
    invoke-virtual {p0}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 228
    iget v2, p0, Lcom/sun/mail/iap/Response;->index:I

    iget v3, p0, Lcom/sun/mail/iap/Response;->size:I

    if-lt v2, v3, :cond_d

    .line 229
    const/4 v2, 0x0

    .line 237
    :goto_c
    return-object v2

    .line 232
    :cond_d
    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 233
    .local v1, "start":I
    :goto_f
    iget v2, p0, Lcom/sun/mail/iap/Response;->index:I

    iget v3, p0, Lcom/sun/mail/iap/Response;->size:I

    if-ge v2, v3, :cond_31

    iget-object v2, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v3, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v0, v2, v3

    .local v0, "b":B
    if-le v0, v4, :cond_31

    int-to-char v2, v0

    .line 234
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_31

    if-lt v0, v4, :cond_31

    const/16 v2, 0x7f

    if-eq v0, v2, :cond_31

    .line 235
    iget v2, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/sun/mail/iap/Response;->index:I

    goto :goto_f

    .line 237
    .end local v0    # "b":B
    :cond_31
    iget-object v2, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v3, p0, Lcom/sun/mail/iap/Response;->index:I

    invoke-static {v2, v1, v3}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v2

    goto :goto_c
.end method

.method private readStringList(Z)[Ljava/lang/String;
    .registers 8
    .param p1, "atom"    # Z

    .prologue
    const/4 v0, 0x0

    .line 267
    invoke-virtual {p0}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 269
    iget-object v3, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v4, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v3, v3, v4

    const/16 v4, 0x28

    if-eq v3, v4, :cond_f

    .line 284
    :cond_e
    :goto_e
    return-object v0

    .line 271
    :cond_f
    iget v3, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 273
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 275
    .local v2, "v":Ljava/util/Vector;
    :cond_1a
    if-eqz p1, :cond_3d

    invoke-virtual {p0}, Lcom/sun/mail/iap/Response;->readAtomString()Ljava/lang/String;

    move-result-object v3

    :goto_20
    invoke-virtual {v2, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 276
    iget-object v3, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v4, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v3, v3, v4

    const/16 v4, 0x29

    if-ne v3, v4, :cond_1a

    .line 278
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v1

    .line 279
    .local v1, "size":I
    if-lez v1, :cond_e

    .line 280
    new-array v0, v1, [Ljava/lang/String;

    .line 281
    .local v0, "s":[Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    goto :goto_e

    .line 275
    .end local v0    # "s":[Ljava/lang/String;
    .end local v1    # "size":I
    :cond_3d
    invoke-virtual {p0}, Lcom/sun/mail/iap/Response;->readString()Ljava/lang/String;

    move-result-object v3

    goto :goto_20
.end method


# virtual methods
.method public getRest()Ljava/lang/String;
    .registers 4

    .prologue
    .line 523
    invoke-virtual {p0}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 524
    iget-object v0, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    iget v2, p0, Lcom/sun/mail/iap/Response;->size:I

    invoke-static {v0, v1, v2}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .registers 2

    .prologue
    .line 515
    iget-object v0, p0, Lcom/sun/mail/iap/Response;->tag:Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 475
    iget v0, p0, Lcom/sun/mail/iap/Response;->type:I

    return v0
.end method

.method public isBAD()Z
    .registers 3

    .prologue
    .line 499
    iget v0, p0, Lcom/sun/mail/iap/Response;->type:I

    and-int/lit8 v0, v0, 0x1c

    const/16 v1, 0xc

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isBYE()Z
    .registers 3

    .prologue
    .line 503
    iget v0, p0, Lcom/sun/mail/iap/Response;->type:I

    and-int/lit8 v0, v0, 0x1c

    const/16 v1, 0x10

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isContinuation()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 479
    iget v1, p0, Lcom/sun/mail/iap/Response;->type:I

    and-int/lit8 v1, v1, 0x3

    if-ne v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isNO()Z
    .registers 3

    .prologue
    .line 495
    iget v0, p0, Lcom/sun/mail/iap/Response;->type:I

    and-int/lit8 v0, v0, 0x1c

    const/16 v1, 0x8

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isOK()Z
    .registers 3

    .prologue
    .line 491
    iget v0, p0, Lcom/sun/mail/iap/Response;->type:I

    and-int/lit8 v0, v0, 0x1c

    const/4 v1, 0x4

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public isSynthetic()Z
    .registers 3

    .prologue
    .line 507
    iget v0, p0, Lcom/sun/mail/iap/Response;->type:I

    and-int/lit8 v0, v0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isTagged()Z
    .registers 3

    .prologue
    .line 483
    iget v0, p0, Lcom/sun/mail/iap/Response;->type:I

    and-int/lit8 v0, v0, 0x3

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public isUnTagged()Z
    .registers 3

    .prologue
    .line 487
    iget v0, p0, Lcom/sun/mail/iap/Response;->type:I

    and-int/lit8 v0, v0, 0x3

    const/4 v1, 0x3

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public peekByte()B
    .registers 3

    .prologue
    .line 195
    iget v0, p0, Lcom/sun/mail/iap/Response;->index:I

    iget v1, p0, Lcom/sun/mail/iap/Response;->size:I

    if-ge v0, v1, :cond_d

    .line 196
    iget-object v0, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v0, v0, v1

    .line 198
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public readAtom()Ljava/lang/String;
    .registers 2

    .prologue
    .line 218
    sget-object v0, Lcom/sun/mail/iap/Response;->ATOM_CHAR_DELIM:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/sun/mail/iap/Response;->readDelimString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readAtomString()Ljava/lang/String;
    .registers 2

    .prologue
    const/4 v0, 0x1

    .line 395
    invoke-direct {p0, v0, v0}, Lcom/sun/mail/iap/Response;->parseString(ZZ)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public readAtomStringList()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 263
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/sun/mail/iap/Response;->readStringList(Z)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readByte()B
    .registers 4

    .prologue
    .line 206
    iget v0, p0, Lcom/sun/mail/iap/Response;->index:I

    iget v1, p0, Lcom/sun/mail/iap/Response;->size:I

    if-ge v0, v1, :cond_11

    .line 207
    iget-object v0, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v0, v0, v1

    .line 209
    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public readByteArray()Lcom/sun/mail/iap/ByteArray;
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 376
    invoke-virtual {p0}, Lcom/sun/mail/iap/Response;->isContinuation()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 377
    invoke-virtual {p0}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 378
    new-instance v0, Lcom/sun/mail/iap/ByteArray;

    iget-object v1, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v2, p0, Lcom/sun/mail/iap/Response;->index:I

    iget v3, p0, Lcom/sun/mail/iap/Response;->size:I

    iget v4, p0, Lcom/sun/mail/iap/Response;->index:I

    sub-int/2addr v3, v4

    invoke-direct {v0, v1, v2, v3}, Lcom/sun/mail/iap/ByteArray;-><init>([BII)V

    .line 380
    :goto_18
    return-object v0

    :cond_19
    invoke-direct {p0, v1, v1}, Lcom/sun/mail/iap/Response;->parseString(ZZ)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sun/mail/iap/ByteArray;

    goto :goto_18
.end method

.method public readBytes()Ljava/io/ByteArrayInputStream;
    .registers 3

    .prologue
    .line 356
    invoke-virtual {p0}, Lcom/sun/mail/iap/Response;->readByteArray()Lcom/sun/mail/iap/ByteArray;

    move-result-object v0

    .line 357
    .local v0, "ba":Lcom/sun/mail/iap/ByteArray;
    if-eqz v0, :cond_b

    .line 358
    invoke-virtual {v0}, Lcom/sun/mail/iap/ByteArray;->toByteArrayInputStream()Ljava/io/ByteArrayInputStream;

    move-result-object v1

    .line 360
    :goto_a
    return-object v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public readLong()J
    .registers 4

    .prologue
    .line 320
    invoke-virtual {p0}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 322
    iget v0, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 323
    .local v0, "start":I
    :goto_5
    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    iget v2, p0, Lcom/sun/mail/iap/Response;->size:I

    if-ge v1, v2, :cond_1f

    iget-object v1, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v2, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v1, v1, v2

    int-to-char v1, v1

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 324
    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/sun/mail/iap/Response;->index:I

    goto :goto_5

    .line 326
    :cond_1f
    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    if-le v1, v0, :cond_2d

    .line 328
    :try_start_23
    iget-object v1, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v2, p0, Lcom/sun/mail/iap/Response;->index:I

    invoke-static {v1, v0, v2}, Lcom/sun/mail/util/ASCIIUtility;->parseLong([BII)J
    :try_end_2a
    .catch Ljava/lang/NumberFormatException; {:try_start_23 .. :try_end_2a} :catch_2c

    move-result-wide v1

    .line 332
    :goto_2b
    return-wide v1

    .line 329
    :catch_2c
    move-exception v1

    .line 332
    :cond_2d
    const-wide/16 v1, -0x1

    goto :goto_2b
.end method

.method public readNumber()I
    .registers 4

    .prologue
    .line 296
    invoke-virtual {p0}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 298
    iget v0, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 299
    .local v0, "start":I
    :goto_5
    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    iget v2, p0, Lcom/sun/mail/iap/Response;->size:I

    if-ge v1, v2, :cond_1f

    iget-object v1, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v2, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v1, v1, v2

    int-to-char v1, v1

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 300
    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/sun/mail/iap/Response;->index:I

    goto :goto_5

    .line 302
    :cond_1f
    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    if-le v1, v0, :cond_2d

    .line 304
    :try_start_23
    iget-object v1, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v2, p0, Lcom/sun/mail/iap/Response;->index:I

    invoke-static {v1, v0, v2}, Lcom/sun/mail/util/ASCIIUtility;->parseInt([BII)I
    :try_end_2a
    .catch Ljava/lang/NumberFormatException; {:try_start_23 .. :try_end_2a} :catch_2c

    move-result v1

    .line 308
    :goto_2b
    return v1

    .line 305
    :catch_2c
    move-exception v1

    .line 308
    :cond_2d
    const/4 v1, -0x1

    goto :goto_2b
.end method

.method public readString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 344
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/sun/mail/iap/Response;->parseString(ZZ)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public readString(C)Ljava/lang/String;
    .registers 5
    .param p1, "delim"    # C

    .prologue
    .line 246
    invoke-virtual {p0}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 248
    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    iget v2, p0, Lcom/sun/mail/iap/Response;->size:I

    if-lt v1, v2, :cond_b

    .line 249
    const/4 v1, 0x0

    .line 255
    :goto_a
    return-object v1

    .line 251
    :cond_b
    iget v0, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 252
    .local v0, "start":I
    :goto_d
    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    iget v2, p0, Lcom/sun/mail/iap/Response;->size:I

    if-ge v1, v2, :cond_22

    iget-object v1, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v2, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v1, v1, v2

    if-eq v1, p1, :cond_22

    .line 253
    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/sun/mail/iap/Response;->index:I

    goto :goto_d

    .line 255
    :cond_22
    iget-object v1, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v2, p0, Lcom/sun/mail/iap/Response;->index:I

    invoke-static {v1, v0, v2}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v1

    goto :goto_a
.end method

.method public readStringList()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 259
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/sun/mail/iap/Response;->readStringList(Z)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 531
    iget v0, p0, Lcom/sun/mail/iap/Response;->pindex:I

    iput v0, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 532
    return-void
.end method

.method public skip(I)V
    .registers 3
    .param p1, "count"    # I

    .prologue
    .line 191
    iget v0, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/sun/mail/iap/Response;->index:I

    .line 192
    return-void
.end method

.method public skipSpaces()V
    .registers 3

    .prologue
    .line 178
    :goto_0
    iget v0, p0, Lcom/sun/mail/iap/Response;->index:I

    iget v1, p0, Lcom/sun/mail/iap/Response;->size:I

    if-ge v0, v1, :cond_17

    iget-object v0, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v0, v0, v1

    const/16 v1, 0x20

    if-ne v0, v1, :cond_17

    .line 179
    iget v0, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/sun/mail/iap/Response;->index:I

    goto :goto_0

    .line 180
    :cond_17
    return-void
.end method

.method public skipToken()V
    .registers 3

    .prologue
    .line 186
    :goto_0
    iget v0, p0, Lcom/sun/mail/iap/Response;->index:I

    iget v1, p0, Lcom/sun/mail/iap/Response;->size:I

    if-ge v0, v1, :cond_17

    iget-object v0, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    iget v1, p0, Lcom/sun/mail/iap/Response;->index:I

    aget-byte v0, v0, v1

    const/16 v1, 0x20

    if-eq v0, v1, :cond_17

    .line 187
    iget v0, p0, Lcom/sun/mail/iap/Response;->index:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/sun/mail/iap/Response;->index:I

    goto :goto_0

    .line 188
    :cond_17
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 535
    iget-object v0, p0, Lcom/sun/mail/iap/Response;->buffer:[B

    const/4 v1, 0x0

    iget v2, p0, Lcom/sun/mail/iap/Response;->size:I

    invoke-static {v0, v1, v2}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
