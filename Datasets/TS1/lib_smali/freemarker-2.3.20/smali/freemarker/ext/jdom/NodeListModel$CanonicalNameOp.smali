.class final Lfreemarker/ext/jdom/NodeListModel$CanonicalNameOp;
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
    name = "CanonicalNameOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 823
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 823
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$CanonicalNameOp;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;)Ljava/util/List;
    .registers 6
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 826
    instance-of v2, p1, Lorg/jdom/Element;

    if-eqz v2, :cond_29

    move-object v1, p1

    .line 828
    check-cast v1, Lorg/jdom/Element;

    .line 829
    .local v1, "element":Lorg/jdom/Element;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1}, Lorg/jdom/Element;->getNamespace()Lorg/jdom/Namespace;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jdom/Namespace;->getURI()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v1}, Lorg/jdom/Element;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 838
    .end local v1    # "element":Lorg/jdom/Element;
    :goto_28
    return-object v2

    .line 831
    :cond_29
    instance-of v2, p1, Lorg/jdom/Attribute;

    if-eqz v2, :cond_52

    move-object v0, p1

    .line 833
    check-cast v0, Lorg/jdom/Attribute;

    .line 834
    .local v0, "attribute":Lorg/jdom/Attribute;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0}, Lorg/jdom/Attribute;->getNamespace()Lorg/jdom/Namespace;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jdom/Namespace;->getURI()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Lorg/jdom/Attribute;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    goto :goto_28

    .line 838
    .end local v0    # "attribute":Lorg/jdom/Attribute;
    :cond_52
    const/4 v2, 0x0

    goto :goto_28
.end method
