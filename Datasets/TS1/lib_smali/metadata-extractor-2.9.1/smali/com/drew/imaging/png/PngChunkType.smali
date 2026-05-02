.class public Lcom/drew/imaging/png/PngChunkType;
.super Ljava/lang/Object;
.source "PngChunkType.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final IDAT:Lcom/drew/imaging/png/PngChunkType;

.field public static final IEND:Lcom/drew/imaging/png/PngChunkType;

.field public static final IHDR:Lcom/drew/imaging/png/PngChunkType;

.field public static final PLTE:Lcom/drew/imaging/png/PngChunkType;

.field private static final _identifiersAllowingMultiples:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final bKGD:Lcom/drew/imaging/png/PngChunkType;

.field public static final cHRM:Lcom/drew/imaging/png/PngChunkType;

.field public static final gAMA:Lcom/drew/imaging/png/PngChunkType;

.field public static final hIST:Lcom/drew/imaging/png/PngChunkType;

.field public static final iCCP:Lcom/drew/imaging/png/PngChunkType;

.field public static final iTXt:Lcom/drew/imaging/png/PngChunkType;

.field public static final pHYs:Lcom/drew/imaging/png/PngChunkType;

.field public static final sBIT:Lcom/drew/imaging/png/PngChunkType;

.field public static final sPLT:Lcom/drew/imaging/png/PngChunkType;

.field public static final sRGB:Lcom/drew/imaging/png/PngChunkType;

.field public static final tEXt:Lcom/drew/imaging/png/PngChunkType;

.field public static final tIME:Lcom/drew/imaging/png/PngChunkType;

.field public static final tRNS:Lcom/drew/imaging/png/PngChunkType;

.field public static final zTXt:Lcom/drew/imaging/png/PngChunkType;


