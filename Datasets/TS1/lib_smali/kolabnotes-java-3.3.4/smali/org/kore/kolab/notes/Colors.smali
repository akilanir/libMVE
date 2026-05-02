.class public final enum Lorg/kore/kolab/notes/Colors;
.super Ljava/lang/Enum;
.source "Colors.java"

# interfaces
.implements Lorg/kore/kolab/notes/Color;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/kore/kolab/notes/Colors;",
        ">;",
        "Lorg/kore/kolab/notes/Color;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/kore/kolab/notes/Colors;

.field public static final enum BLACK:Lorg/kore/kolab/notes/Colors;

.field public static final enum BLUE:Lorg/kore/kolab/notes/Colors;

.field public static final enum BROWN:Lorg/kore/kolab/notes/Colors;

.field public static final enum CYAN:Lorg/kore/kolab/notes/Colors;

.field public static final enum GOLD:Lorg/kore/kolab/notes/Colors;

.field public static final enum GRAY:Lorg/kore/kolab/notes/Colors;

.field public static final enum GREN:Lorg/kore/kolab/notes/Colors;

.field public static final enum LIME:Lorg/kore/kolab/notes/Colors;

.field public static final enum MAGENTA:Lorg/kore/kolab/notes/Colors;

.field public static final enum MAROON:Lorg/kore/kolab/notes/Colors;

.field public static final enum NAVY:Lorg/kore/kolab/notes/Colors;

.field public static final enum OLIVE:Lorg/kore/kolab/notes/Colors;

.field public static final enum ORANGE:Lorg/kore/kolab/notes/Colors;

.field public static final enum PURPLE:Lorg/kore/kolab/notes/Colors;

.field public static final enum RED:Lorg/kore/kolab/notes/Colors;

.field public static final enum SILVER:Lorg/kore/kolab/notes/Colors;

.field public static final enum TEAL:Lorg/kore/kolab/notes/Colors;

.field public static final enum WHITE:Lorg/kore/kolab/notes/Colors;

.field public static final enum YELLOW:Lorg/kore/kolab/notes/Colors;


