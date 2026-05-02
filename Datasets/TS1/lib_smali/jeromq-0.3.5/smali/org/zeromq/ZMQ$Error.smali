.class public final enum Lorg/zeromq/ZMQ$Error;
.super Ljava/lang/Enum;
.source "ZMQ.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/zeromq/ZMQ;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Error"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/zeromq/ZMQ$Error;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/zeromq/ZMQ$Error;

.field public static final enum EADDRINUSE:Lorg/zeromq/ZMQ$Error;

.field public static final enum EADDRNOTAVAIL:Lorg/zeromq/ZMQ$Error;

.field public static final enum EAGAIN:Lorg/zeromq/ZMQ$Error;

.field public static final enum ECONNREFUSED:Lorg/zeromq/ZMQ$Error;

.field public static final enum EFSM:Lorg/zeromq/ZMQ$Error;

.field public static final enum EINPROGRESS:Lorg/zeromq/ZMQ$Error;

.field public static final enum EMTHREAD:Lorg/zeromq/ZMQ$Error;

.field public static final enum ENETDOWN:Lorg/zeromq/ZMQ$Error;

.field public static final enum ENOBUFS:Lorg/zeromq/ZMQ$Error;

.field public static final enum ENOCOMPATPROTO:Lorg/zeromq/ZMQ$Error;

.field public static final enum ENOTSOCK:Lorg/zeromq/ZMQ$Error;

.field public static final enum ENOTSUP:Lorg/zeromq/ZMQ$Error;

.field public static final enum EPROTONOSUPPORT:Lorg/zeromq/ZMQ$Error;

.field public static final enum ETERM:Lorg/zeromq/ZMQ$Error;


