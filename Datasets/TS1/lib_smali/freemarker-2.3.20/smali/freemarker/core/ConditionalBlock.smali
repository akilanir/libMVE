.class final Lfreemarker/core/ConditionalBlock;
.super Lfreemarker/core/TemplateElement;
.source "ConditionalBlock.java"


# static fields
.field static final TYPE_ELSE:I = 0x1

.field static final TYPE_ELSE_IF:I = 0x2

.field static final TYPE_IF:I


# instance fields
.field final condition:Lfreemarker/core/Expression;

.field isLonelyIf:Z

.field private final type:I


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/TemplateElement;I)V
    .registers 4
    .param p1, "condition"    # Lfreemarker/core/Expression;
    .param p2, "nestedBlock"    # Lfreemarker/core/TemplateElement;
    .param p3, "type"    # I

    .prologue
    .line 77
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 78
    iput-object p1, p0, Lfreemarker/core/ConditionalBlock;->condition:Lfreemarker/core/Expression;

    .line 79
    iput-object p2, p0, Lfreemarker/core/ConditionalBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 80
    iput p3, p0, Lfreemarker/core/ConditionalBlock;->type:I

    .line 81
    return-void
.end method


# virtual methods
.method accept(Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    iget-object v0, p0, Lfreemarker/core/ConditionalBlock;->condition:Lfreemarker/core/Expression;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lfreemarker/core/ConditionalBlock;->condition:Lfreemarker/core/Expression;

    invoke-virtual {v0, p1}, Lfreemarker/core/Expression;->evalToBoolean(Lfreemarker/core/Environment;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 85
    :cond_c
    iget-object v0, p0, Lfreemarker/core/ConditionalBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_15

    .line 86
    iget-object v0, p0, Lfreemarker/core/ConditionalBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->visitByHiddingParent(Lfreemarker/core/TemplateElement;)V

    .line 89
    :cond_15
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 92
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 93
    .local v0, "buf":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_c

    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 94
    :cond_c
    invoke-virtual {p0}, Lfreemarker/core/ConditionalBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 95
    iget-object v1, p0, Lfreemarker/core/ConditionalBlock;->condition:Lfreemarker/core/Expression;

    if-eqz v1, :cond_25

    .line 96
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 97
    iget-object v1, p0, Lfreemarker/core/ConditionalBlock;->condition:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 99
    :cond_25
    if-eqz p1, :cond_42

    .line 100
    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 101
    iget-object v1, p0, Lfreemarker/core/ConditionalBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v1, :cond_39

    .line 102
    iget-object v1, p0, Lfreemarker/core/ConditionalBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 104
    :cond_39
    iget-boolean v1, p0, Lfreemarker/core/ConditionalBlock;->isLonelyIf:Z

    if-eqz v1, :cond_42

    .line 105
    const-string v1, "</#if>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 108
    :cond_42
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 3

    .prologue
    .line 112
    iget v0, p0, Lfreemarker/core/ConditionalBlock;->type:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    .line 113
    const-string v0, "#else"

    .line 117
    :goto_7
    return-object v0

    .line 114
    :cond_8
    iget v0, p0, Lfreemarker/core/ConditionalBlock;->type:I

    if-nez v0, :cond_f

    .line 115
    const-string v0, "#if"

    goto :goto_7

    .line 116
    :cond_f
    iget v0, p0, Lfreemarker/core/ConditionalBlock;->type:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_17

    .line 117
    const-string v0, "#elseif"

    goto :goto_7

    .line 119
    :cond_17
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Unknown type"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 124
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 136
    packed-switch p1, :pswitch_data_10

    .line 139
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 137
    :pswitch_9
    sget-object v0, Lfreemarker/core/ParameterRole;->CONDITION:Lfreemarker/core/ParameterRole;

    .line 138
    :goto_b
    return-object v0

    :pswitch_c
    sget-object v0, Lfreemarker/core/ParameterRole;->AST_NODE_SUBTYPE:Lfreemarker/core/ParameterRole;

    goto :goto_b

    .line 136
    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 4
    .param p1, "idx"    # I

    .prologue
    .line 128
    packed-switch p1, :pswitch_data_14

    .line 131
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0

    .line 129
    :pswitch_9
    iget-object v0, p0, Lfreemarker/core/ConditionalBlock;->condition:Lfreemarker/core/Expression;

    .line 130
    :goto_b
    return-object v0

    :pswitch_c
    new-instance v0, Ljava/lang/Integer;

    iget v1, p0, Lfreemarker/core/ConditionalBlock;->type:I

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_b

    .line 128
    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_9
        :pswitch_c
    .end packed-switch
.end method
