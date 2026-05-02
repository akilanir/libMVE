.class final Lfreemarker/core/IfBlock;
.super Lfreemarker/core/TemplateElement;
.source "IfBlock.java"


# direct methods
.method constructor <init>(Lfreemarker/core/ConditionalBlock;)V
    .registers 3
    .param p1, "block"    # Lfreemarker/core/ConditionalBlock;

    .prologue
    .line 68
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/core/IfBlock;->nestedElements:Ljava/util/List;

    .line 70
    invoke-virtual {p0, p1}, Lfreemarker/core/IfBlock;->addBlock(Lfreemarker/core/ConditionalBlock;)V

    .line 71
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 6
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v3, p0, Lfreemarker/core/IfBlock;->nestedElements:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_27

    .line 79
    iget-object v3, p0, Lfreemarker/core/IfBlock;->nestedElements:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/ConditionalBlock;

    .line 80
    .local v0, "cblock":Lfreemarker/core/ConditionalBlock;
    iget-object v1, v0, Lfreemarker/core/ConditionalBlock;->condition:Lfreemarker/core/Expression;

    .line 81
    .local v1, "condition":Lfreemarker/core/Expression;
    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->replaceElemetStackTop(Lfreemarker/core/TemplateElement;)V

    .line 82
    if-eqz v1, :cond_1e

    invoke-virtual {v1, p1}, Lfreemarker/core/Expression;->evalToBoolean(Lfreemarker/core/Environment;)Z

    move-result v3

    if-eqz v3, :cond_28

    .line 83
    :cond_1e
    iget-object v3, v0, Lfreemarker/core/ConditionalBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v3, :cond_27

    .line 84
    iget-object v3, v0, Lfreemarker/core/ConditionalBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {p1, v3}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/TemplateElement;)V

    .line 89
    .end local v0    # "cblock":Lfreemarker/core/ConditionalBlock;
    .end local v1    # "condition":Lfreemarker/core/Expression;
    :cond_27
    return-void

    .line 78
    .restart local v0    # "cblock":Lfreemarker/core/ConditionalBlock;
    .restart local v1    # "condition":Lfreemarker/core/Expression;
    :cond_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method addBlock(Lfreemarker/core/ConditionalBlock;)V
    .registers 3
    .param p1, "block"    # Lfreemarker/core/ConditionalBlock;

    .prologue
    .line 74
    iget-object v0, p0, Lfreemarker/core/IfBlock;->nestedElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 6
    .param p1, "canonical"    # Z

    .prologue
    .line 106
    if-eqz p1, :cond_2c

    .line 107
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 108
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    iget-object v3, p0, Lfreemarker/core/IfBlock;->nestedElements:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_22

    .line 109
    iget-object v3, p0, Lfreemarker/core/IfBlock;->nestedElements:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/core/ConditionalBlock;

    .line 110
    .local v1, "cblock":Lfreemarker/core/ConditionalBlock;
    invoke-virtual {v1, p1}, Lfreemarker/core/ConditionalBlock;->dump(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 108
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 112
    .end local v1    # "cblock":Lfreemarker/core/ConditionalBlock;
    :cond_22
    const-string v3, "</#if>"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 113
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 115
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v2    # "i":I
    :goto_2b
    return-object v3

    :cond_2c
    invoke-virtual {p0}, Lfreemarker/core/IfBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v3

    goto :goto_2b
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 120
    const-string v0, "#if-#elseif-#else-container"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 124
    const/4 v0, 0x0

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 132
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 128
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method isShownInStackTrace()Z
    .registers 2

    .prologue
    .line 136
    const/4 v0, 0x0

    return v0
.end method

.method postParseCleanup(Z)Lfreemarker/core/TemplateElement;
    .registers 6
    .param p1, "stripWhitespace"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 94
    iget-object v1, p0, Lfreemarker/core/IfBlock;->nestedElements:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v3, :cond_20

    .line 95
    iget-object v1, p0, Lfreemarker/core/IfBlock;->nestedElements:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/ConditionalBlock;

    .line 96
    .local v0, "cblock":Lfreemarker/core/ConditionalBlock;
    iput-boolean v3, v0, Lfreemarker/core/ConditionalBlock;->isLonelyIf:Z

    .line 97
    invoke-virtual {p0}, Lfreemarker/core/IfBlock;->getTemplate()Lfreemarker/template/Template;

    move-result-object v1

    invoke-virtual {v0, v1, v0, p0}, Lfreemarker/core/ConditionalBlock;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    .line 98
    invoke-virtual {v0, p1}, Lfreemarker/core/ConditionalBlock;->postParseCleanup(Z)Lfreemarker/core/TemplateElement;

    move-result-object v1

    .line 101
    .end local v0    # "cblock":Lfreemarker/core/ConditionalBlock;
    :goto_1f
    return-object v1

    :cond_20
    invoke-super {p0, p1}, Lfreemarker/core/TemplateElement;->postParseCleanup(Z)Lfreemarker/core/TemplateElement;

    move-result-object v1

    goto :goto_1f
.end method
