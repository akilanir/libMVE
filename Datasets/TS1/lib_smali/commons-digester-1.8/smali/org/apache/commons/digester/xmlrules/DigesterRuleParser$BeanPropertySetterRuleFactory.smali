.class Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$BeanPropertySetterRuleFactory;
.super Lorg/apache/commons/digester/AbstractObjectCreationFactory;
.source "DigesterRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BeanPropertySetterRuleFactory"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;


# direct methods
.method private constructor <init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V
    .registers 2
    .param p1, "this$0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .prologue
    .line 526
    invoke-direct {p0}, Lorg/apache/commons/digester/AbstractObjectCreationFactory;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$BeanPropertySetterRuleFactory;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    return-void
.end method

.method constructor <init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
    .param p2, "x1"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$1;

    .prologue
    .line 526
    invoke-direct {p0, p1}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$BeanPropertySetterRuleFactory;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    return-void
.end method


# virtual methods
.method public createObject(Lorg/xml/sax/Attributes;)Ljava/lang/Object;
    .registers 5
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 528
    const/4 v0, 0x0

    .line 529
    .local v0, "beanPropertySetterRule":Lorg/apache/commons/digester/Rule;
    const-string v2, "propertyname"

    invoke-interface {p1, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 531
    .local v1, "propertyname":Ljava/lang/String;
    if-nez v1, :cond_f

    .line 533
    new-instance v0, Lorg/apache/commons/digester/BeanPropertySetterRule;

    .end local v0    # "beanPropertySetterRule":Lorg/apache/commons/digester/Rule;
    invoke-direct {v0}, Lorg/apache/commons/digester/BeanPropertySetterRule;-><init>()V

    .line 538
    .restart local v0    # "beanPropertySetterRule":Lorg/apache/commons/digester/Rule;
    :goto_e
    return-object v0

    .line 535
    :cond_f
    new-instance v0, Lorg/apache/commons/digester/BeanPropertySetterRule;

    .end local v0    # "beanPropertySetterRule":Lorg/apache/commons/digester/Rule;
    invoke-direct {v0, v1}, Lorg/apache/commons/digester/BeanPropertySetterRule;-><init>(Ljava/lang/String;)V

    .restart local v0    # "beanPropertySetterRule":Lorg/apache/commons/digester/Rule;
    goto :goto_e
.end method
