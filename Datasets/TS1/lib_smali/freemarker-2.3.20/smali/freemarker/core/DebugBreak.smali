.class public Lfreemarker/core/DebugBreak;
.super Lfreemarker/core/TemplateElement;
.source "DebugBreak.java"


# direct methods
.method public constructor <init>(Lfreemarker/core/TemplateElement;)V
    .registers 2
    .param p1, "nestedBlock"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 66
    invoke-direct {p0}, Lfreemarker/core/TemplateElement;-><init>()V

    .line 67
    iput-object p1, p0, Lfreemarker/core/DebugBreak;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 68
    iput-object p0, p1, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    .line 69
    invoke-virtual {p0, p1}, Lfreemarker/core/DebugBreak;->copyLocationFrom(Lfreemarker/core/TemplateObject;)Lfreemarker/core/TemplateObject;

    .line 70
    return-void
.end method


# virtual methods
.method protected accept(Lfreemarker/core/Environment;)V
    .registers 4
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-virtual {p0}, Lfreemarker/core/DebugBreak;->getTemplate()Lfreemarker/template/Template;

    move-result-object v0

    invoke-virtual {v0}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/DebugBreak;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->getBeginLine()I

    move-result v1

    invoke-static {p1, v0, v1}, Lfreemarker/debug/impl/DebuggerService;->suspendEnvironment(Lfreemarker/core/Environment;Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_1a

    .line 76
    iget-object v0, p0, Lfreemarker/core/DebugBreak;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v0, p1}, Lfreemarker/core/TemplateElement;->accept(Lfreemarker/core/Environment;)V

    .line 82
    return-void

    .line 80
    :cond_1a
    new-instance v0, Lfreemarker/core/StopException;

    const-string v1, "Stopped by debugger"

    invoke-direct {v0, p1, v1}, Lfreemarker/core/StopException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    throw v0
.end method

.method protected dump(Z)Ljava/lang/String;
    .registers 4
    .param p1, "canonical"    # Z

    .prologue
    .line 85
    if-eqz p1, :cond_33

    .line 86
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 87
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string v1, "<#-- "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 88
    const-string v1, "debug break"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 89
    iget-object v1, p0, Lfreemarker/core/DebugBreak;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-nez v1, :cond_1f

    .line 90
    const-string v1, " /-->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 96
    :goto_1a
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 98
    .end local v0    # "sb":Ljava/lang/StringBuffer;
    :goto_1e
    return-object v1

    .line 92
    .restart local v0    # "sb":Ljava/lang/StringBuffer;
    :cond_1f
    const-string v1, " -->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 93
    iget-object v1, p0, Lfreemarker/core/DebugBreak;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 94
    const-string v1, "<#--/ debug break -->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1a

    .line 98
    .end local v0    # "sb":Ljava/lang/StringBuffer;
    :cond_33
    const-string v1, "debug break"

    goto :goto_1e
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 103
    const-string v0, "#debug_break"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 107
    const/4 v0, 0x0

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 115
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 111
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v0
.end method
