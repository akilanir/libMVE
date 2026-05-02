.class public Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetNestedPropertiesRuleFactory;
.super Lorg/apache/commons/digester/AbstractObjectCreationFactory;
.source "DigesterRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "SetNestedPropertiesRuleFactory"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V
    .registers 2
    .param p1, "this$0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .prologue
    .line 750
    invoke-direct {p0}, Lorg/apache/commons/digester/AbstractObjectCreationFactory;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetNestedPropertiesRuleFactory;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    return-void
.end method


# virtual methods
.method public createObject(Lorg/xml/sax/Attributes;)Ljava/lang/Object;
    .registers 6
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 752
    const-string v2, "true"

    const-string v3, "allow-unknown-child-elements"

    invoke-interface {p1, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    .line 754
    .local v0, "allowUnknownChildElements":Z
    new-instance v1, Lorg/apache/commons/digester/SetNestedPropertiesRule;

    invoke-direct {v1}, Lorg/apache/commons/digester/SetNestedPropertiesRule;-><init>()V

    .line 755
    .local v1, "snpr":Lorg/apache/commons/digester/SetNestedPropertiesRule;
    invoke-virtual {v1, v0}, Lorg/apache/commons/digester/SetNestedPropertiesRule;->setAllowUnknownChildElements(Z)V

    .line 756
    return-object v1
.end method
