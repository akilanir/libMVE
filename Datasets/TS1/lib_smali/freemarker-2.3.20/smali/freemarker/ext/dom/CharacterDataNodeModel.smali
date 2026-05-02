.class Lfreemarker/ext/dom/CharacterDataNodeModel;
.super Lfreemarker/ext/dom/NodeModel;
.source "CharacterDataNodeModel.java"

# interfaces
.implements Lfreemarker/template/TemplateScalarModel;


# direct methods
.method public constructor <init>(Lorg/w3c/dom/CharacterData;)V
    .registers 2
    .param p1, "text"    # Lorg/w3c/dom/CharacterData;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lfreemarker/ext/dom/NodeModel;-><init>(Lorg/w3c/dom/Node;)V

    .line 64
    return-void
.end method


# virtual methods
.method public getAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lfreemarker/ext/dom/CharacterDataNodeModel;->node:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/CharacterData;

    invoke-interface {v0}, Lorg/w3c/dom/CharacterData;->getData()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNodeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lfreemarker/ext/dom/CharacterDataNodeModel;->node:Lorg/w3c/dom/Node;

    instance-of v0, v0, Lorg/w3c/dom/Comment;

    if-eqz v0, :cond_9

    const-string v0, "@comment"

    :goto_8
    return-object v0

    :cond_9
    const-string v0, "@text"

    goto :goto_8
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 75
    const/4 v0, 0x1

    return v0
.end method
