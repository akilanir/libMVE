.class abstract enum Lcom/github/zafarkhaja/semver/VersionParser$CharType;
.super Ljava/lang/Enum;
.source "VersionParser.java"

# interfaces
.implements Lcom/github/zafarkhaja/semver/util/Stream$ElementType;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/github/zafarkhaja/semver/VersionParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4408
    name = "CharType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/github/zafarkhaja/semver/VersionParser$CharType;",
        ">;",
        "Lcom/github/zafarkhaja/semver/util/Stream$ElementType",
        "<",
        "Ljava/lang/Character;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/github/zafarkhaja/semver/VersionParser$CharType;

.field public static final enum DIGIT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

.field public static final enum DOT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

.field public static final enum EOI:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

.field public static final enum HYPHEN:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

.field public static final enum ILLEGAL:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

.field public static final enum LETTER:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

.field public static final enum PLUS:Lcom/github/zafarkhaja/semver/VersionParser$CharType;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 46
    new-instance v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType$1;

    const-string v1, "DIGIT"

    invoke-direct {v0, v1, v3}, Lcom/github/zafarkhaja/semver/VersionParser$CharType$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DIGIT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .line 58
    new-instance v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType$2;

    const-string v1, "LETTER"

    invoke-direct {v0, v1, v4}, Lcom/github/zafarkhaja/semver/VersionParser$CharType$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->LETTER:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .line 71
    new-instance v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType$3;

    const-string v1, "DOT"

    invoke-direct {v0, v1, v5}, Lcom/github/zafarkhaja/semver/VersionParser$CharType$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DOT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .line 83
    new-instance v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType$4;

    const-string v1, "HYPHEN"

    invoke-direct {v0, v1, v6}, Lcom/github/zafarkhaja/semver/VersionParser$CharType$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->HYPHEN:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .line 95
    new-instance v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType$5;

    const-string v1, "PLUS"

    invoke-direct {v0, v1, v7}, Lcom/github/zafarkhaja/semver/VersionParser$CharType$5;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->PLUS:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .line 107
    new-instance v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType$6;

    const-string v1, "EOI"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/github/zafarkhaja/semver/VersionParser$CharType$6;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->EOI:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .line 116
    new-instance v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType$7;

    const-string v1, "ILLEGAL"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/github/zafarkhaja/semver/VersionParser$CharType$7;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->ILLEGAL:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    .line 44
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    sget-object v1, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DIGIT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->LETTER:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->DOT:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->HYPHEN:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->PLUS:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->EOI:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->ILLEGAL:Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->$VALUES:[Lcom/github/zafarkhaja/semver/VersionParser$CharType;

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
    .line 44
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILcom/github/zafarkhaja/semver/VersionParser$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/github/zafarkhaja/semver/VersionParser$1;

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Lcom/github/zafarkhaja/semver/VersionParser$CharType;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method static forCharacter(Ljava/lang/Character;)Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    .registers 6
    .param p0, "chr"    # Ljava/lang/Character;

    .prologue
    .line 139
    invoke-static {}, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->values()[Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_6
    if-ge v1, v3, :cond_14

    aget-object v0, v2, v1

    .line 140
    .local v0, "type":Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    invoke-virtual {v0, p0}, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 144
    .end local v0    # "type":Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    :goto_10
    return-object v0

    .line 139
    .restart local v0    # "type":Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    :cond_11
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 144
    .end local v0    # "type":Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    :cond_14
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 44
    const-class v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    return-object v0
.end method

.method public static values()[Lcom/github/zafarkhaja/semver/VersionParser$CharType;
    .registers 1

    .prologue
    .line 44
    sget-object v0, Lcom/github/zafarkhaja/semver/VersionParser$CharType;->$VALUES:[Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    invoke-virtual {v0}, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/github/zafarkhaja/semver/VersionParser$CharType;

    return-object v0
.end method
