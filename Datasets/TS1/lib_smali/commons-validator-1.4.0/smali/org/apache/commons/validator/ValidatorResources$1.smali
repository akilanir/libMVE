.class Lorg/apache/commons/validator/ValidatorResources$1;
.super Lorg/apache/commons/digester/Rule;
.source "ValidatorResources.java"


# instance fields
.field private final this$0:Lorg/apache/commons/validator/ValidatorResources;


# direct methods
.method constructor <init>(Lorg/apache/commons/validator/ValidatorResources;)V
    .registers 2

    .prologue
    .line 291
    iput-object p1, p0, Lorg/apache/commons/validator/ValidatorResources$1;->this$0:Lorg/apache/commons/validator/ValidatorResources;

    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    return-void
.end method


# virtual methods
.method public begin(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 10
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 295
    new-instance v0, Lorg/apache/commons/validator/Arg;

    invoke-direct {v0}, Lorg/apache/commons/validator/Arg;-><init>()V

    .line 296
    .local v0, "arg":Lorg/apache/commons/validator/Arg;
    const-string v2, "key"

    invoke-interface {p3, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/commons/validator/Arg;->setKey(Ljava/lang/String;)V

    .line 297
    const-string v2, "name"

    invoke-interface {p3, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/commons/validator/Arg;->setName(Ljava/lang/String;)V

    .line 298
    const-string v2, "false"

    const-string v3, "resource"

    invoke-interface {p3, v3}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 299
    invoke-virtual {v0, v5}, Lorg/apache/commons/validator/Arg;->setResource(Z)V

    .line 302
    :cond_29
    const/4 v2, 0x3

    :try_start_2a
    invoke-virtual {p2, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Lorg/apache/commons/validator/Arg;->setPosition(I)V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_35} :catch_43

    .line 309
    :goto_35
    invoke-virtual {p0}, Lorg/apache/commons/validator/ValidatorResources$1;->getDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v2

    invoke-virtual {v2, v5}, Lorg/apache/commons/digester/Digester;->peek(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/validator/Field;

    invoke-virtual {v2, v0}, Lorg/apache/commons/validator/Field;->addArg(Lorg/apache/commons/validator/Arg;)V

    .line 310
    return-void

    .line 303
    :catch_43
    move-exception v1

    .line 304
    .local v1, "ex":Ljava/lang/Exception;
    iget-object v2, p0, Lorg/apache/commons/validator/ValidatorResources$1;->this$0:Lorg/apache/commons/validator/ValidatorResources;

    invoke-static {v2}, Lorg/apache/commons/validator/ValidatorResources;->access$000(Lorg/apache/commons/validator/ValidatorResources;)Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Error parsing Arg position: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    goto :goto_35
.end method
