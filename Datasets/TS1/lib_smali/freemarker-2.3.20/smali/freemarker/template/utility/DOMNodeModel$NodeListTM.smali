.class Lfreemarker/template/utility/DOMNodeModel$NodeListTM;
.super Ljava/lang/Object;
.source "DOMNodeModel.java"

# interfaces
.implements Lfreemarker/template/TemplateSequenceModel;
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/template/utility/DOMNodeModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "NodeListTM"
.end annotation


# instance fields
.field private nodeList:Lorg/w3c/dom/NodeList;

.field private nodes:[Lfreemarker/template/TemplateModel;

.field private final this$0:Lfreemarker/template/utility/DOMNodeModel;


# direct methods
.method constructor <init>(Lfreemarker/template/utility/DOMNodeModel;Lorg/w3c/dom/NodeList;)V
    .registers 4
    .param p2, "nodeList"    # Lorg/w3c/dom/NodeList;

    .prologue
    .line 287
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;->this$0:Lfreemarker/template/utility/DOMNodeModel;

    .line 288
    iput-object p2, p0, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;->nodeList:Lorg/w3c/dom/NodeList;

    .line 289
    invoke-interface {p2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    new-array v0, v0, [Lfreemarker/template/TemplateModel;

    iput-object v0, p0, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;->nodes:[Lfreemarker/template/TemplateModel;

    .line 290
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 6
    .param p1, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 307
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_f

    .line 308
    new-instance v1, Lfreemarker/template/TemplateModelException;

    const-string v2, "Expecting exactly one string argument here"

    invoke-direct {v1, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 310
    :cond_f
    iget-object v1, p0, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;->this$0:Lfreemarker/template/utility/DOMNodeModel;

    invoke-static {v1}, Lfreemarker/template/utility/DOMNodeModel;->access$000(Lfreemarker/template/utility/DOMNodeModel;)Lorg/w3c/dom/Node;

    move-result-object v1

    instance-of v1, v1, Lorg/w3c/dom/Element;

    if-nez v1, :cond_21

    .line 311
    new-instance v1, Lfreemarker/template/TemplateModelException;

    const-string v2, "Expecting element here."

    invoke-direct {v1, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 313
    :cond_21
    iget-object v1, p0, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;->this$0:Lfreemarker/template/utility/DOMNodeModel;

    invoke-static {v1}, Lfreemarker/template/utility/DOMNodeModel;->access$000(Lfreemarker/template/utility/DOMNodeModel;)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 314
    .local v0, "elem":Lorg/w3c/dom/Element;
    new-instance v2, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;

    iget-object v3, p0, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;->this$0:Lfreemarker/template/utility/DOMNodeModel;

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;-><init>(Lfreemarker/template/utility/DOMNodeModel;Lorg/w3c/dom/NodeList;)V

    return-object v2
.end method

.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 293
    iget-object v1, p0, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;->nodes:[Lfreemarker/template/TemplateModel;

    aget-object v0, v1, p1

    check-cast v0, Lfreemarker/template/utility/DOMNodeModel;

    .line 294
    .local v0, "result":Lfreemarker/template/utility/DOMNodeModel;
    if-nez v0, :cond_1c

    .line 295
    new-instance v0, Lfreemarker/template/utility/DOMNodeModel;

    .end local v0    # "result":Lfreemarker/template/utility/DOMNodeModel;
    iget-object v1, p0, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;->nodeList:Lorg/w3c/dom/NodeList;

    invoke-interface {v1, p1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/utility/DOMNodeModel;-><init>(Lorg/w3c/dom/Node;)V

    .line 296
    .restart local v0    # "result":Lfreemarker/template/utility/DOMNodeModel;
    iget-object v1, p0, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;->nodes:[Lfreemarker/template/TemplateModel;

    aput-object v0, v1, p1

    .line 297
    iget-object v1, p0, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;->this$0:Lfreemarker/template/utility/DOMNodeModel;

    invoke-virtual {v0, v1}, Lfreemarker/template/utility/DOMNodeModel;->setParent(Lfreemarker/template/utility/DOMNodeModel;)V

    .line 299
    :cond_1c
    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 303
    iget-object v0, p0, Lfreemarker/template/utility/DOMNodeModel$NodeListTM;->nodes:[Lfreemarker/template/TemplateModel;

    array-length v0, v0

    return v0
.end method