# instance fields
.field private final colorCode:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 24
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "WHITE"

    const-string v2, "#FFFFFF"

    invoke-direct {v0, v1, v4, v2}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->WHITE:Lorg/kore/kolab/notes/Colors;

    .line 25
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "SILVER"

    const-string v2, "#C0C0C0"

    invoke-direct {v0, v1, v5, v2}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->SILVER:Lorg/kore/kolab/notes/Colors;

    .line 26
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "GRAY"

    const-string v2, "#808080"

    invoke-direct {v0, v1, v6, v2}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->GRAY:Lorg/kore/kolab/notes/Colors;

    .line 27
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "BLACK"

    const-string v2, "#000000"

    invoke-direct {v0, v1, v7, v2}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->BLACK:Lorg/kore/kolab/notes/Colors;

    .line 28
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "RED"

    const-string v2, "#FF0000"

    invoke-direct {v0, v1, v8, v2}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->RED:Lorg/kore/kolab/notes/Colors;

    .line 29
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "MAROON"

    const/4 v2, 0x5

    const-string v3, "#800000"

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->MAROON:Lorg/kore/kolab/notes/Colors;

    .line 30
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "YELLOW"

    const/4 v2, 0x6

    const-string v3, "#FFFF00"

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->YELLOW:Lorg/kore/kolab/notes/Colors;

    .line 31
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "OLIVE"

    const/4 v2, 0x7

    const-string v3, "#808000"

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->OLIVE:Lorg/kore/kolab/notes/Colors;

    .line 32
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "LIME"

    const/16 v2, 0x8

    const-string v3, "#00FF00"

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->LIME:Lorg/kore/kolab/notes/Colors;

    .line 33
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "GREN"

    const/16 v2, 0x9

    const-string v3, "#008000"

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->GREN:Lorg/kore/kolab/notes/Colors;

    .line 34
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "CYAN"

    const/16 v2, 0xa

    const-string v3, "#00FFFF"

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->CYAN:Lorg/kore/kolab/notes/Colors;

    .line 35
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "TEAL"

    const/16 v2, 0xb

    const-string v3, "#008080"

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->TEAL:Lorg/kore/kolab/notes/Colors;

    .line 36
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "BLUE"

    const/16 v2, 0xc

    const-string v3, "#0000FF"

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->BLUE:Lorg/kore/kolab/notes/Colors;

    .line 37
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "NAVY"

    const/16 v2, 0xd

    const-string v3, "#000080"

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->NAVY:Lorg/kore/kolab/notes/Colors;

    .line 38
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "MAGENTA"

    const/16 v2, 0xe

    const-string v3, "#FF00FF"

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->MAGENTA:Lorg/kore/kolab/notes/Colors;

    .line 39
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "BROWN"

    const/16 v2, 0xf

    const-string v3, "#8B4513"

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->BROWN:Lorg/kore/kolab/notes/Colors;

    .line 40
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "GOLD"

    const/16 v2, 0x10

    const-string v3, "#FFD700"

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->GOLD:Lorg/kore/kolab/notes/Colors;

    .line 41
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "ORANGE"

    const/16 v2, 0x11

    const-string v3, "FFA500"

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->ORANGE:Lorg/kore/kolab/notes/Colors;

    .line 42
    new-instance v0, Lorg/kore/kolab/notes/Colors;

    const-string v1, "PURPLE"

    const/16 v2, 0x12

    const-string v3, "#800080"

    invoke-direct {v0, v1, v2, v3}, Lorg/kore/kolab/notes/Colors;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/kore/kolab/notes/Colors;->PURPLE:Lorg/kore/kolab/notes/Colors;

    .line 23
    const/16 v0, 0x13

    new-array v0, v0, [Lorg/kore/kolab/notes/Colors;

    sget-object v1, Lorg/kore/kolab/notes/Colors;->WHITE:Lorg/kore/kolab/notes/Colors;

    aput-object v1, v0, v4

    sget-object v1, Lorg/kore/kolab/notes/Colors;->SILVER:Lorg/kore/kolab/notes/Colors;

    aput-object v1, v0, v5

    sget-object v1, Lorg/kore/kolab/notes/Colors;->GRAY:Lorg/kore/kolab/notes/Colors;

    aput-object v1, v0, v6

    sget-object v1, Lorg/kore/kolab/notes/Colors;->BLACK:Lorg/kore/kolab/notes/Colors;

    aput-object v1, v0, v7

    sget-object v1, Lorg/kore/kolab/notes/Colors;->RED:Lorg/kore/kolab/notes/Colors;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lorg/kore/kolab/notes/Colors;->MAROON:Lorg/kore/kolab/notes/Colors;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/kore/kolab/notes/Colors;->YELLOW:Lorg/kore/kolab/notes/Colors;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/kore/kolab/notes/Colors;->OLIVE:Lorg/kore/kolab/notes/Colors;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/kore/kolab/notes/Colors;->LIME:Lorg/kore/kolab/notes/Colors;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/kore/kolab/notes/Colors;->GREN:Lorg/kore/kolab/notes/Colors;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lorg/kore/kolab/notes/Colors;->CYAN:Lorg/kore/kolab/notes/Colors;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lorg/kore/kolab/notes/Colors;->TEAL:Lorg/kore/kolab/notes/Colors;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lorg/kore/kolab/notes/Colors;->BLUE:Lorg/kore/kolab/notes/Colors;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lorg/kore/kolab/notes/Colors;->NAVY:Lorg/kore/kolab/notes/Colors;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lorg/kore/kolab/notes/Colors;->MAGENTA:Lorg/kore/kolab/notes/Colors;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lorg/kore/kolab/notes/Colors;->BROWN:Lorg/kore/kolab/notes/Colors;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lorg/kore/kolab/notes/Colors;->GOLD:Lorg/kore/kolab/notes/Colors;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lorg/kore/kolab/notes/Colors;->ORANGE:Lorg/kore/kolab/notes/Colors;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lorg/kore/kolab/notes/Colors;->PURPLE:Lorg/kore/kolab/notes/Colors;

    aput-object v2, v0, v1

    sput-object v0, Lorg/kore/kolab/notes/Colors;->$VALUES:[Lorg/kore/kolab/notes/Colors;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4
    .param p3, "colorCode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 48
    iput-object p3, p0, Lorg/kore/kolab/notes/Colors;->colorCode:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public static getColor(Ljava/lang/String;)Lorg/kore/kolab/notes/Color;
    .registers 6
    .param p0, "hexCode"    # Ljava/lang/String;

    .prologue
    .line 67
    if-eqz p0, :cond_c

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_e

    .line 68
    :cond_c
    const/4 v0, 0x0

    .line 77
    :cond_d
    :goto_d
    return-object v0

    .line 71
    :cond_e
    invoke-static {}, Lorg/kore/kolab/notes/Colors;->values()[Lorg/kore/kolab/notes/Colors;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_14
    if-ge v1, v3, :cond_25

    aget-object v0, v2, v1

    .line 72
    .local v0, "color":Lorg/kore/kolab/notes/Color;
    invoke-interface {v0}, Lorg/kore/kolab/notes/Color;->getHexcode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_d

    .line 71
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 77
    .end local v0    # "color":Lorg/kore/kolab/notes/Color;
    :cond_25
    new-instance v0, Lorg/kore/kolab/notes/Color$DefaultImpl;

    invoke-direct {v0, p0}, Lorg/kore/kolab/notes/Color$DefaultImpl;-><init>(Ljava/lang/String;)V

    goto :goto_d
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/kore/kolab/notes/Colors;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 23
    const-class v0, Lorg/kore/kolab/notes/Colors;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/Colors;

    return-object v0
.end method

.method public static values()[Lorg/kore/kolab/notes/Colors;
    .registers 1

    .prologue
    .line 23
    sget-object v0, Lorg/kore/kolab/notes/Colors;->$VALUES:[Lorg/kore/kolab/notes/Colors;

    invoke-virtual {v0}, [Lorg/kore/kolab/notes/Colors;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/kore/kolab/notes/Colors;

    return-object v0
.end method


# virtual methods
.method public getHexcode()Ljava/lang/String;
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lorg/kore/kolab/notes/Colors;->colorCode:Ljava/lang/String;

    return-object v0
.end method
