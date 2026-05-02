.class public Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$NodeCreateRuleFactory;
.super Lorg/apache/commons/digester/AbstractObjectCreationFactory;
.source "DigesterRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "NodeCreateRuleFactory"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V
    .registers 2
    .param p1, "this$0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .prologue
    .line 674
    invoke-direct {p0}, Lorg/apache/commons/digester/AbstractObjectCreationFactory;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$NodeCreateRuleFactory;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    return-void
.end method


# virtual methods
.method public createObject(Lorg/xml/sax/Attributes;)Ljava/lang/Object;
    .registers 6
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 678
    const-string v1, "type"

    invoke-interface {p1, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 679
    .local v0, "nodeType":Ljava/lang/String;
    if-eqz v0, :cond_10

    const-string v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 682
    :cond_10
    new-instance v1, Lorg/apache/commons/digester/NodeCreateRule;

    invoke-direct {v1}, Lorg/apache/commons/digester/NodeCreateRule;-><init>()V

    .line 688
    :goto_15
    return-object v1

    .line 683
    :cond_16
    const-string v1, "element"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 685
    new-instance v1, Lorg/apache/commons/digester/NodeCreateRule;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lorg/apache/commons/digester/NodeCreateRule;-><init>(I)V

    goto :goto_15

    .line 686
    :cond_25
    const-string v1, "fragment"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 688
    new-instance v1, Lorg/apache/commons/digester/NodeCreateRule;

    const/16 v2, 0xb

    invoke-direct {v1, v2}, Lorg/apache/commons/digester/NodeCreateRule;-><init>(I)V

    goto :goto_15

    .line 691
    :cond_35
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Unrecognized node type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ".  This attribute is optional or can have a value of element|fragment."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
