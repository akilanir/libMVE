.class public Lorg/apache/commons/validator/routines/InetAddressValidator;
.super Ljava/lang/Object;
.source "InetAddressValidator.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final IPV4_REGEX:Ljava/lang/String; = "^(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})$"

.field private static final VALIDATOR:Lorg/apache/commons/validator/routines/InetAddressValidator;

.field private static final serialVersionUID:J = -0xcc1a905893109a5L


# instance fields
.field private final ipv4Validator:Lorg/apache/commons/validator/routines/RegexValidator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    new-instance v0, Lorg/apache/commons/validator/routines/InetAddressValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/InetAddressValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/InetAddressValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/InetAddressValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Lorg/apache/commons/validator/routines/RegexValidator;

    const-string v1, "^(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})$"

    invoke-direct {v0, v1}, Lorg/apache/commons/validator/routines/RegexValidator;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/commons/validator/routines/InetAddressValidator;->ipv4Validator:Lorg/apache/commons/validator/routines/RegexValidator;

    return-void
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/InetAddressValidator;
    .registers 1

    .prologue
    .line 54
    sget-object v0, Lorg/apache/commons/validator/routines/InetAddressValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/InetAddressValidator;

    return-object v0
.end method


# virtual methods
.method public isValid(Ljava/lang/String;)Z
    .registers 3
    .param p1, "inetAddress"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-virtual {p0, p1}, Lorg/apache/commons/validator/routines/InetAddressValidator;->isValidInet4Address(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isValidInet4Address(Ljava/lang/String;)Z
    .registers 9
    .param p1, "inet4Address"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 73
    iget-object v6, p0, Lorg/apache/commons/validator/routines/InetAddressValidator;->ipv4Validator:Lorg/apache/commons/validator/routines/RegexValidator;

    invoke-virtual {v6, p1}, Lorg/apache/commons/validator/routines/RegexValidator;->match(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 75
    .local v1, "groups":[Ljava/lang/String;
    if-nez v1, :cond_a

    .line 98
    :cond_9
    :goto_9
    return v5

    .line 78
    :cond_a
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    const/4 v6, 0x3

    if-gt v2, v6, :cond_26

    .line 79
    aget-object v4, v1, v2

    .line 80
    .local v4, "ipSegment":Ljava/lang/String;
    if-eqz v4, :cond_9

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_9

    .line 84
    const/4 v3, 0x0

    .line 87
    .local v3, "iIpSegment":I
    :try_start_19
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1c
    .catch Ljava/lang/NumberFormatException; {:try_start_19 .. :try_end_1c} :catch_24

    move-result v3

    .line 92
    const/16 v6, 0xff

    if-gt v3, v6, :cond_9

    .line 78
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 88
    :catch_24
    move-exception v0

    .line 89
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_9

    .line 98
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v3    # "iIpSegment":I
    .end local v4    # "ipSegment":Ljava/lang/String;
    :cond_26
    const/4 v5, 0x1

    goto :goto_9
.end method
