.class public Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$ObjectCreateRuleFactory;
.super Lorg/apache/commons/digester/AbstractObjectCreationFactory;
.source "DigesterRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "ObjectCreateRuleFactory"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V
    .registers 2
    .param p1, "this$0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .prologue
    .line 717
    invoke-direct {p0}, Lorg/apache/commons/digester/AbstractObjectCreationFactory;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$ObjectCreateRuleFactory;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    return-void
.end method


# virtual methods
.method public createObject(Lorg/xml/sax/Attributes;)Ljava/lang/Object;
    .registers 5
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 719
    const-string v2, "classname"

    invoke-interface {p1, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 720
    .local v1, "className":Ljava/lang/String;
    const-string v2, "attrname"

    invoke-interface {p1, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 721
    .local v0, "attrName":Ljava/lang/String;
    if-eqz v0, :cond_14

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1a

    :cond_14
    new-instance v2, Lorg/apache/commons/digester/ObjectCreateRule;

    invoke-direct {v2, v1}, Lorg/apache/commons/digester/ObjectCreateRule;-><init>(Ljava/lang/String;)V

    :goto_19
    return-object v2

    :cond_1a
    new-instance v2, Lorg/apache/commons/digester/ObjectCreateRule;

    invoke-direct {v2, v1, v0}, Lorg/apache/commons/digester/ObjectCreateRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_19
.end method
