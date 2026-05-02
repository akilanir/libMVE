.class final Lfreemarker/ext/jdom/NodeListModel$QNameOp;
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
    name = "QNameOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 781
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 781
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$QNameOp;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;)Ljava/util/List;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 784
    instance-of v0, p1, Lorg/jdom/Element;

    if-eqz v0, :cond_f

    .line 785
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Element;->getQualifiedName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 790
    :goto_e
    return-object v0

    .line 786
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_f
    instance-of v0, p1, Lorg/jdom/Attribute;

    if-eqz v0, :cond_1e

    .line 787
    check-cast p1, Lorg/jdom/Attribute;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Attribute;->getQualifiedName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_e

    .line 790
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_1e
    const/4 v0, 0x0

    goto :goto_e
.end method
