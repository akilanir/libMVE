.class public Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
.super Lorg/apache/commons/digester/RuleSetBase;
.source "DigesterRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$1;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetNestedPropertiesAliasRule;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetPropertiesAliasRule;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetRootRuleFactory;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetNextRuleFactory;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetTopRuleFactory;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetNestedPropertiesRuleFactory;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetPropertyRuleFactory;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetPropertiesRuleFactory;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$ObjectCreateRuleFactory;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$FactoryCreateRuleFactory;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$NodeCreateRuleFactory;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$ObjectParamRuleFactory;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$CallParamRuleFactory;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$CallMethodRuleFactory;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$BeanPropertySetterRuleFactory;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$RulesPrefixAdapter;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;,
        Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;
    }
.end annotation


# static fields
.field public static final DIGESTER_PUBLIC_ID:Ljava/lang/String; = "-//Jakarta Apache //DTD digester-rules XML V1.0//EN"

.field static class$org$apache$commons$digester$Rule:Ljava/lang/Class;


# instance fields
.field protected basePath:Ljava/lang/String;

.field private digesterDtdUrl:Ljava/lang/String;

.field private includedFiles:Ljava/util/Set;

.field protected patternStack:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;

.field protected targetDigester:Lorg/apache/commons/digester/Digester;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 122
    invoke-direct {p0}, Lorg/apache/commons/digester/RuleSetBase;-><init>()V

    .line 83
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->basePath:Ljava/lang/String;

    .line 116
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->includedFiles:Ljava/util/Set;

    .line 123
    new-instance v0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;

    invoke-direct {v0, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    iput-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->patternStack:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;

    .line 124
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;)V
    .registers 3
    .param p1, "targetDigester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 131
    invoke-direct {p0}, Lorg/apache/commons/digester/RuleSetBase;-><init>()V

    .line 83
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->basePath:Ljava/lang/String;

    .line 116
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->includedFiles:Ljava/util/Set;

    .line 132
    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->targetDigester:Lorg/apache/commons/digester/Digester;

    .line 133
    new-instance v0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;

    invoke-direct {v0, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    iput-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->patternStack:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;

    .line 134
    return-void
.end method

.method private constructor <init>(Lorg/apache/commons/digester/Digester;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;Ljava/util/Set;)V
    .registers 5
    .param p1, "targetDigester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "stack"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;
    .param p3, "includedFiles"    # Ljava/util/Set;

    .prologue
    .line 147
    invoke-direct {p0}, Lorg/apache/commons/digester/RuleSetBase;-><init>()V

    .line 83
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->basePath:Ljava/lang/String;

    .line 116
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->includedFiles:Ljava/util/Set;

    .line 148
    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->targetDigester:Lorg/apache/commons/digester/Digester;

    .line 149
    iput-object p2, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->patternStack:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;

    .line 150
    iput-object p3, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->includedFiles:Ljava/util/Set;

    .line 151
    return-void
.end method

.method constructor <init>(Lorg/apache/commons/digester/Digester;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;Ljava/util/Set;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$1;)V
    .registers 5
    .param p1, "x0"    # Lorg/apache/commons/digester/Digester;
    .param p2, "x1"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;
    .param p3, "x2"    # Ljava/util/Set;
    .param p4, "x3"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$1;

    .prologue
    .line 67
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;-><init>(Lorg/apache/commons/digester/Digester;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;Ljava/util/Set;)V

    return-void
.end method

.method static access$100(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)Ljava/util/Set;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .prologue
    .line 67
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->includedFiles:Ljava/util/Set;

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 133
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public add(Lorg/apache/commons/digester/Rule;)V
    .registers 5
    .param p1, "rule"    # Lorg/apache/commons/digester/Rule;

    .prologue
    .line 206
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->targetDigester:Lorg/apache/commons/digester/Digester;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->basePath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->patternStack:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;

    invoke-virtual {v2}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 208
    return-void
.end method

.method public addRuleInstances(Lorg/apache/commons/digester/Digester;)V
    .registers 6
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 221
    sget-object v1, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->class$org$apache$commons$digester$Rule:Ljava/lang/Class;

    if-nez v1, :cond_1be

    const-string v1, "org.apache.commons.digester.Rule"

    invoke-static {v1}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->class$org$apache$commons$digester$Rule:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 222
    .local v0, "ruleClassName":Ljava/lang/String;
    const-string v1, "-//Jakarta Apache //DTD digester-rules XML V1.0//EN"

    invoke-virtual {p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->getDigesterRulesDTD()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->register(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    const-string v1, "*/pattern"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;

    const-string v3, "value"

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 226
    const-string v1, "*/include"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$IncludeRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 228
    const-string v1, "*/bean-property-setter-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$BeanPropertySetterRuleFactory;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$BeanPropertySetterRuleFactory;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$1;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;)V

    .line 229
    const-string v1, "*/bean-property-setter-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;

    const-string v3, "pattern"

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 230
    const-string v1, "*/bean-property-setter-rule"

    const-string v2, "add"

    invoke-virtual {p1, v1, v2, v0}, Lorg/apache/commons/digester/Digester;->addSetNext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    const-string v1, "*/call-method-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$CallMethodRuleFactory;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$CallMethodRuleFactory;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;)V

    .line 233
    const-string v1, "*/call-method-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;

    const-string v3, "pattern"

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 234
    const-string v1, "*/call-method-rule"

    const-string v2, "add"

    invoke-virtual {p1, v1, v2, v0}, Lorg/apache/commons/digester/Digester;->addSetNext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    const-string v1, "*/object-param-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$ObjectParamRuleFactory;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$ObjectParamRuleFactory;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;)V

    .line 237
    const-string v1, "*/object-param-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;

    const-string v3, "pattern"

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 238
    const-string v1, "*/object-param-rule"

    const-string v2, "add"

    invoke-virtual {p1, v1, v2, v0}, Lorg/apache/commons/digester/Digester;->addSetNext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    const-string v1, "*/call-param-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$CallParamRuleFactory;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$CallParamRuleFactory;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;)V

    .line 241
    const-string v1, "*/call-param-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;

    const-string v3, "pattern"

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 242
    const-string v1, "*/call-param-rule"

    const-string v2, "add"

    invoke-virtual {p1, v1, v2, v0}, Lorg/apache/commons/digester/Digester;->addSetNext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    const-string v1, "*/factory-create-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$FactoryCreateRuleFactory;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$FactoryCreateRuleFactory;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;)V

    .line 245
    const-string v1, "*/factory-create-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;

    const-string v3, "pattern"

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 246
    const-string v1, "*/factory-create-rule"

    const-string v2, "add"

    invoke-virtual {p1, v1, v2, v0}, Lorg/apache/commons/digester/Digester;->addSetNext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    const-string v1, "*/object-create-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$ObjectCreateRuleFactory;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$ObjectCreateRuleFactory;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;)V

    .line 249
    const-string v1, "*/object-create-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;

    const-string v3, "pattern"

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 250
    const-string v1, "*/object-create-rule"

    const-string v2, "add"

    invoke-virtual {p1, v1, v2, v0}, Lorg/apache/commons/digester/Digester;->addSetNext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    const-string v1, "*/node-create-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$NodeCreateRuleFactory;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$NodeCreateRuleFactory;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;)V

    .line 253
    const-string v1, "*/node-create-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;

    const-string v3, "pattern"

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 254
    const-string v1, "*/node-create-rule"

    const-string v2, "add"

    invoke-virtual {p1, v1, v2, v0}, Lorg/apache/commons/digester/Digester;->addSetNext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    const-string v1, "*/set-properties-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetPropertiesRuleFactory;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetPropertiesRuleFactory;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;)V

    .line 257
    const-string v1, "*/set-properties-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;

    const-string v3, "pattern"

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 258
    const-string v1, "*/set-properties-rule"

    const-string v2, "add"

    invoke-virtual {p1, v1, v2, v0}, Lorg/apache/commons/digester/Digester;->addSetNext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    const-string v1, "*/set-properties-rule/alias"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetPropertiesAliasRule;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetPropertiesAliasRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 262
    const-string v1, "*/set-property-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetPropertyRuleFactory;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetPropertyRuleFactory;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;)V

    .line 263
    const-string v1, "*/set-property-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;

    const-string v3, "pattern"

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 264
    const-string v1, "*/set-property-rule"

    const-string v2, "add"

    invoke-virtual {p1, v1, v2, v0}, Lorg/apache/commons/digester/Digester;->addSetNext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    const-string v1, "*/set-nested-properties-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetNestedPropertiesRuleFactory;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetNestedPropertiesRuleFactory;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;)V

    .line 267
    const-string v1, "*/set-nested-properties-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;

    const-string v3, "pattern"

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 268
    const-string v1, "*/set-nested-properties-rule"

    const-string v2, "add"

    invoke-virtual {p1, v1, v2, v0}, Lorg/apache/commons/digester/Digester;->addSetNext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    const-string v1, "*/set-nested-properties-rule/alias"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetNestedPropertiesAliasRule;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetNestedPropertiesAliasRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 272
    const-string v1, "*/set-top-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetTopRuleFactory;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetTopRuleFactory;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;)V

    .line 273
    const-string v1, "*/set-top-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;

    const-string v3, "pattern"

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 274
    const-string v1, "*/set-top-rule"

    const-string v2, "add"

    invoke-virtual {p1, v1, v2, v0}, Lorg/apache/commons/digester/Digester;->addSetNext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    const-string v1, "*/set-next-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetNextRuleFactory;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetNextRuleFactory;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;)V

    .line 277
    const-string v1, "*/set-next-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;

    const-string v3, "pattern"

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 278
    const-string v1, "*/set-next-rule"

    const-string v2, "add"

    invoke-virtual {p1, v1, v2, v0}, Lorg/apache/commons/digester/Digester;->addSetNext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    const-string v1, "*/set-root-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetRootRuleFactory;

    invoke-direct {v2, p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$SetRootRuleFactory;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addFactoryCreate(Ljava/lang/String;Lorg/apache/commons/digester/ObjectCreationFactory;)V

    .line 280
    const-string v1, "*/set-root-rule"

    new-instance v2, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;

    const-string v3, "pattern"

    invoke-direct {v2, p0, v3}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternRule;-><init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;Ljava/lang/String;)V

    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/digester/Digester;->addRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 281
    const-string v1, "*/set-root-rule"

    const-string v2, "add"

    invoke-virtual {p1, v1, v2, v0}, Lorg/apache/commons/digester/Digester;->addSetNext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    return-void

    .line 221
    .end local v0    # "ruleClassName":Ljava/lang/String;
    :cond_1be
    sget-object v1, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->class$org$apache$commons$digester$Rule:Ljava/lang/Class;

    goto/16 :goto_c
.end method

.method protected getDigesterRulesDTD()Ljava/lang/String;
    .registers 2

    .prologue
    .line 195
    iget-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->digesterDtdUrl:Ljava/lang/String;

    return-object v0
.end method

.method public setBasePath(Ljava/lang/String;)V
    .registers 4
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 169
    if-nez p1, :cond_7

    .line 170
    const-string v0, ""

    iput-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->basePath:Ljava/lang/String;

    .line 177
    :goto_6
    return-void

    .line 172
    :cond_7
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_2b

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2b

    .line 173
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->basePath:Ljava/lang/String;

    goto :goto_6

    .line 175
    :cond_2b
    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->basePath:Ljava/lang/String;

    goto :goto_6
.end method

.method public setDigesterRulesDTD(Ljava/lang/String;)V
    .registers 2
    .param p1, "dtdURL"    # Ljava/lang/String;

    .prologue
    .line 184
    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->digesterDtdUrl:Ljava/lang/String;

    .line 185
    return-void
.end method

.method public setTarget(Lorg/apache/commons/digester/Digester;)V
    .registers 2
    .param p1, "d"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 158
    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;->targetDigester:Lorg/apache/commons/digester/Digester;

    .line 159
    return-void
.end method
