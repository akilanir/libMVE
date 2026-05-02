.class public Lfreemarker/template/utility/CaptureOutput;
.super Ljava/lang/Object;
.source "CaptureOutput.java"

# interfaces
.implements Lfreemarker/template/TemplateTransformModel;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getWriter(Ljava/io/Writer;Ljava/util/Map;)Ljava/io/Writer;
    .registers 16
    .param p1, "out"    # Ljava/io/Writer;
    .param p2, "args"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 97
    const-string v9, "Must specify the name of the variable in which to capture the output with the \'var\' or \'local\' or \'global\' parameter."

    .line 99
    .local v9, "errmsg":Ljava/lang/String;
    if-nez p2, :cond_a

    new-instance v0, Lfreemarker/template/TemplateModelException;

    invoke-direct {v0, v9}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_a
    const/4 v11, 0x0

    .local v11, "local":Z
    const/4 v10, 0x0

    .line 102
    .local v10, "global":Z
    const-string v0, "namespace"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lfreemarker/template/TemplateModel;

    .line 103
    .local v8, "nsModel":Lfreemarker/template/TemplateModel;
    const-string v0, "var"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 104
    .local v12, "varNameModel":Ljava/lang/Object;
    if-nez v12, :cond_35

    .line 105
    const-string v0, "local"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 106
    if-nez v12, :cond_33

    .line 107
    const-string v0, "global"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 108
    const/4 v10, 0x1

    .line 112
    :goto_2b
    if-nez v12, :cond_35

    .line 113
    new-instance v0, Lfreemarker/template/TemplateModelException;

    invoke-direct {v0, v9}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 110
    :cond_33
    const/4 v11, 0x1

    goto :goto_2b

    .line 116
    :cond_35
    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_7f

    .line 117
    if-nez v8, :cond_46

    .line 118
    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v1, "Second parameter can only be namespace"

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 120
    :cond_46
    if-eqz v11, :cond_50

    .line 121
    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v1, "Cannot specify namespace for a local assignment"

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_50
    if-eqz v10, :cond_5a

    .line 124
    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v1, "Cannot specify namespace for a global assignment"

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 126
    :cond_5a
    instance-of v0, v8, Lfreemarker/core/Environment$Namespace;

    if-nez v0, :cond_8e

    .line 127
    new-instance v0, Lfreemarker/template/TemplateModelException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "namespace parameter does not specify a namespace. It is a "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 130
    :cond_7f
    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_8e

    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v1, "Bad parameters. Use only one of \'var\' or \'local\' or \'global\' parameters."

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 133
    :cond_8e
    instance-of v0, v12, Lfreemarker/template/TemplateScalarModel;

    if-nez v0, :cond_9a

    .line 134
    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v1, "\'var\' or \'local\' or \'global\' parameter doesn\'t evaluate to a string"

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 136
    :cond_9a
    check-cast v12, Lfreemarker/template/TemplateScalarModel;

    .end local v12    # "varNameModel":Ljava/lang/Object;
    invoke-interface {v12}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v6

    .line 137
    .local v6, "varName":Ljava/lang/String;
    if-nez v6, :cond_aa

    .line 138
    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v1, "\'var\' or \'local\' or \'global\' parameter evaluates to null string"

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 141
    :cond_aa
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 142
    .local v2, "buf":Ljava/lang/StringBuffer;
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v5

    .line 143
    .local v5, "env":Lfreemarker/core/Environment;
    move v4, v11

    .line 144
    .local v4, "localVar":Z
    move v7, v10

    .line 146
    .local v7, "globalVar":Z
    new-instance v0, Lfreemarker/template/utility/CaptureOutput$1;

    move-object v1, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v8}, Lfreemarker/template/utility/CaptureOutput$1;-><init>(Lfreemarker/template/utility/CaptureOutput;Ljava/lang/StringBuffer;Ljava/io/Writer;ZLfreemarker/core/Environment;Ljava/lang/String;ZLfreemarker/template/TemplateModel;)V

    return-object v0
.end method
