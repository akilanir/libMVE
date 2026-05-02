.class Lch/qos/logback/core/pattern/parser/Token;
.super Ljava/lang/Object;


# static fields
.field static BARE_COMPOSITE_KEYWORD_TOKEN:Lch/qos/logback/core/pattern/parser/Token; = null

.field static final COMPOSITE_KEYWORD:I = 0x3ed

.field static final CURLY_LEFT:I = 0x7b

.field static final CURLY_RIGHT:I = 0x7d

.field static final DOT:I = 0x2e

.field static final EOF:I = 0x7fffffff

.field static EOF_TOKEN:Lch/qos/logback/core/pattern/parser/Token; = null

.field static final FORMAT_MODIFIER:I = 0x3ea

.field static final LITERAL:I = 0x3e8

.field static final MINUS:I = 0x2d

.field static final OPTION:I = 0x3ee

.field static final PERCENT:I = 0x25

.field static PERCENT_TOKEN:Lch/qos/logback/core/pattern/parser/Token; = null

.field static final RIGHT_PARENTHESIS:I = 0x29

.field static RIGHT_PARENTHESIS_TOKEN:Lch/qos/logback/core/pattern/parser/Token; = null

.field static final SIMPLE_KEYWORD:I = 0x3ec


# instance fields
.field private final type:I

.field private final value:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lch/qos/logback/core/pattern/parser/Token;

    const v1, 0x7fffffff

    const-string v2, "EOF"

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/pattern/parser/Token;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lch/qos/logback/core/pattern/parser/Token;->EOF_TOKEN:Lch/qos/logback/core/pattern/parser/Token;

    new-instance v0, Lch/qos/logback/core/pattern/parser/Token;

    const/16 v1, 0x29

    invoke-direct {v0, v1}, Lch/qos/logback/core/pattern/parser/Token;-><init>(I)V

    sput-object v0, Lch/qos/logback/core/pattern/parser/Token;->RIGHT_PARENTHESIS_TOKEN:Lch/qos/logback/core/pattern/parser/Token;

    new-instance v0, Lch/qos/logback/core/pattern/parser/Token;

    const/16 v1, 0x3ed

    const-string v2, "BARE"

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/pattern/parser/Token;-><init>(ILjava/lang/Object;)V

    sput-object v0, Lch/qos/logback/core/pattern/parser/Token;->BARE_COMPOSITE_KEYWORD_TOKEN:Lch/qos/logback/core/pattern/parser/Token;

    new-instance v0, Lch/qos/logback/core/pattern/parser/Token;

    const/16 v1, 0x25

    invoke-direct {v0, v1}, Lch/qos/logback/core/pattern/parser/Token;-><init>(I)V

    sput-object v0, Lch/qos/logback/core/pattern/parser/Token;->PERCENT_TOKEN:Lch/qos/logback/core/pattern/parser/Token;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lch/qos/logback/core/pattern/parser/Token;-><init>(ILjava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(ILjava/lang/Object;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lch/qos/logback/core/pattern/parser/Token;->type:I

    iput-object p2, p0, Lch/qos/logback/core/pattern/parser/Token;->value:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_5

    :cond_4
    :goto_4
    return v0

    :cond_5
    instance-of v2, p1, Lch/qos/logback/core/pattern/parser/Token;

    if-nez v2, :cond_b

    move v0, v1

    goto :goto_4

    :cond_b
    check-cast p1, Lch/qos/logback/core/pattern/parser/Token;

    iget v2, p0, Lch/qos/logback/core/pattern/parser/Token;->type:I

    iget v3, p1, Lch/qos/logback/core/pattern/parser/Token;->type:I

    if-eq v2, v3, :cond_15

    move v0, v1

    goto :goto_4

    :cond_15
    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/Token;->value:Ljava/lang/Object;

    if-eqz v2, :cond_25

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/Token;->value:Ljava/lang/Object;

    iget-object v3, p1, Lch/qos/logback/core/pattern/parser/Token;->value:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    :goto_23
    move v0, v1

    goto :goto_4

    :cond_25
    iget-object v2, p1, Lch/qos/logback/core/pattern/parser/Token;->value:Ljava/lang/Object;

    if-eqz v2, :cond_4

    goto :goto_23
.end method

.method public getType()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/pattern/parser/Token;->type:I

    return v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/Token;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    iget v0, p0, Lch/qos/logback/core/pattern/parser/Token;->type:I

    mul-int/lit8 v1, v0, 0x1d

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/Token;->value:Ljava/lang/Object;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/Token;->value:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_e
    add-int/2addr v0, v1

    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    iget v0, p0, Lch/qos/logback/core/pattern/parser/Token;->type:I

    sparse-switch v0, :sswitch_data_60

    const-string v0, "UNKNOWN"

    :goto_7
    iget-object v1, p0, Lch/qos/logback/core/pattern/parser/Token;->value:Ljava/lang/Object;

    if-nez v1, :cond_3a

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Token("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_24
    return-object v0

    :sswitch_25
    const-string v0, "%"

    goto :goto_7

    :sswitch_28
    const-string v0, "FormatModifier"

    goto :goto_7

    :sswitch_2b
    const-string v0, "LITERAL"

    goto :goto_7

    :sswitch_2e
    const-string v0, "OPTION"

    goto :goto_7

    :sswitch_31
    const-string v0, "SIMPLE_KEYWORD"

    goto :goto_7

    :sswitch_34
    const-string v0, "COMPOSITE_KEYWORD"

    goto :goto_7

    :sswitch_37
    const-string v0, "RIGHT_PARENTHESIS"

    goto :goto_7

    :cond_3a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Token("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/pattern/parser/Token;->value:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_24

    :sswitch_data_60
    .sparse-switch
        0x25 -> :sswitch_25
        0x29 -> :sswitch_37
        0x3e8 -> :sswitch_2b
        0x3ea -> :sswitch_28
        0x3ec -> :sswitch_31
        0x3ed -> :sswitch_34
        0x3ee -> :sswitch_2e
    .end sparse-switch
.end method
