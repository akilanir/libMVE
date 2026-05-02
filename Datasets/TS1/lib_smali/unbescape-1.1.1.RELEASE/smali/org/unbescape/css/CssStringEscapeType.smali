.class public final enum Lorg/unbescape/css/CssStringEscapeType;
.super Ljava/lang/Enum;
.source "CssStringEscapeType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/unbescape/css/CssStringEscapeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/unbescape/css/CssStringEscapeType;

.field public static final enum BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

.field public static final enum BACKSLASH_ESCAPES_DEFAULT_TO_SIX_DIGIT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

.field public static final enum COMPACT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

.field public static final enum SIX_DIGIT_HEXA:Lorg/unbescape/css/CssStringEscapeType;


# instance fields
.field private final useBackslashEscapes:Z

.field private final useCompactHexa:Z


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 59
    new-instance v0, Lorg/unbescape/css/CssStringEscapeType;

    const-string v1, "BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA"

    invoke-direct {v0, v1, v2, v3, v3}, Lorg/unbescape/css/CssStringEscapeType;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/unbescape/css/CssStringEscapeType;->BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

    .line 64
    new-instance v0, Lorg/unbescape/css/CssStringEscapeType;

    const-string v1, "BACKSLASH_ESCAPES_DEFAULT_TO_SIX_DIGIT_HEXA"

    invoke-direct {v0, v1, v3, v3, v2}, Lorg/unbescape/css/CssStringEscapeType;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/unbescape/css/CssStringEscapeType;->BACKSLASH_ESCAPES_DEFAULT_TO_SIX_DIGIT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

    .line 69
    new-instance v0, Lorg/unbescape/css/CssStringEscapeType;

    const-string v1, "COMPACT_HEXA"

    invoke-direct {v0, v1, v4, v2, v3}, Lorg/unbescape/css/CssStringEscapeType;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/unbescape/css/CssStringEscapeType;->COMPACT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

    .line 74
    new-instance v0, Lorg/unbescape/css/CssStringEscapeType;

    const-string v1, "SIX_DIGIT_HEXA"

    invoke-direct {v0, v1, v5, v2, v2}, Lorg/unbescape/css/CssStringEscapeType;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/unbescape/css/CssStringEscapeType;->SIX_DIGIT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

    .line 54
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/unbescape/css/CssStringEscapeType;

    sget-object v1, Lorg/unbescape/css/CssStringEscapeType;->BACKSLASH_ESCAPES_DEFAULT_TO_COMPACT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

    aput-object v1, v0, v2

    sget-object v1, Lorg/unbescape/css/CssStringEscapeType;->BACKSLASH_ESCAPES_DEFAULT_TO_SIX_DIGIT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/unbescape/css/CssStringEscapeType;->COMPACT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

    aput-object v1, v0, v4

    sget-object v1, Lorg/unbescape/css/CssStringEscapeType;->SIX_DIGIT_HEXA:Lorg/unbescape/css/CssStringEscapeType;

    aput-object v1, v0, v5

    sput-object v0, Lorg/unbescape/css/CssStringEscapeType;->$VALUES:[Lorg/unbescape/css/CssStringEscapeType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZZ)V
    .registers 5
    .param p3, "useBackslashEscapes"    # Z
    .param p4, "useCompactHexa"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ)V"
        }
    .end annotation

    .prologue
    .line 80
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 81
    iput-boolean p3, p0, Lorg/unbescape/css/CssStringEscapeType;->useBackslashEscapes:Z

    .line 82
    iput-boolean p4, p0, Lorg/unbescape/css/CssStringEscapeType;->useCompactHexa:Z

    .line 83
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/unbescape/css/CssStringEscapeType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 54
    const-class v0, Lorg/unbescape/css/CssStringEscapeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/unbescape/css/CssStringEscapeType;

    return-object v0
.end method

.method public static values()[Lorg/unbescape/css/CssStringEscapeType;
    .registers 1

    .prologue
    .line 54
    sget-object v0, Lorg/unbescape/css/CssStringEscapeType;->$VALUES:[Lorg/unbescape/css/CssStringEscapeType;

    invoke-virtual {v0}, [Lorg/unbescape/css/CssStringEscapeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/unbescape/css/CssStringEscapeType;

    return-object v0
.end method


# virtual methods
.method public getUseBackslashEscapes()Z
    .registers 2

    .prologue
    .line 86
    iget-boolean v0, p0, Lorg/unbescape/css/CssStringEscapeType;->useBackslashEscapes:Z

    return v0
.end method

.method public getUseCompactHexa()Z
    .registers 2

    .prologue
    .line 90
    iget-boolean v0, p0, Lorg/unbescape/css/CssStringEscapeType;->useCompactHexa:Z

    return v0
.end method
