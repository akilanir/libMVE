.class final Lfreemarker/ext/jdom/NodeListModel$NameOp;
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
    name = "NameOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 760
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 760
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$NameOp;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;)Ljava/util/List;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 763
    instance-of v0, p1, Lorg/jdom/Element;

    if-eqz v0, :cond_f

    .line 764
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Element;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 774
    :goto_e
    return-object v0

    .line 765
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_f
    instance-of v0, p1, Lorg/jdom/Attribute;

    if-eqz v0, :cond_1e

    .line 766
    check-cast p1, Lorg/jdom/Attribute;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Attribute;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_e

    .line 767
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_1e
    instance-of v0, p1, Lorg/jdom/EntityRef;

    if-eqz v0, :cond_2d

    .line 768
    check-cast p1, Lorg/jdom/EntityRef;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/EntityRef;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_e

    .line 769
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_2d
    instance-of v0, p1, Lorg/jdom/ProcessingInstruction;

    if-eqz v0, :cond_3c

    .line 770
    check-cast p1, Lorg/jdom/ProcessingInstruction;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/ProcessingInstruction;->getTarget()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_e

    .line 771
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_3c
    instance-of v0, p1, Lorg/jdom/DocType;

    if-eqz v0, :cond_4b

    .line 772
    check-cast p1, Lorg/jdom/DocType;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/DocType;->getPublicID()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_e

    .line 774
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_4b
    const/4 v0, 0x0

    goto :goto_e
.end method
