.class final Lfreemarker/ext/jdom/NodeListModel$NamespacePrefixOp;
.super Ljava/lang/Object;
.source "NodeListModel.java"

# interfaces
.implements Lfreemarker/ext/jdom/NodeListModel$NodeOperator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jdom/NodeListModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NamespacePrefixOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 809
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 809
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$NamespacePrefixOp;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;)Ljava/util/List;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 812
    instance-of v0, p1, Lorg/jdom/Element;

    if-eqz v0, :cond_13

    .line 813
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Element;->getNamespace()Lorg/jdom/Namespace;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jdom/Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 818
    :goto_12
    return-object v0

    .line 814
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_13
    instance-of v0, p1, Lorg/jdom/Attribute;

    if-eqz v0, :cond_26

    .line 815
    check-cast p1, Lorg/jdom/Attribute;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Attribute;->getNamespace()Lorg/jdom/Namespace;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jdom/Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_12

    .line 818
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_26
    const/4 v0, 0x0

    goto :goto_12
.end method
