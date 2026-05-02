.class public Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;
.super Lch/qos/logback/core/pattern/parser/FormattingNode;


# instance fields
.field optionList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(ILjava/lang/Object;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lch/qos/logback/core/pattern/parser/FormattingNode;-><init>(ILjava/lang/Object;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/Object;)V
    .registers 3

    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lch/qos/logback/core/pattern/parser/FormattingNode;-><init>(ILjava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    const/4 v0, 0x0

    invoke-super {p0, p1}, Lch/qos/logback/core/pattern/parser/FormattingNode;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    :cond_7
    :goto_7
    return v0

    :cond_8
    instance-of v1, p1, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;

    if-eqz v1, :cond_7

    check-cast p1, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;

    iget-object v1, p0, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->optionList:Ljava/util/List;

    if-eqz v1, :cond_1b

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->optionList:Ljava/util/List;

    iget-object v1, p1, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->optionList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_7

    :cond_1b
    iget-object v1, p1, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->optionList:Ljava/util/List;

    if-nez v1, :cond_7

    const/4 v0, 0x1

    goto :goto_7
.end method

.method public getOptions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->optionList:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    invoke-super {p0}, Lch/qos/logback/core/pattern/parser/FormattingNode;->hashCode()I

    move-result v0

    return v0
.end method

.method public setOptions(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->optionList:Ljava/util/List;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->optionList:Ljava/util/List;

    if-nez v1, :cond_3f

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "KeyWord("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->value:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->formatInfo:Lch/qos/logback/core/pattern/FormatInfo;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :goto_33
    invoke-virtual {p0}, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->printNext()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_3f
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "KeyWord("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->value:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->formatInfo:Lch/qos/logback/core/pattern/FormatInfo;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/pattern/parser/SimpleKeywordNode;->optionList:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_33
.end method
