.class public Lch/qos/logback/core/pattern/SpacePadder;
.super Ljava/lang/Object;


# static fields
.field static final SPACES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, " "

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "  "

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "    "

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "        "

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "                "

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "                                "

    aput-object v2, v0, v1

    sput-object v0, Lch/qos/logback/core/pattern/SpacePadder;->SPACES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final leftPad(Ljava/lang/StringBuilder;Ljava/lang/String;I)V
    .registers 4

    const/4 v0, 0x0

    if-eqz p1, :cond_7

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    :cond_7
    if-ge v0, p2, :cond_e

    sub-int v0, p2, v0

    invoke-static {p0, v0}, Lch/qos/logback/core/pattern/SpacePadder;->spacePad(Ljava/lang/StringBuilder;I)V

    :cond_e
    if-eqz p1, :cond_13

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_13
    return-void
.end method

.method public static final rightPad(Ljava/lang/StringBuilder;Ljava/lang/String;I)V
    .registers 4

    const/4 v0, 0x0

    if-eqz p1, :cond_7

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    :cond_7
    if-eqz p1, :cond_c

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_c
    if-ge v0, p2, :cond_13

    sub-int v0, p2, v0

    invoke-static {p0, v0}, Lch/qos/logback/core/pattern/SpacePadder;->spacePad(Ljava/lang/StringBuilder;I)V

    :cond_13
    return-void
.end method

.method public static final spacePad(Ljava/lang/StringBuilder;I)V
    .registers 4

    :goto_0
    const/16 v0, 0x20

    if-lt p1, v0, :cond_f

    sget-object v0, Lch/qos/logback/core/pattern/SpacePadder;->SPACES:[Ljava/lang/String;

    const/4 v1, 0x5

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 p1, p1, -0x20

    goto :goto_0

    :cond_f
    const/4 v0, 0x4

    :goto_10
    if-ltz v0, :cond_21

    const/4 v1, 0x1

    shl-int/2addr v1, v0

    and-int/2addr v1, p1

    if-eqz v1, :cond_1e

    sget-object v1, Lch/qos/logback/core/pattern/SpacePadder;->SPACES:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1e
    add-int/lit8 v0, v0, -0x1

    goto :goto_10

    :cond_21
    return-void
.end method
