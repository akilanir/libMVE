.class final Lfreemarker/ext/jdom/NodeListModel$TextOp;
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
    name = "TextOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 1004
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 1004
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$TextOp;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;)Ljava/util/List;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 1007
    instance-of v0, p1, Lorg/jdom/Element;

    if-eqz v0, :cond_f

    .line 1008
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Element;->getTextTrim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 1019
    :goto_e
    return-object v0

    .line 1009
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_f
    instance-of v0, p1, Lorg/jdom/Attribute;

    if-eqz v0, :cond_1e

    .line 1010
    check-cast p1, Lorg/jdom/Attribute;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Attribute;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_e

    .line 1011
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_1e
    instance-of v0, p1, Lorg/jdom/CDATA;

    if-eqz v0, :cond_2d

    .line 1012
    check-cast p1, Lorg/jdom/CDATA;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/CDATA;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_e

    .line 1013
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_2d
    instance-of v0, p1, Lorg/jdom/Comment;

    if-eqz v0, :cond_3c

    .line 1014
    check-cast p1, Lorg/jdom/Comment;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Comment;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_e

    .line 1015
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_3c
    instance-of v0, p1, Lorg/jdom/ProcessingInstruction;

    if-eqz v0, :cond_4b

    .line 1016
    check-cast p1, Lorg/jdom/ProcessingInstruction;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/ProcessingInstruction;->getData()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_e

    .line 1019
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_4b
    const/4 v0, 0x0

    goto :goto_e
.end method
