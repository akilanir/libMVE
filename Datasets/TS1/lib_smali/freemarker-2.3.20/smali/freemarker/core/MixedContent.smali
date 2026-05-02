.class final Lfreemarker/core/MixedContent;
.super Lfreemarker/core/TemplateElement;
.source "MixedContent.java"


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 66
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/core/MixedContent;->nestedElements:Ljava/util/List;

    .line 68
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 5
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v2, p0, Lfreemarker/core/MixedContent;->nestedElements:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_17

    .line 92
    iget-object v2, p0, Lfreemarker/core/MixedContent;->nestedElements:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/TemplateElement;

    .line 93
    .local v0, "element":Lfreemarker/core/TemplateElement;
    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/TemplateElement;)V

    .line 91
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 95
    .end local v0    # "element":Lfreemarker/core/TemplateElement;
    :cond_17
    return-void
.end method

.method addElement(Lfreemarker/core/TemplateElement;)V
    .registers 3
    .param p1, "element"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 71
    iget-object v0, p0, Lfreemarker/core/MixedContent;->nestedElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 6
    .param p1, "canonical"    # Z

    .prologue
    .line 98
    if-eqz p1, :cond_27

    .line 99
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 100
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    iget-object v3, p0, Lfreemarker/core/MixedContent;->nestedElements:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_22

    .line 101
    iget-object v3, p0, Lfreemarker/core/MixedContent;->nestedElements:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/core/TemplateElement;

    .line 102
    .local v1, "element":Lfreemarker/core/TemplateElement;
    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 100
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 104
    .end local v1    # "element":Lfreemarker/core/TemplateElement;
    :cond_22
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 109
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v2    # "i":I
    :goto_26
    return-object v3

    .line 106
    :cond_27
    iget-object v3, p0, Lfreemarker/core/MixedContent;->parent:Lfreemarker/core/TemplateElement;

    if-nez v3, :cond_2e

    .line 107
    const-string v3, "root"

    goto :goto_26

    .line 109
    :cond_2e
    invoke-virtual {p0}, Lfreemarker/core/MixedContent;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v3

    goto :goto_26
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 114
    const-string v0, "#mixed_content"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 118
    const/4 v0, 0x0

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 126
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 122
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method isIgnorable()Z
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lfreemarker/core/MixedContent;->nestedElements:Ljava/util/List;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lfreemarker/core/MixedContent;->nestedElements:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method isShownInStackTrace()Z
    .registers 2

    .prologue
    .line 130
    const/4 v0, 0x0

    return v0
.end method

.method postParseCleanup(Z)Lfreemarker/core/TemplateElement;
    .registers 4
    .param p1, "stripWhitespace"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-super {p0, p1}, Lfreemarker/core/TemplateElement;->postParseCleanup(Z)Lfreemarker/core/TemplateElement;

    .line 78
    iget-object v0, p0, Lfreemarker/core/MixedContent;->nestedElements:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_16

    .line 79
    iget-object v0, p0, Lfreemarker/core/MixedContent;->nestedElements:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/TemplateElement;

    .line 81
    :goto_15
    return-object v0

    :cond_16
    move-object v0, p0

    goto :goto_15
.end method
