.class final Lfreemarker/ext/jdom/NodeListModel$DocumentOp;
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
    name = "DocumentOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 946
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 946
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$DocumentOp;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;)Ljava/util/List;
    .registers 6
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 949
    const/4 v0, 0x0

    .line 950
    .local v0, "doc":Lorg/jdom/Document;
    instance-of v3, p1, Lorg/jdom/Element;

    if-eqz v3, :cond_11

    .line 951
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Element;->getDocument()Lorg/jdom/Document;

    move-result-object v0

    .line 972
    :goto_c
    if-nez v0, :cond_60

    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_10
    :goto_10
    return-object v2

    .line 952
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_11
    instance-of v3, p1, Lorg/jdom/Attribute;

    if-eqz v3, :cond_24

    .line 953
    check-cast p1, Lorg/jdom/Attribute;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Attribute;->getParent()Lorg/jdom/Element;

    move-result-object v1

    .line 954
    .local v1, "parent":Lorg/jdom/Element;
    if-nez v1, :cond_1f

    move-object v0, v2

    .line 955
    :goto_1e
    goto :goto_c

    .line 954
    :cond_1f
    invoke-virtual {v1}, Lorg/jdom/Element;->getDocument()Lorg/jdom/Document;

    move-result-object v0

    goto :goto_1e

    .line 955
    .end local v1    # "parent":Lorg/jdom/Element;
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_24
    instance-of v3, p1, Lorg/jdom/Text;

    if-eqz v3, :cond_37

    .line 956
    check-cast p1, Lorg/jdom/Text;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Text;->getParent()Lorg/jdom/Element;

    move-result-object v1

    .line 957
    .restart local v1    # "parent":Lorg/jdom/Element;
    if-nez v1, :cond_32

    move-object v0, v2

    .line 958
    :goto_31
    goto :goto_c

    .line 957
    :cond_32
    invoke-virtual {v1}, Lorg/jdom/Element;->getDocument()Lorg/jdom/Document;

    move-result-object v0

    goto :goto_31

    .line 958
    .end local v1    # "parent":Lorg/jdom/Element;
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_37
    instance-of v3, p1, Lorg/jdom/Document;

    if-eqz v3, :cond_3f

    move-object v0, p1

    .line 959
    check-cast v0, Lorg/jdom/Document;

    goto :goto_c

    .line 960
    :cond_3f
    instance-of v3, p1, Lorg/jdom/ProcessingInstruction;

    if-eqz v3, :cond_4a

    .line 961
    check-cast p1, Lorg/jdom/ProcessingInstruction;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/ProcessingInstruction;->getDocument()Lorg/jdom/Document;

    move-result-object v0

    goto :goto_c

    .line 962
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_4a
    instance-of v3, p1, Lorg/jdom/EntityRef;

    if-eqz v3, :cond_55

    .line 963
    check-cast p1, Lorg/jdom/EntityRef;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/EntityRef;->getDocument()Lorg/jdom/Document;

    move-result-object v0

    goto :goto_c

    .line 964
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_55
    instance-of v3, p1, Lorg/jdom/Comment;

    if-eqz v3, :cond_10

    .line 965
    check-cast p1, Lorg/jdom/Comment;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Comment;->getDocument()Lorg/jdom/Document;

    move-result-object v0

    goto :goto_c

    .line 972
    :cond_60
    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto :goto_10
.end method
