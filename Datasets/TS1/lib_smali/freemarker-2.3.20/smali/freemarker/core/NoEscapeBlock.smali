.class Lfreemarker/core/NoEscapeBlock;
.super Lfreemarker/core/TemplateElement;
.source "NoEscapeBlock.java"


# direct methods
.method constructor <init>(Lfreemarker/core/TemplateElement;)V
    .registers 2
    .param p1, "nestedBlock"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 64
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 65
    iput-object p1, p0, Lfreemarker/core/NoEscapeBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 66
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
    .line 69
    iget-object v0, p0, Lfreemarker/core/NoEscapeBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_9

    .line 70
    iget-object v0, p0, Lfreemarker/core/NoEscapeBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {p1, v0}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/TemplateElement;)V

    .line 72
    :cond_9
    return-void
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 5
    .param p1, "canonical"    # Z

    .prologue
    const/16 v2, 0x3e

    .line 75
    if-eqz p1, :cond_3c

    .line 76
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lfreemarker/core/NoEscapeBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/NoEscapeBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lfreemarker/core/NoEscapeBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 78
    :goto_3b
    return-object v0

    :cond_3c
    invoke-virtual {p0}, Lfreemarker/core/NoEscapeBlock;->getNodeTypeSymbol()Ljava/lang/String;

    move-result-object v0

    goto :goto_3b
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 95
    const-string v0, "#noescape"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 83
    const/4 v0, 0x0

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 91
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 87
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method
