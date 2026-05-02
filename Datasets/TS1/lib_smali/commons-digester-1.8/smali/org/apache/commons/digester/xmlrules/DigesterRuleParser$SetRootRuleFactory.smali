.class public Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetRootRuleFactory;
.super Lorg/apache/commons/digester/AbstractObjectCreationFactory;
.source "DigesterRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "SetRootRuleFactory"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V
    .registers 2
    .param p1, "this$0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .prologue
    .line 789
    invoke-direct {p0}, Lorg/apache/commons/digester/AbstractObjectCreationFactory;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetRootRuleFactory;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    return-void
.end method


# virtual methods
.method public createObject(Lorg/xml/sax/Attributes;)Ljava/lang/Object;
    .registers 5
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 791
    const-string v2, "methodname"

    invoke-interface {p1, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 792
    .local v0, "methodName":Ljava/lang/String;
    const-string v2, "paramtype"

    invoke-interface {p1, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 793
    .local v1, "paramType":Ljava/lang/String;
    if-eqz v1, :cond_14

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1a

    :cond_14
    new-instance v2, Lorg/apache/commons/digester/SetRootRule;

    invoke-direct {v2, v0}, Lorg/apache/commons/digester/SetRootRule;-><init>(Ljava/lang/String;)V

    :goto_19
    return-object v2

    :cond_1a
    new-instance v2, Lorg/apache/commons/digester/SetRootRule;

    invoke-direct {v2, v0, v1}, Lorg/apache/commons/digester/SetRootRule;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_19
.end method
