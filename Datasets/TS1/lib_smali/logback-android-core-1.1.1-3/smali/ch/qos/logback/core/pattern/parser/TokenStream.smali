.class Lch/qos/logback/core/pattern/parser/TokenStream;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/pattern/parser/TokenStream$1;,
        Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;
    }
.end annotation


# instance fields
.field final escapeUtil:Lch/qos/logback/core/pattern/util/IEscapeUtil;

.field final optionEscapeUtil:Lch/qos/logback/core/pattern/util/IEscapeUtil;

.field final pattern:Ljava/lang/String;

.field final patternLength:I

.field pointer:I

.field state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 3

    new-instance v0, Lch/qos/logback/core/pattern/util/RegularEscapeUtil;

    invoke-direct {v0}, Lch/qos/logback/core/pattern/util/RegularEscapeUtil;-><init>()V

    invoke-direct {p0, p1, v0}, Lch/qos/logback/core/pattern/parser/TokenStream;-><init>(Ljava/lang/String;Lch/qos/logback/core/pattern/util/IEscapeUtil;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lch/qos/logback/core/pattern/util/IEscapeUtil;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lch/qos/logback/core/pattern/util/RestrictedEscapeUtil;

    invoke-direct {v0}, Lch/qos/logback/core/pattern/util/RestrictedEscapeUtil;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->optionEscapeUtil:Lch/qos/logback/core/pattern/util/IEscapeUtil;

    sget-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->LITERAL_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    const/4 v0, 0x0

    iput v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    if-eqz p1, :cond_19

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_21

    :cond_19
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "null or empty pattern string not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_21
    iput-object p1, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pattern:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->patternLength:I

    iput-object p2, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->escapeUtil:Lch/qos/logback/core/pattern/util/IEscapeUtil;

    return-void
.end method

.method private addValuedToken(ILjava/lang/StringBuffer;Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/StringBuffer;",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/pattern/parser/Token;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-lez v0, :cond_16

    new-instance v0, Lch/qos/logback/core/pattern/parser/Token;

    invoke-virtual {p2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lch/qos/logback/core/pattern/parser/Token;-><init>(ILjava/lang/Object;)V

    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    :cond_16
    return-void
.end method

.method private handleFormatModifierState(CLjava/util/List;Ljava/lang/StringBuffer;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(C",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/pattern/parser/Token;",
            ">;",
            "Ljava/lang/StringBuffer;",
            ")V"
        }
    .end annotation

    const/16 v1, 0x3ea

    const/16 v0, 0x28

    if-ne p1, v0, :cond_13

    invoke-direct {p0, v1, p3, p2}, Lch/qos/logback/core/pattern/parser/TokenStream;->addValuedToken(ILjava/lang/StringBuffer;Ljava/util/List;)V

    sget-object v0, Lch/qos/logback/core/pattern/parser/Token;->BARE_COMPOSITE_KEYWORD_TOKEN:Lch/qos/logback/core/pattern/parser/Token;

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->LITERAL_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    :goto_12
    return-void

    :cond_13
    invoke-static {p1}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-direct {p0, v1, p3, p2}, Lch/qos/logback/core/pattern/parser/TokenStream;->addValuedToken(ILjava/lang/StringBuffer;Ljava/util/List;)V

    sget-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->KEYWORD_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_12

    :cond_24
    invoke-virtual {p3, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_12
.end method

.method private handleKeywordState(CLjava/util/List;Ljava/lang/StringBuffer;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(C",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/pattern/parser/Token;",
            ">;",
            "Ljava/lang/StringBuffer;",
            ")V"
        }
    .end annotation

    const/16 v1, 0x3ec

    invoke-static {p1}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-virtual {p3, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    :goto_b
    return-void

    :cond_c
    const/16 v0, 0x7b

    if-ne p1, v0, :cond_18

    invoke-direct {p0, v1, p3, p2}, Lch/qos/logback/core/pattern/parser/TokenStream;->addValuedToken(ILjava/lang/StringBuffer;Ljava/util/List;)V

    sget-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->OPTION_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    goto :goto_b

    :cond_18
    const/16 v0, 0x28

    if-ne p1, v0, :cond_26

    const/16 v0, 0x3ed

    invoke-direct {p0, v0, p3, p2}, Lch/qos/logback/core/pattern/parser/TokenStream;->addValuedToken(ILjava/lang/StringBuffer;Ljava/util/List;)V

    sget-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->LITERAL_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    goto :goto_b

    :cond_26
    const/16 v0, 0x25

    if-ne p1, v0, :cond_37

    invoke-direct {p0, v1, p3, p2}, Lch/qos/logback/core/pattern/parser/TokenStream;->addValuedToken(ILjava/lang/StringBuffer;Ljava/util/List;)V

    sget-object v0, Lch/qos/logback/core/pattern/parser/Token;->PERCENT_TOKEN:Lch/qos/logback/core/pattern/parser/Token;

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->FORMAT_MODIFIER_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    goto :goto_b

    :cond_37
    const/16 v0, 0x29

    if-ne p1, v0, :cond_43

    invoke-direct {p0, v1, p3, p2}, Lch/qos/logback/core/pattern/parser/TokenStream;->addValuedToken(ILjava/lang/StringBuffer;Ljava/util/List;)V

    sget-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->RIGHT_PARENTHESIS_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    goto :goto_b

    :cond_43
    invoke-direct {p0, v1, p3, p2}, Lch/qos/logback/core/pattern/parser/TokenStream;->addValuedToken(ILjava/lang/StringBuffer;Ljava/util/List;)V

    const/16 v0, 0x5c

    if-ne p1, v0, :cond_6a

    iget v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    iget v1, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->patternLength:I

    if-ge v0, v1, :cond_65

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pattern:Ljava/lang/String;

    iget v1, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    iget-object v1, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->escapeUtil:Lch/qos/logback/core/pattern/util/IEscapeUtil;

    const-string v2, "%()"

    iget v3, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    invoke-interface {v1, v2, p3, v0, v3}, Lch/qos/logback/core/pattern/util/IEscapeUtil;->escape(Ljava/lang/String;Ljava/lang/StringBuffer;CI)V

    :cond_65
    :goto_65
    sget-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->LITERAL_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    goto :goto_b

    :cond_6a
    invoke-virtual {p3, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_65
.end method

.method private handleLiteralState(CLjava/util/List;Ljava/lang/StringBuffer;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(C",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/pattern/parser/Token;",
            ">;",
            "Ljava/lang/StringBuffer;",
            ")V"
        }
    .end annotation

    const/16 v0, 0x3e8

    sparse-switch p1, :sswitch_data_24

    invoke-virtual {p3, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    :goto_8
    return-void

    :sswitch_9
    const-string v0, "%()"

    invoke-virtual {p0, v0, p3}, Lch/qos/logback/core/pattern/parser/TokenStream;->escape(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    goto :goto_8

    :sswitch_f
    invoke-direct {p0, v0, p3, p2}, Lch/qos/logback/core/pattern/parser/TokenStream;->addValuedToken(ILjava/lang/StringBuffer;Ljava/util/List;)V

    sget-object v0, Lch/qos/logback/core/pattern/parser/Token;->PERCENT_TOKEN:Lch/qos/logback/core/pattern/parser/Token;

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->FORMAT_MODIFIER_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    goto :goto_8

    :sswitch_1c
    invoke-direct {p0, v0, p3, p2}, Lch/qos/logback/core/pattern/parser/TokenStream;->addValuedToken(ILjava/lang/StringBuffer;Ljava/util/List;)V

    sget-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->RIGHT_PARENTHESIS_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    goto :goto_8

    :sswitch_data_24
    .sparse-switch
        0x25 -> :sswitch_f
        0x29 -> :sswitch_1c
        0x5c -> :sswitch_9
    .end sparse-switch
.end method

.method private handleRightParenthesisState(CLjava/util/List;Ljava/lang/StringBuffer;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(C",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/pattern/parser/Token;",
            ">;",
            "Ljava/lang/StringBuffer;",
            ")V"
        }
    .end annotation

    sget-object v0, Lch/qos/logback/core/pattern/parser/Token;->RIGHT_PARENTHESIS_TOKEN:Lch/qos/logback/core/pattern/parser/Token;

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sparse-switch p1, :sswitch_data_20

    invoke-virtual {p3, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    sget-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->LITERAL_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    :goto_f
    :sswitch_f
    return-void

    :sswitch_10
    sget-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->OPTION_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    goto :goto_f

    :sswitch_15
    const-string v0, "%{}"

    invoke-virtual {p0, v0, p3}, Lch/qos/logback/core/pattern/parser/TokenStream;->escape(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    sget-object v0, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->LITERAL_STATE:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    iput-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    goto :goto_f

    nop

    :sswitch_data_20
    .sparse-switch
        0x29 -> :sswitch_f
        0x5c -> :sswitch_15
        0x7b -> :sswitch_10
    .end sparse-switch
.end method

.method private processOption(CLjava/util/List;Ljava/lang/StringBuffer;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(C",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/pattern/parser/Token;",
            ">;",
            "Ljava/lang/StringBuffer;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    new-instance v0, Lch/qos/logback/core/pattern/parser/OptionTokenizer;

    invoke-direct {v0, p0}, Lch/qos/logback/core/pattern/parser/OptionTokenizer;-><init>(Lch/qos/logback/core/pattern/parser/TokenStream;)V

    invoke-virtual {v0, p1, p2}, Lch/qos/logback/core/pattern/parser/OptionTokenizer;->tokenize(CLjava/util/List;)V

    return-void
.end method


# virtual methods
.method escape(Ljava/lang/String;Ljava/lang/StringBuffer;)V
    .registers 6

    iget v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    iget v1, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->patternLength:I

    if-ge v0, v1, :cond_19

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pattern:Ljava/lang/String;

    iget v1, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    iget-object v1, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->escapeUtil:Lch/qos/logback/core/pattern/util/IEscapeUtil;

    iget v2, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    invoke-interface {v1, p1, p2, v0, v2}, Lch/qos/logback/core/pattern/util/IEscapeUtil;->escape(Ljava/lang/String;Ljava/lang/StringBuffer;CI)V

    :cond_19
    return-void
.end method

.method optionEscape(Ljava/lang/String;Ljava/lang/StringBuffer;)V
    .registers 6

    iget v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    iget v1, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->patternLength:I

    if-ge v0, v1, :cond_19

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pattern:Ljava/lang/String;

    iget v1, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    iget-object v1, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->optionEscapeUtil:Lch/qos/logback/core/pattern/util/IEscapeUtil;

    iget v2, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    invoke-interface {v1, p1, p2, v0, v2}, Lch/qos/logback/core/pattern/util/IEscapeUtil;->escape(Ljava/lang/String;Ljava/lang/StringBuffer;CI)V

    :cond_19
    return-void
.end method

.method tokenize()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/spi/ScanException;
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    :goto_a
    iget v2, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    iget v3, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->patternLength:I

    if-ge v2, v3, :cond_40

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pattern:Ljava/lang/String;

    iget v3, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    iget v3, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->pointer:I

    sget-object v3, Lch/qos/logback/core/pattern/parser/TokenStream$1;->$SwitchMap$ch$qos$logback$core$pattern$parser$TokenStream$TokenizerState:[I

    iget-object v4, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    invoke-virtual {v4}, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_72

    goto :goto_a

    :pswitch_2c
    invoke-direct {p0, v2, v0, v1}, Lch/qos/logback/core/pattern/parser/TokenStream;->handleLiteralState(CLjava/util/List;Ljava/lang/StringBuffer;)V

    goto :goto_a

    :pswitch_30
    invoke-direct {p0, v2, v0, v1}, Lch/qos/logback/core/pattern/parser/TokenStream;->handleFormatModifierState(CLjava/util/List;Ljava/lang/StringBuffer;)V

    goto :goto_a

    :pswitch_34
    invoke-direct {p0, v2, v0, v1}, Lch/qos/logback/core/pattern/parser/TokenStream;->processOption(CLjava/util/List;Ljava/lang/StringBuffer;)V

    goto :goto_a

    :pswitch_38
    invoke-direct {p0, v2, v0, v1}, Lch/qos/logback/core/pattern/parser/TokenStream;->handleKeywordState(CLjava/util/List;Ljava/lang/StringBuffer;)V

    goto :goto_a

    :pswitch_3c
    invoke-direct {p0, v2, v0, v1}, Lch/qos/logback/core/pattern/parser/TokenStream;->handleRightParenthesisState(CLjava/util/List;Ljava/lang/StringBuffer;)V

    goto :goto_a

    :cond_40
    sget-object v2, Lch/qos/logback/core/pattern/parser/TokenStream$1;->$SwitchMap$ch$qos$logback$core$pattern$parser$TokenStream$TokenizerState:[I

    iget-object v3, p0, Lch/qos/logback/core/pattern/parser/TokenStream;->state:Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;

    invoke-virtual {v3}, Lch/qos/logback/core/pattern/parser/TokenStream$TokenizerState;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_80

    :goto_4d
    return-object v0

    :pswitch_4e
    const/16 v2, 0x3e8

    invoke-direct {p0, v2, v1, v0}, Lch/qos/logback/core/pattern/parser/TokenStream;->addValuedToken(ILjava/lang/StringBuffer;Ljava/util/List;)V

    goto :goto_4d

    :pswitch_54
    new-instance v2, Lch/qos/logback/core/pattern/parser/Token;

    const/16 v3, 0x3ec

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Lch/qos/logback/core/pattern/parser/Token;-><init>(ILjava/lang/Object;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4d

    :pswitch_63
    sget-object v1, Lch/qos/logback/core/pattern/parser/Token;->RIGHT_PARENTHESIS_TOKEN:Lch/qos/logback/core/pattern/parser/Token;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4d

    :pswitch_69
    new-instance v0, Lch/qos/logback/core/spi/ScanException;

    const-string v1, "Unexpected end of pattern string"

    invoke-direct {v0, v1}, Lch/qos/logback/core/spi/ScanException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :pswitch_data_72
    .packed-switch 0x1
        :pswitch_2c
        :pswitch_30
        :pswitch_34
        :pswitch_38
        :pswitch_3c
    .end packed-switch

    :pswitch_data_80
    .packed-switch 0x1
        :pswitch_4e
        :pswitch_69
        :pswitch_69
        :pswitch_54
        :pswitch_63
    .end packed-switch
.end method
