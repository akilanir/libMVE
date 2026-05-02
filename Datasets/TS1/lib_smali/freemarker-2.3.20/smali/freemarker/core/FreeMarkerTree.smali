.class public Lfreemarker/core/FreeMarkerTree;
.super Ljavax/swing/JTree;
.source "FreeMarkerTree.java"


# direct methods
.method public constructor <init>(Lfreemarker/template/Template;)V
    .registers 3
    .param p1, "template"    # Lfreemarker/template/Template;

    .prologue
    .line 65
    invoke-virtual {p1}, Lfreemarker/template/Template;->getRootTreeNode()Lfreemarker/core/TemplateElement;

    move-result-object v0

    invoke-direct {p0, v0}, Ljavax/swing/JTree;-><init>(Ljavax/swing/tree/TreeNode;)V

    .line 66
    return-void
.end method


# virtual methods
.method public convertValueToText(Ljava/lang/Object;ZZZIZ)Ljava/lang/String;
    .registers 8
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "selected"    # Z
    .param p3, "expanded"    # Z
    .param p4, "leaf"    # Z
    .param p5, "row"    # I
    .param p6, "hasFocus"    # Z

    .prologue
    .line 77
    instance-of v0, p1, Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_b

    .line 78
    check-cast p1, Lfreemarker/core/TemplateElement;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Lfreemarker/core/TemplateElement;->getDescription()Ljava/lang/String;

    move-result-object v0

    .line 80
    :goto_a
    return-object v0

    .restart local p1    # "value":Ljava/lang/Object;
    :cond_b
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method public setTemplate(Lfreemarker/template/Template;)V
    .registers 4
    .param p1, "template"    # Lfreemarker/template/Template;

    .prologue
    .line 69
    new-instance v0, Ljavax/swing/tree/DefaultTreeModel;

    invoke-virtual {p1}, Lfreemarker/template/Template;->getRootTreeNode()Lfreemarker/core/TemplateElement;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/swing/tree/DefaultTreeModel;-><init>(Ljavax/swing/tree/TreeNode;)V

    invoke-virtual {p0, v0}, Lfreemarker/core/FreeMarkerTree;->setModel(Ljavax/swing/tree/TreeModel;)V

    .line 70
    invoke-virtual {p0}, Lfreemarker/core/FreeMarkerTree;->invalidate()V

    .line 71
    return-void
.end method
