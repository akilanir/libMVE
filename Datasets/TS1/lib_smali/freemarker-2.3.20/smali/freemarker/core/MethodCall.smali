.class final Lfreemarker/core/MethodCall;
.super Lfreemarker/core/Expression;
.source "MethodCall.java"


# instance fields
.field private final arguments:Lfreemarker/core/ListLiteral;

.field private final target:Lfreemarker/core/Expression;


# direct methods
.method private constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/ListLiteral;)V
    .registers 3
    .param p1, "target"    # Lfreemarker/core/Expression;
    .param p2, "arguments"    # Lfreemarker/core/ListLiteral;

    .prologue
    .line 84
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 85
    iput-object p1, p0, Lfreemarker/core/MethodCall;->target:Lfreemarker/core/Expression;

    .line 86
    iput-object p2, p0, Lfreemarker/core/MethodCall;->arguments:Lfreemarker/core/ListLiteral;

    .line 87
    return-void
.end method

.method constructor <init>(Lfreemarker/core/Expression;Ljava/util/ArrayList;)V
    .registers 4
    .param p1, "target"    # Lfreemarker/core/Expression;
    .param p2, "arguments"    # Ljava/util/ArrayList;

    .prologue
    .line 81
    new-instance v0, Lfreemarker/core/ListLiteral;

    invoke-direct {v0, p2}, Lfreemarker/core/ListLiteral;-><init>(Ljava/util/ArrayList;)V

    invoke-direct {p0, p1, v0}, Lfreemarker/core/MethodCall;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/ListLiteral;)V

    .line 82
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 14
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 91
    iget-object v0, p0, Lfreemarker/core/MethodCall;->target:Lfreemarker/core/Expression;

    invoke-virtual {v0, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v11

    .line 92
    .local v11, "targetModel":Lfreemarker/template/TemplateModel;
    instance-of v0, v11, Lfreemarker/template/TemplateMethodModel;

    if-eqz v0, :cond_2c

    move-object v10, v11

    .line 93
    check-cast v10, Lfreemarker/template/TemplateMethodModel;

    .line 94
    .local v10, "targetMethod":Lfreemarker/template/TemplateMethodModel;
    instance-of v0, v10, Lfreemarker/template/TemplateMethodModelEx;

    if-eqz v0, :cond_25

    iget-object v0, p0, Lfreemarker/core/MethodCall;->arguments:Lfreemarker/core/ListLiteral;

    invoke-virtual {v0, p1}, Lfreemarker/core/ListLiteral;->getModelList(Lfreemarker/core/Environment;)Ljava/util/List;

    move-result-object v6

    .line 98
    .local v6, "argumentStrings":Ljava/util/List;
    :goto_18
    invoke-interface {v10, v6}, Lfreemarker/template/TemplateMethodModel;->exec(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v9

    .line 99
    .local v9, "result":Ljava/lang/Object;
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v0

    invoke-interface {v0, v9}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 116
    .end local v6    # "argumentStrings":Ljava/util/List;
    .end local v9    # "result":Ljava/lang/Object;
    .end local v10    # "targetMethod":Lfreemarker/template/TemplateMethodModel;
    :goto_24
    return-object v0

    .line 94
    .restart local v10    # "targetMethod":Lfreemarker/template/TemplateMethodModel;
    :cond_25
    iget-object v0, p0, Lfreemarker/core/MethodCall;->arguments:Lfreemarker/core/ListLiteral;

    invoke-virtual {v0, p1}, Lfreemarker/core/ListLiteral;->getValueList(Lfreemarker/core/Environment;)Ljava/util/List;

    move-result-object v6

    goto :goto_18

    .line 101
    .end local v10    # "targetMethod":Lfreemarker/template/TemplateMethodModel;
    :cond_2c
    instance-of v0, v11, Lfreemarker/core/Macro;

    if-eqz v0, :cond_6c

    move-object v1, v11

    .line 102
    check-cast v1, Lfreemarker/core/Macro;

    .line 103
    .local v1, "func":Lfreemarker/core/Macro;
    invoke-virtual {p1, v2}, Lfreemarker/core/Environment;->setLastReturnValue(Lfreemarker/template/TemplateModel;)V

    .line 104
    iget-boolean v0, v1, Lfreemarker/core/Macro;->isFunction:Z

    if-nez v0, :cond_42

    .line 105
    new-instance v0, Lfreemarker/core/_MiscTemplateException;

    const-string v2, "A macro cannot be called in an expression."

    invoke-direct {v0, p1, v2}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    throw v0

    .line 107
    :cond_42
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getOut()Ljava/io/Writer;

    move-result-object v8

    .line 109
    .local v8, "prevOut":Ljava/io/Writer;
    :try_start_46
    sget-object v0, Lfreemarker/template/utility/NullWriter;->INSTANCE:Lfreemarker/template/utility/NullWriter;

    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->setOut(Ljava/io/Writer;)V

    .line 110
    const/4 v2, 0x0

    iget-object v0, p0, Lfreemarker/core/MethodCall;->arguments:Lfreemarker/core/ListLiteral;

    iget-object v3, v0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/Macro;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Lfreemarker/core/TemplateElement;)V
    :try_end_56
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_56} :catch_5e
    .catchall {:try_start_46 .. :try_end_56} :catchall_67

    .line 114
    invoke-virtual {p1, v8}, Lfreemarker/core/Environment;->setOut(Ljava/io/Writer;)V

    .line 116
    invoke-virtual {p1}, Lfreemarker/core/Environment;->getLastReturnValue()Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_24

    .line 111
    :catch_5e
    move-exception v7

    .line 112
    .local v7, "ioe":Ljava/io/IOException;
    :try_start_5f
    new-instance v0, Ljava/lang/InternalError;

    const-string v2, "This should be impossible."

    invoke-direct {v0, v2}, Ljava/lang/InternalError;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_67
    .catchall {:try_start_5f .. :try_end_67} :catchall_67

    .line 114
    .end local v7    # "ioe":Ljava/io/IOException;
    :catchall_67
    move-exception v0

    invoke-virtual {p1, v8}, Lfreemarker/core/Environment;->setOut(Ljava/io/Writer;)V

    throw v0

    .line 119
    .end local v1    # "func":Lfreemarker/core/Macro;
    .end local v8    # "prevOut":Ljava/io/Writer;
    :cond_6c
    new-instance v0, Lfreemarker/core/UnexpectedTypeException;

    iget-object v2, p0, Lfreemarker/core/MethodCall;->target:Lfreemarker/core/Expression;

    const-string v3, "method"

    invoke-direct {v0, v2, v11, v3, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v0
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 7
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 147
    new-instance v1, Lfreemarker/core/MethodCall;

    iget-object v0, p0, Lfreemarker/core/MethodCall;->target:Lfreemarker/core/Expression;

    invoke-virtual {v0, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v2

    iget-object v0, p0, Lfreemarker/core/MethodCall;->arguments:Lfreemarker/core/ListLiteral;

    invoke-virtual {v0, p1, p2, p3}, Lfreemarker/core/ListLiteral;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v0

    check-cast v0, Lfreemarker/core/ListLiteral;

    invoke-direct {v1, v2, v0}, Lfreemarker/core/MethodCall;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/ListLiteral;)V

    return-object v1
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 5

    .prologue
    .line 124
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 125
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v2, p0, Lfreemarker/core/MethodCall;->target:Lfreemarker/core/Expression;

    invoke-virtual {v2}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 126
    const-string v2, "("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 127
    iget-object v2, p0, Lfreemarker/core/MethodCall;->arguments:Lfreemarker/core/ListLiteral;

    invoke-virtual {v2}, Lfreemarker/core/ListLiteral;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    .line 128
    .local v1, "list":Ljava/lang/String;
    const/4 v2, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 129
    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method getConstantValue()Lfreemarker/template/TemplateModel;
    .registers 2

    .prologue
    .line 138
    const/4 v0, 0x0

    return-object v0
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 134
    const-string v0, "...(...)"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lfreemarker/core/MethodCall;->arguments:Lfreemarker/core/ListLiteral;

    iget-object v0, v0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 167
    if-nez p1, :cond_5

    .line 168
    sget-object v0, Lfreemarker/core/ParameterRole;->CALLEE:Lfreemarker/core/ParameterRole;

    .line 170
    :goto_4
    return-object v0

    .line 169
    :cond_5
    invoke-virtual {p0}, Lfreemarker/core/MethodCall;->getParameterCount()I

    move-result v0

    if-ge p1, v0, :cond_e

    .line 170
    sget-object v0, Lfreemarker/core/ParameterRole;->ARGUMENT_VALUE:Lfreemarker/core/ParameterRole;

    goto :goto_4

    .line 172
    :cond_e
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 4
    .param p1, "idx"    # I

    .prologue
    .line 157
    if-nez p1, :cond_5

    .line 158
    iget-object v0, p0, Lfreemarker/core/MethodCall;->target:Lfreemarker/core/Expression;

    .line 160
    :goto_4
    return-object v0

    .line 159
    :cond_5
    invoke-virtual {p0}, Lfreemarker/core/MethodCall;->getParameterCount()I

    move-result v0

    if-ge p1, v0, :cond_16

    .line 160
    iget-object v0, p0, Lfreemarker/core/MethodCall;->arguments:Lfreemarker/core/ListLiteral;

    iget-object v0, v0, Lfreemarker/core/ListLiteral;->items:Ljava/util/ArrayList;

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_4

    .line 162
    :cond_16
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 142
    const/4 v0, 0x0

    return v0
.end method
