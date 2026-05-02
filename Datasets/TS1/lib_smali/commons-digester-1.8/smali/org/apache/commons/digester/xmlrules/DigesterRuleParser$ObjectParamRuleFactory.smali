.class public Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$ObjectParamRuleFactory;
.super Lorg/apache/commons/digester/AbstractObjectCreationFactory;
.source "DigesterRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "ObjectParamRuleFactory"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V
    .registers 2
    .param p1, "this$0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .prologue
    .line 638
    invoke-direct {p0}, Lorg/apache/commons/digester/AbstractObjectCreationFactory;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$ObjectParamRuleFactory;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    return-void
.end method


# virtual methods
.method public createObject(Lorg/xml/sax/Attributes;)Ljava/lang/Object;
    .registers 11
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 641
    const-string v7, "paramnumber"

    invoke-interface {p1, v7}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 642
    .local v4, "paramIndex":I
    const-string v7, "attrname"

    invoke-interface {p1, v7}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 643
    .local v0, "attributeName":Ljava/lang/String;
    const-string v7, "type"

    invoke-interface {p1, v7}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 644
    .local v5, "type":Ljava/lang/String;
    const-string v7, "value"

    invoke-interface {p1, v7}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 646
    .local v6, "value":Ljava/lang/String;
    const/4 v2, 0x0

    .line 649
    .local v2, "objectParamRule":Lorg/apache/commons/digester/Rule;
    if-nez v5, :cond_27

    .line 650
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Attribute \'type\' is required."

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 654
    :cond_27
    const/4 v3, 0x0

    .line 655
    .local v3, "param":Ljava/lang/Object;
    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 656
    .local v1, "clazz":Ljava/lang/Class;
    if-nez v6, :cond_3a

    .line 657
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    .line 662
    :goto_32
    if-nez v0, :cond_3f

    .line 663
    new-instance v2, Lorg/apache/commons/digester/ObjectParamRule;

    .end local v2    # "objectParamRule":Lorg/apache/commons/digester/Rule;
    invoke-direct {v2, v4, v3}, Lorg/apache/commons/digester/ObjectParamRule;-><init>(ILjava/lang/Object;)V

    .line 667
    .restart local v2    # "objectParamRule":Lorg/apache/commons/digester/Rule;
    :goto_39
    return-object v2

    .line 659
    :cond_3a
    invoke-static {v6, v1}, Lorg/apache/commons/beanutils/ConvertUtils;->convert(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_32

    .line 665
    :cond_3f
    new-instance v2, Lorg/apache/commons/digester/ObjectParamRule;

    .end local v2    # "objectParamRule":Lorg/apache/commons/digester/Rule;
    invoke-direct {v2, v4, v0, v3}, Lorg/apache/commons/digester/ObjectParamRule;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    .restart local v2    # "objectParamRule":Lorg/apache/commons/digester/Rule;
    goto :goto_39
.end method
