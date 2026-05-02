.class final enum Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lch/qos/logback/core/pattern/parser/TokenStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "TokenizerState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

.field public static final enum FORMAT_MODIFIER_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

.field public static final enum KEYWORD_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

.field public static final enum LITERAL_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

.field public static final enum OPTION_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

.field public static final enum RIGHT_PARENTHESIS_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    const-string v1, "LITERAL_STATE"

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->LITERAL_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    new-instance v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    const-string v1, "FORMAT_MODIFIER_STATE"

    invoke-direct {v0, v1, v3}, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->FORMAT_MODIFIER_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    new-instance v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    const-string v1, "KEYWORD_STATE"

    invoke-direct {v0, v1, v4}, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->KEYWORD_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    new-instance v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    const-string v1, "OPTION_STATE"

    invoke-direct {v0, v1, v5}, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->OPTION_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    new-instance v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    const-string v1, "RIGHT_PARENTHESIS_STATE"

    invoke-direct {v0, v1, v6}, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->RIGHT_PARENTHESIS_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    const/4 v0, 0x5

    new-array v0, v0, [Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    sget-object v1, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->LITERAL_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    aput-object v1, v0, v2

    sget-object v1, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->FORMAT_MODIFIER_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    aput-object v1, v0, v3

    sget-object v1, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->KEYWORD_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    aput-object v1, v0, v4

    sget-object v1, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->OPTION_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    aput-object v1, v0, v5

    sget-object v1, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->RIGHT_PARENTHESIS_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    aput-object v1, v0, v6

    sput-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->$VALUES:[Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;
    .registers 2

    const-class v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    return-object v0
.end method

.method public static values()[Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;
    .registers 1

    sget-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->$VALUES:[Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    invoke-virtual {v0}, [Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    return-object v0
.end method
