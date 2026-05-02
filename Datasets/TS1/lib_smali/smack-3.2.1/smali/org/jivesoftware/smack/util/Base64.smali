.class public Lorg/jivesoftware/smack/util/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/util/Base64$OutputStream;,
        Lorg/jivesoftware/smack/util/Base64$InputStream;
    }
.end annotation


# static fields
.field public static final DECODE:I = 0x0

.field public static final DONT_BREAK_LINES:I = 0x8

.field public static final ENCODE:I = 0x1

.field private static final EQUALS_SIGN:B = 0x3dt

.field private static final EQUALS_SIGN_ENC:B = -0x1t

.field public static final GZIP:I = 0x2

.field private static final MAX_LINE_LENGTH:I = 0x4c

.field private static final NEW_LINE:B = 0xat

.field public static final NO_OPTIONS:I = 0x0

.field public static final ORDERED:I = 0x20

.field private static final PREFERRED_ENCODING:Ljava/lang/String; = "UTF-8"

.field public static final URL_SAFE:I = 0x10

.field private static final WHITE_SPACE_ENC:B = -0x5t

.field private static final _ORDERED_ALPHABET:[B

.field private static final _ORDERED_DECODABET:[B

.field private static final _STANDARD_ALPHABET:[B

.field private static final _STANDARD_DECODABET:[B

.field private static final _URL_SAFE_ALPHABET:[B

.field private static final _URL_SAFE_DECODABET:[B


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/16 v2, 0x7f

    const/16 v1, 0x40

    .line 141
    new-array v0, v1, [B

    fill-array-data v0, :array_30

    sput-object v0, Lorg/jivesoftware/smack/util/Base64;->_STANDARD_ALPHABET:[B

    .line 160
    new-array v0, v2, [B

    fill-array-data v0, :array_54

    sput-object v0, Lorg/jivesoftware/smack/util/Base64;->_STANDARD_DECODABET:[B

    .line 203
    new-array v0, v1, [B

    fill-array-data v0, :array_98

    sput-object v0, Lorg/jivesoftware/smack/util/Base64;->_URL_SAFE_ALPHABET:[B

    .line 220
    new-array v0, v2, [B

    fill-array-data v0, :array_bc

    sput-object v0, Lorg/jivesoftware/smack/util/Base64;->_URL_SAFE_DECODABET:[B

    .line 267
    new-array v0, v1, [B

    fill-array-data v0, :array_100

    sput-object v0, Lorg/jivesoftware/smack/util/Base64;->_ORDERED_ALPHABET:[B

    .line 286
    new-array v0, v2, [B

    fill-array-data v0, :array_124

    sput-object v0, Lorg/jivesoftware/smack/util/Base64;->_ORDERED_DECODABET:[B

    return-void

    .line 141
    nop

    :array_30
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2bt
        0x2ft
    .end array-data

    .line 160
    :array_54
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3et
        -0x9t
        -0x9t
        -0x9t
        0x3ft
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x25t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data

    .line 203
    :array_98
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2dt
        0x5ft
    .end array-data

    .line 220
    :array_bc
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3et
        -0x9t
        -0x9t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3ft
        -0x9t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x25t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data

    .line 267
    :array_100
    .array-data 1
        0x2dt
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x5ft
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
    .end array-data

    .line 286
    :array_124
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        -0x9t
        -0x9t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x25t
        -0x9t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        0x3et
        0x3ft
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 363
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(I)[B
    .registers 2
    .param p0, "x0"    # I

    .prologue
    .line 69
    invoke-static {p0}, Lorg/jivesoftware/smack/util/Base64;->getAlphabet(I)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(I)[B
    .registers 2
    .param p0, "x0"    # I

    .prologue
    .line 69
    invoke-static {p0}, Lorg/jivesoftware/smack/util/Base64;->getDecodabet(I)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200([BII[BII)[B
    .registers 7
    .param p0, "x0"    # [B
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # [B
    .param p4, "x4"    # I
    .param p5, "x5"    # I

    .prologue
    .line 69
    invoke-static/range {p0 .. p5}, Lorg/jivesoftware/smack/util/Base64;->encode3to4([BII[BII)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300([BI[BII)I
    .registers 6
    .param p0, "x0"    # [B
    .param p1, "x1"    # I
    .param p2, "x2"    # [B
    .param p3, "x3"    # I
    .param p4, "x4"    # I

    .prologue
    .line 69
    invoke-static {p0, p1, p2, p3, p4}, Lorg/jivesoftware/smack/util/Base64;->decode4to3([BI[BII)I

    move-result v0

    return v0
.end method

.method static synthetic access$400([B[BII)[B
    .registers 5
    .param p0, "x0"    # [B
    .param p1, "x1"    # [B
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .prologue
    .line 69
    invoke-static {p0, p1, p2, p3}, Lorg/jivesoftware/smack/util/Base64;->encode3to4([B[BII)[B

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/lang/String;)[B
    .registers 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 943
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/jivesoftware/smack/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/lang/String;I)[B
    .registers 16
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "options"    # I

    .prologue
    const/4 v13, 0x0

    .line 961
    :try_start_1
    const-string v11, "UTF-8"

    invoke-virtual {p0, v11}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_6
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_6} :catch_56

    move-result-object v5

    .line 970
    .local v5, "bytes":[B
    :goto_7
    array-length v11, v5

    invoke-static {v5, v13, v11, p1}, Lorg/jivesoftware/smack/util/Base64;->decode([BIII)[B

    move-result-object v5

    .line 975
    if-eqz v5, :cond_55

    array-length v11, v5

    const/4 v12, 0x4

    if-lt v11, v12, :cond_55

    .line 978
    aget-byte v11, v5, v13

    and-int/lit16 v11, v11, 0xff

    const/4 v12, 0x1

    aget-byte v12, v5, v12

    shl-int/lit8 v12, v12, 0x8

    const v13, 0xff00

    and-int/2addr v12, v13

    or-int v8, v11, v12

    .line 979
    .local v8, "head":I
    const v11, 0x8b1f

    if-ne v11, v8, :cond_55

    .line 981
    const/4 v0, 0x0

    .line 982
    .local v0, "bais":Ljava/io/ByteArrayInputStream;
    const/4 v6, 0x0

    .line 983
    .local v6, "gzis":Ljava/util/zip/GZIPInputStream;
    const/4 v2, 0x0

    .line 984
    .local v2, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v11, 0x800

    new-array v4, v11, [B

    .line 985
    .local v4, "buffer":[B
    const/4 v9, 0x0

    .line 989
    .local v9, "length":I
    :try_start_2e
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_33} :catch_93
    .catchall {:try_start_2e .. :try_end_33} :catchall_6c

    .line 990
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .local v3, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_33
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_38} :catch_95
    .catchall {:try_start_33 .. :try_end_38} :catchall_87

    .line 991
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .local v1, "bais":Ljava/io/ByteArrayInputStream;
    :try_start_38
    new-instance v7, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v7, v1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_3d
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_3d} :catch_98
    .catchall {:try_start_38 .. :try_end_3d} :catchall_8a

    .line 993
    .end local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    .local v7, "gzis":Ljava/util/zip/GZIPInputStream;
    :goto_3d
    :try_start_3d
    invoke-virtual {v7, v4}, Ljava/util/zip/GZIPInputStream;->read([B)I

    move-result v9

    if-ltz v9, :cond_5c

    .line 995
    const/4 v11, 0x0

    invoke-virtual {v3, v4, v11, v9}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_47
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_47} :catch_48
    .catchall {:try_start_3d .. :try_end_47} :catchall_8e

    goto :goto_3d

    .line 1002
    :catch_48
    move-exception v11

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    move-object v6, v7

    .end local v7    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    move-object v0, v1

    .line 1008
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    :goto_4c
    :try_start_4c
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_4f} :catch_7b

    .line 1009
    :goto_4f
    :try_start_4f
    invoke-virtual {v6}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_52} :catch_7d

    .line 1010
    :goto_52
    :try_start_52
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_55} :catch_7f

    .line 1016
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "buffer":[B
    .end local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    .end local v8    # "head":I
    .end local v9    # "length":I
    :cond_55
    :goto_55
    return-object v5

    .line 963
    .end local v5    # "bytes":[B
    :catch_56
    move-exception v10

    .line 965
    .local v10, "uee":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    .restart local v5    # "bytes":[B
    goto :goto_7

    .line 999
    .end local v10    # "uee":Ljava/io/UnsupportedEncodingException;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v4    # "buffer":[B
    .restart local v7    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v8    # "head":I
    .restart local v9    # "length":I
    :cond_5c
    :try_start_5c
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_5f
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_5f} :catch_48
    .catchall {:try_start_5c .. :try_end_5f} :catchall_8e

    move-result-object v5

    .line 1008
    :try_start_60
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_63
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_63} :catch_77

    .line 1009
    :goto_63
    :try_start_63
    invoke-virtual {v7}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_63 .. :try_end_66} :catch_79

    .line 1010
    :goto_66
    :try_start_66
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_69} :catch_6a

    goto :goto_55

    :catch_6a
    move-exception v11

    goto :goto_55

    .line 1008
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    :catchall_6c
    move-exception v11

    :goto_6d
    :try_start_6d
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_70
    .catch Ljava/lang/Exception; {:try_start_6d .. :try_end_70} :catch_81

    .line 1009
    :goto_70
    :try_start_70
    invoke-virtual {v6}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_73
    .catch Ljava/lang/Exception; {:try_start_70 .. :try_end_73} :catch_83

    .line 1010
    :goto_73
    :try_start_73
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_76
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_76} :catch_85

    :goto_76
    throw v11

    .line 1008
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzis":Ljava/util/zip/GZIPInputStream;
    :catch_77
    move-exception v11

    goto :goto_63

    .line 1009
    :catch_79
    move-exception v11

    goto :goto_66

    .line 1008
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    :catch_7b
    move-exception v11

    goto :goto_4f

    .line 1009
    :catch_7d
    move-exception v11

    goto :goto_52

    .line 1010
    :catch_7f
    move-exception v11

    goto :goto_55

    .line 1008
    :catch_81
    move-exception v12

    goto :goto_70

    .line 1009
    :catch_83
    move-exception v12

    goto :goto_73

    .line 1010
    :catch_85
    move-exception v12

    goto :goto_76

    .line 1008
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_87
    move-exception v11

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_6d

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_8a
    move-exception v11

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_6d

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v7    # "gzis":Ljava/util/zip/GZIPInputStream;
    :catchall_8e
    move-exception v11

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    move-object v6, v7

    .end local v7    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "gzis":Ljava/util/zip/GZIPInputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_6d

    .line 1002
    :catch_93
    move-exception v11

    goto :goto_4c

    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_95
    move-exception v11

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_4c

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_98
    move-exception v11

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_4c
.end method

.method public static decode([BIII)[B
    .registers 19
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "options"    # I

    .prologue
    .line 884
    invoke-static/range {p3 .. p3}, Lorg/jivesoftware/smack/util/Base64;->getDecodabet(I)[B

    move-result-object v1

    .line 886
    .local v1, "DECODABET":[B
    mul-int/lit8 v12, p2, 0x3

    div-int/lit8 v6, v12, 0x4

    .line 887
    .local v6, "len34":I
    new-array v8, v6, [B

    .line 888
    .local v8, "outBuff":[B
    const/4 v9, 0x0

    .line 890
    .local v9, "outBuffPosn":I
    const/4 v12, 0x4

    new-array v2, v12, [B

    .line 891
    .local v2, "b4":[B
    const/4 v3, 0x0

    .line 892
    .local v3, "b4Posn":I
    const/4 v5, 0x0

    .line 893
    .local v5, "i":I
    const/4 v10, 0x0

    .line 894
    .local v10, "sbiCrop":B
    const/4 v11, 0x0

    .line 895
    .local v11, "sbiDecode":B
    move/from16 v5, p1

    move v4, v3

    .end local v3    # "b4Posn":I
    .local v4, "b4Posn":I
    :goto_15
    add-int v12, p1, p2

    if-ge v5, v12, :cond_74

    .line 897
    aget-byte v12, p0, v5

    and-int/lit8 v12, v12, 0x7f

    int-to-byte v10, v12

    .line 898
    aget-byte v11, v1, v10

    .line 900
    const/4 v12, -0x5

    if-lt v11, v12, :cond_42

    .line 902
    const/4 v12, -0x1

    if-lt v11, v12, :cond_6f

    .line 904
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    aput-byte v10, v2, v4

    .line 905
    const/4 v12, 0x3

    if-le v3, v12, :cond_70

    .line 907
    const/4 v12, 0x0

    move/from16 v0, p3

    invoke-static {v2, v12, v8, v9, v0}, Lorg/jivesoftware/smack/util/Base64;->decode4to3([BI[BII)I

    move-result v12

    add-int/2addr v9, v12

    .line 908
    const/4 v3, 0x0

    .line 911
    const/16 v12, 0x3d

    if-ne v10, v12, :cond_70

    .line 925
    :goto_3a
    new-array v7, v9, [B

    .line 926
    .local v7, "out":[B
    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static {v8, v12, v7, v13, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 927
    .end local v7    # "out":[B
    :goto_41
    return-object v7

    .line 920
    .end local v3    # "b4Posn":I
    .restart local v4    # "b4Posn":I
    :cond_42
    sget-object v12, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Bad Base64 input character at "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ": "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    aget-byte v14, p0, v5

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "(decimal)"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 921
    const/4 v7, 0x0

    move v3, v4

    .end local v4    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    goto :goto_41

    .end local v3    # "b4Posn":I
    .restart local v4    # "b4Posn":I
    :cond_6f
    move v3, v4

    .line 895
    .end local v4    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    :cond_70
    add-int/lit8 v5, v5, 0x1

    move v4, v3

    .end local v3    # "b4Posn":I
    .restart local v4    # "b4Posn":I
    goto :goto_15

    :cond_74
    move v3, v4

    .end local v4    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    goto :goto_3a
.end method

.method private static decode4to3([BI[BII)I
    .registers 11
    .param p0, "source"    # [B
    .param p1, "srcOffset"    # I
    .param p2, "destination"    # [B
    .param p3, "destOffset"    # I
    .param p4, "options"    # I

    .prologue
    const/16 v4, 0x3d

    .line 807
    invoke-static {p4}, Lorg/jivesoftware/smack/util/Base64;->getDecodabet(I)[B

    move-result-object v0

    .line 810
    .local v0, "DECODABET":[B
    add-int/lit8 v3, p1, 0x2

    aget-byte v3, p0, v3

    if-ne v3, v4, :cond_27

    .line 815
    aget-byte v3, p0, p1

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x12

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0xc

    or-int v2, v3, v4

    .line 818
    .local v2, "outBuff":I
    ushr-int/lit8 v3, v2, 0x10

    int-to-byte v3, v3

    aput-byte v3, p2, p3

    .line 819
    const/4 v3, 0x1

    .line 863
    .end local v2    # "outBuff":I
    :goto_26
    return v3

    .line 823
    :cond_27
    add-int/lit8 v3, p1, 0x3

    aget-byte v3, p0, v3

    if-ne v3, v4, :cond_5a

    .line 829
    aget-byte v3, p0, p1

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x12

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0xc

    or-int/2addr v3, v4

    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x6

    or-int v2, v3, v4

    .line 833
    .restart local v2    # "outBuff":I
    ushr-int/lit8 v3, v2, 0x10

    int-to-byte v3, v3

    aput-byte v3, p2, p3

    .line 834
    add-int/lit8 v3, p3, 0x1

    ushr-int/lit8 v4, v2, 0x8

    int-to-byte v4, v4

    aput-byte v4, p2, v3

    .line 835
    const/4 v3, 0x2

    goto :goto_26

    .line 847
    .end local v2    # "outBuff":I
    :cond_5a
    :try_start_5a
    aget-byte v3, p0, p1

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x12

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0xc

    or-int/2addr v3, v4

    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x6

    or-int/2addr v3, v4

    add-int/lit8 v4, p1, 0x3

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    or-int v2, v3, v4

    .line 853
    .restart local v2    # "outBuff":I
    shr-int/lit8 v3, v2, 0x10

    int-to-byte v3, v3

    aput-byte v3, p2, p3

    .line 854
    add-int/lit8 v3, p3, 0x1

    shr-int/lit8 v4, v2, 0x8

    int-to-byte v4, v4

    aput-byte v4, p2, v3

    .line 855
    add-int/lit8 v3, p3, 0x2

    int-to-byte v4, v2

    aput-byte v4, p2, v3
    :try_end_93
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_93} :catch_95

    .line 857
    const/4 v3, 0x3

    goto :goto_26

    .line 858
    .end local v2    # "outBuff":I
    :catch_95
    move-exception v1

    .line 859
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-byte v5, p0, p1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-byte v5, p0, p1

    aget-byte v5, v0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 860
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, p1, 0x1

    aget-byte v5, p0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, p1, 0x1

    aget-byte v5, p0, v5

    aget-byte v5, v0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 861
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, p1, 0x2

    aget-byte v5, p0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, p1, 0x2

    aget-byte v5, p0, v5

    aget-byte v5, v0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 862
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, p1, 0x3

    aget-byte v5, p0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, p1, 0x3

    aget-byte v5, p0, v5

    aget-byte v5, v0, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 863
    const/4 v3, -0x1

    goto/16 :goto_26
.end method

.method public static decodeFileToFile(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p0, "infile"    # Ljava/lang/String;
    .param p1, "outfile"    # Ljava/lang/String;

    .prologue
    .line 1274
    invoke-static {p0}, Lorg/jivesoftware/smack/util/Base64;->decodeFromFile(Ljava/lang/String;)[B

    move-result-object v0

    .line 1275
    .local v0, "decoded":[B
    const/4 v2, 0x0

    .line 1277
    .local v2, "out":Ljava/io/OutputStream;
    :try_start_5
    new-instance v3, Ljava/io/BufferedOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_f} :catch_1a
    .catchall {:try_start_5 .. :try_end_f} :catchall_24

    .line 1279
    .end local v2    # "out":Ljava/io/OutputStream;
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_f
    invoke-virtual {v3, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_12} :catch_2e
    .catchall {:try_start_f .. :try_end_12} :catchall_2b

    .line 1285
    :try_start_12
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_15} :catch_17

    move-object v2, v3

    .line 1288
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    :goto_16
    return-void

    .line 1286
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catch_17
    move-exception v4

    move-object v2, v3

    .line 1287
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_16

    .line 1281
    :catch_1a
    move-exception v1

    .line 1282
    .local v1, "ex":Ljava/io/IOException;
    :goto_1b
    :try_start_1b
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_1e
    .catchall {:try_start_1b .. :try_end_1e} :catchall_24

    .line 1285
    :try_start_1e
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_21} :catch_22

    goto :goto_16

    .line 1286
    :catch_22
    move-exception v4

    goto :goto_16

    .line 1285
    .end local v1    # "ex":Ljava/io/IOException;
    :catchall_24
    move-exception v4

    :goto_25
    :try_start_25
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_28} :catch_29

    .line 1286
    :goto_28
    throw v4

    :catch_29
    move-exception v5

    goto :goto_28

    .line 1285
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catchall_2b
    move-exception v4

    move-object v2, v3

    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_25

    .line 1281
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catch_2e
    move-exception v1

    move-object v2, v3

    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_1b
.end method

.method public static decodeFromFile(Ljava/lang/String;)[B
    .registers 13
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 1147
    const/4 v3, 0x0

    .line 1148
    .local v3, "decodedData":[B
    const/4 v0, 0x0

    .line 1152
    .local v0, "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    :try_start_2
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1153
    .local v5, "file":Ljava/io/File;
    const/4 v2, 0x0

    .line 1154
    .local v2, "buffer":[B
    const/4 v6, 0x0

    .line 1155
    .local v6, "length":I
    const/4 v7, 0x0

    .line 1158
    .local v7, "numBytes":I
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v8

    const-wide/32 v10, 0x7fffffff

    cmp-long v8, v8, v10

    if-lez v8, :cond_3c

    .line 1160
    sget-object v8, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "File is too big for this convenience method ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " bytes)."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_37} :catch_6d
    .catchall {:try_start_2 .. :try_end_37} :catchall_8c

    .line 1161
    const/4 v8, 0x0

    .line 1185
    :try_start_38
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$InputStream;->close()V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_3b} :catch_91

    .line 1188
    .end local v2    # "buffer":[B
    .end local v5    # "file":Ljava/io/File;
    .end local v6    # "length":I
    .end local v7    # "numBytes":I
    :goto_3b
    return-object v8

    .line 1163
    .restart local v2    # "buffer":[B
    .restart local v5    # "file":Ljava/io/File;
    .restart local v6    # "length":I
    .restart local v7    # "numBytes":I
    :cond_3c
    :try_start_3c
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v8

    long-to-int v8, v8

    new-array v2, v8, [B

    .line 1166
    new-instance v1, Lorg/jivesoftware/smack/util/Base64$InputStream;

    new-instance v8, Ljava/io/BufferedInputStream;

    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v8, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v9, 0x0

    invoke-direct {v1, v8, v9}, Lorg/jivesoftware/smack/util/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_53
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_53} :catch_6d
    .catchall {:try_start_3c .. :try_end_53} :catchall_8c

    .line 1171
    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .local v1, "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    :goto_53
    const/16 v8, 0x1000

    :try_start_55
    invoke-virtual {v1, v2, v6, v8}, Lorg/jivesoftware/smack/util/Base64$InputStream;->read([BII)I

    move-result v7

    if-ltz v7, :cond_5d

    .line 1172
    add-int/2addr v6, v7

    goto :goto_53

    .line 1175
    :cond_5d
    new-array v3, v6, [B

    .line 1176
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v2, v8, v3, v9, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_64} :catch_98
    .catchall {:try_start_55 .. :try_end_64} :catchall_95

    .line 1185
    :try_start_64
    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Base64$InputStream;->close()V
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_67} :catch_6a

    move-object v0, v1

    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .end local v2    # "buffer":[B
    .end local v5    # "file":Ljava/io/File;
    .end local v6    # "length":I
    .end local v7    # "numBytes":I
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    :goto_68
    move-object v8, v3

    .line 1188
    goto :goto_3b

    .line 1185
    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v2    # "buffer":[B
    .restart local v5    # "file":Ljava/io/File;
    .restart local v6    # "length":I
    .restart local v7    # "numBytes":I
    :catch_6a
    move-exception v8

    move-object v0, v1

    .line 1186
    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    goto :goto_68

    .line 1179
    .end local v2    # "buffer":[B
    .end local v5    # "file":Ljava/io/File;
    .end local v6    # "length":I
    .end local v7    # "numBytes":I
    :catch_6d
    move-exception v4

    .line 1181
    .local v4, "e":Ljava/io/IOException;
    :goto_6e
    :try_start_6e
    sget-object v8, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Error decoding from file "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_86
    .catchall {:try_start_6e .. :try_end_86} :catchall_8c

    .line 1185
    :try_start_86
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$InputStream;->close()V
    :try_end_89
    .catch Ljava/lang/Exception; {:try_start_86 .. :try_end_89} :catch_8a

    goto :goto_68

    :catch_8a
    move-exception v8

    goto :goto_68

    .end local v4    # "e":Ljava/io/IOException;
    :catchall_8c
    move-exception v8

    :goto_8d
    :try_start_8d
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$InputStream;->close()V
    :try_end_90
    .catch Ljava/lang/Exception; {:try_start_8d .. :try_end_90} :catch_93

    :goto_90
    throw v8

    .restart local v2    # "buffer":[B
    .restart local v5    # "file":Ljava/io/File;
    .restart local v6    # "length":I
    .restart local v7    # "numBytes":I
    :catch_91
    move-exception v9

    goto :goto_3b

    .end local v2    # "buffer":[B
    .end local v5    # "file":Ljava/io/File;
    .end local v6    # "length":I
    .end local v7    # "numBytes":I
    :catch_93
    move-exception v9

    goto :goto_90

    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v2    # "buffer":[B
    .restart local v5    # "file":Ljava/io/File;
    .restart local v6    # "length":I
    .restart local v7    # "numBytes":I
    :catchall_95
    move-exception v8

    move-object v0, v1

    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    goto :goto_8d

    .line 1179
    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    :catch_98
    move-exception v4

    move-object v0, v1

    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    goto :goto_6e
.end method

.method public static decodeToFile(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 8
    .param p0, "dataToDecode"    # Ljava/lang/String;
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 1112
    const/4 v3, 0x0

    .line 1113
    .local v3, "success":Z
    const/4 v0, 0x0

    .line 1116
    .local v0, "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :try_start_2
    new-instance v1, Lorg/jivesoftware/smack/util/Base64$OutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/4 v5, 0x0

    invoke-direct {v1, v4, v5}, Lorg/jivesoftware/smack/util/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_d} :catch_1f
    .catchall {:try_start_2 .. :try_end_d} :catchall_27

    .line 1118
    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .local v1, "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :try_start_d
    const-string v4, "UTF-8"

    invoke-virtual {p0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->write([B)V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_16} :catch_31
    .catchall {:try_start_d .. :try_end_16} :catchall_2e

    .line 1119
    const/4 v3, 0x1

    .line 1127
    :try_start_17
    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_1a} :catch_1c

    move-object v0, v1

    .line 1130
    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :goto_1b
    return v3

    .line 1127
    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :catch_1c
    move-exception v4

    move-object v0, v1

    .line 1128
    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    goto :goto_1b

    .line 1121
    :catch_1f
    move-exception v2

    .line 1123
    .local v2, "e":Ljava/io/IOException;
    :goto_20
    const/4 v3, 0x0

    .line 1127
    :try_start_21
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_24} :catch_25

    goto :goto_1b

    :catch_25
    move-exception v4

    goto :goto_1b

    .end local v2    # "e":Ljava/io/IOException;
    :catchall_27
    move-exception v4

    :goto_28
    :try_start_28
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_2b} :catch_2c

    :goto_2b
    throw v4

    :catch_2c
    move-exception v5

    goto :goto_2b

    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :catchall_2e
    move-exception v4

    move-object v0, v1

    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    goto :goto_28

    .line 1121
    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :catch_31
    move-exception v2

    move-object v0, v1

    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    goto :goto_20
.end method

.method public static decodeToObject(Ljava/lang/String;)Ljava/lang/Object;
    .registers 10
    .param p0, "encodedObject"    # Ljava/lang/String;

    .prologue
    .line 1033
    invoke-static {p0}, Lorg/jivesoftware/smack/util/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v4

    .line 1035
    .local v4, "objBytes":[B
    const/4 v0, 0x0

    .line 1036
    .local v0, "bais":Ljava/io/ByteArrayInputStream;
    const/4 v5, 0x0

    .line 1037
    .local v5, "ois":Ljava/io/ObjectInputStream;
    const/4 v3, 0x0

    .line 1041
    .local v3, "obj":Ljava/lang/Object;
    :try_start_7
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_c} :catch_22
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7 .. :try_end_c} :catch_30
    .catchall {:try_start_7 .. :try_end_c} :catchall_3e

    .line 1042
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .local v1, "bais":Ljava/io/ByteArrayInputStream;
    :try_start_c
    new-instance v6, Ljava/io/ObjectInputStream;

    invoke-direct {v6, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_11} :catch_5e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_c .. :try_end_11} :catch_57
    .catchall {:try_start_c .. :try_end_11} :catchall_50

    .line 1044
    .end local v5    # "ois":Ljava/io/ObjectInputStream;
    .local v6, "ois":Ljava/io/ObjectInputStream;
    :try_start_11
    invoke-virtual {v6}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_14} :catch_61
    .catch Ljava/lang/ClassNotFoundException; {:try_start_11 .. :try_end_14} :catch_5a
    .catchall {:try_start_11 .. :try_end_14} :catchall_53

    move-result-object v3

    .line 1058
    :try_start_15
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_18} :catch_46

    .line 1059
    :goto_18
    :try_start_18
    invoke-virtual {v6}, Ljava/io/ObjectInputStream;->close()V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_1b} :catch_1e

    move-object v5, v6

    .end local v6    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "ois":Ljava/io/ObjectInputStream;
    move-object v0, v1

    .line 1062
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "obj":Ljava/lang/Object;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    :goto_1d
    return-object v3

    .line 1059
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v5    # "ois":Ljava/io/ObjectInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "obj":Ljava/lang/Object;
    .restart local v6    # "ois":Ljava/io/ObjectInputStream;
    :catch_1e
    move-exception v7

    move-object v5, v6

    .end local v6    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "ois":Ljava/io/ObjectInputStream;
    move-object v0, v1

    .line 1060
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_1d

    .line 1046
    :catch_22
    move-exception v2

    .line 1048
    .local v2, "e":Ljava/io/IOException;
    :goto_23
    :try_start_23
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_26
    .catchall {:try_start_23 .. :try_end_26} :catchall_3e

    .line 1049
    const/4 v3, 0x0

    .line 1058
    :try_start_27
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_2a} :catch_48

    .line 1059
    :goto_2a
    :try_start_2a
    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->close()V
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2d} :catch_2e

    goto :goto_1d

    :catch_2e
    move-exception v7

    goto :goto_1d

    .line 1051
    .end local v2    # "e":Ljava/io/IOException;
    :catch_30
    move-exception v2

    .line 1053
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    :goto_31
    :try_start_31
    invoke-virtual {v2}, Ljava/lang/ClassNotFoundException;->printStackTrace()V
    :try_end_34
    .catchall {:try_start_31 .. :try_end_34} :catchall_3e

    .line 1054
    const/4 v3, 0x0

    .line 1058
    :try_start_35
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_38} :catch_4a

    .line 1059
    :goto_38
    :try_start_38
    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->close()V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_3b} :catch_3c

    goto :goto_1d

    :catch_3c
    move-exception v7

    goto :goto_1d

    .line 1058
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    :catchall_3e
    move-exception v7

    :goto_3f
    :try_start_3f
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_42} :catch_4c

    .line 1059
    :goto_42
    :try_start_42
    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->close()V
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_45} :catch_4e

    :goto_45
    throw v7

    .line 1058
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v5    # "ois":Ljava/io/ObjectInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v6    # "ois":Ljava/io/ObjectInputStream;
    :catch_46
    move-exception v7

    goto :goto_18

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v6    # "ois":Ljava/io/ObjectInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .local v2, "e":Ljava/io/IOException;
    .restart local v5    # "ois":Ljava/io/ObjectInputStream;
    :catch_48
    move-exception v7

    goto :goto_2a

    .local v2, "e":Ljava/lang/ClassNotFoundException;
    :catch_4a
    move-exception v7

    goto :goto_38

    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    :catch_4c
    move-exception v8

    goto :goto_42

    .line 1059
    :catch_4e
    move-exception v8

    goto :goto_45

    .line 1058
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    :catchall_50
    move-exception v7

    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_3f

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v5    # "ois":Ljava/io/ObjectInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v6    # "ois":Ljava/io/ObjectInputStream;
    :catchall_53
    move-exception v7

    move-object v5, v6

    .end local v6    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "ois":Ljava/io/ObjectInputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_3f

    .line 1051
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    :catch_57
    move-exception v2

    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_31

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v5    # "ois":Ljava/io/ObjectInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v6    # "ois":Ljava/io/ObjectInputStream;
    :catch_5a
    move-exception v2

    move-object v5, v6

    .end local v6    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "ois":Ljava/io/ObjectInputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_31

    .line 1046
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    :catch_5e
    move-exception v2

    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_23

    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v5    # "ois":Ljava/io/ObjectInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v6    # "ois":Ljava/io/ObjectInputStream;
    :catch_61
    move-exception v2

    move-object v5, v6

    .end local v6    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "ois":Ljava/io/ObjectInputStream;
    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_23
.end method

.method private static encode3to4([BII[BII)[B
    .registers 12
    .param p0, "source"    # [B
    .param p1, "srcOffset"    # I
    .param p2, "numSigBytes"    # I
    .param p3, "destination"    # [B
    .param p4, "destOffset"    # I
    .param p5, "options"    # I

    .prologue
    const/16 v5, 0x3d

    const/4 v2, 0x0

    .line 456
    invoke-static {p5}, Lorg/jivesoftware/smack/util/Base64;->getAlphabet(I)[B

    move-result-object v0

    .line 469
    .local v0, "ALPHABET":[B
    if-lez p2, :cond_2d

    aget-byte v3, p0, p1

    shl-int/lit8 v3, v3, 0x18

    ushr-int/lit8 v3, v3, 0x8

    move v4, v3

    :goto_10
    const/4 v3, 0x1

    if-le p2, v3, :cond_2f

    add-int/lit8 v3, p1, 0x1

    aget-byte v3, p0, v3

    shl-int/lit8 v3, v3, 0x18

    ushr-int/lit8 v3, v3, 0x10

    :goto_1b
    or-int/2addr v3, v4

    const/4 v4, 0x2

    if-le p2, v4, :cond_27

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    shl-int/lit8 v2, v2, 0x18

    ushr-int/lit8 v2, v2, 0x18

    :cond_27
    or-int v1, v3, v2

    .line 473
    .local v1, "inBuff":I
    packed-switch p2, :pswitch_data_8c

    .line 497
    :goto_2c
    return-object p3

    .end local v1    # "inBuff":I
    :cond_2d
    move v4, v2

    .line 469
    goto :goto_10

    :cond_2f
    move v3, v2

    goto :goto_1b

    .line 476
    .restart local v1    # "inBuff":I
    :pswitch_31
    ushr-int/lit8 v2, v1, 0x12

    aget-byte v2, v0, v2

    aput-byte v2, p3, p4

    .line 477
    add-int/lit8 v2, p4, 0x1

    ushr-int/lit8 v3, v1, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 478
    add-int/lit8 v2, p4, 0x2

    ushr-int/lit8 v3, v1, 0x6

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 479
    add-int/lit8 v2, p4, 0x3

    and-int/lit8 v3, v1, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    goto :goto_2c

    .line 483
    :pswitch_54
    ushr-int/lit8 v2, v1, 0x12

    aget-byte v2, v0, v2

    aput-byte v2, p3, p4

    .line 484
    add-int/lit8 v2, p4, 0x1

    ushr-int/lit8 v3, v1, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 485
    add-int/lit8 v2, p4, 0x2

    ushr-int/lit8 v3, v1, 0x6

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 486
    add-int/lit8 v2, p4, 0x3

    aput-byte v5, p3, v2

    goto :goto_2c

    .line 490
    :pswitch_73
    ushr-int/lit8 v2, v1, 0x12

    aget-byte v2, v0, v2

    aput-byte v2, p3, p4

    .line 491
    add-int/lit8 v2, p4, 0x1

    ushr-int/lit8 v3, v1, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 492
    add-int/lit8 v2, p4, 0x2

    aput-byte v5, p3, v2

    .line 493
    add-int/lit8 v2, p4, 0x3

    aput-byte v5, p3, v2

    goto :goto_2c

    .line 473
    :pswitch_data_8c
    .packed-switch 0x1
        :pswitch_73
        :pswitch_54
        :pswitch_31
    .end packed-switch
.end method

.method private static encode3to4([B[BII)[B
    .registers 10
    .param p0, "b4"    # [B
    .param p1, "threeBytes"    # [B
    .param p2, "numSigBytes"    # I
    .param p3, "options"    # I

    .prologue
    const/4 v1, 0x0

    .line 424
    move-object v0, p1

    move v2, p2

    move-object v3, p0

    move v4, v1

    move v5, p3

    invoke-static/range {v0 .. v5}, Lorg/jivesoftware/smack/util/Base64;->encode3to4([BII[BII)[B

    .line 425
    return-object p0
.end method

.method public static encodeBytes([B)Ljava/lang/String;
    .registers 3
    .param p0, "source"    # [B

    .prologue
    const/4 v1, 0x0

    .line 609
    array-length v0, p0

    invoke-static {p0, v1, v0, v1}, Lorg/jivesoftware/smack/util/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBytes([BI)Ljava/lang/String;
    .registers 4
    .param p0, "source"    # [B
    .param p1, "options"    # I

    .prologue
    .line 636
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Lorg/jivesoftware/smack/util/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBytes([BII)Ljava/lang/String;
    .registers 4
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 651
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/jivesoftware/smack/util/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBytes([BIII)Ljava/lang/String;
    .registers 28
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "options"    # I

    .prologue
    .line 681
    and-int/lit8 v16, p3, 0x8

    .line 682
    .local v16, "dontBreakLines":I
    and-int/lit8 v17, p3, 0x2

    .line 685
    .local v17, "gzip":I
    const/4 v4, 0x2

    move/from16 v0, v17

    if-ne v0, v4, :cond_6a

    .line 687
    const/4 v12, 0x0

    .line 688
    .local v12, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v18, 0x0

    .line 689
    .local v18, "gzos":Ljava/util/zip/GZIPOutputStream;
    const/4 v10, 0x0

    .line 695
    .local v10, "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :try_start_d
    new-instance v13, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v13}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_12} :catch_43
    .catchall {:try_start_d .. :try_end_12} :catchall_54

    .line 696
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .local v13, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_12
    new-instance v11, Lorg/jivesoftware/smack/util/Base64$OutputStream;

    or-int/lit8 v4, p3, 0x1

    invoke-direct {v11, v13, v4}, Lorg/jivesoftware/smack/util/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_19} :catch_fe
    .catchall {:try_start_12 .. :try_end_19} :catchall_ee

    .line 697
    .end local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .local v11, "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :try_start_19
    new-instance v19, Ljava/util/zip/GZIPOutputStream;

    move-object/from16 v0, v19

    invoke-direct {v0, v11}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_20} :catch_102
    .catchall {:try_start_19 .. :try_end_20} :catchall_f2

    .line 699
    .end local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .local v19, "gzos":Ljava/util/zip/GZIPOutputStream;
    :try_start_20
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move/from16 v2, p1

    move/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/zip/GZIPOutputStream;->write([BII)V

    .line 700
    invoke-virtual/range {v19 .. v19}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_2e} :catch_107
    .catchall {:try_start_20 .. :try_end_2e} :catchall_f7

    .line 709
    :try_start_2e
    invoke-virtual/range {v19 .. v19}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_31} :catch_d6

    .line 710
    :goto_31
    :try_start_31
    invoke-virtual {v11}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_34} :catch_d9

    .line 711
    :goto_34
    :try_start_34
    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_37} :catch_dc

    .line 717
    :goto_37
    :try_start_37
    new-instance v4, Ljava/lang/String;

    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v4, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_42
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_37 .. :try_end_42} :catch_5f

    .line 766
    .end local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :goto_42
    return-object v4

    .line 702
    .restart local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_43
    move-exception v8

    .line 704
    .local v8, "e":Ljava/io/IOException;
    :goto_44
    :try_start_44
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V
    :try_end_47
    .catchall {:try_start_44 .. :try_end_47} :catchall_54

    .line 705
    const/4 v4, 0x0

    .line 709
    :try_start_48
    invoke-virtual/range {v18 .. v18}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_4b} :catch_df

    .line 710
    :goto_4b
    :try_start_4b
    invoke-virtual {v10}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_4b .. :try_end_4e} :catch_e2

    .line 711
    :goto_4e
    :try_start_4e
    invoke-virtual {v12}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_51} :catch_52

    goto :goto_42

    :catch_52
    move-exception v5

    goto :goto_42

    .line 709
    .end local v8    # "e":Ljava/io/IOException;
    :catchall_54
    move-exception v4

    :goto_55
    :try_start_55
    invoke-virtual/range {v18 .. v18}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_55 .. :try_end_58} :catch_e5

    .line 710
    :goto_58
    :try_start_58
    invoke-virtual {v10}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_5b} :catch_e8

    .line 711
    :goto_5b
    :try_start_5b
    invoke-virtual {v12}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5e
    .catch Ljava/lang/Exception; {:try_start_5b .. :try_end_5e} :catch_eb

    :goto_5e
    throw v4

    .line 719
    .end local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_5f
    move-exception v23

    .line 721
    .local v23, "uue":Ljava/io/UnsupportedEncodingException;
    new-instance v4, Ljava/lang/String;

    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    goto :goto_42

    .line 729
    .end local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .end local v23    # "uue":Ljava/io/UnsupportedEncodingException;
    :cond_6a
    if-nez v16, :cond_ac

    const/4 v14, 0x1

    .line 731
    .local v14, "breakLines":Z
    :goto_6d
    mul-int/lit8 v4, p2, 0x4

    div-int/lit8 v21, v4, 0x3

    .line 732
    .local v21, "len43":I
    rem-int/lit8 v4, p2, 0x3

    if-lez v4, :cond_ae

    const/4 v4, 0x4

    :goto_76
    add-int v5, v21, v4

    if-eqz v14, :cond_b0

    div-int/lit8 v4, v21, 0x4c

    :goto_7c
    add-int/2addr v4, v5

    new-array v7, v4, [B

    .line 735
    .local v7, "outBuff":[B
    const/4 v15, 0x0

    .line 736
    .local v15, "d":I
    const/4 v8, 0x0

    .line 737
    .local v8, "e":I
    add-int/lit8 v20, p2, -0x2

    .line 738
    .local v20, "len2":I
    const/16 v22, 0x0

    .line 739
    .local v22, "lineLength":I
    :goto_85
    move/from16 v0, v20

    if-ge v15, v0, :cond_b2

    .line 741
    add-int v5, v15, p1

    const/4 v6, 0x3

    move-object/from16 v4, p0

    move/from16 v9, p3

    invoke-static/range {v4 .. v9}, Lorg/jivesoftware/smack/util/Base64;->encode3to4([BII[BII)[B

    .line 743
    add-int/lit8 v22, v22, 0x4

    .line 744
    if-eqz v14, :cond_a7

    const/16 v4, 0x4c

    move/from16 v0, v22

    if-ne v0, v4, :cond_a7

    .line 746
    add-int/lit8 v4, v8, 0x4

    const/16 v5, 0xa

    aput-byte v5, v7, v4

    .line 747
    add-int/lit8 v8, v8, 0x1

    .line 748
    const/16 v22, 0x0

    .line 739
    :cond_a7
    add-int/lit8 v15, v15, 0x3

    add-int/lit8 v8, v8, 0x4

    goto :goto_85

    .line 729
    .end local v7    # "outBuff":[B
    .end local v8    # "e":I
    .end local v14    # "breakLines":Z
    .end local v15    # "d":I
    .end local v20    # "len2":I
    .end local v21    # "len43":I
    .end local v22    # "lineLength":I
    :cond_ac
    const/4 v14, 0x0

    goto :goto_6d

    .line 732
    .restart local v14    # "breakLines":Z
    .restart local v21    # "len43":I
    :cond_ae
    const/4 v4, 0x0

    goto :goto_76

    :cond_b0
    const/4 v4, 0x0

    goto :goto_7c

    .line 752
    .restart local v7    # "outBuff":[B
    .restart local v8    # "e":I
    .restart local v15    # "d":I
    .restart local v20    # "len2":I
    .restart local v22    # "lineLength":I
    :cond_b2
    move/from16 v0, p2

    if-ge v15, v0, :cond_c3

    .line 754
    add-int v5, v15, p1

    sub-int v6, p2, v15

    move-object/from16 v4, p0

    move/from16 v9, p3

    invoke-static/range {v4 .. v9}, Lorg/jivesoftware/smack/util/Base64;->encode3to4([BII[BII)[B

    .line 755
    add-int/lit8 v8, v8, 0x4

    .line 762
    :cond_c3
    :try_start_c3
    new-instance v4, Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "UTF-8"

    invoke-direct {v4, v7, v5, v8, v6}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_cb
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_c3 .. :try_end_cb} :catch_cd

    goto/16 :goto_42

    .line 764
    :catch_cd
    move-exception v23

    .line 766
    .restart local v23    # "uue":Ljava/io/UnsupportedEncodingException;
    new-instance v4, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-direct {v4, v7, v5, v8}, Ljava/lang/String;-><init>([BII)V

    goto/16 :goto_42

    .line 709
    .end local v7    # "outBuff":[B
    .end local v8    # "e":I
    .end local v14    # "breakLines":Z
    .end local v15    # "d":I
    .end local v20    # "len2":I
    .end local v21    # "len43":I
    .end local v22    # "lineLength":I
    .end local v23    # "uue":Ljava/io/UnsupportedEncodingException;
    .restart local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_d6
    move-exception v4

    goto/16 :goto_31

    .line 710
    :catch_d9
    move-exception v4

    goto/16 :goto_34

    .line 711
    :catch_dc
    move-exception v4

    goto/16 :goto_37

    .line 709
    .end local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .local v8, "e":Ljava/io/IOException;
    .restart local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_df
    move-exception v5

    goto/16 :goto_4b

    .line 710
    :catch_e2
    move-exception v5

    goto/16 :goto_4e

    .line 709
    .end local v8    # "e":Ljava/io/IOException;
    :catch_e5
    move-exception v5

    goto/16 :goto_58

    .line 710
    :catch_e8
    move-exception v5

    goto/16 :goto_5b

    .line 711
    :catch_eb
    move-exception v5

    goto/16 :goto_5e

    .line 709
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_ee
    move-exception v4

    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_55

    .end local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_f2
    move-exception v4

    move-object v10, v11

    .end local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_55

    .end local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catchall_f7
    move-exception v4

    move-object v10, v11

    .end local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    move-object/from16 v18, v19

    .end local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_55

    .line 702
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_fe
    move-exception v8

    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_44

    .end local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_102
    move-exception v8

    move-object v10, v11

    .end local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_44

    .end local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_107
    move-exception v8

    move-object v10, v11

    .end local v11    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v10    # "b64os":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    move-object/from16 v18, v19

    .end local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_44
.end method

.method public static encodeFileToFile(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p0, "infile"    # Ljava/lang/String;
    .param p1, "outfile"    # Ljava/lang/String;

    .prologue
    .line 1248
    invoke-static {p0}, Lorg/jivesoftware/smack/util/Base64;->encodeFromFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1249
    .local v0, "encoded":Ljava/lang/String;
    const/4 v2, 0x0

    .line 1251
    .local v2, "out":Ljava/io/OutputStream;
    :try_start_5
    new-instance v3, Ljava/io/BufferedOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_f} :catch_20
    .catchall {:try_start_5 .. :try_end_f} :catchall_2a

    .line 1253
    .end local v2    # "out":Ljava/io/OutputStream;
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_f
    const-string v4, "US-ASCII"

    invoke-virtual {v0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStream;->write([B)V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_18} :catch_34
    .catchall {:try_start_f .. :try_end_18} :catchall_31

    .line 1259
    :try_start_18
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_1b} :catch_1d

    move-object v2, v3

    .line 1262
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    :goto_1c
    return-void

    .line 1260
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catch_1d
    move-exception v4

    move-object v2, v3

    .line 1261
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_1c

    .line 1255
    :catch_20
    move-exception v1

    .line 1256
    .local v1, "ex":Ljava/io/IOException;
    :goto_21
    :try_start_21
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_24
    .catchall {:try_start_21 .. :try_end_24} :catchall_2a

    .line 1259
    :try_start_24
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_27} :catch_28

    goto :goto_1c

    .line 1260
    :catch_28
    move-exception v4

    goto :goto_1c

    .line 1259
    .end local v1    # "ex":Ljava/io/IOException;
    :catchall_2a
    move-exception v4

    :goto_2b
    :try_start_2b
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_2e} :catch_2f

    .line 1260
    :goto_2e
    throw v4

    :catch_2f
    move-exception v5

    goto :goto_2e

    .line 1259
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catchall_31
    move-exception v4

    move-object v2, v3

    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_2b

    .line 1255
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catch_34
    move-exception v1

    move-object v2, v3

    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_21
.end method

.method public static encodeFromFile(Ljava/lang/String;)Ljava/lang/String;
    .registers 14
    .param p0, "filename"    # Ljava/lang/String;

    .prologue
    .line 1204
    const/4 v4, 0x0

    .line 1205
    .local v4, "encodedData":Ljava/lang/String;
    const/4 v0, 0x0

    .line 1209
    .local v0, "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    :try_start_2
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1210
    .local v6, "file":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v9

    long-to-double v9, v9

    const-wide v11, 0x3ff6666666666666L    # 1.4

    mul-double/2addr v9, v11

    double-to-int v9, v9

    const/16 v10, 0x28

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v9

    new-array v2, v9, [B

    .line 1211
    .local v2, "buffer":[B
    const/4 v7, 0x0

    .line 1212
    .local v7, "length":I
    const/4 v8, 0x0

    .line 1215
    .local v8, "numBytes":I
    new-instance v1, Lorg/jivesoftware/smack/util/Base64$InputStream;

    new-instance v9, Ljava/io/BufferedInputStream;

    new-instance v10, Ljava/io/FileInputStream;

    invoke-direct {v10, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v9, v10}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v10, 0x1

    invoke-direct {v1, v9, v10}, Lorg/jivesoftware/smack/util/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2d} :catch_49
    .catchall {:try_start_2 .. :try_end_2d} :catchall_68

    .line 1220
    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .local v1, "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    :goto_2d
    const/16 v9, 0x1000

    :try_start_2f
    invoke-virtual {v1, v2, v7, v9}, Lorg/jivesoftware/smack/util/Base64$InputStream;->read([BII)I

    move-result v8

    if-ltz v8, :cond_37

    .line 1221
    add-int/2addr v7, v8

    goto :goto_2d

    .line 1224
    :cond_37
    new-instance v5, Ljava/lang/String;

    const/4 v9, 0x0

    const-string v10, "UTF-8"

    invoke-direct {v5, v2, v9, v7, v10}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_3f} :catch_72
    .catchall {:try_start_2f .. :try_end_3f} :catchall_6f

    .line 1233
    .end local v4    # "encodedData":Ljava/lang/String;
    .local v5, "encodedData":Ljava/lang/String;
    :try_start_3f
    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Base64$InputStream;->close()V
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_42} :catch_45

    move-object v0, v1

    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    move-object v4, v5

    .line 1236
    .end local v2    # "buffer":[B
    .end local v5    # "encodedData":Ljava/lang/String;
    .end local v6    # "file":Ljava/io/File;
    .end local v7    # "length":I
    .end local v8    # "numBytes":I
    .restart local v4    # "encodedData":Ljava/lang/String;
    :goto_44
    return-object v4

    .line 1233
    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .end local v4    # "encodedData":Ljava/lang/String;
    .restart local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v2    # "buffer":[B
    .restart local v5    # "encodedData":Ljava/lang/String;
    .restart local v6    # "file":Ljava/io/File;
    .restart local v7    # "length":I
    .restart local v8    # "numBytes":I
    :catch_45
    move-exception v9

    move-object v0, v1

    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    move-object v4, v5

    .line 1234
    .end local v5    # "encodedData":Ljava/lang/String;
    .restart local v4    # "encodedData":Ljava/lang/String;
    goto :goto_44

    .line 1227
    .end local v2    # "buffer":[B
    .end local v6    # "file":Ljava/io/File;
    .end local v7    # "length":I
    .end local v8    # "numBytes":I
    :catch_49
    move-exception v3

    .line 1229
    .local v3, "e":Ljava/io/IOException;
    :goto_4a
    :try_start_4a
    sget-object v9, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Error encoding from file "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_62
    .catchall {:try_start_4a .. :try_end_62} :catchall_68

    .line 1233
    :try_start_62
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$InputStream;->close()V
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_65} :catch_66

    goto :goto_44

    :catch_66
    move-exception v9

    goto :goto_44

    .end local v3    # "e":Ljava/io/IOException;
    :catchall_68
    move-exception v9

    :goto_69
    :try_start_69
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$InputStream;->close()V
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_69 .. :try_end_6c} :catch_6d

    :goto_6c
    throw v9

    :catch_6d
    move-exception v10

    goto :goto_6c

    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v2    # "buffer":[B
    .restart local v6    # "file":Ljava/io/File;
    .restart local v7    # "length":I
    .restart local v8    # "numBytes":I
    :catchall_6f
    move-exception v9

    move-object v0, v1

    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    goto :goto_69

    .line 1227
    .end local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    :catch_72
    move-exception v3

    move-object v0, v1

    .end local v1    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    .restart local v0    # "bis":Lorg/jivesoftware/smack/util/Base64$InputStream;
    goto :goto_4a
.end method

.method public static encodeObject(Ljava/io/Serializable;)Ljava/lang/String;
    .registers 2
    .param p0, "serializableObject"    # Ljava/io/Serializable;

    .prologue
    .line 516
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/jivesoftware/smack/util/Base64;->encodeObject(Ljava/io/Serializable;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeObject(Ljava/io/Serializable;I)Ljava/lang/String;
    .registers 17
    .param p0, "serializableObject"    # Ljava/io/Serializable;
    .param p1, "options"    # I

    .prologue
    .line 547
    const/4 v2, 0x0

    .line 548
    .local v2, "baos":Ljava/io/ByteArrayOutputStream;
    const/4 v0, 0x0

    .line 549
    .local v0, "b64os":Ljava/io/OutputStream;
    const/4 v9, 0x0

    .line 550
    .local v9, "oos":Ljava/io/ObjectOutputStream;
    const/4 v7, 0x0

    .line 553
    .local v7, "gzos":Ljava/util/zip/GZIPOutputStream;
    and-int/lit8 v6, p1, 0x2

    .line 554
    .local v6, "gzip":I
    and-int/lit8 v4, p1, 0x8

    .line 559
    .local v4, "dontBreakLines":I
    :try_start_8
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_d} :catch_47
    .catchall {:try_start_8 .. :try_end_d} :catchall_5b

    .line 560
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .local v3, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_d
    new-instance v1, Lorg/jivesoftware/smack/util/Base64$OutputStream;

    or-int/lit8 v12, p1, 0x1

    invoke-direct {v1, v3, v12}, Lorg/jivesoftware/smack/util/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_14} :catch_98
    .catchall {:try_start_d .. :try_end_14} :catchall_8c

    .line 563
    .end local v0    # "b64os":Ljava/io/OutputStream;
    .local v1, "b64os":Ljava/io/OutputStream;
    const/4 v12, 0x2

    if-ne v6, v12, :cond_40

    .line 565
    :try_start_17
    new-instance v8, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v8, v1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_1c} :catch_9b
    .catchall {:try_start_17 .. :try_end_1c} :catchall_8f

    .line 566
    .end local v7    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .local v8, "gzos":Ljava/util/zip/GZIPOutputStream;
    :try_start_1c
    new-instance v10, Ljava/io/ObjectOutputStream;

    invoke-direct {v10, v8}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_21} :catch_9f
    .catchall {:try_start_1c .. :try_end_21} :catchall_93

    .end local v9    # "oos":Ljava/io/ObjectOutputStream;
    .local v10, "oos":Ljava/io/ObjectOutputStream;
    move-object v7, v8

    .end local v8    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v7    # "gzos":Ljava/util/zip/GZIPOutputStream;
    move-object v9, v10

    .line 571
    .end local v10    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v9    # "oos":Ljava/io/ObjectOutputStream;
    :goto_23
    :try_start_23
    invoke-virtual {v9, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_26} :catch_9b
    .catchall {:try_start_23 .. :try_end_26} :catchall_8f

    .line 580
    :try_start_26
    invoke-virtual {v9}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_29} :catch_76

    .line 581
    :goto_29
    :try_start_29
    invoke-virtual {v7}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_2c} :catch_78

    .line 582
    :goto_2c
    :try_start_2c
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_2f} :catch_7a

    .line 583
    :goto_2f
    :try_start_2f
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_32} :catch_7c

    .line 589
    :goto_32
    :try_start_32
    new-instance v12, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v13

    const-string v14, "UTF-8"

    invoke-direct {v12, v13, v14}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_3d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_32 .. :try_end_3d} :catch_69

    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .line 593
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    :goto_3f
    return-object v12

    .line 569
    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :cond_40
    :try_start_40
    new-instance v10, Ljava/io/ObjectOutputStream;

    invoke-direct {v10, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_45
    .catch Ljava/io/IOException; {:try_start_40 .. :try_end_45} :catch_9b
    .catchall {:try_start_40 .. :try_end_45} :catchall_8f

    .end local v9    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v10    # "oos":Ljava/io/ObjectOutputStream;
    move-object v9, v10

    .end local v10    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v9    # "oos":Ljava/io/ObjectOutputStream;
    goto :goto_23

    .line 573
    .end local v1    # "b64os":Ljava/io/OutputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_47
    move-exception v5

    .line 575
    .local v5, "e":Ljava/io/IOException;
    :goto_48
    :try_start_48
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4b
    .catchall {:try_start_48 .. :try_end_4b} :catchall_5b

    .line 576
    const/4 v12, 0x0

    .line 580
    :try_start_4c
    invoke-virtual {v9}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_4f} :catch_7e

    .line 581
    :goto_4f
    :try_start_4f
    invoke-virtual {v7}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_52} :catch_80

    .line 582
    :goto_52
    :try_start_52
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_55} :catch_82

    .line 583
    :goto_55
    :try_start_55
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_55 .. :try_end_58} :catch_59

    goto :goto_3f

    :catch_59
    move-exception v13

    goto :goto_3f

    .line 580
    .end local v5    # "e":Ljava/io/IOException;
    :catchall_5b
    move-exception v12

    :goto_5c
    :try_start_5c
    invoke-virtual {v9}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_5f
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_5f} :catch_84

    .line 581
    :goto_5f
    :try_start_5f
    invoke-virtual {v7}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_62
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_62} :catch_86

    .line 582
    :goto_62
    :try_start_62
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_65} :catch_88

    .line 583
    :goto_65
    :try_start_65
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_68
    .catch Ljava/lang/Exception; {:try_start_65 .. :try_end_68} :catch_8a

    :goto_68
    throw v12

    .line 591
    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_69
    move-exception v11

    .line 593
    .local v11, "uue":Ljava/io/UnsupportedEncodingException;
    new-instance v12, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/String;-><init>([B)V

    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_3f

    .line 580
    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v11    # "uue":Ljava/io/UnsupportedEncodingException;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_76
    move-exception v12

    goto :goto_29

    .line 581
    :catch_78
    move-exception v12

    goto :goto_2c

    .line 582
    :catch_7a
    move-exception v12

    goto :goto_2f

    .line 583
    :catch_7c
    move-exception v12

    goto :goto_32

    .line 580
    .end local v1    # "b64os":Ljava/io/OutputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v5    # "e":Ljava/io/IOException;
    :catch_7e
    move-exception v13

    goto :goto_4f

    .line 581
    :catch_80
    move-exception v13

    goto :goto_52

    .line 582
    :catch_82
    move-exception v13

    goto :goto_55

    .line 580
    .end local v5    # "e":Ljava/io/IOException;
    :catch_84
    move-exception v13

    goto :goto_5f

    .line 581
    :catch_86
    move-exception v13

    goto :goto_62

    .line 582
    :catch_88
    move-exception v13

    goto :goto_65

    .line 583
    :catch_8a
    move-exception v13

    goto :goto_68

    .line 580
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_8c
    move-exception v12

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_5c

    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_8f
    move-exception v12

    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_5c

    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v8    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catchall_93
    move-exception v12

    move-object v7, v8

    .end local v8    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v7    # "gzos":Ljava/util/zip/GZIPOutputStream;
    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_5c

    .line 573
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_98
    move-exception v5

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_48

    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_9b
    move-exception v5

    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_48

    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v8    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_9f
    move-exception v5

    move-object v7, v8

    .end local v8    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v7    # "gzos":Ljava/util/zip/GZIPOutputStream;
    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_48
.end method

.method public static encodeToFile([BLjava/lang/String;)Z
    .registers 8
    .param p0, "dataToEncode"    # [B
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 1078
    const/4 v3, 0x0

    .line 1079
    .local v3, "success":Z
    const/4 v0, 0x0

    .line 1082
    .local v0, "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :try_start_2
    new-instance v1, Lorg/jivesoftware/smack/util/Base64$OutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5}, Lorg/jivesoftware/smack/util/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_d} :catch_19
    .catchall {:try_start_2 .. :try_end_d} :catchall_21

    .line 1084
    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .local v1, "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :try_start_d
    invoke-virtual {v1, p0}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->write([B)V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_10} :catch_2b
    .catchall {:try_start_d .. :try_end_10} :catchall_28

    .line 1085
    const/4 v3, 0x1

    .line 1094
    :try_start_11
    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_14} :catch_16

    move-object v0, v1

    .line 1097
    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :goto_15
    return v3

    .line 1094
    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :catch_16
    move-exception v4

    move-object v0, v1

    .line 1095
    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    goto :goto_15

    .line 1087
    :catch_19
    move-exception v2

    .line 1090
    .local v2, "e":Ljava/io/IOException;
    :goto_1a
    const/4 v3, 0x0

    .line 1094
    :try_start_1b
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1e} :catch_1f

    goto :goto_15

    :catch_1f
    move-exception v4

    goto :goto_15

    .end local v2    # "e":Ljava/io/IOException;
    :catchall_21
    move-exception v4

    :goto_22
    :try_start_22
    invoke-virtual {v0}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->close()V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_25} :catch_26

    :goto_25
    throw v4

    :catch_26
    move-exception v5

    goto :goto_25

    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :catchall_28
    move-exception v4

    move-object v0, v1

    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    goto :goto_22

    .line 1087
    .end local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    :catch_2b
    move-exception v2

    move-object v0, v1

    .end local v1    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/jivesoftware/smack/util/Base64$OutputStream;
    goto :goto_1a
.end method

.method private static final getAlphabet(I)[B
    .registers 3
    .param p0, "options"    # I

    .prologue
    .line 338
    and-int/lit8 v0, p0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_9

    sget-object v0, Lorg/jivesoftware/smack/util/Base64;->_URL_SAFE_ALPHABET:[B

    .line 340
    :goto_8
    return-object v0

    .line 339
    :cond_9
    and-int/lit8 v0, p0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_12

    sget-object v0, Lorg/jivesoftware/smack/util/Base64;->_ORDERED_ALPHABET:[B

    goto :goto_8

    .line 340
    :cond_12
    sget-object v0, Lorg/jivesoftware/smack/util/Base64;->_STANDARD_ALPHABET:[B

    goto :goto_8
.end method

.method private static final getDecodabet(I)[B
    .registers 3
    .param p0, "options"    # I

    .prologue
    .line 354
    and-int/lit8 v0, p0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_9

    sget-object v0, Lorg/jivesoftware/smack/util/Base64;->_URL_SAFE_DECODABET:[B

    .line 356
    :goto_8
    return-object v0

    .line 355
    :cond_9
    and-int/lit8 v0, p0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_12

    sget-object v0, Lorg/jivesoftware/smack/util/Base64;->_ORDERED_DECODABET:[B

    goto :goto_8

    .line 356
    :cond_12
    sget-object v0, Lorg/jivesoftware/smack/util/Base64;->_STANDARD_DECODABET:[B

    goto :goto_8
.end method

.method public static final main([Ljava/lang/String;)V
    .registers 6
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 373
    array-length v3, p0

    const/4 v4, 0x3

    if-ge v3, v4, :cond_a

    .line 374
    const-string v3, "Not enough arguments."

    invoke-static {v3}, Lorg/jivesoftware/smack/util/Base64;->usage(Ljava/lang/String;)V

    .line 390
    :goto_9
    return-void

    .line 377
    :cond_a
    const/4 v3, 0x0

    aget-object v0, p0, v3

    .line 378
    .local v0, "flag":Ljava/lang/String;
    const/4 v3, 0x1

    aget-object v1, p0, v3

    .line 379
    .local v1, "infile":Ljava/lang/String;
    const/4 v3, 0x2

    aget-object v2, p0, v3

    .line 380
    .local v2, "outfile":Ljava/lang/String;
    const-string v3, "-e"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 381
    invoke-static {v1, v2}, Lorg/jivesoftware/smack/util/Base64;->encodeFileToFile(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9

    .line 383
    :cond_1f
    const-string v3, "-d"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 384
    invoke-static {v1, v2}, Lorg/jivesoftware/smack/util/Base64;->decodeFileToFile(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9

    .line 387
    :cond_2b
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown flag: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/jivesoftware/smack/util/Base64;->usage(Ljava/lang/String;)V

    goto :goto_9
.end method

.method private static final usage(Ljava/lang/String;)V
    .registers 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 399
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 400
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v1, "Usage: java Base64 -e|-d inputfile outputfile"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 401
    return-void
.end method
