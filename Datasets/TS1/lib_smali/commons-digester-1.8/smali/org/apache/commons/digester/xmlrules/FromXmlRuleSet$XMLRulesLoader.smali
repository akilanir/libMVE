.class abstract Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$XMLRulesLoader;
.super Ljava/lang/Object;
.source "FromXmlRuleSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "XMLRulesLoader"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$1;

    .prologue
    .line 183
    invoke-direct {p0}, Lorg/apache/commons/digester/xmlrules/FromXmlRuleSet$XMLRulesLoader;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract loadRules()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/xmlrules/XmlLoadException;
        }
    .end annotation
.end method
