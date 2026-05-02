.class public final enum Lorg/unbescape/properties/PropertiesKeyEscapeLevel;
.super Ljava/lang/Enum;
.source "PropertiesKeyEscapeLevel.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/unbescape/properties/PropertiesKeyEscapeLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

.field public static final enum LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

.field public static final enum LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

.field public static final enum LEVEL_3_ALL_NON_ALPHANUMERIC:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

.field public static final enum LEVEL_4_ALL_CHARACTERS:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;


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

    .line 75
    new-instance v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    const-string v1, "LEVEL_1_BASIC_ESCAPE_SET"

    invoke-direct {v0, v1, v5, v2}, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    .line 80
    new-instance v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    const-string v1, "LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET"

    invoke-direct {v0, v1, v2, v3}, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    .line 86
    new-instance v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    const-string v1, "LEVEL_3_ALL_NON_ALPHANUMERIC"

    invoke-direct {v0, v1, v3, v4}, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_3_ALL_NON_ALPHANUMERIC:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    .line 91
    new-instance v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    const-string v1, "LEVEL_4_ALL_CHARACTERS"

    invoke-direct {v0, v1, v4, v6}, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_4_ALL_CHARACTERS:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    .line 70
    new-array v0, v6, [Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    sget-object v1, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    aput-object v1, v0, v5

    sget-object v1, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    aput-object v1, v0, v2

    sget-object v1, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_3_ALL_NON_ALPHANUMERIC:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    aput-object v1, v0, v3

    sget-object v1, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_4_ALL_CHARACTERS:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    aput-object v1, v0, v4

    sput-object v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->$VALUES:[Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

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
    .line 119
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 120
    iput p3, p0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->escapeLevel:I

    .line 121
    return-void
.end method

.method public static forLevel(I)Lorg/unbescape/properties/PropertiesKeyEscapeLevel;
    .registers 4
    .param p0, "level"    # I

    .prologue
    .line 108
    packed-switch p0, :pswitch_data_28

    .line 114
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

    .line 109
    :pswitch_1c
    sget-object v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_1_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    .line 112
    :goto_1e
    return-object v0

    .line 110
    :pswitch_1f
    sget-object v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_2_ALL_NON_ASCII_PLUS_BASIC_ESCAPE_SET:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    goto :goto_1e

    .line 111
    :pswitch_22
    sget-object v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_3_ALL_NON_ALPHANUMERIC:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    goto :goto_1e

    .line 112
    :pswitch_25
    sget-object v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->LEVEL_4_ALL_CHARACTERS:Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    goto :goto_1e

    .line 108
    :pswitch_data_28
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_1f
        :pswitch_22
        :pswitch_25
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/unbescape/properties/PropertiesKeyEscapeLevel;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 70
    const-class v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    return-object v0
.end method

.method public static values()[Lorg/unbescape/properties/PropertiesKeyEscapeLevel;
    .registers 1

    .prologue
    .line 70
    sget-object v0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->$VALUES:[Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    invoke-virtual {v0}, [Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/unbescape/properties/PropertiesKeyEscapeLevel;

    return-object v0
.end method


# virtual methods
.method public getEscapeLevel()I
    .registers 2

    .prologue
    .line 129
    iget v0, p0, Lorg/unbescape/properties/PropertiesKeyEscapeLevel;->escapeLevel:I

    return v0
.end method
