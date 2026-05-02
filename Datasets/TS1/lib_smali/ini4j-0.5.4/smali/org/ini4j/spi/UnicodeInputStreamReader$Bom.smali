.class final enum Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
.super Ljava/lang/Enum;
.source "UnicodeInputStreamReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/spi/UnicodeInputStreamReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Bom"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

.field public static final enum UTF16BE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

.field public static final enum UTF16LE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

.field public static final enum UTF32BE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

.field public static final enum UTF32LE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

.field public static final enum UTF8:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;


# instance fields
.field private final _bytes:[B

.field private _charset:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x3

    const/4 v5, 0x4

    const/4 v4, 0x2

    .line 32
    new-instance v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    const-string v1, "UTF32BE"

    const-string v2, "UTF-32BE"

    new-array v3, v5, [B

    fill-array-data v3, :array_70

    invoke-direct {v0, v1, v7, v2, v3}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;-><init>(Ljava/lang/String;ILjava/lang/String;[B)V

    sput-object v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF32BE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    .line 33
    new-instance v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    const-string v1, "UTF32LE"

    const-string v2, "UTF-32LE"

    new-array v3, v5, [B

    fill-array-data v3, :array_76

    invoke-direct {v0, v1, v8, v2, v3}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;-><init>(Ljava/lang/String;ILjava/lang/String;[B)V

    sput-object v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF32LE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    .line 34
    new-instance v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    const-string v1, "UTF16BE"

    const-string v2, "UTF-16BE"

    new-array v3, v4, [B

    fill-array-data v3, :array_7c

    invoke-direct {v0, v1, v4, v2, v3}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;-><init>(Ljava/lang/String;ILjava/lang/String;[B)V

    sput-object v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF16BE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    .line 35
    new-instance v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    const-string v1, "UTF16LE"

    const-string v2, "UTF-16LE"

    new-array v3, v4, [B

    fill-array-data v3, :array_82

    invoke-direct {v0, v1, v6, v2, v3}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;-><init>(Ljava/lang/String;ILjava/lang/String;[B)V

    sput-object v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF16LE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    .line 36
    new-instance v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    const-string v1, "UTF8"

    const-string v2, "UTF-8"

    new-array v3, v6, [B

    fill-array-data v3, :array_88

    invoke-direct {v0, v1, v5, v2, v3}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;-><init>(Ljava/lang/String;ILjava/lang/String;[B)V

    sput-object v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF8:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    .line 30
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    sget-object v1, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF32BE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    aput-object v1, v0, v7

    sget-object v1, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF32LE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    aput-object v1, v0, v8

    sget-object v1, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF16BE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    aput-object v1, v0, v4

    sget-object v1, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF16LE:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    aput-object v1, v0, v6

    sget-object v1, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->UTF8:Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    aput-object v1, v0, v5

    sput-object v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->$VALUES:[Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    return-void

    .line 32
    nop

    :array_70
    .array-data 1
        0x0t
        0x0t
        -0x2t
        -0x1t
    .end array-data

    .line 33
    :array_76
    .array-data 1
        -0x1t
        -0x2t
        0x0t
        0x0t
    .end array-data

    .line 34
    :array_7c
    .array-data 1
        -0x2t
        -0x1t
    .end array-data

    .line 35
    nop

    :array_82
    .array-data 1
        -0x1t
        -0x2t
    .end array-data

    .line 36
    nop

    :array_88
    .array-data 1
        -0x11t
        -0x45t
        -0x41t
    .end array-data
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;[B)V
    .registers 7
    .param p3, "charsetName"    # Ljava/lang/String;
    .param p4, "bytes"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[B)V"
        }
    .end annotation

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 45
    :try_start_3
    invoke-static {p3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    iput-object v1, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_charset:Ljava/nio/charset/Charset;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_9} :catch_c

    .line 52
    :goto_9
    iput-object p4, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_bytes:[B

    .line 53
    return-void

    .line 47
    :catch_c
    move-exception v0

    .line 49
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_charset:Ljava/nio/charset/Charset;

    goto :goto_9
.end method

.method static synthetic access$000([B)Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    .registers 2
    .param p0, "x0"    # [B

    .prologue
    .line 30
    invoke-static {p0}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->find([B)Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;)Ljava/nio/charset/Charset;
    .registers 2
    .param p0, "x0"    # Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    .prologue
    .line 30
    iget-object v0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method static synthetic access$200(Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;)[B
    .registers 2
    .param p0, "x0"    # Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    .prologue
    .line 30
    iget-object v0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_bytes:[B

    return-object v0
.end method

.method private static find([B)Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    .registers 7
    .param p0, "data"    # [B

    .prologue
    .line 57
    const/4 v4, 0x0

    .line 59
    .local v4, "ret":Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    invoke-static {}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->values()[Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    move-result-object v0

    .local v0, "arr$":[Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_7
    if-ge v2, v3, :cond_18

    aget-object v1, v0, v2

    .line 61
    .local v1, "bom":Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    invoke-direct {v1}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->supported()Z

    move-result v5

    if-eqz v5, :cond_19

    invoke-direct {v1, p0}, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->match([B)Z

    move-result v5

    if-eqz v5, :cond_19

    .line 63
    move-object v4, v1

    .line 69
    .end local v1    # "bom":Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    :cond_18
    return-object v4

    .line 59
    .restart local v1    # "bom":Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    :cond_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_7
.end method

.method private match([B)Z
    .registers 6
    .param p1, "data"    # [B

    .prologue
    .line 74
    const/4 v1, 0x1

    .line 76
    .local v1, "ok":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v2, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_bytes:[B

    array-length v2, v2

    if-ge v0, v2, :cond_10

    .line 78
    aget-byte v2, p1, v0

    iget-object v3, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_bytes:[B

    aget-byte v3, v3, v0

    if-eq v2, v3, :cond_11

    .line 80
    const/4 v1, 0x0

    .line 86
    :cond_10
    return v1

    .line 76
    :cond_11
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method private supported()Z
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->_charset:Ljava/nio/charset/Charset;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 30
    const-class v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    return-object v0
.end method

.method public static values()[Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;
    .registers 1

    .prologue
    .line 30
    sget-object v0, Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->$VALUES:[Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    invoke-virtual {v0}, [Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/ini4j/spi/UnicodeInputStreamReader$Bom;

    return-object v0
.end method
