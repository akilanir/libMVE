.class Lfreemarker/ext/dom/DocumentTypeModel;
.super Lfreemarker/ext/dom/NodeModel;
.source "DocumentTypeModel.java"


# direct methods
.method public constructor <init>(Lorg/w3c/dom/DocumentType;)V
    .registers 2
    .param p1, "docType"    # Lorg/w3c/dom/DocumentType;

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lfreemarker/ext/dom/NodeModel;-><init>(Lorg/w3c/dom/Node;)V

    .line 66
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 77
    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v1, "accessing properties of a DTD is not currently supported"

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAsString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lfreemarker/ext/dom/DocumentTypeModel;->node:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/ProcessingInstruction;

    invoke-interface {v0}, Lorg/w3c/dom/ProcessingInstruction;->getData()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getChildren()Lfreemarker/template/TemplateSequenceModel;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 73
    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v1, "entering the child nodes of a DTD node is not currently supported"

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getNodeName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 81
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "@document_type$"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v0, p0, Lfreemarker/ext/dom/DocumentTypeModel;->node:Lorg/w3c/dom/Node;

    check-cast v0, Lorg/w3c/dom/DocumentType;

    invoke-interface {v0}, Lorg/w3c/dom/DocumentType;->getNodeName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 85
    const/4 v0, 0x1

    return v0
.end method
