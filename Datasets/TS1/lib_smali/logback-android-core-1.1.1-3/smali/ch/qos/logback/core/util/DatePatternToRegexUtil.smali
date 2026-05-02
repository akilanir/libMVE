.class public Lch/qos/logback/core/util/DatePatternToRegexUtil;
.super Ljava/lang/Object;


# instance fields
.field final datePattern:Ljava/lang/String;

.field final datePatternLength:I

.field final regexMapper:Lch/qos/logback/core/util/CharSequenceToRegexMapper;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lch/qos/logback/core/util/CharSequenceToRegexMapper;

    invoke-direct {v0}, Lch/qos/logback/core/util/CharSequenceToRegexMapper;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/util/DatePatternToRegexUtil;->regexMapper:Lch/qos/logback/core/util/CharSequenceToRegexMapper;

    iput-object p1, p0, Lch/qos/logback/core/util/DatePatternToRegexUtil;->datePattern:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lch/qos/logback/core/util/DatePatternToRegexUtil;->datePatternLength:I

    return-void
.end method

.method private tokenize()Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lch/qos/logback/core/util/CharSequenceState;",
            ">;"
        }
    .end annotation

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    const/4 v0, 0x0

    move v5, v0

    move-object v0, v1

    move v1, v5

    :goto_a
    iget v3, p0, Lch/qos/logback/core/util/DatePatternToRegexUtil;->datePatternLength:I

    if-ge v1, v3, :cond_29

    iget-object v3, p0, Lch/qos/logback/core/util/DatePatternToRegexUtil;->datePattern:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eqz v0, :cond_1a

    iget-char v4, v0, Lch/qos/logback/core/util/CharSequenceState;->c:C

    if-eq v4, v3, :cond_25

    :cond_1a
    new-instance v0, Lch/qos/logback/core/util/CharSequenceState;

    invoke-direct {v0, v3}, Lch/qos/logback/core/util/CharSequenceState;-><init>(C)V

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_22
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_25
    invoke-virtual {v0}, Lch/qos/logback/core/util/CharSequenceState;->incrementOccurrences()V

    goto :goto_22

    :cond_29
    return-object v2
.end method


# virtual methods
.method public toRegex()Ljava/lang/String;
    .registers 5

    invoke-direct {p0}, Lch/qos/logback/core/util/DatePatternToRegexUtil;->tokenize()Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/util/CharSequenceState;

    iget-object v3, p0, Lch/qos/logback/core/util/DatePatternToRegexUtil;->regexMapper:Lch/qos/logback/core/util/CharSequenceToRegexMapper;

    invoke-virtual {v3, v0}, Lch/qos/logback/core/util/CharSequenceToRegexMapper;->toRegex(Lch/qos/logback/core/util/CharSequenceState;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_d

    :cond_23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
