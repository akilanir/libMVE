.class public Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$FactoryCreateRuleFactory;
.super Lorg/apache/commons/digester/AbstractObjectCreationFactory;
.source "DigesterRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "FactoryCreateRuleFactory"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V
    .registers 2
    .param p1, "this$0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .prologue
    .line 702
    invoke-direct {p0}, Lorg/apache/commons/digester/AbstractObjectCreationFactory;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$FactoryCreateRuleFactory;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    return-void
.end method


# virtual methods
.method public createObject(Lorg/xml/sax/Attributes;)Ljava/lang/Object;
    .registers 7
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 704
    const-string v3, "classname"

    invoke-interface {p1, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 705
    .local v1, "className":Ljava/lang/String;
    const-string v3, "attrname"

    invoke-interface {p1, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 706
    .local v0, "attrName":Ljava/lang/String;
    const-string v3, "true"

    const-string v4, "ignore-exceptions"

    invoke-interface {p1, v4}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    .line 708
    .local v2, "ignoreExceptions":Z
    if-eqz v0, :cond_20

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_26

    :cond_20
    new-instance v3, Lorg/apache/commons/digester/FactoryCreateRule;

    invoke-direct {v3, v1, v2}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/String;Z)V

    :goto_25
    return-object v3

    :cond_26
    new-instance v3, Lorg/apache/commons/digester/FactoryCreateRule;

    invoke-direct {v3, v1, v0, v2}, Lorg/apache/commons/digester/FactoryCreateRule;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_25
.end method
