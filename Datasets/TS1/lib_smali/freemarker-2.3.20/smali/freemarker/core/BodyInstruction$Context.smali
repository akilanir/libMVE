.class Lfreemarker/core/BodyInstruction$Context;
.super Ljava/lang/Object;
.source "BodyInstruction.java"

# interfaces
.implements Lfreemarker/core/LocalContext;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/BodyInstruction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Context"
.end annotation


# instance fields
.field bodyVars:Lfreemarker/core/Environment$Namespace;

.field invokingMacroContext:Lfreemarker/core/Macro$Context;

.field private final this$0:Lfreemarker/core/BodyInstruction;


# direct methods
.method constructor <init>(Lfreemarker/core/BodyInstruction;Lfreemarker/core/Environment;)V
    .registers 9
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/BodyInstruction$Context;->this$0:Lfreemarker/core/BodyInstruction;

    .line 149
    invoke-virtual {p2}, Lfreemarker/core/Environment;->getCurrentMacroContext()Lfreemarker/core/Macro$Context;

    move-result-object v5

    iput-object v5, p0, Lfreemarker/core/BodyInstruction$Context;->invokingMacroContext:Lfreemarker/core/Macro$Context;

    .line 150
    iget-object v5, p0, Lfreemarker/core/BodyInstruction$Context;->invokingMacroContext:Lfreemarker/core/Macro$Context;

    iget-object v1, v5, Lfreemarker/core/Macro$Context;->bodyParameterNames:Ljava/util/List;

    .line 151
    .local v1, "bodyParameterNames":Ljava/util/List;
    invoke-static {p1}, Lfreemarker/core/BodyInstruction;->access$000(Lfreemarker/core/BodyInstruction;)Ljava/util/List;

    move-result-object v5

    if-eqz v5, :cond_52

    .line 152
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_16
    invoke-static {p1}, Lfreemarker/core/BodyInstruction;->access$000(Lfreemarker/core/BodyInstruction;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_52

    .line 153
    invoke-static {p1}, Lfreemarker/core/BodyInstruction;->access$000(Lfreemarker/core/BodyInstruction;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/core/Expression;

    .line 154
    .local v2, "exp":Lfreemarker/core/Expression;
    invoke-virtual {v2, p2}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    .line 155
    .local v4, "tm":Lfreemarker/template/TemplateModel;
    if-eqz v1, :cond_4f

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_4f

    .line 156
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 157
    .local v0, "bodyParameterName":Ljava/lang/String;
    iget-object v5, p0, Lfreemarker/core/BodyInstruction$Context;->bodyVars:Lfreemarker/core/Environment$Namespace;

    if-nez v5, :cond_4a

    .line 158
    new-instance v5, Lfreemarker/core/Environment$Namespace;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v5, p2}, Lfreemarker/core/Environment$Namespace;-><init>(Lfreemarker/core/Environment;)V

    iput-object v5, p0, Lfreemarker/core/BodyInstruction$Context;->bodyVars:Lfreemarker/core/Environment$Namespace;

    .line 160
    :cond_4a
    iget-object v5, p0, Lfreemarker/core/BodyInstruction$Context;->bodyVars:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v5, v0, v4}, Lfreemarker/core/Environment$Namespace;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 152
    .end local v0    # "bodyParameterName":Ljava/lang/String;
    :cond_4f
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    .line 164
    .end local v2    # "exp":Lfreemarker/core/Expression;
    .end local v3    # "i":I
    .end local v4    # "tm":Lfreemarker/template/TemplateModel;
    :cond_52
    return-void
.end method


# virtual methods
.method public getLocalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 167
    iget-object v0, p0, Lfreemarker/core/BodyInstruction$Context;->bodyVars:Lfreemarker/core/Environment$Namespace;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lfreemarker/core/BodyInstruction$Context;->bodyVars:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v0, p1}, Lfreemarker/core/Environment$Namespace;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_5
.end method

.method public getLocalVariableNames()Ljava/util/Collection;
    .registers 3

    .prologue
    .line 171
    iget-object v1, p0, Lfreemarker/core/BodyInstruction$Context;->invokingMacroContext:Lfreemarker/core/Macro$Context;

    iget-object v0, v1, Lfreemarker/core/Macro$Context;->bodyParameterNames:Ljava/util/List;

    .line 172
    .local v0, "bodyParameterNames":Ljava/util/List;
    if-nez v0, :cond_8

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .end local v0    # "bodyParameterNames":Ljava/util/List;
    :cond_8
    return-object v0
.end method
