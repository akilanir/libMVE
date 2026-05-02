.class abstract enum Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;
.super Ljava/lang/Enum;
.source "UriEscapeUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/unbescape/uri/UriEscapeUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4408
    name = "UriEscapeType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

.field public static final enum FRAGMENT_ID:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

.field public static final enum PATH:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

.field public static final enum PATH_SEGMENT:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

.field public static final enum QUERY_PARAM:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 70
    new-instance v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType$1;

    const-string v1, "PATH"

    invoke-direct {v0, v1, v2}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->PATH:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    .line 77
    new-instance v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType$2;

    const-string v1, "PATH_SEGMENT"

    invoke-direct {v0, v1, v3}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->PATH_SEGMENT:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    .line 84
    new-instance v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType$3;

    const-string v1, "QUERY_PARAM"

    invoke-direct {v0, v1, v4}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->QUERY_PARAM:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    .line 99
    new-instance v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType$4;

    const-string v1, "FRAGMENT_ID"

    invoke-direct {v0, v1, v5}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->FRAGMENT_ID:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    .line 68
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    sget-object v1, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->PATH:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    aput-object v1, v0, v2

    sget-object v1, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->PATH_SEGMENT:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->QUERY_PARAM:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    aput-object v1, v0, v4

    sget-object v1, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->FRAGMENT_ID:Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    aput-object v1, v0, v5

    sput-object v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->$VALUES:[Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 68
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILorg/unbescape/uri/UriEscapeUtil$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lorg/unbescape/uri/UriEscapeUtil$1;

    .prologue
    .line 68
    invoke-direct {p0, p1, p2}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$100(I)Z
    .registers 2
    .param p0, "x0"    # I

    .prologue
    .line 68
    invoke-static {p0}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->isPchar(I)Z

    move-result v0

    return v0
.end method

.method static isAlpha(I)Z
    .registers 2
    .param p0, "c"    # I

    .prologue
    .line 171
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

.method private static isDigit(I)Z
    .registers 2
    .param p0, "c"    # I

    .prologue
    .line 179
    const/16 v0, 0x30

    if-lt p0, v0, :cond_a

    const/16 v0, 0x39

    if-gt p0, v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private static isGenDelim(I)Z
    .registers 2
    .param p0, "c"    # I

    .prologue
    .line 163
    const/16 v0, 0x3a

    if-eq v0, p0, :cond_1c

    const/16 v0, 0x2f

    if-eq v0, p0, :cond_1c

    const/16 v0, 0x3f

    if-eq v0, p0, :cond_1c

    const/16 v0, 0x23

    if-eq v0, p0, :cond_1c

    const/16 v0, 0x5b

    if-eq v0, p0, :cond_1c

    const/16 v0, 0x5d

    if-eq v0, p0, :cond_1c

    const/16 v0, 0x40

    if-ne v0, p0, :cond_1e

    :cond_1c
    const/4 v0, 0x1

    :goto_1d
    return v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method private static isPchar(I)Z
    .registers 2
    .param p0, "c"    # I

    .prologue
    .line 130
    invoke-static {p0}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->isUnreserved(I)Z

    move-result v0

    if-nez v0, :cond_14

    invoke-static {p0}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->isSubDelim(I)Z

    move-result v0

    if-nez v0, :cond_14

    const/16 v0, 0x3a

    if-eq v0, p0, :cond_14

    const/16 v0, 0x40

    if-ne v0, p0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method private static isReserved(I)Z
    .registers 2
    .param p0, "c"    # I

    .prologue
    .line 146
    invoke-static {p0}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->isGenDelim(I)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-static {p0}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->isSubDelim(I)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private static isSubDelim(I)Z
    .registers 2
    .param p0, "c"    # I

    .prologue
    .line 154
    const/16 v0, 0x21

    if-eq v0, p0, :cond_2c

    const/16 v0, 0x24

    if-eq v0, p0, :cond_2c

    const/16 v0, 0x26

    if-eq v0, p0, :cond_2c

    const/16 v0, 0x27

    if-eq v0, p0, :cond_2c

    const/16 v0, 0x28

    if-eq v0, p0, :cond_2c

    const/16 v0, 0x29

    if-eq v0, p0, :cond_2c

    const/16 v0, 0x2a

    if-eq v0, p0, :cond_2c

    const/16 v0, 0x2b

    if-eq v0, p0, :cond_2c

    const/16 v0, 0x2c

    if-eq v0, p0, :cond_2c

    const/16 v0, 0x3b

    if-eq v0, p0, :cond_2c

    const/16 v0, 0x3d

    if-ne v0, p0, :cond_2e

    :cond_2c
    const/4 v0, 0x1

    :goto_2d
    return v0

    :cond_2e
    const/4 v0, 0x0

    goto :goto_2d
.end method

.method private static isUnreserved(I)Z
    .registers 2
    .param p0, "c"    # I

    .prologue
    .line 138
    invoke-static {p0}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->isAlpha(I)Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-static {p0}, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->isDigit(I)Z

    move-result v0

    if-nez v0, :cond_1c

    const/16 v0, 0x2d

    if-eq v0, p0, :cond_1c

    const/16 v0, 0x2e

    if-eq v0, p0, :cond_1c

    const/16 v0, 0x5f

    if-eq v0, p0, :cond_1c

    const/16 v0, 0x7e

    if-ne v0, p0, :cond_1e

    :cond_1c
    const/4 v0, 0x1

    :goto_1d
    return v0

    :cond_1e
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 68
    const-class v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    return-object v0
.end method

.method public static values()[Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;
    .registers 1

    .prologue
    .line 68
    sget-object v0, Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->$VALUES:[Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    invoke-virtual {v0}, [Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/unbescape/uri/UriEscapeUtil$UriEscapeType;

    return-object v0
.end method


# virtual methods
.method public canPlusEscapeWhitespace()Z
    .registers 2

    .prologue
    .line 122
    const/4 v0, 0x0

    return v0
.end method

.method public abstract isAllowed(I)Z
.end method