# instance fields
.field private final _bytes:[B

.field private final _multipleAllowed:Z


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 33
    const-class v0, Lcom/drew/imaging/png/PngChunkType;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_d5

    move v0, v1

    :goto_b
    sput-boolean v0, Lcom/drew/imaging/png/PngChunkType;->$assertionsDisabled:Z

    .line 35
    new-instance v0, Ljava/util/HashSet;

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "IDAT"

    aput-object v4, v3, v2

    const-string v2, "sPLT"

    aput-object v2, v3, v1

    const/4 v2, 0x2

    const-string v4, "iTXt"

    aput-object v4, v3, v2

    const/4 v2, 0x3

    const-string v4, "tEXt"

    aput-object v4, v3, v2

    const/4 v2, 0x4

    const-string v4, "zTXt"

    aput-object v4, v3, v2

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->_identifiersAllowingMultiples:Ljava/util/Set;

    .line 56
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "IHDR"

    invoke-direct {v0, v2}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->IHDR:Lcom/drew/imaging/png/PngChunkType;

    .line 71
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "PLTE"

    invoke-direct {v0, v2}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->PLTE:Lcom/drew/imaging/png/PngChunkType;

    .line 72
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "IDAT"

    invoke-direct {v0, v2, v1}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;Z)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->IDAT:Lcom/drew/imaging/png/PngChunkType;

    .line 73
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "IEND"

    invoke-direct {v0, v2}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->IEND:Lcom/drew/imaging/png/PngChunkType;

    .line 78
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "cHRM"

    invoke-direct {v0, v2}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->cHRM:Lcom/drew/imaging/png/PngChunkType;

    .line 79
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "gAMA"

    invoke-direct {v0, v2}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->gAMA:Lcom/drew/imaging/png/PngChunkType;

    .line 80
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "iCCP"

    invoke-direct {v0, v2}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->iCCP:Lcom/drew/imaging/png/PngChunkType;

    .line 81
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "sBIT"

    invoke-direct {v0, v2}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->sBIT:Lcom/drew/imaging/png/PngChunkType;

    .line 82
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "sRGB"

    invoke-direct {v0, v2}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->sRGB:Lcom/drew/imaging/png/PngChunkType;

    .line 83
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "bKGD"

    invoke-direct {v0, v2}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->bKGD:Lcom/drew/imaging/png/PngChunkType;

    .line 84
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "hIST"

    invoke-direct {v0, v2}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->hIST:Lcom/drew/imaging/png/PngChunkType;

    .line 85
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "tRNS"

    invoke-direct {v0, v2}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->tRNS:Lcom/drew/imaging/png/PngChunkType;

    .line 86
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "pHYs"

    invoke-direct {v0, v2}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->pHYs:Lcom/drew/imaging/png/PngChunkType;

    .line 87
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "sPLT"

    invoke-direct {v0, v2, v1}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;Z)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->sPLT:Lcom/drew/imaging/png/PngChunkType;

    .line 88
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "tIME"

    invoke-direct {v0, v2}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->tIME:Lcom/drew/imaging/png/PngChunkType;

    .line 89
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "iTXt"

    invoke-direct {v0, v2, v1}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;Z)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->iTXt:Lcom/drew/imaging/png/PngChunkType;

    .line 104
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "tEXt"

    invoke-direct {v0, v2, v1}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;Z)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->tEXt:Lcom/drew/imaging/png/PngChunkType;

    .line 105
    new-instance v0, Lcom/drew/imaging/png/PngChunkType;

    const-string v2, "zTXt"

    invoke-direct {v0, v2, v1}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;Z)V

    sput-object v0, Lcom/drew/imaging/png/PngChunkType;->zTXt:Lcom/drew/imaging/png/PngChunkType;

    return-void

    :cond_d5
    move v0, v2

    .line 33
    goto/16 :goto_b
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "identifier"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 112
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/drew/imaging/png/PngChunkType;-><init>(Ljava/lang/String;Z)V

    .line 113
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 7
    .param p1, "identifier"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "multipleAllowed"    # Z

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    iput-boolean p2, p0, Lcom/drew/imaging/png/PngChunkType;->_multipleAllowed:Z

    .line 120
    :try_start_5
    const-string v2, "ASCII"

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 121
    .local v0, "bytes":[B
    invoke-static {v0}, Lcom/drew/imaging/png/PngChunkType;->validateBytes([B)V

    .line 122
    iput-object v0, p0, Lcom/drew/imaging/png/PngChunkType;->_bytes:[B
    :try_end_10
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_5 .. :try_end_10} :catch_11

    .line 126
    return-void

    .line 123
    .end local v0    # "bytes":[B
    :catch_11
    move-exception v1

    .line 124
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Unable to convert string code to bytes."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public constructor <init>([B)V
    .registers 4
    .param p1, "bytes"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    invoke-static {p1}, Lcom/drew/imaging/png/PngChunkType;->validateBytes([B)V

    .line 131
    iput-object p1, p0, Lcom/drew/imaging/png/PngChunkType;->_bytes:[B

    .line 132
    sget-object v0, Lcom/drew/imaging/png/PngChunkType;->_identifiersAllowingMultiples:Ljava/util/Set;

    invoke-virtual {p0}, Lcom/drew/imaging/png/PngChunkType;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/drew/imaging/png/PngChunkType;->_multipleAllowed:Z

    .line 133
    return-void
.end method

.method private static isLowerCase(B)Z
    .registers 2
    .param p0, "b"    # B

    .prologue
    .line 175
    and-int/lit8 v0, p0, 0x20

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private static isUpperCase(B)Z
    .registers 2
    .param p0, "b"    # B

    .prologue
    .line 180
    and-int/lit8 v0, p0, 0x20

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private static isValidByte(B)Z
    .registers 2
    .param p0, "b"    # B

    .prologue
    .line 185
    const/16 v0, 0x41

    if-lt p0, v0, :cond_8

    const/16 v0, 0x5a

    if-le p0, v0, :cond_10

    :cond_8
    const/16 v0, 0x61

    if-lt p0, v0, :cond_12

    const/16 v0, 0x7a

    if-gt p0, v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private static validateBytes([B)V
    .registers 7
    .param p0, "bytes"    # [B

    .prologue
    .line 137
    array-length v4, p0

    const/4 v5, 0x4

    if-eq v4, v5, :cond_c

    .line 138
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "PNG chunk type identifier must be four bytes in length"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 141
    :cond_c
    move-object v0, p0

    .local v0, "arr$":[B
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_f
    if-ge v2, v3, :cond_24

    aget-byte v1, v0, v2

    .line 142
    .local v1, "b":B
    invoke-static {v1}, Lcom/drew/imaging/png/PngChunkType;->isValidByte(B)Z

    move-result v4

    if-nez v4, :cond_21

    .line 143
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "PNG chunk type identifier may only contain alphabet characters"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 141
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 146
    .end local v1    # "b":B
    :cond_24
    return-void
.end method


# virtual methods
.method public areMultipleAllowed()Z
    .registers 2

    .prologue
    .line 170
    iget-boolean v0, p0, Lcom/drew/imaging/png/PngChunkType;->_multipleAllowed:Z

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 209
    if-ne p0, p1, :cond_4

    .line 210
    const/4 v1, 0x1

    .line 217
    :goto_3
    return v1

    .line 212
    :cond_4
    if-eqz p1, :cond_10

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_12

    .line 213
    :cond_10
    const/4 v1, 0x0

    goto :goto_3

    :cond_12
    move-object v0, p1

    .line 215
    check-cast v0, Lcom/drew/imaging/png/PngChunkType;

    .line 217
    .local v0, "that":Lcom/drew/imaging/png/PngChunkType;
    iget-object v1, p0, Lcom/drew/imaging/png/PngChunkType;->_bytes:[B

    iget-object v2, v0, Lcom/drew/imaging/png/PngChunkType;->_bytes:[B

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    goto :goto_3
.end method

.method public getIdentifier()Ljava/lang/String;
    .registers 5

    .prologue
    .line 191
    :try_start_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/drew/imaging/png/PngChunkType;->_bytes:[B

    const-string v3, "ASCII"

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_9
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_9} :catch_a

    .line 196
    :goto_9
    return-object v1

    .line 192
    :catch_a
    move-exception v0

    .line 195
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    sget-boolean v1, Lcom/drew/imaging/png/PngChunkType;->$assertionsDisabled:Z

    if-nez v1, :cond_15

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 196
    :cond_15
    const-string v1, "Invalid object instance"

    goto :goto_9
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 223
    iget-object v0, p0, Lcom/drew/imaging/png/PngChunkType;->_bytes:[B

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    return v0
.end method

.method public isAncillary()Z
    .registers 2

    .prologue
    .line 155
    invoke-virtual {p0}, Lcom/drew/imaging/png/PngChunkType;->isCritical()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isCritical()Z
    .registers 3

    .prologue
    .line 150
    iget-object v0, p0, Lcom/drew/imaging/png/PngChunkType;->_bytes:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    invoke-static {v0}, Lcom/drew/imaging/png/PngChunkType;->isUpperCase(B)Z

    move-result v0

    return v0
.end method

.method public isPrivate()Z
    .registers 3

    .prologue
    .line 160
    iget-object v0, p0, Lcom/drew/imaging/png/PngChunkType;->_bytes:[B

    const/4 v1, 0x1

    aget-byte v0, v0, v1

    invoke-static {v0}, Lcom/drew/imaging/png/PngChunkType;->isUpperCase(B)Z

    move-result v0

    return v0
.end method

.method public isSafeToCopy()Z
    .registers 3

    .prologue
    .line 165
    iget-object v0, p0, Lcom/drew/imaging/png/PngChunkType;->_bytes:[B

    const/4 v1, 0x3

    aget-byte v0, v0, v1

    invoke-static {v0}, Lcom/drew/imaging/png/PngChunkType;->isLowerCase(B)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 203
    invoke-virtual {p0}, Lcom/drew/imaging/png/PngChunkType;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
