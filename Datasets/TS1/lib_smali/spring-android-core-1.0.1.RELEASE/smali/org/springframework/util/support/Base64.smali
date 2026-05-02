.class public Lorg/springframework/util/support/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/springframework/util/support/Base64$OutputStream;,
        Lorg/springframework/util/support/Base64$InputStream;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DECODE:I = 0x0

.field public static final DONT_GUNZIP:I = 0x4

.field public static final DO_BREAK_LINES:I = 0x8

.field public static final ENCODE:I = 0x1

.field private static final EQUALS_SIGN:B = 0x3dt

.field private static final EQUALS_SIGN_ENC:B = -0x1t

.field public static final GZIP:I = 0x2

.field private static final MAX_LINE_LENGTH:I = 0x4c

.field private static final NEW_LINE:B = 0xat

.field public static final NO_OPTIONS:I = 0x0

.field public static final ORDERED:I = 0x20

.field private static final PREFERRED_ENCODING:Ljava/lang/String; = "US-ASCII"

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
    const/16 v2, 0x100

    const/16 v1, 0x40

    .line 150
    const-class v0, Lorg/springframework/util/support/Base64;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_3c

    const/4 v0, 0x1

    :goto_d
    sput-boolean v0, Lorg/springframework/util/support/Base64;->$assertionsDisabled:Z

    .line 222
    new-array v0, v1, [B

    fill-array-data v0, :array_3e

    sput-object v0, Lorg/springframework/util/support/Base64;->_STANDARD_ALPHABET:[B

    .line 240
    new-array v0, v2, [B

    fill-array-data v0, :array_62

    sput-object v0, Lorg/springframework/util/support/Base64;->_STANDARD_DECODABET:[B

    .line 282
    new-array v0, v1, [B

    fill-array-data v0, :array_e6

    sput-object v0, Lorg/springframework/util/support/Base64;->_URL_SAFE_ALPHABET:[B

    .line 298
    new-array v0, v2, [B

    fill-array-data v0, :array_10a

    sput-object v0, Lorg/springframework/util/support/Base64;->_URL_SAFE_DECODABET:[B

    .line 345
    new-array v0, v1, [B

    fill-array-data v0, :array_18e

    sput-object v0, Lorg/springframework/util/support/Base64;->_ORDERED_ALPHABET:[B

    .line 363
    const/16 v0, 0x101

    new-array v0, v0, [B

    fill-array-data v0, :array_1b2

    sput-object v0, Lorg/springframework/util/support/Base64;->_ORDERED_DECODABET:[B

    return-void

    .line 150
    :cond_3c
    const/4 v0, 0x0

    goto :goto_d

    .line 222
    :array_3e
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

    .line 240
    :array_62
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
        -0x9t
        -0x9t
        -0x9t
    .end array-data

    .line 282
    :array_e6
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

    .line 298
    :array_10a
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
        -0x9t
        -0x9t
        -0x9t
    .end array-data

    .line 345
    :array_18e
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

    .line 363
    :array_1b2
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
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 443
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(I)[B
    .registers 2
    .param p0, "x0"    # I

    .prologue
    .line 150
    invoke-static {p0}, Lorg/springframework/util/support/Base64;->getDecodabet(I)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100([BII[BII)[B
    .registers 7
    .param p0, "x0"    # [B
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # [B
    .param p4, "x4"    # I
    .param p5, "x5"    # I

    .prologue
    .line 150
    invoke-static/range {p0 .. p5}, Lorg/springframework/util/support/Base64;->encode3to4([BII[BII)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200([BI[BII)I
    .registers 6
    .param p0, "x0"    # [B
    .param p1, "x1"    # I
    .param p2, "x2"    # [B
    .param p3, "x3"    # I
    .param p4, "x4"    # I

    .prologue
    .line 150
    invoke-static {p0, p1, p2, p3, p4}, Lorg/springframework/util/support/Base64;->decode4to3([BI[BII)I

    move-result v0

    return v0
.end method

.method static synthetic access$300([B[BII)[B
    .registers 5
    .param p0, "x0"    # [B
    .param p1, "x1"    # [B
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .prologue
    .line 150
    invoke-static {p0, p1, p2, p3}, Lorg/springframework/util/support/Base64;->encode3to4([B[BII)[B

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/lang/String;)[B
    .registers 2
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1224
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/springframework/util/support/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/lang/String;I)[B
    .registers 19
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1242
    if-nez p0, :cond_a

    .line 1243
    new-instance v14, Ljava/lang/NullPointerException;

    const-string v15, "Input string was null."

    invoke-direct {v14, v15}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 1248
    :cond_a
    :try_start_a
    const-string v14, "US-ASCII"

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_11
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_a .. :try_end_11} :catch_70

    move-result-object v6

    .line 1256
    .local v6, "bytes":[B
    :goto_12
    const/4 v14, 0x0

    array-length v15, v6

    move/from16 v0, p1

    invoke-static {v6, v14, v15, v0}, Lorg/springframework/util/support/Base64;->decode([BIII)[B

    move-result-object v6

    .line 1260
    and-int/lit8 v14, p1, 0x4

    if-eqz v14, :cond_76

    const/4 v7, 0x1

    .line 1261
    .local v7, "dontGunzip":Z
    :goto_1f
    if-eqz v6, :cond_6f

    array-length v14, v6

    const/4 v15, 0x4

    if-lt v14, v15, :cond_6f

    if-nez v7, :cond_6f

    .line 1263
    const/4 v14, 0x0

    aget-byte v14, v6, v14

    and-int/lit16 v14, v14, 0xff

    const/4 v15, 0x1

    aget-byte v15, v6, v15

    shl-int/lit8 v15, v15, 0x8

    const v16, 0xff00

    and-int v15, v15, v16

    or-int v11, v14, v15

    .line 1264
    .local v11, "head":I
    const v14, 0x8b1f

    if-ne v14, v11, :cond_6f

    .line 1265
    const/4 v1, 0x0

    .line 1266
    .local v1, "bais":Ljava/io/ByteArrayInputStream;
    const/4 v9, 0x0

    .line 1267
    .local v9, "gzis":Ljava/util/zip/GZIPInputStream;
    const/4 v3, 0x0

    .line 1268
    .local v3, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v14, 0x800

    new-array v5, v14, [B

    .line 1269
    .local v5, "buffer":[B
    const/4 v12, 0x0

    .line 1272
    .local v12, "length":I
    :try_start_45
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_4a} :catch_af
    .catchall {:try_start_45 .. :try_end_4a} :catchall_88

    .line 1273
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .local v4, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_4a
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v6}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_4f
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_4f} :catch_b1
    .catchall {:try_start_4a .. :try_end_4f} :catchall_a3

    .line 1274
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .local v2, "bais":Ljava/io/ByteArrayInputStream;
    :try_start_4f
    new-instance v10, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v10, v2}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_54
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_54} :catch_b4
    .catchall {:try_start_4f .. :try_end_54} :catchall_a6

    .line 1276
    .end local v9    # "gzis":Ljava/util/zip/GZIPInputStream;
    .local v10, "gzis":Ljava/util/zip/GZIPInputStream;
    :goto_54
    :try_start_54
    invoke-virtual {v10, v5}, Ljava/util/zip/GZIPInputStream;->read([B)I

    move-result v12

    if-ltz v12, :cond_78

    .line 1277
    const/4 v14, 0x0

    invoke-virtual {v4, v5, v14, v12}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_54 .. :try_end_5e} :catch_5f
    .catchall {:try_start_54 .. :try_end_5e} :catchall_aa

    goto :goto_54

    .line 1284
    :catch_5f
    move-exception v8

    move-object v3, v4

    .end local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    move-object v9, v10

    .end local v10    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v9    # "gzis":Ljava/util/zip/GZIPInputStream;
    move-object v1, v2

    .line 1285
    .end local v2    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .local v8, "e":Ljava/io/IOException;
    :goto_63
    :try_start_63
    invoke-virtual {v8}, Ljava/io/IOException;->printStackTrace()V
    :try_end_66
    .catchall {:try_start_63 .. :try_end_66} :catchall_88

    .line 1289
    :try_start_66
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_69} :catch_97

    .line 1290
    :goto_69
    :try_start_69
    invoke-virtual {v9}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_69 .. :try_end_6c} :catch_99

    .line 1291
    :goto_6c
    :try_start_6c
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_6c .. :try_end_6f} :catch_9b

    .line 1297
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v5    # "buffer":[B
    .end local v8    # "e":Ljava/io/IOException;
    .end local v9    # "gzis":Ljava/util/zip/GZIPInputStream;
    .end local v11    # "head":I
    .end local v12    # "length":I
    :cond_6f
    :goto_6f
    return-object v6

    .line 1250
    .end local v6    # "bytes":[B
    .end local v7    # "dontGunzip":Z
    :catch_70
    move-exception v13

    .line 1251
    .local v13, "uee":Ljava/io/UnsupportedEncodingException;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    .restart local v6    # "bytes":[B
    goto :goto_12

    .line 1260
    .end local v13    # "uee":Ljava/io/UnsupportedEncodingException;
    :cond_76
    const/4 v7, 0x0

    goto :goto_1f

    .line 1281
    .restart local v2    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v5    # "buffer":[B
    .restart local v7    # "dontGunzip":Z
    .restart local v10    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v11    # "head":I
    .restart local v12    # "length":I
    :cond_78
    :try_start_78
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_7b
    .catch Ljava/io/IOException; {:try_start_78 .. :try_end_7b} :catch_5f
    .catchall {:try_start_78 .. :try_end_7b} :catchall_aa

    move-result-object v6

    .line 1289
    :try_start_7c
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_7f
    .catch Ljava/lang/Exception; {:try_start_7c .. :try_end_7f} :catch_93

    .line 1290
    :goto_7f
    :try_start_7f
    invoke-virtual {v10}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_82
    .catch Ljava/lang/Exception; {:try_start_7f .. :try_end_82} :catch_95

    .line 1291
    :goto_82
    :try_start_82
    invoke-virtual {v2}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_85
    .catch Ljava/lang/Exception; {:try_start_82 .. :try_end_85} :catch_86

    goto :goto_6f

    :catch_86
    move-exception v14

    goto :goto_6f

    .line 1289
    .end local v2    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v10    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v9    # "gzis":Ljava/util/zip/GZIPInputStream;
    :catchall_88
    move-exception v14

    :goto_89
    :try_start_89
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_8c
    .catch Ljava/lang/Exception; {:try_start_89 .. :try_end_8c} :catch_9d

    .line 1290
    :goto_8c
    :try_start_8c
    invoke-virtual {v9}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_8f
    .catch Ljava/lang/Exception; {:try_start_8c .. :try_end_8f} :catch_9f

    .line 1291
    :goto_8f
    :try_start_8f
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_92
    .catch Ljava/lang/Exception; {:try_start_8f .. :try_end_92} :catch_a1

    :goto_92
    throw v14

    .line 1289
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v9    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v2    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v10    # "gzis":Ljava/util/zip/GZIPInputStream;
    :catch_93
    move-exception v14

    goto :goto_7f

    .line 1290
    :catch_95
    move-exception v14

    goto :goto_82

    .line 1289
    .end local v2    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v10    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v8    # "e":Ljava/io/IOException;
    .restart local v9    # "gzis":Ljava/util/zip/GZIPInputStream;
    :catch_97
    move-exception v14

    goto :goto_69

    .line 1290
    :catch_99
    move-exception v14

    goto :goto_6c

    .line 1291
    :catch_9b
    move-exception v14

    goto :goto_6f

    .line 1289
    .end local v8    # "e":Ljava/io/IOException;
    :catch_9d
    move-exception v15

    goto :goto_8c

    .line 1290
    :catch_9f
    move-exception v15

    goto :goto_8f

    .line 1291
    :catch_a1
    move-exception v15

    goto :goto_92

    .line 1289
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_a3
    move-exception v14

    move-object v3, v4

    .end local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_89

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_a6
    move-exception v14

    move-object v3, v4

    .end local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_89

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v9    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v2    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v10    # "gzis":Ljava/util/zip/GZIPInputStream;
    :catchall_aa
    move-exception v14

    move-object v3, v4

    .end local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    move-object v9, v10

    .end local v10    # "gzis":Ljava/util/zip/GZIPInputStream;
    .restart local v9    # "gzis":Ljava/util/zip/GZIPInputStream;
    move-object v1, v2

    .end local v2    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_89

    .line 1284
    :catch_af
    move-exception v8

    goto :goto_63

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_b1
    move-exception v8

    move-object v3, v4

    .end local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_63

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_b4
    move-exception v8

    move-object v3, v4

    .end local v4    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    move-object v1, v2

    .end local v2    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_63
.end method

.method public static decode([B)[B
    .registers 4
    .param p0, "source"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1120
    const/4 v0, 0x0

    .line 1122
    .local v0, "decoded":[B
    array-length v1, p0

    invoke-static {p0, v2, v1, v2}, Lorg/springframework/util/support/Base64;->decode([BIII)[B

    move-result-object v0

    .line 1126
    return-object v0
.end method

.method public static decode([BIII)[B
    .registers 20
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1152
    if-nez p0, :cond_a

    .line 1153
    new-instance v11, Ljava/lang/NullPointerException;

    const-string v12, "Cannot decode null source array."

    invoke-direct {v11, v12}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 1155
    :cond_a
    if-ltz p1, :cond_13

    add-int v11, p1, p2

    move-object/from16 v0, p0

    array-length v12, v0

    if-le v11, v12, :cond_3a

    .line 1156
    :cond_13
    new-instance v11, Ljava/lang/IllegalArgumentException;

    const-string v12, "Source array with length %d cannot have offset of %d and process %d bytes."

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    move-object/from16 v0, p0

    array-length v15, v0

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x2

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 1160
    :cond_3a
    if-nez p2, :cond_40

    .line 1161
    const/4 v11, 0x0

    new-array v7, v11, [B

    .line 1208
    :goto_3f
    return-object v7

    .line 1162
    :cond_40
    const/4 v11, 0x4

    move/from16 v0, p2

    if-ge v0, v11, :cond_60

    .line 1163
    new-instance v11, Ljava/lang/IllegalArgumentException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Base64-encoded string must have at least four characters, but length specified was "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 1167
    :cond_60
    invoke-static/range {p3 .. p3}, Lorg/springframework/util/support/Base64;->getDecodabet(I)[B

    move-result-object v1

    .line 1169
    .local v1, "DECODABET":[B
    mul-int/lit8 v11, p2, 0x3

    div-int/lit8 v6, v11, 0x4

    .line 1170
    .local v6, "len34":I
    new-array v8, v6, [B

    .line 1171
    .local v8, "outBuff":[B
    const/4 v9, 0x0

    .line 1173
    .local v9, "outBuffPosn":I
    const/4 v11, 0x4

    new-array v2, v11, [B

    .line 1174
    .local v2, "b4":[B
    const/4 v3, 0x0

    .line 1175
    .local v3, "b4Posn":I
    const/4 v5, 0x0

    .line 1176
    .local v5, "i":I
    const/4 v10, 0x0

    .line 1178
    .local v10, "sbiDecode":B
    move/from16 v5, p1

    move v4, v3

    .end local v3    # "b4Posn":I
    .local v4, "b4Posn":I
    :goto_74
    add-int v11, p1, p2

    if-ge v5, v11, :cond_ca

    .line 1180
    aget-byte v11, p0, v5

    and-int/lit16 v11, v11, 0xff

    aget-byte v10, v1, v11

    .line 1185
    const/4 v11, -0x5

    if-lt v10, v11, :cond_a4

    .line 1186
    const/4 v11, -0x1

    if-lt v10, v11, :cond_c5

    .line 1187
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    aget-byte v11, p0, v5

    aput-byte v11, v2, v4

    .line 1188
    const/4 v11, 0x3

    if-le v3, v11, :cond_c6

    .line 1189
    const/4 v11, 0x0

    move/from16 v0, p3

    invoke-static {v2, v11, v8, v9, v0}, Lorg/springframework/util/support/Base64;->decode4to3([BI[BII)I

    move-result v11

    add-int/2addr v9, v11

    .line 1190
    const/4 v3, 0x0

    .line 1193
    aget-byte v11, p0, v5

    const/16 v12, 0x3d

    if-ne v11, v12, :cond_c6

    .line 1206
    :goto_9c
    new-array v7, v9, [B

    .line 1207
    .local v7, "out":[B
    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static {v8, v11, v7, v12, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_3f

    .line 1201
    .end local v3    # "b4Posn":I
    .end local v7    # "out":[B
    .restart local v4    # "b4Posn":I
    :cond_a4
    new-instance v11, Ljava/io/IOException;

    const-string v12, "Bad Base64 input character decimal %d in array position %d"

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aget-byte v15, p0, v5

    and-int/lit16 v15, v15, 0xff

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v11

    :cond_c5
    move v3, v4

    .line 1178
    .end local v4    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    :cond_c6
    add-int/lit8 v5, v5, 0x1

    move v4, v3

    .end local v3    # "b4Posn":I
    .restart local v4    # "b4Posn":I
    goto :goto_74

    :cond_ca
    move v3, v4

    .end local v4    # "b4Posn":I
    .restart local v3    # "b4Posn":I
    goto :goto_9c
.end method

.method private static decode4to3([BI[BII)I
    .registers 13
    .param p0, "source"    # [B
    .param p1, "srcOffset"    # I
    .param p2, "destination"    # [B
    .param p3, "destOffset"    # I
    .param p4, "options"    # I

    .prologue
    const/16 v6, 0x3d

    const/4 v7, 0x0

    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 1035
    if-nez p0, :cond_f

    .line 1036
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "Source array was null."

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1038
    :cond_f
    if-nez p2, :cond_19

    .line 1039
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "Destination array was null."

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1041
    :cond_19
    if-ltz p1, :cond_20

    add-int/lit8 v4, p1, 0x3

    array-length v5, p0

    if-lt v4, v5, :cond_3b

    .line 1042
    :cond_20
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Source array with length %d cannot have offset of %d and still process four bytes."

    new-array v3, v3, [Ljava/lang/Object;

    array-length v6, p0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v7

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v2

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1045
    :cond_3b
    if-ltz p3, :cond_42

    add-int/lit8 v4, p3, 0x2

    array-length v5, p2

    if-lt v4, v5, :cond_5d

    .line 1046
    :cond_42
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Destination array with length %d cannot have offset of %d and still store three bytes."

    new-array v3, v3, [Ljava/lang/Object;

    array-length v6, p2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v7

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v3, v2

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1051
    :cond_5d
    invoke-static {p4}, Lorg/springframework/util/support/Base64;->getDecodabet(I)[B

    move-result-object v0

    .line 1054
    .local v0, "DECODABET":[B
    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    if-ne v4, v6, :cond_81

    .line 1058
    aget-byte v3, p0, p1

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x12

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0xc

    or-int v1, v3, v4

    .line 1061
    .local v1, "outBuff":I
    ushr-int/lit8 v3, v1, 0x10

    int-to-byte v3, v3

    aput-byte v3, p2, p3

    .line 1097
    :goto_80
    return v2

    .line 1066
    .end local v1    # "outBuff":I
    :cond_81
    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    if-ne v2, v6, :cond_b4

    .line 1071
    aget-byte v2, p0, p1

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x12

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0xc

    or-int/2addr v2, v4

    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x6

    or-int v1, v2, v4

    .line 1075
    .restart local v1    # "outBuff":I
    ushr-int/lit8 v2, v1, 0x10

    int-to-byte v2, v2

    aput-byte v2, p2, p3

    .line 1076
    add-int/lit8 v2, p3, 0x1

    ushr-int/lit8 v4, v1, 0x8

    int-to-byte v4, v4

    aput-byte v4, p2, v2

    move v2, v3

    .line 1077
    goto :goto_80

    .line 1087
    .end local v1    # "outBuff":I
    :cond_b4
    aget-byte v2, p0, p1

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x12

    add-int/lit8 v3, p1, 0x1

    aget-byte v3, p0, v3

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0xc

    or-int/2addr v2, v3

    add-int/lit8 v3, p1, 0x2

    aget-byte v3, p0, v3

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x6

    or-int/2addr v2, v3

    add-int/lit8 v3, p1, 0x3

    aget-byte v3, p0, v3

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    or-int v1, v2, v3

    .line 1093
    .restart local v1    # "outBuff":I
    shr-int/lit8 v2, v1, 0x10

    int-to-byte v2, v2

    aput-byte v2, p2, p3

    .line 1094
    add-int/lit8 v2, p3, 0x1

    shr-int/lit8 v3, v1, 0x8

    int-to-byte v3, v3

    aput-byte v3, p2, v2

    .line 1095
    add-int/lit8 v2, p3, 0x2

    int-to-byte v3, v1

    aput-byte v3, p2, v2

    .line 1097
    const/4 v2, 0x3

    goto :goto_80
.end method

.method public static decodeFileToFile(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p0, "infile"    # Ljava/lang/String;
    .param p1, "outfile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1612
    invoke-static {p0}, Lorg/springframework/util/support/Base64;->decodeFromFile(Ljava/lang/String;)[B

    move-result-object v0

    .line 1613
    .local v0, "decoded":[B
    const/4 v2, 0x0

    .line 1615
    .local v2, "out":Ljava/io/OutputStream;
    :try_start_5
    new-instance v3, Ljava/io/BufferedOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_f} :catch_16
    .catchall {:try_start_5 .. :try_end_f} :catchall_18

    .line 1617
    .end local v2    # "out":Ljava/io/OutputStream;
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_f
    invoke-virtual {v3, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_12} :catch_24
    .catchall {:try_start_f .. :try_end_12} :catchall_21

    .line 1623
    :try_start_12
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_15} :catch_1d

    .line 1626
    :goto_15
    return-void

    .line 1619
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    :catch_16
    move-exception v1

    .line 1620
    .local v1, "e":Ljava/io/IOException;
    :goto_17
    :try_start_17
    throw v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_18

    .line 1623
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_18
    move-exception v4

    :goto_19
    :try_start_19
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_1c} :catch_1f

    .line 1624
    :goto_1c
    throw v4

    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catch_1d
    move-exception v4

    goto :goto_15

    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    :catch_1f
    move-exception v5

    goto :goto_1c

    .line 1623
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catchall_21
    move-exception v4

    move-object v2, v3

    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_19

    .line 1619
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catch_24
    move-exception v1

    move-object v2, v3

    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_17
.end method

.method public static decodeFromFile(Ljava/lang/String;)[B
    .registers 13
    .param p0, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1478
    const/4 v3, 0x0

    .line 1479
    .local v3, "decodedData":[B
    const/4 v0, 0x0

    .line 1483
    .local v0, "bis":Lorg/springframework/util/support/Base64$InputStream;
    :try_start_2
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1484
    .local v5, "file":Ljava/io/File;
    const/4 v2, 0x0

    .line 1485
    .local v2, "buffer":[B
    const/4 v6, 0x0

    .line 1486
    .local v6, "length":I
    const/4 v7, 0x0

    .line 1489
    .local v7, "numBytes":I
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v8

    const-wide/32 v10, 0x7fffffff

    cmp-long v8, v8, v10

    if-lez v8, :cond_3f

    .line 1491
    new-instance v8, Ljava/io/IOException;

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

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_38} :catch_38
    .catchall {:try_start_2 .. :try_end_38} :catchall_3a

    .line 1510
    .end local v2    # "buffer":[B
    .end local v5    # "file":Ljava/io/File;
    .end local v6    # "length":I
    .end local v7    # "numBytes":I
    :catch_38
    move-exception v4

    .line 1511
    .local v4, "e":Ljava/io/IOException;
    :goto_39
    :try_start_39
    throw v4
    :try_end_3a
    .catchall {:try_start_39 .. :try_end_3a} :catchall_3a

    .line 1514
    .end local v4    # "e":Ljava/io/IOException;
    :catchall_3a
    move-exception v8

    :goto_3b
    :try_start_3b
    invoke-virtual {v0}, Lorg/springframework/util/support/Base64$InputStream;->close()V
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_3e} :catch_6d

    :goto_3e
    throw v8

    .line 1493
    .restart local v2    # "buffer":[B
    .restart local v5    # "file":Ljava/io/File;
    .restart local v6    # "length":I
    .restart local v7    # "numBytes":I
    :cond_3f
    :try_start_3f
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v8

    long-to-int v8, v8

    new-array v2, v8, [B

    .line 1496
    new-instance v1, Lorg/springframework/util/support/Base64$InputStream;

    new-instance v8, Ljava/io/BufferedInputStream;

    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v8, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v9, 0x0

    invoke-direct {v1, v8, v9}, Lorg/springframework/util/support/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_56
    .catch Ljava/io/IOException; {:try_start_3f .. :try_end_56} :catch_38
    .catchall {:try_start_3f .. :try_end_56} :catchall_3a

    .line 1501
    .end local v0    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .local v1, "bis":Lorg/springframework/util/support/Base64$InputStream;
    :goto_56
    const/16 v8, 0x1000

    :try_start_58
    invoke-virtual {v1, v2, v6, v8}, Lorg/springframework/util/support/Base64$InputStream;->read([BII)I

    move-result v7

    if-ltz v7, :cond_60

    .line 1502
    add-int/2addr v6, v7

    goto :goto_56

    .line 1506
    :cond_60
    new-array v3, v6, [B

    .line 1507
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v2, v8, v3, v9, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_58 .. :try_end_67} :catch_72
    .catchall {:try_start_58 .. :try_end_67} :catchall_6f

    .line 1514
    :try_start_67
    invoke-virtual {v1}, Lorg/springframework/util/support/Base64$InputStream;->close()V
    :try_end_6a
    .catch Ljava/lang/Exception; {:try_start_67 .. :try_end_6a} :catch_6b

    .line 1517
    :goto_6a
    return-object v3

    .line 1514
    :catch_6b
    move-exception v8

    goto :goto_6a

    .end local v1    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .end local v2    # "buffer":[B
    .end local v5    # "file":Ljava/io/File;
    .end local v6    # "length":I
    .end local v7    # "numBytes":I
    .restart local v0    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    :catch_6d
    move-exception v9

    goto :goto_3e

    .end local v0    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .restart local v1    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .restart local v2    # "buffer":[B
    .restart local v5    # "file":Ljava/io/File;
    .restart local v6    # "length":I
    .restart local v7    # "numBytes":I
    :catchall_6f
    move-exception v8

    move-object v0, v1

    .end local v1    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .restart local v0    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    goto :goto_3b

    .line 1510
    .end local v0    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .restart local v1    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    :catch_72
    move-exception v4

    move-object v0, v1

    .end local v1    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .restart local v0    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    goto :goto_39
.end method

.method public static decodeToFile(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p0, "dataToDecode"    # Ljava/lang/String;
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1443
    const/4 v0, 0x0

    .line 1445
    .local v0, "bos":Lorg/springframework/util/support/Base64$OutputStream;
    :try_start_1
    new-instance v1, Lorg/springframework/util/support/Base64$OutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    invoke-direct {v1, v3, v4}, Lorg/springframework/util/support/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_c} :catch_19
    .catchall {:try_start_1 .. :try_end_c} :catchall_1b

    .line 1447
    .end local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .local v1, "bos":Lorg/springframework/util/support/Base64$OutputStream;
    :try_start_c
    const-string v3, "US-ASCII"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/springframework/util/support/Base64$OutputStream;->write([B)V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_15} :catch_27
    .catchall {:try_start_c .. :try_end_15} :catchall_24

    .line 1453
    :try_start_15
    invoke-virtual {v1}, Lorg/springframework/util/support/Base64$OutputStream;->close()V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_18} :catch_20

    .line 1456
    :goto_18
    return-void

    .line 1449
    .end local v1    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    :catch_19
    move-exception v2

    .line 1450
    .local v2, "e":Ljava/io/IOException;
    :goto_1a
    :try_start_1a
    throw v2
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_1b

    .line 1453
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_1b
    move-exception v3

    :goto_1c
    :try_start_1c
    invoke-virtual {v0}, Lorg/springframework/util/support/Base64$OutputStream;->close()V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1f} :catch_22

    :goto_1f
    throw v3

    .end local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    :catch_20
    move-exception v3

    goto :goto_18

    .end local v1    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    :catch_22
    move-exception v4

    goto :goto_1f

    .end local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    :catchall_24
    move-exception v3

    move-object v0, v1

    .end local v1    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    goto :goto_1c

    .line 1449
    .end local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    :catch_27
    move-exception v2

    move-object v0, v1

    .end local v1    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    goto :goto_1a
.end method

.method public static decodeToObject(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p0, "encodedObject"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 1316
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/springframework/util/support/Base64;->decodeToObject(Ljava/lang/String;ILjava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static decodeToObject(Ljava/lang/String;ILjava/lang/ClassLoader;)Ljava/lang/Object;
    .registers 12
    .param p0, "encodedObject"    # Ljava/lang/String;
    .param p1, "options"    # I
    .param p2, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 1341
    invoke-static {p0, p1}, Lorg/springframework/util/support/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v4

    .line 1343
    .local v4, "objBytes":[B
    const/4 v0, 0x0

    .line 1344
    .local v0, "bais":Ljava/io/ByteArrayInputStream;
    const/4 v5, 0x0

    .line 1345
    .local v5, "ois":Ljava/io/ObjectInputStream;
    const/4 v3, 0x0

    .line 1348
    .local v3, "obj":Ljava/lang/Object;
    :try_start_7
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_c} :catch_26
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7 .. :try_end_c} :catch_30
    .catchall {:try_start_7 .. :try_end_c} :catchall_28

    .line 1351
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .local v1, "bais":Ljava/io/ByteArrayInputStream;
    if-nez p2, :cond_1f

    .line 1352
    :try_start_e
    new-instance v6, Ljava/io/ObjectInputStream;

    invoke-direct {v6, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .end local v5    # "ois":Ljava/io/ObjectInputStream;
    .local v6, "ois":Ljava/io/ObjectInputStream;
    move-object v5, v6

    .line 1372
    .end local v6    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "ois":Ljava/io/ObjectInputStream;
    :goto_14
    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_17} :catch_40
    .catch Ljava/lang/ClassNotFoundException; {:try_start_e .. :try_end_17} :catch_3d
    .catchall {:try_start_e .. :try_end_17} :catchall_3a

    move-result-object v3

    .line 1381
    :try_start_18
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_1b} :catch_32

    .line 1382
    :goto_1b
    :try_start_1b
    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->close()V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1e} :catch_34

    .line 1385
    :goto_1e
    return-object v3

    .line 1358
    :cond_1f
    :try_start_1f
    new-instance v6, Lorg/springframework/util/support/Base64$1;

    invoke-direct {v6, v1, p2}, Lorg/springframework/util/support/Base64$1;-><init>(Ljava/io/InputStream;Ljava/lang/ClassLoader;)V
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_24} :catch_40
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1f .. :try_end_24} :catch_3d
    .catchall {:try_start_1f .. :try_end_24} :catchall_3a

    .end local v5    # "ois":Ljava/io/ObjectInputStream;
    .restart local v6    # "ois":Ljava/io/ObjectInputStream;
    move-object v5, v6

    .end local v6    # "ois":Ljava/io/ObjectInputStream;
    .restart local v5    # "ois":Ljava/io/ObjectInputStream;
    goto :goto_14

    .line 1374
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    :catch_26
    move-exception v2

    .line 1375
    .local v2, "e":Ljava/io/IOException;
    :goto_27
    :try_start_27
    throw v2
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_28

    .line 1381
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_28
    move-exception v7

    :goto_29
    :try_start_29
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_2c} :catch_36

    .line 1382
    :goto_2c
    :try_start_2c
    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->close()V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_2f} :catch_38

    :goto_2f
    throw v7

    .line 1377
    :catch_30
    move-exception v2

    .line 1378
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    :goto_31
    :try_start_31
    throw v2
    :try_end_32
    .catchall {:try_start_31 .. :try_end_32} :catchall_28

    .line 1381
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    :catch_32
    move-exception v7

    goto :goto_1b

    .line 1382
    :catch_34
    move-exception v7

    goto :goto_1e

    .line 1381
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    :catch_36
    move-exception v8

    goto :goto_2c

    .line 1382
    :catch_38
    move-exception v8

    goto :goto_2f

    .line 1381
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    :catchall_3a
    move-exception v7

    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_29

    .line 1377
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    :catch_3d
    move-exception v2

    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_31

    .line 1374
    .end local v0    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    :catch_40
    move-exception v2

    move-object v0, v1

    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v0    # "bais":Ljava/io/ByteArrayInputStream;
    goto :goto_27
.end method

.method public static encode(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .registers 8
    .param p0, "raw"    # Ljava/nio/ByteBuffer;
    .param p1, "encoded"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x0

    .line 558
    new-array v1, v5, [B

    .line 559
    .local v1, "raw3":[B
    const/4 v3, 0x4

    new-array v0, v3, [B

    .line 561
    .local v0, "enc4":[B
    :goto_7
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 562
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    invoke-static {v5, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 563
    .local v2, "rem":I
    invoke-virtual {p0, v1, v4, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 564
    invoke-static {v0, v1, v2, v4}, Lorg/springframework/util/support/Base64;->encode3to4([B[BII)[B

    .line 565
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    goto :goto_7

    .line 567
    .end local v2    # "rem":I
    :cond_1f
    return-void
.end method

.method public static encode(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;)V
    .registers 10
    .param p0, "raw"    # Ljava/nio/ByteBuffer;
    .param p1, "encoded"    # Ljava/nio/CharBuffer;

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x0

    .line 582
    new-array v2, v6, [B

    .line 583
    .local v2, "raw3":[B
    new-array v0, v7, [B

    .line 585
    .local v0, "enc4":[B
    :cond_7
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    if-eqz v4, :cond_29

    .line 586
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-static {v6, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 587
    .local v3, "rem":I
    invoke-virtual {p0, v2, v5, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 588
    invoke-static {v0, v2, v3, v5}, Lorg/springframework/util/support/Base64;->encode3to4([B[BII)[B

    .line 589
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1c
    if-ge v1, v7, :cond_7

    .line 590
    aget-byte v4, v0, v1

    and-int/lit16 v4, v4, 0xff

    int-to-char v4, v4

    invoke-virtual {p1, v4}, Ljava/nio/CharBuffer;->put(C)Ljava/nio/CharBuffer;

    .line 589
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c

    .line 593
    .end local v1    # "i":I
    .end local v3    # "rem":I
    :cond_29
    return-void
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

    .line 499
    invoke-static {p5}, Lorg/springframework/util/support/Base64;->getAlphabet(I)[B

    move-result-object v0

    .line 512
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

    .line 516
    .local v1, "inBuff":I
    packed-switch p2, :pswitch_data_8c

    .line 540
    :goto_2c
    return-object p3

    .end local v1    # "inBuff":I
    :cond_2d
    move v4, v2

    .line 512
    goto :goto_10

    :cond_2f
    move v3, v2

    goto :goto_1b

    .line 519
    .restart local v1    # "inBuff":I
    :pswitch_31
    ushr-int/lit8 v2, v1, 0x12

    aget-byte v2, v0, v2

    aput-byte v2, p3, p4

    .line 520
    add-int/lit8 v2, p4, 0x1

    ushr-int/lit8 v3, v1, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 521
    add-int/lit8 v2, p4, 0x2

    ushr-int/lit8 v3, v1, 0x6

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 522
    add-int/lit8 v2, p4, 0x3

    and-int/lit8 v3, v1, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    goto :goto_2c

    .line 526
    :pswitch_54
    ushr-int/lit8 v2, v1, 0x12

    aget-byte v2, v0, v2

    aput-byte v2, p3, p4

    .line 527
    add-int/lit8 v2, p4, 0x1

    ushr-int/lit8 v3, v1, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 528
    add-int/lit8 v2, p4, 0x2

    ushr-int/lit8 v3, v1, 0x6

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 529
    add-int/lit8 v2, p4, 0x3

    aput-byte v5, p3, v2

    goto :goto_2c

    .line 533
    :pswitch_73
    ushr-int/lit8 v2, v1, 0x12

    aget-byte v2, v0, v2

    aput-byte v2, p3, p4

    .line 534
    add-int/lit8 v2, p4, 0x1

    ushr-int/lit8 v3, v1, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 535
    add-int/lit8 v2, p4, 0x2

    aput-byte v5, p3, v2

    .line 536
    add-int/lit8 v2, p4, 0x3

    aput-byte v5, p3, v2

    goto :goto_2c

    .line 516
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

    .line 467
    move-object v0, p1

    move v2, p2

    move-object v3, p0

    move v4, v1

    move v5, p3

    invoke-static/range {v0 .. v5}, Lorg/springframework/util/support/Base64;->encode3to4([BII[BII)[B

    .line 468
    return-object p0
.end method

.method public static encodeBytes([B)Ljava/lang/String;
    .registers 6
    .param p0, "source"    # [B

    .prologue
    .line 718
    const/4 v0, 0x0

    .line 720
    .local v0, "encoded":Ljava/lang/String;
    const/4 v2, 0x0

    :try_start_2
    array-length v3, p0

    const/4 v4, 0x0

    invoke-static {p0, v2, v3, v4}, Lorg/springframework/util/support/Base64;->encodeBytes([BIII)Ljava/lang/String;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_7} :catch_14

    move-result-object v0

    .line 724
    :cond_8
    sget-boolean v2, Lorg/springframework/util/support/Base64;->$assertionsDisabled:Z

    if-nez v2, :cond_23

    if-nez v0, :cond_23

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 721
    :catch_14
    move-exception v1

    .line 722
    .local v1, "ex":Ljava/io/IOException;
    sget-boolean v2, Lorg/springframework/util/support/Base64;->$assertionsDisabled:Z

    if-nez v2, :cond_8

    new-instance v2, Ljava/lang/AssertionError;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 725
    .end local v1    # "ex":Ljava/io/IOException;
    :cond_23
    return-object v0
.end method

.method public static encodeBytes([BI)Ljava/lang/String;
    .registers 4
    .param p0, "source"    # [B
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 760
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Lorg/springframework/util/support/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBytes([BII)Ljava/lang/String;
    .registers 7
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 786
    const/4 v0, 0x0

    .line 788
    .local v0, "encoded":Ljava/lang/String;
    const/4 v2, 0x0

    :try_start_2
    invoke-static {p0, p1, p2, v2}, Lorg/springframework/util/support/Base64;->encodeBytes([BIII)Ljava/lang/String;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_12

    move-result-object v0

    .line 792
    :cond_6
    sget-boolean v2, Lorg/springframework/util/support/Base64;->$assertionsDisabled:Z

    if-nez v2, :cond_21

    if-nez v0, :cond_21

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 789
    :catch_12
    move-exception v1

    .line 790
    .local v1, "ex":Ljava/io/IOException;
    sget-boolean v2, Lorg/springframework/util/support/Base64;->$assertionsDisabled:Z

    if-nez v2, :cond_6

    new-instance v2, Ljava/lang/AssertionError;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 793
    .end local v1    # "ex":Ljava/io/IOException;
    :cond_21
    return-object v0
.end method

.method public static encodeBytes([BIII)Ljava/lang/String;
    .registers 8
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 831
    invoke-static {p0, p1, p2, p3}, Lorg/springframework/util/support/Base64;->encodeBytesToBytes([BIII)[B

    move-result-object v0

    .line 835
    .local v0, "encoded":[B
    :try_start_4
    new-instance v2, Ljava/lang/String;

    const-string v3, "US-ASCII"

    invoke-direct {v2, v0, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_b} :catch_c

    .line 838
    :goto_b
    return-object v2

    .line 837
    :catch_c
    move-exception v1

    .line 838
    .local v1, "uue":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([B)V

    goto :goto_b
.end method

.method public static encodeBytesToBytes([B)[B
    .registers 6
    .param p0, "source"    # [B

    .prologue
    .line 858
    const/4 v0, 0x0

    .line 860
    .local v0, "encoded":[B
    const/4 v2, 0x0

    :try_start_2
    array-length v3, p0

    const/4 v4, 0x0

    invoke-static {p0, v2, v3, v4}, Lorg/springframework/util/support/Base64;->encodeBytesToBytes([BIII)[B
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_7} :catch_9

    move-result-object v0

    .line 864
    :cond_8
    return-object v0

    .line 861
    :catch_9
    move-exception v1

    .line 862
    .local v1, "ex":Ljava/io/IOException;
    sget-boolean v2, Lorg/springframework/util/support/Base64;->$assertionsDisabled:Z

    if-nez v2, :cond_8

    new-instance v2, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IOExceptions only come from GZipping, which is turned off: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method public static encodeBytesToBytes([BIII)[B
    .registers 27
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 888
    if-nez p0, :cond_a

    .line 889
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "Cannot serialize a null array."

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 892
    :cond_a
    if-gez p1, :cond_27

    .line 893
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cannot have negative offset: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, p1

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 896
    :cond_27
    if-gez p2, :cond_44

    .line 897
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cannot have length offset: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, p2

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 900
    :cond_44
    add-int v4, p1, p2

    move-object/from16 v0, p0

    array-length v5, v0

    if-le v4, v5, :cond_74

    .line 901
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Cannot have offset of %d and length of %d with array of length %d"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v6, v9

    const/4 v9, 0x1

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v6, v9

    const/4 v9, 0x2

    move-object/from16 v0, p0

    array-length v0, v0

    move/from16 v22, v0

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    aput-object v22, v6, v9

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 908
    :cond_74
    and-int/lit8 v4, p3, 0x2

    if-eqz v4, :cond_b8

    .line 909
    const/4 v12, 0x0

    .line 910
    .local v12, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v18, 0x0

    .line 911
    .local v18, "gzos":Ljava/util/zip/GZIPOutputStream;
    const/4 v10, 0x0

    .line 915
    .local v10, "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    :try_start_7c
    new-instance v13, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v13}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_81
    .catch Ljava/io/IOException; {:try_start_7c .. :try_end_81} :catch_ab
    .catchall {:try_start_7c .. :try_end_81} :catchall_ad

    .line 916
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .local v13, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_81
    new-instance v11, Lorg/springframework/util/support/Base64$OutputStream;

    or-int/lit8 v4, p3, 0x1

    invoke-direct {v11, v13, v4}, Lorg/springframework/util/support/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_88
    .catch Ljava/io/IOException; {:try_start_81 .. :try_end_88} :catch_14a
    .catchall {:try_start_81 .. :try_end_88} :catchall_13a

    .line 917
    .end local v10    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .local v11, "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    :try_start_88
    new-instance v19, Ljava/util/zip/GZIPOutputStream;

    move-object/from16 v0, v19

    invoke-direct {v0, v11}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_8f
    .catch Ljava/io/IOException; {:try_start_88 .. :try_end_8f} :catch_14e
    .catchall {:try_start_88 .. :try_end_8f} :catchall_13e

    .line 919
    .end local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .local v19, "gzos":Ljava/util/zip/GZIPOutputStream;
    :try_start_8f
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move/from16 v2, p1

    move/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/zip/GZIPOutputStream;->write([BII)V

    .line 920
    invoke-virtual/range {v19 .. v19}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_9d
    .catch Ljava/io/IOException; {:try_start_8f .. :try_end_9d} :catch_153
    .catchall {:try_start_8f .. :try_end_9d} :catchall_143

    .line 928
    :try_start_9d
    invoke-virtual/range {v19 .. v19}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_a0
    .catch Ljava/lang/Exception; {:try_start_9d .. :try_end_a0} :catch_128

    .line 929
    :goto_a0
    :try_start_a0
    invoke-virtual {v11}, Lorg/springframework/util/support/Base64$OutputStream;->close()V
    :try_end_a3
    .catch Ljava/lang/Exception; {:try_start_a0 .. :try_end_a3} :catch_12b

    .line 930
    :goto_a3
    :try_start_a3
    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_a6
    .catch Ljava/lang/Exception; {:try_start_a3 .. :try_end_a6} :catch_12e

    .line 933
    :goto_a6
    invoke-virtual {v13}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v17

    .line 988
    .end local v11    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :goto_aa
    return-object v17

    .line 922
    .restart local v10    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_ab
    move-exception v8

    .line 925
    .local v8, "e":Ljava/io/IOException;
    :goto_ac
    :try_start_ac
    throw v8
    :try_end_ad
    .catchall {:try_start_ac .. :try_end_ad} :catchall_ad

    .line 928
    .end local v8    # "e":Ljava/io/IOException;
    :catchall_ad
    move-exception v4

    :goto_ae
    :try_start_ae
    invoke-virtual/range {v18 .. v18}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_b1
    .catch Ljava/lang/Exception; {:try_start_ae .. :try_end_b1} :catch_131

    .line 929
    :goto_b1
    :try_start_b1
    invoke-virtual {v10}, Lorg/springframework/util/support/Base64$OutputStream;->close()V
    :try_end_b4
    .catch Ljava/lang/Exception; {:try_start_b1 .. :try_end_b4} :catch_134

    .line 930
    :goto_b4
    :try_start_b4
    invoke-virtual {v12}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_b7
    .catch Ljava/lang/Exception; {:try_start_b4 .. :try_end_b7} :catch_137

    :goto_b7
    throw v4

    .line 938
    .end local v10    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :cond_b8
    and-int/lit8 v4, p3, 0x8

    if-eqz v4, :cond_ff

    const/4 v14, 0x1

    .line 947
    .local v14, "breakLines":Z
    :goto_bd
    div-int/lit8 v4, p2, 0x3

    mul-int/lit8 v5, v4, 0x4

    rem-int/lit8 v4, p2, 0x3

    if-lez v4, :cond_101

    const/4 v4, 0x4

    :goto_c6
    add-int v16, v5, v4

    .line 948
    .local v16, "encLen":I
    if-eqz v14, :cond_ce

    .line 949
    div-int/lit8 v4, v16, 0x4c

    add-int v16, v16, v4

    .line 951
    :cond_ce
    move/from16 v0, v16

    new-array v7, v0, [B

    .line 954
    .local v7, "outBuff":[B
    const/4 v15, 0x0

    .line 955
    .local v15, "d":I
    const/4 v8, 0x0

    .line 956
    .local v8, "e":I
    add-int/lit8 v20, p2, -0x2

    .line 957
    .local v20, "len2":I
    const/16 v21, 0x0

    .line 958
    .local v21, "lineLength":I
    :goto_d8
    move/from16 v0, v20

    if-ge v15, v0, :cond_103

    .line 959
    add-int v5, v15, p1

    const/4 v6, 0x3

    move-object/from16 v4, p0

    move/from16 v9, p3

    invoke-static/range {v4 .. v9}, Lorg/springframework/util/support/Base64;->encode3to4([BII[BII)[B

    .line 961
    add-int/lit8 v21, v21, 0x4

    .line 962
    if-eqz v14, :cond_fa

    const/16 v4, 0x4c

    move/from16 v0, v21

    if-lt v0, v4, :cond_fa

    .line 964
    add-int/lit8 v4, v8, 0x4

    const/16 v5, 0xa

    aput-byte v5, v7, v4

    .line 965
    add-int/lit8 v8, v8, 0x1

    .line 966
    const/16 v21, 0x0

    .line 958
    :cond_fa
    add-int/lit8 v15, v15, 0x3

    add-int/lit8 v8, v8, 0x4

    goto :goto_d8

    .line 938
    .end local v7    # "outBuff":[B
    .end local v8    # "e":I
    .end local v14    # "breakLines":Z
    .end local v15    # "d":I
    .end local v16    # "encLen":I
    .end local v20    # "len2":I
    .end local v21    # "lineLength":I
    :cond_ff
    const/4 v14, 0x0

    goto :goto_bd

    .line 947
    .restart local v14    # "breakLines":Z
    :cond_101
    const/4 v4, 0x0

    goto :goto_c6

    .line 970
    .restart local v7    # "outBuff":[B
    .restart local v8    # "e":I
    .restart local v15    # "d":I
    .restart local v16    # "encLen":I
    .restart local v20    # "len2":I
    .restart local v21    # "lineLength":I
    :cond_103
    move/from16 v0, p2

    if-ge v15, v0, :cond_114

    .line 971
    add-int v5, v15, p1

    sub-int v6, p2, v15

    move-object/from16 v4, p0

    move/from16 v9, p3

    invoke-static/range {v4 .. v9}, Lorg/springframework/util/support/Base64;->encode3to4([BII[BII)[B

    .line 972
    add-int/lit8 v8, v8, 0x4

    .line 977
    :cond_114
    array-length v4, v7

    add-int/lit8 v4, v4, -0x1

    if-gt v8, v4, :cond_125

    .line 982
    new-array v0, v8, [B

    move-object/from16 v17, v0

    .line 983
    .local v17, "finalOut":[B
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v0, v17

    invoke-static {v7, v4, v0, v5, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_aa

    .end local v17    # "finalOut":[B
    :cond_125
    move-object/from16 v17, v7

    .line 988
    goto :goto_aa

    .line 928
    .end local v7    # "outBuff":[B
    .end local v8    # "e":I
    .end local v14    # "breakLines":Z
    .end local v15    # "d":I
    .end local v16    # "encLen":I
    .end local v20    # "len2":I
    .end local v21    # "lineLength":I
    .restart local v11    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_128
    move-exception v4

    goto/16 :goto_a0

    .line 929
    :catch_12b
    move-exception v4

    goto/16 :goto_a3

    .line 930
    :catch_12e
    move-exception v4

    goto/16 :goto_a6

    .line 928
    .end local v11    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v10    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_131
    move-exception v5

    goto/16 :goto_b1

    .line 929
    :catch_134
    move-exception v5

    goto/16 :goto_b4

    .line 930
    :catch_137
    move-exception v5

    goto/16 :goto_b7

    .line 928
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_13a
    move-exception v4

    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_ae

    .end local v10    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v11    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_13e
    move-exception v4

    move-object v10, v11

    .end local v11    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v10    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_ae

    .end local v10    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v11    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catchall_143
    move-exception v4

    move-object v10, v11

    .end local v11    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v10    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    move-object/from16 v18, v19

    .end local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_ae

    .line 922
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_14a
    move-exception v8

    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_ac

    .end local v10    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v11    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_14e
    move-exception v8

    move-object v10, v11

    .end local v11    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v10    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_ac

    .end local v10    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .end local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v11    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_153
    move-exception v8

    move-object v10, v11

    .end local v11    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v10    # "b64os":Lorg/springframework/util/support/Base64$OutputStream;
    move-object/from16 v18, v19

    .end local v19    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v18    # "gzos":Ljava/util/zip/GZIPOutputStream;
    move-object v12, v13

    .end local v13    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "baos":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_ac
.end method

.method public static encodeFileToFile(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p0, "infile"    # Ljava/lang/String;
    .param p1, "outfile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1584
    invoke-static {p0}, Lorg/springframework/util/support/Base64;->encodeFromFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1585
    .local v1, "encoded":Ljava/lang/String;
    const/4 v2, 0x0

    .line 1587
    .local v2, "out":Ljava/io/OutputStream;
    :try_start_5
    new-instance v3, Ljava/io/BufferedOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_f} :catch_1c
    .catchall {:try_start_5 .. :try_end_f} :catchall_1e

    .line 1589
    .end local v2    # "out":Ljava/io/OutputStream;
    .local v3, "out":Ljava/io/OutputStream;
    :try_start_f
    const-string v4, "US-ASCII"

    invoke-virtual {v1, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStream;->write([B)V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_18} :catch_2a
    .catchall {:try_start_f .. :try_end_18} :catchall_27

    .line 1595
    :try_start_18
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_1b} :catch_23

    .line 1598
    :goto_1b
    return-void

    .line 1591
    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    :catch_1c
    move-exception v0

    .line 1592
    .local v0, "e":Ljava/io/IOException;
    :goto_1d
    :try_start_1d
    throw v0
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_1e

    .line 1595
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_1e
    move-exception v4

    :goto_1f
    :try_start_1f
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_22} :catch_25

    .line 1596
    :goto_22
    throw v4

    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catch_23
    move-exception v4

    goto :goto_1b

    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    :catch_25
    move-exception v5

    goto :goto_22

    .line 1595
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catchall_27
    move-exception v4

    move-object v2, v3

    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_1f

    .line 1591
    .end local v2    # "out":Ljava/io/OutputStream;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :catch_2a
    move-exception v0

    move-object v2, v3

    .end local v3    # "out":Ljava/io/OutputStream;
    .restart local v2    # "out":Ljava/io/OutputStream;
    goto :goto_1d
.end method

.method public static encodeFromFile(Ljava/lang/String;)Ljava/lang/String;
    .registers 13
    .param p0, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1539
    const/4 v4, 0x0

    .line 1540
    .local v4, "encodedData":Ljava/lang/String;
    const/4 v0, 0x0

    .line 1544
    .local v0, "bis":Lorg/springframework/util/support/Base64$InputStream;
    :try_start_2
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1545
    .local v5, "file":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v8

    long-to-double v8, v8

    const-wide v10, 0x3ff6666666666666L    # 1.4

    mul-double/2addr v8, v10

    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    add-double/2addr v8, v10

    double-to-int v8, v8

    const/16 v9, 0x28

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    new-array v2, v8, [B

    .line 1546
    .local v2, "buffer":[B
    const/4 v6, 0x0

    .line 1547
    .local v6, "length":I
    const/4 v7, 0x0

    .line 1550
    .local v7, "numBytes":I
    new-instance v1, Lorg/springframework/util/support/Base64$InputStream;

    new-instance v8, Ljava/io/BufferedInputStream;

    new-instance v9, Ljava/io/FileInputStream;

    invoke-direct {v9, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v8, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v9, 0x1

    invoke-direct {v1, v8, v9}, Lorg/springframework/util/support/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_30
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_30} :catch_46
    .catchall {:try_start_2 .. :try_end_30} :catchall_48

    .line 1555
    .end local v0    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .local v1, "bis":Lorg/springframework/util/support/Base64$InputStream;
    :goto_30
    const/16 v8, 0x1000

    :try_start_32
    invoke-virtual {v1, v2, v6, v8}, Lorg/springframework/util/support/Base64$InputStream;->read([BII)I

    move-result v7

    if-ltz v7, :cond_3a

    .line 1556
    add-int/2addr v6, v7

    goto :goto_30

    .line 1560
    :cond_3a
    new-instance v4, Ljava/lang/String;

    .end local v4    # "encodedData":Ljava/lang/String;
    const/4 v8, 0x0

    const-string v9, "US-ASCII"

    invoke-direct {v4, v2, v8, v6, v9}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_42
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_42} :catch_54
    .catchall {:try_start_32 .. :try_end_42} :catchall_51

    .line 1567
    .restart local v4    # "encodedData":Ljava/lang/String;
    :try_start_42
    invoke-virtual {v1}, Lorg/springframework/util/support/Base64$InputStream;->close()V
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_45} :catch_4d

    .line 1570
    :goto_45
    return-object v4

    .line 1563
    .end local v1    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .end local v2    # "buffer":[B
    .end local v5    # "file":Ljava/io/File;
    .end local v6    # "length":I
    .end local v7    # "numBytes":I
    .restart local v0    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    :catch_46
    move-exception v3

    .line 1564
    .end local v4    # "encodedData":Ljava/lang/String;
    .local v3, "e":Ljava/io/IOException;
    :goto_47
    :try_start_47
    throw v3
    :try_end_48
    .catchall {:try_start_47 .. :try_end_48} :catchall_48

    .line 1567
    .end local v3    # "e":Ljava/io/IOException;
    :catchall_48
    move-exception v8

    :goto_49
    :try_start_49
    invoke-virtual {v0}, Lorg/springframework/util/support/Base64$InputStream;->close()V
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_4c} :catch_4f

    :goto_4c
    throw v8

    .end local v0    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .restart local v1    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .restart local v2    # "buffer":[B
    .restart local v4    # "encodedData":Ljava/lang/String;
    .restart local v5    # "file":Ljava/io/File;
    .restart local v6    # "length":I
    .restart local v7    # "numBytes":I
    :catch_4d
    move-exception v8

    goto :goto_45

    .end local v1    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .end local v2    # "buffer":[B
    .end local v4    # "encodedData":Ljava/lang/String;
    .end local v5    # "file":Ljava/io/File;
    .end local v6    # "length":I
    .end local v7    # "numBytes":I
    .restart local v0    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    :catch_4f
    move-exception v9

    goto :goto_4c

    .end local v0    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .restart local v1    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .restart local v2    # "buffer":[B
    .restart local v5    # "file":Ljava/io/File;
    .restart local v6    # "length":I
    .restart local v7    # "numBytes":I
    :catchall_51
    move-exception v8

    move-object v0, v1

    .end local v1    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .restart local v0    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    goto :goto_49

    .line 1563
    .end local v0    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .restart local v1    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    :catch_54
    move-exception v3

    move-object v0, v1

    .end local v1    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    .restart local v0    # "bis":Lorg/springframework/util/support/Base64$InputStream;
    goto :goto_47
.end method

.method public static encodeObject(Ljava/io/Serializable;)Ljava/lang/String;
    .registers 2
    .param p0, "serializableObject"    # Ljava/io/Serializable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 618
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/springframework/util/support/Base64;->encodeObject(Ljava/io/Serializable;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeObject(Ljava/io/Serializable;I)Ljava/lang/String;
    .registers 15
    .param p0, "serializableObject"    # Ljava/io/Serializable;
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 655
    if-nez p0, :cond_a

    .line 656
    new-instance v10, Ljava/lang/NullPointerException;

    const-string v11, "Cannot serialize a null object."

    invoke-direct {v10, v11}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 660
    :cond_a
    const/4 v2, 0x0

    .line 661
    .local v2, "baos":Ljava/io/ByteArrayOutputStream;
    const/4 v0, 0x0

    .line 662
    .local v0, "b64os":Ljava/io/OutputStream;
    const/4 v5, 0x0

    .line 663
    .local v5, "gzos":Ljava/util/zip/GZIPOutputStream;
    const/4 v7, 0x0

    .line 668
    .local v7, "oos":Ljava/io/ObjectOutputStream;
    :try_start_e
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_13} :catch_4c
    .catchall {:try_start_e .. :try_end_13} :catchall_4e

    .line 669
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .local v3, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_13
    new-instance v1, Lorg/springframework/util/support/Base64$OutputStream;

    or-int/lit8 v10, p1, 0x1

    invoke-direct {v1, v3, v10}, Lorg/springframework/util/support/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_1a} :catch_83
    .catchall {:try_start_13 .. :try_end_1a} :catchall_77

    .line 670
    .end local v0    # "b64os":Ljava/io/OutputStream;
    .local v1, "b64os":Ljava/io/OutputStream;
    and-int/lit8 v10, p1, 0x2

    if-eqz v10, :cond_45

    .line 672
    :try_start_1e
    new-instance v6, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v6, v1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_23} :catch_86
    .catchall {:try_start_1e .. :try_end_23} :catchall_7a

    .line 673
    .end local v5    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .local v6, "gzos":Ljava/util/zip/GZIPOutputStream;
    :try_start_23
    new-instance v8, Ljava/io/ObjectOutputStream;

    invoke-direct {v8, v6}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_28} :catch_8a
    .catchall {:try_start_23 .. :try_end_28} :catchall_7e

    .end local v7    # "oos":Ljava/io/ObjectOutputStream;
    .local v8, "oos":Ljava/io/ObjectOutputStream;
    move-object v7, v8

    .end local v8    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v7    # "oos":Ljava/io/ObjectOutputStream;
    move-object v5, v6

    .line 678
    .end local v6    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v5    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :goto_2a
    :try_start_2a
    invoke-virtual {v7, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_2d} :catch_86
    .catchall {:try_start_2a .. :try_end_2d} :catchall_7a

    .line 686
    :try_start_2d
    invoke-virtual {v7}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_30} :catch_67

    .line 687
    :goto_30
    :try_start_30
    invoke-virtual {v5}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_33} :catch_69

    .line 688
    :goto_33
    :try_start_33
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_36} :catch_6b

    .line 689
    :goto_36
    :try_start_36
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_39} :catch_6d

    .line 694
    :goto_39
    :try_start_39
    new-instance v10, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v11

    const-string v12, "US-ASCII"

    invoke-direct {v10, v11, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_44
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_39 .. :try_end_44} :catch_5c

    .line 698
    :goto_44
    return-object v10

    .line 676
    :cond_45
    :try_start_45
    new-instance v8, Ljava/io/ObjectOutputStream;

    invoke-direct {v8, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_4a} :catch_86
    .catchall {:try_start_45 .. :try_end_4a} :catchall_7a

    .end local v7    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v8    # "oos":Ljava/io/ObjectOutputStream;
    move-object v7, v8

    .end local v8    # "oos":Ljava/io/ObjectOutputStream;
    .restart local v7    # "oos":Ljava/io/ObjectOutputStream;
    goto :goto_2a

    .line 680
    .end local v1    # "b64os":Ljava/io/OutputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_4c
    move-exception v4

    .line 683
    .local v4, "e":Ljava/io/IOException;
    :goto_4d
    :try_start_4d
    throw v4
    :try_end_4e
    .catchall {:try_start_4d .. :try_end_4e} :catchall_4e

    .line 686
    .end local v4    # "e":Ljava/io/IOException;
    :catchall_4e
    move-exception v10

    :goto_4f
    :try_start_4f
    invoke-virtual {v7}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_52} :catch_6f

    .line 687
    :goto_52
    :try_start_52
    invoke-virtual {v5}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_55} :catch_71

    .line 688
    :goto_55
    :try_start_55
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_55 .. :try_end_58} :catch_73

    .line 689
    :goto_58
    :try_start_58
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_5b} :catch_75

    :goto_5b
    throw v10

    .line 696
    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_5c
    move-exception v9

    .line 698
    .local v9, "uue":Ljava/io/UnsupportedEncodingException;
    new-instance v10, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/String;-><init>([B)V

    goto :goto_44

    .line 686
    .end local v9    # "uue":Ljava/io/UnsupportedEncodingException;
    :catch_67
    move-exception v10

    goto :goto_30

    .line 687
    :catch_69
    move-exception v10

    goto :goto_33

    .line 688
    :catch_6b
    move-exception v10

    goto :goto_36

    .line 689
    :catch_6d
    move-exception v10

    goto :goto_39

    .line 686
    .end local v1    # "b64os":Ljava/io/OutputStream;
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_6f
    move-exception v11

    goto :goto_52

    .line 687
    :catch_71
    move-exception v11

    goto :goto_55

    .line 688
    :catch_73
    move-exception v11

    goto :goto_58

    .line 689
    :catch_75
    move-exception v11

    goto :goto_5b

    .line 686
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_77
    move-exception v10

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_4f

    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catchall_7a
    move-exception v10

    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_4f

    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v5    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v6    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catchall_7e
    move-exception v10

    move-object v5, v6

    .end local v6    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v5    # "gzos":Ljava/util/zip/GZIPOutputStream;
    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_4f

    .line 680
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_83
    move-exception v4

    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_4d

    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_86
    move-exception v4

    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_4d

    .end local v0    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v5    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v6    # "gzos":Ljava/util/zip/GZIPOutputStream;
    :catch_8a
    move-exception v4

    move-object v5, v6

    .end local v6    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v5    # "gzos":Ljava/util/zip/GZIPOutputStream;
    move-object v0, v1

    .end local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v0    # "b64os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "baos":Ljava/io/ByteArrayOutputStream;
    goto :goto_4d
.end method

.method public static encodeToFile([BLjava/lang/String;)V
    .registers 7
    .param p0, "dataToEncode"    # [B
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1407
    if-nez p0, :cond_a

    .line 1408
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "Data to encode was null."

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1411
    :cond_a
    const/4 v0, 0x0

    .line 1413
    .local v0, "bos":Lorg/springframework/util/support/Base64$OutputStream;
    :try_start_b
    new-instance v1, Lorg/springframework/util/support/Base64$OutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lorg/springframework/util/support/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_16} :catch_1d
    .catchall {:try_start_b .. :try_end_16} :catchall_1f

    .line 1415
    .end local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .local v1, "bos":Lorg/springframework/util/support/Base64$OutputStream;
    :try_start_16
    invoke-virtual {v1, p0}, Lorg/springframework/util/support/Base64$OutputStream;->write([B)V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_19} :catch_2b
    .catchall {:try_start_16 .. :try_end_19} :catchall_28

    .line 1421
    :try_start_19
    invoke-virtual {v1}, Lorg/springframework/util/support/Base64$OutputStream;->close()V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_1c} :catch_24

    .line 1424
    :goto_1c
    return-void

    .line 1417
    .end local v1    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    :catch_1d
    move-exception v2

    .line 1418
    .local v2, "e":Ljava/io/IOException;
    :goto_1e
    :try_start_1e
    throw v2
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_1f

    .line 1421
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_1f
    move-exception v3

    :goto_20
    :try_start_20
    invoke-virtual {v0}, Lorg/springframework/util/support/Base64$OutputStream;->close()V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_23} :catch_26

    :goto_23
    throw v3

    .end local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    :catch_24
    move-exception v3

    goto :goto_1c

    .end local v1    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    :catch_26
    move-exception v4

    goto :goto_23

    .end local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    :catchall_28
    move-exception v3

    move-object v0, v1

    .end local v1    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    goto :goto_20

    .line 1417
    .end local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v1    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    :catch_2b
    move-exception v2

    move-object v0, v1

    .end local v1    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    .restart local v0    # "bos":Lorg/springframework/util/support/Base64$OutputStream;
    goto :goto_1e
.end method

.method private static final getAlphabet(I)[B
    .registers 3
    .param p0, "options"    # I

    .prologue
    .line 413
    and-int/lit8 v0, p0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_9

    .line 414
    sget-object v0, Lorg/springframework/util/support/Base64;->_URL_SAFE_ALPHABET:[B

    .line 418
    :goto_8
    return-object v0

    .line 415
    :cond_9
    and-int/lit8 v0, p0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_12

    .line 416
    sget-object v0, Lorg/springframework/util/support/Base64;->_ORDERED_ALPHABET:[B

    goto :goto_8

    .line 418
    :cond_12
    sget-object v0, Lorg/springframework/util/support/Base64;->_STANDARD_ALPHABET:[B

    goto :goto_8
.end method

.method private static final getDecodabet(I)[B
    .registers 3
    .param p0, "options"    # I

    .prologue
    .line 431
    and-int/lit8 v0, p0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_9

    .line 432
    sget-object v0, Lorg/springframework/util/support/Base64;->_URL_SAFE_DECODABET:[B

    .line 436
    :goto_8
    return-object v0

    .line 433
    :cond_9
    and-int/lit8 v0, p0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_12

    .line 434
    sget-object v0, Lorg/springframework/util/support/Base64;->_ORDERED_DECODABET:[B

    goto :goto_8

    .line 436
    :cond_12
    sget-object v0, Lorg/springframework/util/support/Base64;->_STANDARD_DECODABET:[B

    goto :goto_8
.end method
