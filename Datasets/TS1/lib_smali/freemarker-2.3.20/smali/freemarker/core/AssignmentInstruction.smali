.class final Lfreemarker/core/AssignmentInstruction;
.super Lfreemarker/core/TemplateElement;
.source "AssignmentInstruction.java"


# instance fields
.field private namespaceExp:Lfreemarker/core/Expression;

.field private scope:I


# direct methods
.method constructor <init>(I)V
    .registers 4
    .param p1, "scope"    # I

    .prologue
    .line 70
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 71
    iput p1, p0, Lfreemarker/core/AssignmentInstruction;->scope:I

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lfreemarker/core/AssignmentInstruction;->nestedElements:Ljava/util/List;

    .line 73
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
    .line 87
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v2, p0, Lfreemarker/core/AssignmentInstruction;->nestedElements:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_17

    .line 88
    iget-object v2, p0, Lfreemarker/core/AssignmentInstruction;->nestedElements:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Assignment;

    .line 89
    .local v0, "ass":Lfreemarker/core/Assignment;
    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/TemplateElement;)V

    .line 87
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 91
    .end local v0    # "ass":Lfreemarker/core/Assignment;
    :cond_17
    return-void
.end method

.method addAssignment(Lfreemarker/core/Assignment;)V
    .registers 3
    .param p1, "ass"    # Lfreemarker/core/Assignment;

    .prologue
    .line 76
    iget-object v0, p0, Lfreemarker/core/AssignmentInstruction;->nestedElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 6
    .param p1, "canonical"    # Z

    .prologue
    .line 94
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 95
    .local v1, "buf":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_c

    const/16 v3, 0x3c

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 96
    :cond_c
    iget v3, p0, Lfreemarker/core/AssignmentInstruction;->scope:I

    invoke-static {v3}, Lfreemarker/core/Assignment;->getDirectiveName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 97
    if-eqz p1, :cond_46

    .line 98
    const/16 v3, 0x20

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 99
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1d
    iget-object v3, p0, Lfreemarker/core/AssignmentInstruction;->nestedElements:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_4b

    .line 100
    iget-object v3, p0, Lfreemarker/core/AssignmentInstruction;->nestedElements:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Assignment;

    .line 101
    .local v0, "ass":Lfreemarker/core/Assignment;
    invoke-virtual {v0}, Lfreemarker/core/Assignment;->getCanonicalForm()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 102
    iget-object v3, p0, Lfreemarker/core/AssignmentInstruction;->nestedElements:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v2, v3, :cond_43

    .line 103
    const-string v3, " "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 99
    :cond_43
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    .line 107
    .end local v0    # "ass":Lfreemarker/core/Assignment;
    .end local v2    # "i":I
    :cond_46
    const-string v3, "-container"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 109
    :cond_4b
    iget-object v3, p0, Lfreemarker/core/AssignmentInstruction;->namespaceExp:Lfreemarker/core/Expression;

    if-eqz v3, :cond_5d

    .line 110
    const-string v3, " in "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 111
    iget-object v3, p0, Lfreemarker/core/AssignmentInstruction;->namespaceExp:Lfreemarker/core/Expression;

    invoke-virtual {v3}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 113
    :cond_5d
    if-eqz p1, :cond_64

    const-string v3, "/>"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 114
    :cond_64
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 138
    iget v0, p0, Lfreemarker/core/AssignmentInstruction;->scope:I

    invoke-static {v0}, Lfreemarker/core/Assignment;->getDirectiveName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 118
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 130
    packed-switch p1, :pswitch_data_c

    .line 133
    const/4 v0, 0x0

    :goto_4
    return-object v0

    .line 131
    :pswitch_5
    sget-object v0, Lfreemarker/core/ParameterRole;->VARIABLE_SCOPE:Lfreemarker/core/ParameterRole;

    goto :goto_4

    .line 132
    :pswitch_8
    sget-object v0, Lfreemarker/core/ParameterRole;->NAMESPACE:Lfreemarker/core/ParameterRole;

    goto :goto_4

    .line 130
    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_5
        :pswitch_8
    .end packed-switch
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 4
    .param p1, "idx"    # I

    .prologue
    .line 122
    packed-switch p1, :pswitch_data_10

    .line 125
    const/4 v0, 0x0

    :goto_4
    return-object v0

    .line 123
    :pswitch_5
    new-instance v0, Ljava/lang/Integer;

    iget v1, p0, Lfreemarker/core/AssignmentInstruction;->scope:I

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_4

    .line 124
    :pswitch_d
    iget-object v0, p0, Lfreemarker/core/AssignmentInstruction;->namespaceExp:Lfreemarker/core/Expression;

    goto :goto_4

    .line 122
    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_5
        :pswitch_d
    .end packed-switch
.end method

.method public postParseCleanup(Z)Lfreemarker/core/TemplateElement;
    .registers 5
    .param p1, "stripWhitespace"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-super {p0, p1}, Lfreemarker/core/TemplateElement;->postParseCleanup(Z)Lfreemarker/core/TemplateElement;

    .line 143
    iget-object v1, p0, Lfreemarker/core/AssignmentInstruction;->nestedElements:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1d

    .line 144
    iget-object v1, p0, Lfreemarker/core/AssignmentInstruction;->nestedElements:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Assignment;

    .line 145
    .local v0, "ass":Lfreemarker/core/Assignment;
    invoke-virtual {p0}, Lfreemarker/core/AssignmentInstruction;->getTemplate()Lfreemarker/template/Template;

    move-result-object v1

    invoke-virtual {v0, v1, p0, p0}, Lfreemarker/core/Assignment;->setLocation(Lfreemarker/template/Template;Lfreemarker/core/TemplateObject;Lfreemarker/core/TemplateObject;)V

    .line 148
    .end local v0    # "ass":Lfreemarker/core/Assignment;
    :goto_1c
    return-object v0

    :cond_1d
    move-object v0, p0

    goto :goto_1c
.end method

.method setNamespaceExp(Lfreemarker/core/Expression;)V
    .registers 4
    .param p1, "namespaceExp"    # Lfreemarker/core/Expression;

    .prologue
    .line 80
    iput-object p1, p0, Lfreemarker/core/AssignmentInstruction;->namespaceExp:Lfreemarker/core/Expression;

    .line 81
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    iget-object v1, p0, Lfreemarker/core/AssignmentInstruction;->nestedElements:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_19

    .line 82
    iget-object v1, p0, Lfreemarker/core/AssignmentInstruction;->nestedElements:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/core/Assignment;

    invoke-virtual {v1, p1}, Lfreemarker/core/Assignment;->setNamespaceExp(Lfreemarker/core/Expression;)V

    .line 81
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 84
    :cond_19
    return-void
.end method
