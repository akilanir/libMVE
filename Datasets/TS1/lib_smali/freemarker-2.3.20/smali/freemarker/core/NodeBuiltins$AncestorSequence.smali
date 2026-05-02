.class Lfreemarker/core/NodeBuiltins$AncestorSequence;
.super Lfreemarker/template/SimpleSequence;
.source "NodeBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/NodeBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AncestorSequence"
.end annotation


# instance fields
.field private env:Lfreemarker/core/Environment;


# direct methods
.method constructor <init>(Lfreemarker/core/Environment;)V
    .registers 2
    .param p1, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 150
    invoke-direct {p0}, Lfreemarker/template/SimpleSequence;-><init>()V

    .line 151
    iput-object p1, p0, Lfreemarker/core/NodeBuiltins$AncestorSequence;->env:Lfreemarker/core/Environment;

    .line 152
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 10
    .param p1, "names"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 155
    if-eqz p1, :cond_8

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_a

    :cond_8
    move-object v4, p0

    .line 176
    :cond_9
    return-object v4

    .line 158
    :cond_a
    new-instance v4, Lfreemarker/core/NodeBuiltins$AncestorSequence;

    iget-object v6, p0, Lfreemarker/core/NodeBuiltins$AncestorSequence;->env:Lfreemarker/core/Environment;

    invoke-direct {v4, v6}, Lfreemarker/core/NodeBuiltins$AncestorSequence;-><init>(Lfreemarker/core/Environment;)V

    .line 159
    .local v4, "result":Lfreemarker/core/NodeBuiltins$AncestorSequence;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    invoke-virtual {p0}, Lfreemarker/core/NodeBuiltins$AncestorSequence;->size()I

    move-result v6

    if-ge v0, v6, :cond_9

    .line 160
    invoke-virtual {p0, v0}, Lfreemarker/core/NodeBuiltins$AncestorSequence;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v5

    check-cast v5, Lfreemarker/template/TemplateNodeModel;

    .line 161
    .local v5, "tnm":Lfreemarker/template/TemplateNodeModel;
    invoke-interface {v5}, Lfreemarker/template/TemplateNodeModel;->getNodeName()Ljava/lang/String;

    move-result-object v2

    .line 162
    .local v2, "nodeName":Ljava/lang/String;
    invoke-interface {v5}, Lfreemarker/template/TemplateNodeModel;->getNodeNamespace()Ljava/lang/String;

    move-result-object v3

    .line 163
    .local v3, "nsURI":Ljava/lang/String;
    if-nez v3, :cond_34

    .line 164
    invoke-interface {p1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_31

    .line 165
    invoke-virtual {v4, v5}, Lfreemarker/core/NodeBuiltins$AncestorSequence;->add(Ljava/lang/Object;)V

    .line 159
    :cond_31
    :goto_31
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 168
    :cond_34
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_35
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    if-ge v1, v6, :cond_31

    .line 169
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iget-object v7, p0, Lfreemarker/core/NodeBuiltins$AncestorSequence;->env:Lfreemarker/core/Environment;

    invoke-static {v6, v2, v3, v7}, Lfreemarker/template/utility/StringUtil;->matchesName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfreemarker/core/Environment;)Z

    move-result v6

    if-eqz v6, :cond_4d

    .line 170
    invoke-virtual {v4, v5}, Lfreemarker/core/NodeBuiltins$AncestorSequence;->add(Ljava/lang/Object;)V

    goto :goto_31

    .line 168
    :cond_4d
    add-int/lit8 v1, v1, 0x1

    goto :goto_35
.end method
