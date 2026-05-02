.class public final Lokhttp3/HttpUrl;
.super Ljava/lang/Object;
.source "HttpUrl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lokhttp3/HttpUrl$Builder;
    }
.end annotation


# static fields
.field static final FORM_ENCODE_SET:Ljava/lang/String; = " \"\':;<=>@[]^`{}|/\\?#&!$(),~"

.field static final FRAGMENT_ENCODE_SET:Ljava/lang/String; = ""

.field static final FRAGMENT_ENCODE_SET_URI:Ljava/lang/String; = " \"#<>\\^`{|}"

.field private static final HEX_DIGITS:[C

.field static final PASSWORD_ENCODE_SET:Ljava/lang/String; = " \"\':;<=>@[]^`{}|/\\?#"

.field static final PATH_SEGMENT_ENCODE_SET:Ljava/lang/String; = " \"<>^`{}|/\\?#"

.field static final PATH_SEGMENT_ENCODE_SET_URI:Ljava/lang/String; = "[]"

.field static final QUERY_COMPONENT_ENCODE_SET:Ljava/lang/String; = " \"\'<>#&="

.field static final QUERY_COMPONENT_ENCODE_SET_URI:Ljava/lang/String; = "\\^`{|}"

.field static final QUERY_ENCODE_SET:Ljava/lang/String; = " \"\'<>#"

.field static final USERNAME_ENCODE_SET:Ljava/lang/String; = " \"\':;<=>@[]^`{}|/\\?#"


# instance fields
.field private final fragment:Ljava/lang/String;

.field private final host:Ljava/lang/String;

.field private final password:Ljava/lang/String;

.field private final pathSegments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final port:I

.field private final queryNamesAndValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final scheme:Ljava/lang/String;

.field private final url:Ljava/lang/String;

.field private final username:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 279
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lokhttp3/HttpUrl;->HEX_DIGITS:[C

    return-void

    :array_a
    .array-data 2
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
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method private constructor <init>(Lokhttp3/HttpUrl$Builder;)V
    .registers 6
    .param p1, "builder"    # Lokhttp3/HttpUrl$Builder;

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 327
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 328
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    iput-object v0, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    .line 329
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    invoke-static {v0, v3}, Lokhttp3/HttpUrl;->percentDecode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/HttpUrl;->username:Ljava/lang/String;

    .line 330
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    invoke-static {v0, v3}, Lokhttp3/HttpUrl;->percentDecode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/HttpUrl;->password:Ljava/lang/String;

    .line 331
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    iput-object v0, p0, Lokhttp3/HttpUrl;->host:Ljava/lang/String;

    .line 332
    invoke-virtual {p1}, Lokhttp3/HttpUrl$Builder;->effectivePort()I

    move-result v0

    iput v0, p0, Lokhttp3/HttpUrl;->port:I

    .line 333
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-direct {p0, v0, v3}, Lokhttp3/HttpUrl;->percentDecode(Ljava/util/List;Z)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/HttpUrl;->pathSegments:Ljava/util/List;

    .line 334
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-eqz v0, :cond_4b

    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    const/4 v2, 0x1

    .line 335
    invoke-direct {p0, v0, v2}, Lokhttp3/HttpUrl;->percentDecode(Ljava/util/List;Z)Ljava/util/List;

    move-result-object v0

    :goto_36
    iput-object v0, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    .line 337
    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    if-eqz v0, :cond_42

    iget-object v0, p1, Lokhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    .line 338
    invoke-static {v0, v3}, Lokhttp3/HttpUrl;->percentDecode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    :cond_42
    iput-object v1, p0, Lokhttp3/HttpUrl;->fragment:Ljava/lang/String;

    .line 340
    invoke-virtual {p1}, Lokhttp3/HttpUrl$Builder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    .line 341
    return-void

    :cond_4b
    move-object v0, v1

    .line 335
    goto :goto_36
.end method

.method synthetic constructor <init>(Lokhttp3/HttpUrl$Builder;Lokhttp3/HttpUrl$1;)V
    .registers 3
    .param p1, "x0"    # Lokhttp3/HttpUrl$Builder;
    .param p2, "x1"    # Lokhttp3/HttpUrl$1;

    .prologue
    .line 278
    invoke-direct {p0, p1}, Lokhttp3/HttpUrl;-><init>(Lokhttp3/HttpUrl$Builder;)V

    return-void
.end method

.method static synthetic access$100(Lokhttp3/HttpUrl;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lokhttp3/HttpUrl;

    .prologue
    .line 278
    iget-object v0, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lokhttp3/HttpUrl;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lokhttp3/HttpUrl;

    .prologue
    .line 278
    iget-object v0, p0, Lokhttp3/HttpUrl;->host:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lokhttp3/HttpUrl;)I
    .registers 2
    .param p0, "x0"    # Lokhttp3/HttpUrl;

    .prologue
    .line 278
    iget v0, p0, Lokhttp3/HttpUrl;->port:I

    return v0
.end method

.method static canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;
    .registers 18
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "limit"    # I
    .param p3, "encodeSet"    # Ljava/lang/String;
    .param p4, "alreadyEncoded"    # Z
    .param p5, "strict"    # Z
    .param p6, "plusIsSpace"    # Z
    .param p7, "asciiOnly"    # Z

    .prologue
    .line 1553
    move v2, p1

    .local v2, "i":I
    :goto_1
    if-ge v2, p2, :cond_4f

    .line 1554
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v9

    .line 1555
    .local v9, "codePoint":I
    const/16 v1, 0x20

    if-lt v9, v1, :cond_30

    const/16 v1, 0x7f

    if-eq v9, v1, :cond_30

    const/16 v1, 0x80

    if-lt v9, v1, :cond_15

    if-nez p7, :cond_30

    .line 1558
    :cond_15
    invoke-virtual {p3, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v3, -0x1

    if-ne v1, v3, :cond_30

    const/16 v1, 0x25

    if-ne v9, v1, :cond_2a

    if-eqz p4, :cond_30

    if-eqz p5, :cond_2a

    .line 1559
    invoke-static {p0, v2, p2}, Lokhttp3/HttpUrl;->percentEncoded(Ljava/lang/String;II)Z

    move-result v1

    if-eqz v1, :cond_30

    :cond_2a
    const/16 v1, 0x2b

    if-ne v9, v1, :cond_49

    if-eqz p6, :cond_49

    .line 1562
    :cond_30
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 1563
    .local v0, "out":Lokio/Buffer;
    invoke-virtual {v0, p0, p1, v2}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    move-object v1, p0

    move v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    .line 1564
    invoke-static/range {v0 .. v8}, Lokhttp3/HttpUrl;->canonicalize(Lokio/Buffer;Ljava/lang/String;IILjava/lang/String;ZZZZ)V

    .line 1566
    invoke-virtual {v0}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v1

    .line 1571
    .end local v0    # "out":Lokio/Buffer;
    .end local v9    # "codePoint":I
    :goto_48
    return-object v1

    .line 1553
    .restart local v9    # "codePoint":I
    :cond_49
    invoke-static {v9}, Ljava/lang/Character;->charCount(I)I

    move-result v1

    add-int/2addr v2, v1

    goto :goto_1

    .line 1571
    .end local v9    # "codePoint":I
    :cond_4f
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_48
.end method

.method static canonicalize(Ljava/lang/String;Ljava/lang/String;ZZZZ)Ljava/lang/String;
    .registers 14
    .param p0, "input"    # Ljava/lang/String;
    .param p1, "encodeSet"    # Ljava/lang/String;
    .param p2, "alreadyEncoded"    # Z
    .param p3, "strict"    # Z
    .param p4, "plusIsSpace"    # Z
    .param p5, "asciiOnly"    # Z

    .prologue
    .line 1611
    const/4 v1, 0x0

    .line 1612
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    .line 1611
    invoke-static/range {v0 .. v7}, Lokhttp3/HttpUrl;->canonicalize(Ljava/lang/String;IILjava/lang/String;ZZZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static canonicalize(Lokio/Buffer;Ljava/lang/String;IILjava/lang/String;ZZZZ)V
    .registers 16
    .param p0, "out"    # Lokio/Buffer;
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "pos"    # I
    .param p3, "limit"    # I
    .param p4, "encodeSet"    # Ljava/lang/String;
    .param p5, "alreadyEncoded"    # Z
    .param p6, "strict"    # Z
    .param p7, "plusIsSpace"    # Z
    .param p8, "asciiOnly"    # Z

    .prologue
    const/16 v6, 0x25

    .line 1576
    const/4 v3, 0x0

    .line 1578
    .local v3, "utf8Buffer":Lokio/Buffer;
    move v2, p2

    .local v2, "i":I
    :goto_4
    if-ge v2, p3, :cond_86

    .line 1579
    invoke-virtual {p1, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v1

    .line 1580
    .local v1, "codePoint":I
    if-eqz p5, :cond_22

    const/16 v4, 0x9

    if-eq v1, v4, :cond_1c

    const/16 v4, 0xa

    if-eq v1, v4, :cond_1c

    const/16 v4, 0xc

    if-eq v1, v4, :cond_1c

    const/16 v4, 0xd

    if-ne v1, v4, :cond_22

    .line 1578
    :cond_1c
    :goto_1c
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v4

    add-int/2addr v2, v4

    goto :goto_4

    .line 1583
    :cond_22
    const/16 v4, 0x2b

    if-ne v1, v4, :cond_33

    if-eqz p7, :cond_33

    .line 1585
    if-eqz p5, :cond_30

    const-string v4, "+"

    :goto_2c
    invoke-virtual {p0, v4}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;)Lokio/Buffer;

    goto :goto_1c

    :cond_30
    const-string v4, "%2B"

    goto :goto_2c

    .line 1586
    :cond_33
    const/16 v4, 0x20

    if-lt v1, v4, :cond_54

    const/16 v4, 0x7f

    if-eq v1, v4, :cond_54

    const/16 v4, 0x80

    if-lt v1, v4, :cond_41

    if-nez p8, :cond_54

    .line 1589
    :cond_41
    invoke-virtual {p4, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_54

    if-ne v1, v6, :cond_82

    if-eqz p5, :cond_54

    if-eqz p6, :cond_82

    .line 1590
    invoke-static {p1, v2, p3}, Lokhttp3/HttpUrl;->percentEncoded(Ljava/lang/String;II)Z

    move-result v4

    if-nez v4, :cond_82

    .line 1592
    :cond_54
    if-nez v3, :cond_5b

    .line 1593
    new-instance v3, Lokio/Buffer;

    .end local v3    # "utf8Buffer":Lokio/Buffer;
    invoke-direct {v3}, Lokio/Buffer;-><init>()V

    .line 1595
    .restart local v3    # "utf8Buffer":Lokio/Buffer;
    :cond_5b
    invoke-virtual {v3, v1}, Lokio/Buffer;->writeUtf8CodePoint(I)Lokio/Buffer;

    .line 1596
    :goto_5e
    invoke-virtual {v3}, Lokio/Buffer;->exhausted()Z

    move-result v4

    if-nez v4, :cond_1c

    .line 1597
    invoke-virtual {v3}, Lokio/Buffer;->readByte()B

    move-result v4

    and-int/lit16 v0, v4, 0xff

    .line 1598
    .local v0, "b":I
    invoke-virtual {p0, v6}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1599
    sget-object v4, Lokhttp3/HttpUrl;->HEX_DIGITS:[C

    shr-int/lit8 v5, v0, 0x4

    and-int/lit8 v5, v5, 0xf

    aget-char v4, v4, v5

    invoke-virtual {p0, v4}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1600
    sget-object v4, Lokhttp3/HttpUrl;->HEX_DIGITS:[C

    and-int/lit8 v5, v0, 0xf

    aget-char v4, v4, v5

    invoke-virtual {p0, v4}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    goto :goto_5e

    .line 1604
    .end local v0    # "b":I
    :cond_82
    invoke-virtual {p0, v1}, Lokio/Buffer;->writeUtf8CodePoint(I)Lokio/Buffer;

    goto :goto_1c

    .line 1607
    .end local v1    # "codePoint":I
    :cond_86
    return-void
.end method

.method static decodeHexDigit(C)I
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 1528
    const/16 v0, 0x30

    if-lt p0, v0, :cond_b

    const/16 v0, 0x39

    if-gt p0, v0, :cond_b

    add-int/lit8 v0, p0, -0x30

    .line 1531
    :goto_a
    return v0

    .line 1529
    :cond_b
    const/16 v0, 0x61

    if-lt p0, v0, :cond_18

    const/16 v0, 0x66

    if-gt p0, v0, :cond_18

    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    goto :goto_a

    .line 1530
    :cond_18
    const/16 v0, 0x41

    if-lt p0, v0, :cond_25

    const/16 v0, 0x46

    if-gt p0, v0, :cond_25

    add-int/lit8 v0, p0, -0x41

    add-int/lit8 v0, v0, 0xa

    goto :goto_a

    .line 1531
    :cond_25
    const/4 v0, -0x1

    goto :goto_a
.end method

.method public static defaultPort(Ljava/lang/String;)I
    .registers 2
    .param p0, "scheme"    # Ljava/lang/String;

    .prologue
    .line 443
    const-string v0, "http"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 444
    const/16 v0, 0x50

    .line 448
    :goto_a
    return v0

    .line 445
    :cond_b
    const-string v0, "https"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 446
    const/16 v0, 0x1bb

    goto :goto_a

    .line 448
    :cond_16
    const/4 v0, -0x1

    goto :goto_a
.end method

.method public static get(Ljava/net/URI;)Lokhttp3/HttpUrl;
    .registers 2
    .param p0, "uri"    # Ljava/net/URI;

    .prologue
    .line 679
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    return-object v0
.end method

.method public static get(Ljava/net/URL;)Lokhttp3/HttpUrl;
    .registers 2
    .param p0, "url"    # Ljava/net/URL;

    .prologue
    .line 652
    invoke-virtual {p0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lokhttp3/HttpUrl;->parse(Ljava/lang/String;)Lokhttp3/HttpUrl;

    move-result-object v0

    return-object v0
.end method

.method static getChecked(Ljava/lang/String;)Lokhttp3/HttpUrl;
    .registers 6
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 663
    new-instance v0, Lokhttp3/HttpUrl$Builder;

    invoke-direct {v0}, Lokhttp3/HttpUrl$Builder;-><init>()V

    .line 664
    .local v0, "builder":Lokhttp3/HttpUrl$Builder;
    const/4 v2, 0x0

    invoke-virtual {v0, v2, p0}, Lokhttp3/HttpUrl$Builder;->parse(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder$ParseResult;

    move-result-object v1

    .line 665
    .local v1, "result":Lokhttp3/HttpUrl$Builder$ParseResult;
    sget-object v2, Lokhttp3/HttpUrl$1;->$SwitchMap$okhttp3$HttpUrl$Builder$ParseResult:[I

    invoke-virtual {v1}, Lokhttp3/HttpUrl$Builder$ParseResult;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_56

    .line 674
    new-instance v2, Ljava/net/MalformedURLException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid URL: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 667
    :pswitch_38
    invoke-virtual {v0}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v2

    return-object v2

    .line 669
    :pswitch_3d
    new-instance v2, Ljava/net/UnknownHostException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid host: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 665
    :pswitch_data_56
    .packed-switch 0x1
        :pswitch_38
        :pswitch_3d
    .end packed-switch
.end method

.method static namesAndValuesToQueryString(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .registers 7
    .param p0, "out"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 503
    .local p1, "namesAndValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    .local v2, "size":I
    :goto_5
    if-ge v0, v2, :cond_2c

    .line 504
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 505
    .local v1, "name":Ljava/lang/String;
    add-int/lit8 v4, v0, 0x1

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 506
    .local v3, "value":Ljava/lang/String;
    if-lez v0, :cond_1c

    const/16 v4, 0x26

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 507
    :cond_1c
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 508
    if-eqz v3, :cond_29

    .line 509
    const/16 v4, 0x3d

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 510
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 503
    :cond_29
    add-int/lit8 v0, v0, 0x2

    goto :goto_5

    .line 513
    .end local v1    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_2c
    return-void
.end method

.method public static parse(Ljava/lang/String;)Lokhttp3/HttpUrl;
    .registers 5
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 642
    new-instance v0, Lokhttp3/HttpUrl$Builder;

    invoke-direct {v0}, Lokhttp3/HttpUrl$Builder;-><init>()V

    .line 643
    .local v0, "builder":Lokhttp3/HttpUrl$Builder;
    invoke-virtual {v0, v2, p0}, Lokhttp3/HttpUrl$Builder;->parse(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder$ParseResult;

    move-result-object v1

    .line 644
    .local v1, "result":Lokhttp3/HttpUrl$Builder$ParseResult;
    sget-object v3, Lokhttp3/HttpUrl$Builder$ParseResult;->SUCCESS:Lokhttp3/HttpUrl$Builder$ParseResult;

    if-ne v1, v3, :cond_12

    invoke-virtual {v0}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v2

    :cond_12
    return-object v2
.end method

.method static pathSegmentsToString(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .registers 5
    .param p0, "out"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 467
    .local p1, "pathSegments":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "size":I
    :goto_5
    if-ge v0, v1, :cond_18

    .line 468
    const/16 v2, 0x2f

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 469
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 467
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 471
    :cond_18
    return-void
.end method

.method static percentDecode(Ljava/lang/String;IIZ)Ljava/lang/String;
    .registers 8
    .param p0, "encoded"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "limit"    # I
    .param p3, "plusIsSpace"    # Z

    .prologue
    .line 1485
    move v1, p1

    .local v1, "i":I
    :goto_1
    if-ge v1, p2, :cond_24

    .line 1486
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1487
    .local v0, "c":C
    const/16 v3, 0x25

    if-eq v0, v3, :cond_11

    const/16 v3, 0x2b

    if-ne v0, v3, :cond_21

    if-eqz p3, :cond_21

    .line 1489
    :cond_11
    new-instance v2, Lokio/Buffer;

    invoke-direct {v2}, Lokio/Buffer;-><init>()V

    .line 1490
    .local v2, "out":Lokio/Buffer;
    invoke-virtual {v2, p0, p1, v1}, Lokio/Buffer;->writeUtf8(Ljava/lang/String;II)Lokio/Buffer;

    .line 1491
    invoke-static {v2, p0, v1, p2, p3}, Lokhttp3/HttpUrl;->percentDecode(Lokio/Buffer;Ljava/lang/String;IIZ)V

    .line 1492
    invoke-virtual {v2}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object v3

    .line 1497
    .end local v0    # "c":C
    .end local v2    # "out":Lokio/Buffer;
    :goto_20
    return-object v3

    .line 1485
    .restart local v0    # "c":C
    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1497
    .end local v0    # "c":C
    :cond_24
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_20
.end method

.method static percentDecode(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 4
    .param p0, "encoded"    # Ljava/lang/String;
    .param p1, "plusIsSpace"    # Z

    .prologue
    .line 1473
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {p0, v0, v1, p1}, Lokhttp3/HttpUrl;->percentDecode(Ljava/lang/String;IIZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private percentDecode(Ljava/util/List;Z)Ljava/util/List;
    .registers 7
    .param p2, "plusIsSpace"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;Z)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1477
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 1478
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1479
    .local v1, "s":Ljava/lang/String;
    if-eqz v1, :cond_23

    invoke-static {v1, p2}, Lokhttp3/HttpUrl;->percentDecode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    :goto_1f
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_23
    const/4 v2, 0x0

    goto :goto_1f

    .line 1481
    .end local v1    # "s":Ljava/lang/String;
    :cond_25
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    return-object v2
.end method

.method static percentDecode(Lokio/Buffer;Ljava/lang/String;IIZ)V
    .registers 11
    .param p0, "out"    # Lokio/Buffer;
    .param p1, "encoded"    # Ljava/lang/String;
    .param p2, "pos"    # I
    .param p3, "limit"    # I
    .param p4, "plusIsSpace"    # Z

    .prologue
    const/4 v5, -0x1

    .line 1502
    move v3, p2

    .local v3, "i":I
    :goto_2
    if-ge v3, p3, :cond_46

    .line 1503
    invoke-virtual {p1, v3}, Ljava/lang/String;->codePointAt(I)I

    move-result v0

    .line 1504
    .local v0, "codePoint":I
    const/16 v4, 0x25

    if-ne v0, v4, :cond_36

    add-int/lit8 v4, v3, 0x2

    if-ge v4, p3, :cond_36

    .line 1505
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lokhttp3/HttpUrl;->decodeHexDigit(C)I

    move-result v1

    .line 1506
    .local v1, "d1":I
    add-int/lit8 v4, v3, 0x2

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lokhttp3/HttpUrl;->decodeHexDigit(C)I

    move-result v2

    .line 1507
    .local v2, "d2":I
    if-eq v1, v5, :cond_42

    if-eq v2, v5, :cond_42

    .line 1508
    shl-int/lit8 v4, v1, 0x4

    add-int/2addr v4, v2

    invoke-virtual {p0, v4}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 1509
    add-int/lit8 v3, v3, 0x2

    .line 1502
    .end local v1    # "d1":I
    .end local v2    # "d2":I
    :goto_30
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v4

    add-int/2addr v3, v4

    goto :goto_2

    .line 1512
    :cond_36
    const/16 v4, 0x2b

    if-ne v0, v4, :cond_42

    if-eqz p4, :cond_42

    .line 1513
    const/16 v4, 0x20

    invoke-virtual {p0, v4}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    goto :goto_30

    .line 1516
    :cond_42
    invoke-virtual {p0, v0}, Lokio/Buffer;->writeUtf8CodePoint(I)Lokio/Buffer;

    goto :goto_30

    .line 1518
    .end local v0    # "codePoint":I
    :cond_46
    return-void
.end method

.method static percentEncoded(Ljava/lang/String;II)Z
    .registers 6
    .param p0, "encoded"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "limit"    # I

    .prologue
    const/4 v2, -0x1

    .line 1521
    add-int/lit8 v0, p1, 0x2

    if-ge v0, p2, :cond_27

    .line 1522
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x25

    if-ne v0, v1, :cond_27

    add-int/lit8 v0, p1, 0x1

    .line 1523
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lokhttp3/HttpUrl;->decodeHexDigit(C)I

    move-result v0

    if-eq v0, v2, :cond_27

    add-int/lit8 v0, p1, 0x2

    .line 1524
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lokhttp3/HttpUrl;->decodeHexDigit(C)I

    move-result v0

    if-eq v0, v2, :cond_27

    const/4 v0, 0x1

    :goto_26
    return v0

    :cond_27
    const/4 v0, 0x0

    goto :goto_26
.end method

.method static queryStringToNamesAndValues(Ljava/lang/String;)Ljava/util/List;
    .registers 7
    .param p0, "encodedQuery"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v5, -0x1

    .line 522
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 523
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "pos":I
    :goto_7
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-gt v2, v4, :cond_42

    .line 524
    const/16 v4, 0x26

    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 525
    .local v0, "ampersandOffset":I
    if-ne v0, v5, :cond_19

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 527
    :cond_19
    const/16 v4, 0x3d

    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 528
    .local v1, "equalsOffset":I
    if-eq v1, v5, :cond_23

    if-le v1, v0, :cond_31

    .line 529
    :cond_23
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 530
    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 535
    :goto_2e
    add-int/lit8 v2, v0, 0x1

    .line 536
    goto :goto_7

    .line 532
    :cond_31
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 533
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2e

    .line 537
    .end local v0    # "ampersandOffset":I
    .end local v1    # "equalsOffset":I
    :cond_42
    return-object v3
.end method


# virtual methods
.method public encodedFragment()Ljava/lang/String;
    .registers 4

    .prologue
    .line 594
    iget-object v1, p0, Lokhttp3/HttpUrl;->fragment:Ljava/lang/String;

    if-nez v1, :cond_6

    const/4 v1, 0x0

    .line 596
    :goto_5
    return-object v1

    .line 595
    :cond_6
    iget-object v1, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    const/16 v2, 0x23

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 596
    .local v0, "fragmentStart":I
    iget-object v1, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_5
.end method

.method public encodedPassword()Ljava/lang/String;
    .registers 6

    .prologue
    .line 403
    iget-object v2, p0, Lokhttp3/HttpUrl;->password:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_b

    const-string v2, ""

    .line 406
    :goto_a
    return-object v2

    .line 404
    :cond_b
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    const/16 v3, 0x3a

    iget-object v4, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x3

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    add-int/lit8 v1, v2, 0x1

    .line 405
    .local v1, "passwordStart":I
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    const/16 v3, 0x40

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 406
    .local v0, "passwordEnd":I
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_a
.end method

.method public encodedPath()Ljava/lang/String;
    .registers 6

    .prologue
    .line 461
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    const/16 v3, 0x2f

    iget-object v4, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x3

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 462
    .local v1, "pathStart":I
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    iget-object v3, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const-string v4, "?#"

    invoke-static {v2, v1, v3, v4}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IILjava/lang/String;)I

    move-result v0

    .line 463
    .local v0, "pathEnd":I
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public encodedPathSegments()Ljava/util/List;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v8, 0x2f

    .line 474
    iget-object v5, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    iget-object v6, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x3

    invoke-virtual {v5, v8, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 475
    .local v2, "pathStart":I
    iget-object v5, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    iget-object v6, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    const-string v7, "?#"

    invoke-static {v5, v2, v6, v7}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IILjava/lang/String;)I

    move-result v1

    .line 476
    .local v1, "pathEnd":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 477
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move v0, v2

    .local v0, "i":I
    :goto_24
    if-ge v0, v1, :cond_39

    .line 478
    add-int/lit8 v0, v0, 0x1

    .line 479
    iget-object v5, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-static {v5, v0, v1, v8}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IIC)I

    move-result v4

    .line 480
    .local v4, "segmentEnd":I
    iget-object v5, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v5, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 481
    move v0, v4

    .line 482
    goto :goto_24

    .line 483
    .end local v4    # "segmentEnd":I
    :cond_39
    return-object v3
.end method

.method public encodedQuery()Ljava/lang/String;
    .registers 7

    .prologue
    .line 496
    iget-object v2, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    if-nez v2, :cond_6

    const/4 v2, 0x0

    .line 499
    :goto_5
    return-object v2

    .line 497
    :cond_6
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    const/16 v3, 0x3f

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    add-int/lit8 v1, v2, 0x1

    .line 498
    .local v1, "queryStart":I
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    add-int/lit8 v3, v1, 0x1

    iget-object v4, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x23

    invoke-static {v2, v3, v4, v5}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IIC)I

    move-result v0

    .line 499
    .local v0, "queryEnd":I
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_5
.end method

.method public encodedUsername()Ljava/lang/String;
    .registers 6

    .prologue
    .line 391
    iget-object v2, p0, Lokhttp3/HttpUrl;->username:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_b

    const-string v2, ""

    .line 394
    :goto_a
    return-object v2

    .line 392
    :cond_b
    iget-object v2, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v1, v2, 0x3

    .line 393
    .local v1, "usernameStart":I
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    iget-object v3, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const-string v4, ":@"

    invoke-static {v2, v1, v3, v4}, Lokhttp3/internal/Util;->delimiterOffset(Ljava/lang/String;IILjava/lang/String;)I

    move-result v0

    .line 394
    .local v0, "usernameEnd":I
    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_a
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 683
    instance-of v0, p1, Lokhttp3/HttpUrl;

    if-eqz v0, :cond_12

    check-cast p1, Lokhttp3/HttpUrl;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v0, p1, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    iget-object v1, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public fragment()Ljava/lang/String;
    .registers 2

    .prologue
    .line 600
    iget-object v0, p0, Lokhttp3/HttpUrl;->fragment:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 687
    iget-object v0, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public host()Ljava/lang/String;
    .registers 2

    .prologue
    .line 426
    iget-object v0, p0, Lokhttp3/HttpUrl;->host:Ljava/lang/String;

    return-object v0
.end method

.method public isHttps()Z
    .registers 3

    .prologue
    .line 386
    iget-object v0, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    const-string v1, "https"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public newBuilder()Lokhttp3/HttpUrl$Builder;
    .registers 4

    .prologue
    .line 613
    new-instance v0, Lokhttp3/HttpUrl$Builder;

    invoke-direct {v0}, Lokhttp3/HttpUrl$Builder;-><init>()V

    .line 614
    .local v0, "result":Lokhttp3/HttpUrl$Builder;
    iget-object v1, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    .line 615
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedUsername()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    .line 616
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedPassword()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    .line 617
    iget-object v1, p0, Lokhttp3/HttpUrl;->host:Ljava/lang/String;

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    .line 619
    iget v1, p0, Lokhttp3/HttpUrl;->port:I

    iget-object v2, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    invoke-static {v2}, Lokhttp3/HttpUrl;->defaultPort(Ljava/lang/String;)I

    move-result v2

    if-eq v1, v2, :cond_43

    iget v1, p0, Lokhttp3/HttpUrl;->port:I

    :goto_25
    iput v1, v0, Lokhttp3/HttpUrl$Builder;->port:I

    .line 620
    iget-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 621
    iget-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedPathSegments()Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 622
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedQuery()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lokhttp3/HttpUrl$Builder;->encodedQuery(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    .line 623
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->encodedFragment()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lokhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    .line 624
    return-object v0

    .line 619
    :cond_43
    const/4 v1, -0x1

    goto :goto_25
.end method

.method public newBuilder(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;
    .registers 5
    .param p1, "link"    # Ljava/lang/String;

    .prologue
    .line 632
    new-instance v0, Lokhttp3/HttpUrl$Builder;

    invoke-direct {v0}, Lokhttp3/HttpUrl$Builder;-><init>()V

    .line 633
    .local v0, "builder":Lokhttp3/HttpUrl$Builder;
    invoke-virtual {v0, p0, p1}, Lokhttp3/HttpUrl$Builder;->parse(Lokhttp3/HttpUrl;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder$ParseResult;

    move-result-object v1

    .line 634
    .local v1, "result":Lokhttp3/HttpUrl$Builder$ParseResult;
    sget-object v2, Lokhttp3/HttpUrl$Builder$ParseResult;->SUCCESS:Lokhttp3/HttpUrl$Builder$ParseResult;

    if-ne v1, v2, :cond_e

    .end local v0    # "builder":Lokhttp3/HttpUrl$Builder;
    :goto_d
    return-object v0

    .restart local v0    # "builder":Lokhttp3/HttpUrl$Builder;
    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public password()Ljava/lang/String;
    .registers 2

    .prologue
    .line 411
    iget-object v0, p0, Lokhttp3/HttpUrl;->password:Ljava/lang/String;

    return-object v0
.end method

.method public pathSegments()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 487
    iget-object v0, p0, Lokhttp3/HttpUrl;->pathSegments:Ljava/util/List;

    return-object v0
.end method

.method public pathSize()I
    .registers 2

    .prologue
    .line 453
    iget-object v0, p0, Lokhttp3/HttpUrl;->pathSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public port()I
    .registers 2

    .prologue
    .line 435
    iget v0, p0, Lokhttp3/HttpUrl;->port:I

    return v0
.end method

.method public query()Ljava/lang/String;
    .registers 3

    .prologue
    .line 541
    iget-object v1, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    if-nez v1, :cond_6

    const/4 v1, 0x0

    .line 544
    :goto_5
    return-object v1

    .line 542
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 543
    .local v0, "result":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    invoke-static {v0, v1}, Lokhttp3/HttpUrl;->namesAndValuesToQueryString(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 544
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_5
.end method

.method public queryParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 556
    iget-object v3, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    if-nez v3, :cond_6

    .line 562
    :cond_5
    :goto_5
    return-object v2

    .line 557
    :cond_6
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v3, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    .local v1, "size":I
    :goto_d
    if-ge v0, v1, :cond_5

    .line 558
    iget-object v3, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_26

    .line 559
    iget-object v2, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    add-int/lit8 v3, v0, 0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    goto :goto_5

    .line 557
    :cond_26
    add-int/lit8 v0, v0, 0x2

    goto :goto_d
.end method

.method public queryParameterName(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 586
    iget-object v0, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    mul-int/lit8 v1, p1, 0x2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public queryParameterNames()Ljava/util/Set;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 566
    iget-object v3, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    if-nez v3, :cond_9

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v3

    .line 571
    :goto_8
    return-object v3

    .line 567
    :cond_9
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 568
    .local v1, "result":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v3, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .local v2, "size":I
    :goto_15
    if-ge v0, v2, :cond_23

    .line 569
    iget-object v3, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 568
    add-int/lit8 v0, v0, 0x2

    goto :goto_15

    .line 571
    :cond_23
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v3

    goto :goto_8
.end method

.method public queryParameterValue(I)Ljava/lang/String;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 590
    iget-object v0, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    mul-int/lit8 v1, p1, 0x2

    add-int/lit8 v1, v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public queryParameterValues(Ljava/lang/String;)Ljava/util/List;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 575
    iget-object v3, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    if-nez v3, :cond_9

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    .line 582
    :goto_8
    return-object v3

    .line 576
    :cond_9
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 577
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v3, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .local v2, "size":I
    :goto_15
    if-ge v0, v2, :cond_31

    .line 578
    iget-object v3, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 579
    iget-object v3, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    add-int/lit8 v4, v0, 0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 577
    :cond_2e
    add-int/lit8 v0, v0, 0x2

    goto :goto_15

    .line 582
    :cond_31
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    goto :goto_8
.end method

.method public querySize()I
    .registers 2

    .prologue
    .line 548
    iget-object v0, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lokhttp3/HttpUrl;->queryNamesAndValues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public resolve(Ljava/lang/String;)Lokhttp3/HttpUrl;
    .registers 4
    .param p1, "link"    # Ljava/lang/String;

    .prologue
    .line 608
    invoke-virtual {p0, p1}, Lokhttp3/HttpUrl;->newBuilder(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v0

    .line 609
    .local v0, "builder":Lokhttp3/HttpUrl$Builder;
    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v1

    :goto_a
    return-object v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public scheme()Ljava/lang/String;
    .registers 2

    .prologue
    .line 382
    iget-object v0, p0, Lokhttp3/HttpUrl;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 691
    iget-object v0, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    return-object v0
.end method

.method public uri()Ljava/net/URI;
    .registers 7

    .prologue
    .line 366
    invoke-virtual {p0}, Lokhttp3/HttpUrl;->newBuilder()Lokhttp3/HttpUrl$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/HttpUrl$Builder;->reencodeForUri()Lokhttp3/HttpUrl$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/HttpUrl$Builder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 368
    .local v3, "uri":Ljava/lang/String;
    :try_start_c
    new-instance v4, Ljava/net/URI;

    invoke-direct {v4, v3}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_11
    .catch Ljava/net/URISyntaxException; {:try_start_c .. :try_end_11} :catch_12

    .line 373
    :goto_11
    return-object v4

    .line 369
    :catch_12
    move-exception v0

    .line 372
    .local v0, "e":Ljava/net/URISyntaxException;
    :try_start_13
    const-string v4, "[\\u0000-\\u001F\\u007F-\\u009F\\p{javaWhitespace}]"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 373
    .local v2, "stripped":Ljava/lang/String;
    invoke-static {v2}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_1e} :catch_20

    move-result-object v4

    goto :goto_11

    .line 374
    .end local v2    # "stripped":Ljava/lang/String;
    :catch_20
    move-exception v1

    .line 375
    .local v1, "e1":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public url()Ljava/net/URL;
    .registers 4

    .prologue
    .line 346
    :try_start_0
    new-instance v1, Ljava/net/URL;

    iget-object v2, p0, Lokhttp3/HttpUrl;->url:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_7} :catch_8

    return-object v1

    .line 347
    :catch_8
    move-exception v0

    .line 348
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public username()Ljava/lang/String;
    .registers 2

    .prologue
    .line 398
    iget-object v0, p0, Lokhttp3/HttpUrl;->username:Ljava/lang/String;

    return-object v0
.end method
