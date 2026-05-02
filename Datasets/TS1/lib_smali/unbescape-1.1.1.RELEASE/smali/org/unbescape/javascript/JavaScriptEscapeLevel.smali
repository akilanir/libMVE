.class public final enum Lorg/unbescape/javascript/JavaScriptEscapeLevel;
.super Ljava/lang/Enum;
.source "JavaScriptEscapeLevel.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/unbescape/javascript/JavaScriptEscapeLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/unbescape/javascript/JavaScriptEscapeLevel;

.field public static final enum LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

.field public static final enum LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

.field public static final enum LEVEL_3_ALL_NON_ALPHANUMERIC:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

.field public static final enum LEVEL_4_ALL_CHARACTERS:Lorg/unbescape/javascript/JavaScriptEscapeLevel;


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

    .line 83
    new-instance v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    const-string v1, "LEVEL_1_BASIC_ESCAPE_SET"

    invoke-direct {v0, v1, v5, v2}, Lorg/unbescape/javascript/JavaScriptEscapeLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    .line 88
    new-instance v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    const-string v1, "LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET"

    invoke-direct {v0, v1, v2, v3}, Lorg/unbescape/javascript/JavaScriptEscapeLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    .line 94
    new-instance v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    const-string v1, "LEVEL_3_ALL_NON_ALPHANUMERIC"

    invoke-direct {v0, v1, v3, v4}, Lorg/unbescape/javascript/JavaScriptEscapeLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_3_ALL_NON_ALPHANUMERIC:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    .line 99
    new-instance v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    const-string v1, "LEVEL_4_ALL_CHARACTERS"

    invoke-direct {v0, v1, v4, v6}, Lorg/unbescape/javascript/JavaScriptEscapeLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_4_ALL_CHARACTERS:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    .line 78
    new-array v0, v6, [Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    aput-object v1, v0, v5

    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    aput-object v1, v0, v2

    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_3_ALL_NON_ALPHANUMERIC:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    aput-object v1, v0, v3

    sget-object v1, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_4_ALL_CHARACTERS:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    aput-object v1, v0, v4

    sput-object v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->$VALUES:[Lorg/unbescape/javascript/JavaScriptEscapeLevel;

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
    .line 127
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 128
    iput p3, p0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->escapeLevel:I

    .line 129
    return-void
.end method

.method public static forLevel(I)Lorg/unbescape/javascript/JavaScriptEscapeLevel;
    .registers 4
    .param p0, "level"    # I

    .prologue
    .line 116
    packed-switch p0, :pswitch_data_28

    .line 122
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

    .line 117
    :pswitch_1c
    sget-object v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    .line 120
    :goto_1e
    return-object v0

    .line 118
    :pswitch_1f
    sget-object v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    goto :goto_1e

    .line 119
    :pswitch_22
    sget-object v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_3_ALL_NON_ALPHANUMERIC:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    goto :goto_1e

    .line 120
    :pswitch_25
    sget-object v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->LEVEL_4_ALL_CHARACTERS:Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    goto :goto_1e

    .line 116
    :pswitch_data_28
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_1f
        :pswitch_22
        :pswitch_25
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/unbescape/javascript/JavaScriptEscapeLevel;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 78
    const-class v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    return-object v0
.end method

.method public static values()[Lorg/unbescape/javascript/JavaScriptEscapeLevel;
    .registers 1

    .prologue
    .line 78
    sget-object v0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->$VALUES:[Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    invoke-virtual {v0}, [Lorg/unbescape/javascript/JavaScriptEscapeLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/unbescape/javascript/JavaScriptEscapeLevel;

    return-object v0
.end method


# virtual methods
.method public getEscapeLevel()I
    .registers 2

    .prologue
    .line 137
    iget v0, p0, Lorg/unbescape/javascript/JavaScriptEscapeLevel;->escapeLevel:I

    return v0
.end method
