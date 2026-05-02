.class public final enum Lorg/unbescape/css/CssStringEscapeLevel;
.super Ljava/lang/Enum;
.source "CssStringEscapeLevel.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/unbescape/css/CssStringEscapeLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/unbescape/css/CssStringEscapeLevel;

.field public static final enum LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssStringEscapeLevel;

.field public static final enum LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssStringEscapeLevel;

.field public static final enum LEVEL_3_ALL_NON_ALPHANUMERIC:Lorg/unbescape/css/CssStringEscapeLevel;

.field public static final enum LEVEL_4_ALL_CHARACTERS:Lorg/unbescape/css/CssStringEscapeLevel;


# instance fields
.field private final escapeLevel:I


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x0

    const/4 v4, 0x3

    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 68
    new-instance v0, Lorg/unbescape/css/CssStringEscapeLevel;

    const-string v1, "LEVEL_1_BASIC_ESCAPE_SET"

    invoke-direct {v0, v1, v5, v2}, Lorg/unbescape/css/CssStringEscapeLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssStringEscapeLevel;

    .line 73
    new-instance v0, Lorg/unbescape/css/CssStringEscapeLevel;

    const-string v1, "LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET"

    invoke-direct {v0, v1, v2, v3}, Lorg/unbescape/css/CssStringEscapeLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssStringEscapeLevel;

    .line 79
    new-instance v0, Lorg/unbescape/css/CssStringEscapeLevel;

    const-string v1, "LEVEL_3_ALL_NON_ALPHANUMERIC"

    invoke-direct {v0, v1, v3, v4}, Lorg/unbescape/css/CssStringEscapeLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_3_ALL_NON_ALPHANUMERIC:Lorg/unbescape/css/CssStringEscapeLevel;

    .line 84
    new-instance v0, Lorg/unbescape/css/CssStringEscapeLevel;

    const-string v1, "LEVEL_4_ALL_CHARACTERS"

    invoke-direct {v0, v1, v4, v6}, Lorg/unbescape/css/CssStringEscapeLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_4_ALL_CHARACTERS:Lorg/unbescape/css/CssStringEscapeLevel;

    .line 63
    new-array v0, v6, [Lorg/unbescape/css/CssStringEscapeLevel;

    sget-object v1, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssStringEscapeLevel;

    aput-object v1, v0, v5

    sget-object v1, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssStringEscapeLevel;

    aput-object v1, v0, v2

    sget-object v1, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_3_ALL_NON_ALPHANUMERIC:Lorg/unbescape/css/CssStringEscapeLevel;

    aput-object v1, v0, v3

    sget-object v1, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_4_ALL_CHARACTERS:Lorg/unbescape/css/CssStringEscapeLevel;

    aput-object v1, v0, v4

    sput-object v0, Lorg/unbescape/css/CssStringEscapeLevel;->$VALUES:[Lorg/unbescape/css/CssStringEscapeLevel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "escapeLevel"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 112
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 113
    iput p3, p0, Lorg/unbescape/css/CssStringEscapeLevel;->escapeLevel:I

    .line 114
    return-void
.end method

.method public static forLevel(I)Lorg/unbescape/css/CssStringEscapeLevel;
    .registers 4
    .param p0, "level"    # I

    .prologue
    .line 101
    packed-switch p0, :pswitch_data_28

    .line 107
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No escape level enum constant defined for level: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 102
    :pswitch_1c
    sget-object v0, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssStringEscapeLevel;

    .line 105
    :goto_1e
    return-object v0

    .line 103
    :pswitch_1f
    sget-object v0, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/css/CssStringEscapeLevel;

    goto :goto_1e

    .line 104
    :pswitch_22
    sget-object v0, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_3_ALL_NON_ALPHANUMERIC:Lorg/unbescape/css/CssStringEscapeLevel;

    goto :goto_1e

    .line 105
    :pswitch_25
    sget-object v0, Lorg/unbescape/css/CssStringEscapeLevel;->LEVEL_4_ALL_CHARACTERS:Lorg/unbescape/css/CssStringEscapeLevel;

    goto :goto_1e

    .line 101
    :pswitch_data_28
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_1f
        :pswitch_22
        :pswitch_25
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/unbescape/css/CssStringEscapeLevel;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 63
    const-class v0, Lorg/unbescape/css/CssStringEscapeLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/unbescape/css/CssStringEscapeLevel;

    return-object v0
.end method

.method public static values()[Lorg/unbescape/css/CssStringEscapeLevel;
    .registers 1

    .prologue
    .line 63
    sget-object v0, Lorg/unbescape/css/CssStringEscapeLevel;->$VALUES:[Lorg/unbescape/css/CssStringEscapeLevel;

    invoke-virtual {v0}, [Lorg/unbescape/css/CssStringEscapeLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/unbescape/css/CssStringEscapeLevel;

    return-object v0
.end method


# virtual methods
.method public getEscapeLevel()I
    .registers 2

    .prologue
    .line 122
    iget v0, p0, Lorg/unbescape/css/CssStringEscapeLevel;->escapeLevel:I

    return v0
.end method
