.class final Lfreemarker/core/VisitNode;
.super Lfreemarker/core/TemplateElement;
.source "VisitNode.java"


# instance fields
.field namespaces:Lfreemarker/core/Expression;

.field targetNode:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V
    .registers 3
    .param p1, "targetNode"    # Lfreemarker/core/Expression;
    .param p2, "namespaces"    # Lfreemarker/core/Expression;

    .prologue
    .line 72
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 73
    iput-object p1, p0, Lfreemarker/core/VisitNode;->targetNode:Lfreemarker/core/Expression;

    .line 74
    iput-object p2, p0, Lfreemarker/core/VisitNode;->namespaces:Lfreemarker/core/Expression;

    .line 75
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 8
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 78
    iget-object v4, p0, Lfreemarker/core/VisitNode;->targetNode:Lfreemarker/core/Expression;

    invoke-virtual {v4, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 79
    .local v0, "node":Lfreemarker/template/TemplateModel;
    instance-of v4, v0, Lfreemarker/template/TemplateNodeModel;

    if-nez v4, :cond_15

    .line 80
    new-instance v3, Lfreemarker/core/UnexpectedTypeException;

    iget-object v4, p0, Lfreemarker/core/VisitNode;->targetNode:Lfreemarker/core/Expression;

    const-string v5, "node"

    invoke-direct {v3, v4, v0, v5, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v3

    .line 83
    :cond_15
    iget-object v4, p0, Lfreemarker/core/VisitNode;->namespaces:Lfreemarker/core/Expression;

    if-nez v4, :cond_42

    move-object v1, v3

    .line 84
    .local v1, "nss":Lfreemarker/template/TemplateModel;
    :goto_1a
    iget-object v4, p0, Lfreemarker/core/VisitNode;->namespaces:Lfreemarker/core/Expression;

    instance-of v4, v4, Lfreemarker/core/StringLiteral;

    if-eqz v4, :cond_49

    .line 85
    check-cast v1, Lfreemarker/template/TemplateScalarModel;

    .end local v1    # "nss":Lfreemarker/template/TemplateModel;
    invoke-interface {v1}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4, v3}, Lfreemarker/core/Environment;->importLib(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/core/Environment$Namespace;

    move-result-object v1

    .line 90
    .restart local v1    # "nss":Lfreemarker/template/TemplateModel;
    :cond_2a
    :goto_2a
    if-eqz v1, :cond_3a

    .line 91
    instance-of v3, v1, Lfreemarker/core/Environment$Namespace;

    if-eqz v3, :cond_58

    .line 92
    new-instance v2, Lfreemarker/template/SimpleSequence;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleSequence;-><init>(I)V

    .line 93
    .local v2, "ss":Lfreemarker/template/SimpleSequence;
    invoke-virtual {v2, v1}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V

    .line 94
    move-object v1, v2

    .line 105
    .end local v2    # "ss":Lfreemarker/template/SimpleSequence;
    :cond_3a
    check-cast v0, Lfreemarker/template/TemplateNodeModel;

    .end local v0    # "node":Lfreemarker/template/TemplateModel;
    check-cast v1, Lfreemarker/template/TemplateSequenceModel;

    .end local v1    # "nss":Lfreemarker/template/TemplateModel;
    invoke-virtual {p1, v0, v1}, Lfreemarker/core/Environment;->visit(Lfreemarker/template/TemplateNodeModel;Lfreemarker/template/TemplateSequenceModel;)V

    .line 106
    return-void

    .line 83
    .restart local v0    # "node":Lfreemarker/template/TemplateModel;
    :cond_42
    iget-object v4, p0, Lfreemarker/core/VisitNode;->namespaces:Lfreemarker/core/Expression;

    invoke-virtual {v4, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    goto :goto_1a

    .line 87
    .restart local v1    # "nss":Lfreemarker/template/TemplateModel;
    :cond_49
    iget-object v3, p0, Lfreemarker/core/VisitNode;->namespaces:Lfreemarker/core/Expression;

    instance-of v3, v3, Lfreemarker/core/ListLiteral;

    if-eqz v3, :cond_2a

    .line 88
    iget-object v3, p0, Lfreemarker/core/VisitNode;->namespaces:Lfreemarker/core/Expression;

    check-cast v3, Lfreemarker/core/ListLiteral;

    invoke-virtual {v3, p1}, Lfreemarker/core/ListLiteral;->evaluateStringsToNamespaces(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateSequenceModel;

    move-result-object v1

    goto :goto_2a

    .line 96
    :cond_58
    instance-of v3, v1, Lfreemarker/template/TemplateSequenceModel;

    if-nez v3, :cond_3a

    .line 97
    iget-object v3, p0, Lfreemarker/core/VisitNode;->namespaces:Lfreemarker/core/Expression;

    if-eqz v3, :cond_6a

    .line 98
    new-instance v3, Lfreemarker/core/UnexpectedTypeException;

    iget-object v4, p0, Lfreemarker/core/VisitNode;->namespaces:Lfreemarker/core/Expression;

    const-string v5, "sequence"

    invoke-direct {v3, v4, v1, v5, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v3

    .line 101
    :cond_6a
    new-instance v3, Lfreemarker/core/_MiscTemplateException;

    const-string v4, "Expecting a sequence of namespaces after \"using\""

    invoke-direct {v3, p1, v4}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    throw v3
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 109
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 110
    .local v0, "sb":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_c

    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 111
    :cond_c
    invoke-virtual {p0}, Lfreemarker/core/VisitNode;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 112
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 113
    iget-object v1, p0, Lfreemarker/core/VisitNode;->targetNode:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 114
    iget-object v1, p0, Lfreemarker/core/VisitNode;->namespaces:Lfreemarker/core/Expression;

    if-eqz v1, :cond_33

    .line 115
    const-string v1, " using "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 116
    iget-object v1, p0, Lfreemarker/core/VisitNode;->namespaces:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 118
    :cond_33
    if-eqz p1, :cond_3a

    const-string v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 119
    :cond_3a
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 123
    const-string v0, "#visit"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 127
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 139
    packed-switch p1, :pswitch_data_10

    .line 142
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 140
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->NODE:Lfreemarker/core/ParameterRole;

    .line 141
    :goto_b
    return-object v0

    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->NAMESPACE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 139
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 131
    packed-switch p1, :pswitch_data_10

    .line 134
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 132
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/VisitNode;->targetNode:Lfreemarker/core/Expression;

    .line 133
    :goto_b
    return-object v0

    :pswitch_c
    iget-object v0, p0, Lfreemarker/core/VisitNode;->namespaces:Lfreemarker/core/Expression;

    goto :goto_b

    .line 131
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method