# instance fields
.field private final code:I


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1870
    new-instance v0, Lorg/zeromq/ZMQ$Error;

    const-string v1, "ENOTSUP"

    const/16 v2, 0x2d

    invoke-direct {v0, v1, v4, v2}, Lorg/zeromq/ZMQ$Error;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/zeromq/ZMQ$Error;->ENOTSUP:Lorg/zeromq/ZMQ$Error;

    .line 1871
    new-instance v0, Lorg/zeromq/ZMQ$Error;

    const-string v1, "EPROTONOSUPPORT"

    const/16 v2, 0x2b

    invoke-direct {v0, v1, v5, v2}, Lorg/zeromq/ZMQ$Error;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/zeromq/ZMQ$Error;->EPROTONOSUPPORT:Lorg/zeromq/ZMQ$Error;

    .line 1872
    new-instance v0, Lorg/zeromq/ZMQ$Error;

    const-string v1, "ENOBUFS"

    const/16 v2, 0x37

    invoke-direct {v0, v1, v6, v2}, Lorg/zeromq/ZMQ$Error;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/zeromq/ZMQ$Error;->ENOBUFS:Lorg/zeromq/ZMQ$Error;

    .line 1873
    new-instance v0, Lorg/zeromq/ZMQ$Error;

    const-string v1, "ENETDOWN"

    const/16 v2, 0x32

    invoke-direct {v0, v1, v7, v2}, Lorg/zeromq/ZMQ$Error;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/zeromq/ZMQ$Error;->ENETDOWN:Lorg/zeromq/ZMQ$Error;

    .line 1874
    new-instance v0, Lorg/zeromq/ZMQ$Error;

    const-string v1, "EADDRINUSE"

    const/16 v2, 0x30

    invoke-direct {v0, v1, v8, v2}, Lorg/zeromq/ZMQ$Error;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/zeromq/ZMQ$Error;->EADDRINUSE:Lorg/zeromq/ZMQ$Error;

    .line 1875
    new-instance v0, Lorg/zeromq/ZMQ$Error;

    const-string v1, "EADDRNOTAVAIL"

    const/4 v2, 0x5

    const/16 v3, 0x31

    invoke-direct {v0, v1, v2, v3}, Lorg/zeromq/ZMQ$Error;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/zeromq/ZMQ$Error;->EADDRNOTAVAIL:Lorg/zeromq/ZMQ$Error;

    .line 1876
    new-instance v0, Lorg/zeromq/ZMQ$Error;

    const-string v1, "ECONNREFUSED"

    const/4 v2, 0x6

    const/16 v3, 0x3d

    invoke-direct {v0, v1, v2, v3}, Lorg/zeromq/ZMQ$Error;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/zeromq/ZMQ$Error;->ECONNREFUSED:Lorg/zeromq/ZMQ$Error;

    .line 1877
    new-instance v0, Lorg/zeromq/ZMQ$Error;

    const-string v1, "EINPROGRESS"

    const/4 v2, 0x7

    const/16 v3, 0x24

    invoke-direct {v0, v1, v2, v3}, Lorg/zeromq/ZMQ$Error;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/zeromq/ZMQ$Error;->EINPROGRESS:Lorg/zeromq/ZMQ$Error;

    .line 1878
    new-instance v0, Lorg/zeromq/ZMQ$Error;

    const-string v1, "EMTHREAD"

    const/16 v2, 0x8

    const v3, 0x9523dfe

    invoke-direct {v0, v1, v2, v3}, Lorg/zeromq/ZMQ$Error;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/zeromq/ZMQ$Error;->EMTHREAD:Lorg/zeromq/ZMQ$Error;

    .line 1879
    new-instance v0, Lorg/zeromq/ZMQ$Error;

    const-string v1, "EFSM"

    const/16 v2, 0x9

    const v3, 0x9523dfb

    invoke-direct {v0, v1, v2, v3}, Lorg/zeromq/ZMQ$Error;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/zeromq/ZMQ$Error;->EFSM:Lorg/zeromq/ZMQ$Error;

    .line 1880
    new-instance v0, Lorg/zeromq/ZMQ$Error;

    const-string v1, "ENOCOMPATPROTO"

    const/16 v2, 0xa

    const v3, 0x9523dfc

    invoke-direct {v0, v1, v2, v3}, Lorg/zeromq/ZMQ$Error;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/zeromq/ZMQ$Error;->ENOCOMPATPROTO:Lorg/zeromq/ZMQ$Error;

    .line 1881
    new-instance v0, Lorg/zeromq/ZMQ$Error;

    const-string v1, "ETERM"

    const/16 v2, 0xb

    const v3, 0x9523dfd

    invoke-direct {v0, v1, v2, v3}, Lorg/zeromq/ZMQ$Error;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/zeromq/ZMQ$Error;->ETERM:Lorg/zeromq/ZMQ$Error;

    .line 1882
    new-instance v0, Lorg/zeromq/ZMQ$Error;

    const-string v1, "ENOTSOCK"

    const/16 v2, 0xc

    const v3, 0x9523dcd

    invoke-direct {v0, v1, v2, v3}, Lorg/zeromq/ZMQ$Error;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/zeromq/ZMQ$Error;->ENOTSOCK:Lorg/zeromq/ZMQ$Error;

    .line 1883
    new-instance v0, Lorg/zeromq/ZMQ$Error;

    const-string v1, "EAGAIN"

    const/16 v2, 0xd

    const/16 v3, 0x23

    invoke-direct {v0, v1, v2, v3}, Lorg/zeromq/ZMQ$Error;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/zeromq/ZMQ$Error;->EAGAIN:Lorg/zeromq/ZMQ$Error;

    .line 1868
    const/16 v0, 0xe

    new-array v0, v0, [Lorg/zeromq/ZMQ$Error;

    sget-object v1, Lorg/zeromq/ZMQ$Error;->ENOTSUP:Lorg/zeromq/ZMQ$Error;

    aput-object v1, v0, v4

    sget-object v1, Lorg/zeromq/ZMQ$Error;->EPROTONOSUPPORT:Lorg/zeromq/ZMQ$Error;

    aput-object v1, v0, v5

    sget-object v1, Lorg/zeromq/ZMQ$Error;->ENOBUFS:Lorg/zeromq/ZMQ$Error;

    aput-object v1, v0, v6

    sget-object v1, Lorg/zeromq/ZMQ$Error;->ENETDOWN:Lorg/zeromq/ZMQ$Error;

    aput-object v1, v0, v7

    sget-object v1, Lorg/zeromq/ZMQ$Error;->EADDRINUSE:Lorg/zeromq/ZMQ$Error;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lorg/zeromq/ZMQ$Error;->EADDRNOTAVAIL:Lorg/zeromq/ZMQ$Error;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/zeromq/ZMQ$Error;->ECONNREFUSED:Lorg/zeromq/ZMQ$Error;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/zeromq/ZMQ$Error;->EINPROGRESS:Lorg/zeromq/ZMQ$Error;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/zeromq/ZMQ$Error;->EMTHREAD:Lorg/zeromq/ZMQ$Error;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/zeromq/ZMQ$Error;->EFSM:Lorg/zeromq/ZMQ$Error;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lorg/zeromq/ZMQ$Error;->ENOCOMPATPROTO:Lorg/zeromq/ZMQ$Error;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lorg/zeromq/ZMQ$Error;->ETERM:Lorg/zeromq/ZMQ$Error;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lorg/zeromq/ZMQ$Error;->ENOTSOCK:Lorg/zeromq/ZMQ$Error;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lorg/zeromq/ZMQ$Error;->EAGAIN:Lorg/zeromq/ZMQ$Error;

    aput-object v2, v0, v1

    sput-object v0, Lorg/zeromq/ZMQ$Error;->$VALUES:[Lorg/zeromq/ZMQ$Error;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "code"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 1888
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 1889
    iput p3, p0, Lorg/zeromq/ZMQ$Error;->code:I

    .line 1890
    return-void
.end method

.method public static findByCode(I)Lorg/zeromq/ZMQ$Error;
    .registers 8
    .param p0, "code"    # I

    .prologue
    .line 1899
    const-class v4, Lorg/zeromq/ZMQ$Error;

    invoke-virtual {v4}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/zeromq/ZMQ$Error;

    .local v0, "arr$":[Lorg/zeromq/ZMQ$Error;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_a
    if-ge v2, v3, :cond_18

    aget-object v1, v0, v2

    .line 1900
    .local v1, "e":Lorg/zeromq/ZMQ$Error;
    invoke-virtual {v1}, Lorg/zeromq/ZMQ$Error;->getCode()I

    move-result v4

    if-ne v4, p0, :cond_15

    .line 1901
    return-object v1

    .line 1899
    :cond_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 1904
    .end local v1    # "e":Lorg/zeromq/ZMQ$Error;
    :cond_18
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-class v6, Lorg/zeromq/ZMQ$Error;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " enum code:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/zeromq/ZMQ$Error;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 1868
    const-class v0, Lorg/zeromq/ZMQ$Error;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/zeromq/ZMQ$Error;

    return-object v0
.end method

.method public static values()[Lorg/zeromq/ZMQ$Error;
    .registers 1

    .prologue
    .line 1868
    sget-object v0, Lorg/zeromq/ZMQ$Error;->$VALUES:[Lorg/zeromq/ZMQ$Error;

    invoke-virtual {v0}, [Lorg/zeromq/ZMQ$Error;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/zeromq/ZMQ$Error;

    return-object v0
.end method


# virtual methods
.method public getCode()I
    .registers 2

    .prologue
    .line 1894
    iget v0, p0, Lorg/zeromq/ZMQ$Error;->code:I

    return v0
.end method
