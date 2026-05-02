.class final Lfreemarker/core/CompressedBlock;
.super Lfreemarker/core/TemplateElement;
.source "CompressedBlock.java"


# direct methods
.method constructor <init>(Lfreemarker/core/TemplateElement;)V
    .registers 2
    .param p1, "nestedBlock"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 67
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 68
    iput-object p1, p0, Lfreemarker/core/CompressedBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 69
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
    .line 72
    iget-object v0, p0, Lfreemarker/core/CompressedBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_c

    .line 73
    iget-object v0, p0, Lfreemarker/core/CompressedBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    sget-object v1, Lfreemarker/template/utility/StandardCompress;->INSTANCE:Lfreemarker/template/utility/StandardCompress;

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lfreemarker/core/Environment;->visitAndTransform(Lfreemarker/core/TemplateElement;Lfreemarker/template/TemplateTransformModel;Ljava/util/Map;)V

    .line 75
    :cond_c
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 5
    .param p1, "canonical"    # Z

    .prologue
    .line 78
    if-eqz p1, :cond_45

    .line 79
    iget-object v1, p0, Lfreemarker/core/CompressedBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v1, :cond_42

    iget-object v1, p0, Lfreemarker/core/CompressedBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v0

    .line 80
    .local v0, "nested":Ljava/lang/String;
    :goto_c
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "<"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lfreemarker/core/CompressedBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "</"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lfreemarker/core/CompressedBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 82
    .end local v0    # "nested":Ljava/lang/String;
    :goto_41
    return-object v1

    .line 79
    :cond_42
    const-string v0, ""

    goto :goto_c

    .line 82
    :cond_45
    invoke-virtual {p0}, Lfreemarker/core/CompressedBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    goto :goto_41
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 87
    const-string v0, "#compress"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 91
    const/4 v0, 0x0

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 99
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 95
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method isIgnorable()Z
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lfreemarker/core/CompressedBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lfreemarker/core/CompressedBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v0}, Lfreemarker/core/TemplateElement;->isIgnorable()Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method
