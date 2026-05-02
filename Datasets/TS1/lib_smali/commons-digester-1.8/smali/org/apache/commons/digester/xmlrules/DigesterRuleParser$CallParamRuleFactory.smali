.class public Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$CallParamRuleFactory;
.super Lorg/apache/commons/digester/AbstractObjectCreationFactory;
.source "DigesterRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "CallParamRuleFactory"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V
    .registers 2
    .param p1, "this$0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .prologue
    .line 602
    invoke-direct {p0}, Lorg/apache/commons/digester/AbstractObjectCreationFactory;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$CallParamRuleFactory;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    return-void
.end method


# virtual methods
.method public createObject(Lorg/xml/sax/Attributes;)Ljava/lang/Object;
    .registers 9
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 606
    const-string v5, "paramnumber"

    invoke-interface {p1, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 607
    .local v3, "paramIndex":I
    const-string v5, "attrname"

    invoke-interface {p1, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 608
    .local v0, "attributeName":Ljava/lang/String;
    const-string v5, "from-stack"

    invoke-interface {p1, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 609
    .local v2, "fromStack":Ljava/lang/String;
    const-string v5, "stack-index"

    invoke-interface {p1, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 610
    .local v4, "stackIndex":Ljava/lang/String;
    const/4 v1, 0x0

    .line 612
    .local v1, "callParamRule":Lorg/apache/commons/digester/Rule;
    if-nez v0, :cond_41

    .line 613
    if-eqz v4, :cond_2b

    .line 614
    new-instance v1, Lorg/apache/commons/digester/CallParamRule;

    .end local v1    # "callParamRule":Lorg/apache/commons/digester/Rule;
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-direct {v1, v3, v5}, Lorg/apache/commons/digester/CallParamRule;-><init>(II)V

    .line 631
    .restart local v1    # "callParamRule":Lorg/apache/commons/digester/Rule;
    :goto_2a
    return-object v1

    .line 616
    :cond_2b
    if-eqz v2, :cond_3b

    .line 617
    new-instance v1, Lorg/apache/commons/digester/CallParamRule;

    .end local v1    # "callParamRule":Lorg/apache/commons/digester/Rule;
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-direct {v1, v3, v5}, Lorg/apache/commons/digester/CallParamRule;-><init>(IZ)V

    .restart local v1    # "callParamRule":Lorg/apache/commons/digester/Rule;
    goto :goto_2a

    .line 620
    :cond_3b
    new-instance v1, Lorg/apache/commons/digester/CallParamRule;

    .end local v1    # "callParamRule":Lorg/apache/commons/digester/Rule;
    invoke-direct {v1, v3}, Lorg/apache/commons/digester/CallParamRule;-><init>(I)V

    .restart local v1    # "callParamRule":Lorg/apache/commons/digester/Rule;
    goto :goto_2a

    .line 623
    :cond_41
    if-nez v2, :cond_49

    .line 624
    new-instance v1, Lorg/apache/commons/digester/CallParamRule;

    .end local v1    # "callParamRule":Lorg/apache/commons/digester/Rule;
    invoke-direct {v1, v3, v0}, Lorg/apache/commons/digester/CallParamRule;-><init>(ILjava/lang/String;)V

    .restart local v1    # "callParamRule":Lorg/apache/commons/digester/Rule;
    goto :goto_2a

    .line 627
    :cond_49
    new-instance v5, Ljava/lang/RuntimeException;

    const-string v6, "Attributes from-stack and attrname cannot both be present."

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5
.end method
