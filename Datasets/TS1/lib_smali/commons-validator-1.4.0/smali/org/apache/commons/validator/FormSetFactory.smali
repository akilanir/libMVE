.class public Lorg/apache/commons/validator/FormSetFactory;
.super Lorg/apache/commons/digester/AbstractObjectCreationFactory;
.source "FormSetFactory.java"


# static fields
.field static class$org$apache$commons$validator$FormSetFactory:Ljava/lang/Class;


# instance fields
.field private transient log:Lorg/apache/commons/logging/Log;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/apache/commons/digester/AbstractObjectCreationFactory;-><init>()V

    .line 33
    sget-object v0, Lorg/apache/commons/validator/FormSetFactory;->class$org$apache$commons$validator$FormSetFactory:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.apache.commons.validator.FormSetFactory"

    invoke-static {v0}, Lorg/apache/commons/validator/FormSetFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/FormSetFactory;->class$org$apache$commons$validator$FormSetFactory:Ljava/lang/Class;

    :goto_f
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/validator/FormSetFactory;->log:Lorg/apache/commons/logging/Log;

    return-void

    :cond_16
    sget-object v0, Lorg/apache/commons/validator/FormSetFactory;->class$org$apache$commons$validator$FormSetFactory:Ljava/lang/Class;

    goto :goto_f
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 33
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

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method private createFormSet(Lorg/apache/commons/validator/ValidatorResources;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/validator/FormSet;
    .registers 10
    .param p1, "resources"    # Lorg/apache/commons/validator/ValidatorResources;
    .param p2, "language"    # Ljava/lang/String;
    .param p3, "country"    # Ljava/lang/String;
    .param p4, "variant"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 72
    invoke-virtual {p1, p2, p3, p4}, Lorg/apache/commons/validator/ValidatorResources;->getFormSet(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/validator/FormSet;

    move-result-object v0

    .line 73
    .local v0, "formSet":Lorg/apache/commons/validator/FormSet;
    if-eqz v0, :cond_36

    .line 74
    invoke-direct {p0}, Lorg/apache/commons/validator/FormSetFactory;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_34

    .line 75
    invoke-direct {p0}, Lorg/apache/commons/validator/FormSetFactory;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "FormSet["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/commons/validator/FormSet;->displayKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "] found - merging."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    :cond_34
    move-object v1, v0

    .line 93
    .end local v0    # "formSet":Lorg/apache/commons/validator/FormSet;
    .local v1, "formSet":Ljava/lang/Object;
    :goto_35
    return-object v1

    .line 81
    .end local v1    # "formSet":Ljava/lang/Object;
    .restart local v0    # "formSet":Lorg/apache/commons/validator/FormSet;
    :cond_36
    new-instance v0, Lorg/apache/commons/validator/FormSet;

    .end local v0    # "formSet":Lorg/apache/commons/validator/FormSet;
    invoke-direct {v0}, Lorg/apache/commons/validator/FormSet;-><init>()V

    .line 82
    .restart local v0    # "formSet":Lorg/apache/commons/validator/FormSet;
    invoke-virtual {v0, p2}, Lorg/apache/commons/validator/FormSet;->setLanguage(Ljava/lang/String;)V

    .line 83
    invoke-virtual {v0, p3}, Lorg/apache/commons/validator/FormSet;->setCountry(Ljava/lang/String;)V

    .line 84
    invoke-virtual {v0, p4}, Lorg/apache/commons/validator/FormSet;->setVariant(Ljava/lang/String;)V

    .line 87
    invoke-virtual {p1, v0}, Lorg/apache/commons/validator/ValidatorResources;->addFormSet(Lorg/apache/commons/validator/FormSet;)V

    .line 89
    invoke-direct {p0}, Lorg/apache/commons/validator/FormSetFactory;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_75

    .line 90
    invoke-direct {p0}, Lorg/apache/commons/validator/FormSetFactory;->getLog()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "FormSet["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/commons/validator/FormSet;->displayKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "] created."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    :cond_75
    move-object v1, v0

    .line 93
    .restart local v1    # "formSet":Ljava/lang/Object;
    goto :goto_35
.end method

.method private getLog()Lorg/apache/commons/logging/Log;
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lorg/apache/commons/validator/FormSetFactory;->log:Lorg/apache/commons/logging/Log;

    if-nez v0, :cond_16

    .line 109
    sget-object v0, Lorg/apache/commons/validator/FormSetFactory;->class$org$apache$commons$validator$FormSetFactory:Ljava/lang/Class;

    if-nez v0, :cond_19

    const-string v0, "org.apache.commons.validator.FormSetFactory"

    invoke-static {v0}, Lorg/apache/commons/validator/FormSetFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/validator/FormSetFactory;->class$org$apache$commons$validator$FormSetFactory:Ljava/lang/Class;

    :goto_10
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/validator/FormSetFactory;->log:Lorg/apache/commons/logging/Log;

    .line 111
    :cond_16
    iget-object v0, p0, Lorg/apache/commons/validator/FormSetFactory;->log:Lorg/apache/commons/logging/Log;

    return-object v0

    .line 109
    :cond_19
    sget-object v0, Lorg/apache/commons/validator/FormSetFactory;->class$org$apache$commons$validator$FormSetFactory:Ljava/lang/Class;

    goto :goto_10
.end method


# virtual methods
.method public createObject(Lorg/xml/sax/Attributes;)Ljava/lang/Object;
    .registers 8
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 45
    iget-object v4, p0, Lorg/apache/commons/validator/FormSetFactory;->digester:Lorg/apache/commons/digester/Digester;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/apache/commons/digester/Digester;->peek(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/validator/ValidatorResources;

    .line 47
    .local v2, "resources":Lorg/apache/commons/validator/ValidatorResources;
    const-string v4, "language"

    invoke-interface {p1, v4}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 48
    .local v1, "language":Ljava/lang/String;
    const-string v4, "country"

    invoke-interface {p1, v4}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "country":Ljava/lang/String;
    const-string v4, "variant"

    invoke-interface {p1, v4}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 51
    .local v3, "variant":Ljava/lang/String;
    invoke-direct {p0, v2, v1, v0, v3}, Lorg/apache/commons/validator/FormSetFactory;->createFormSet(Lorg/apache/commons/validator/ValidatorResources;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/validator/FormSet;

    move-result-object v4

    return-object v4
.end method
