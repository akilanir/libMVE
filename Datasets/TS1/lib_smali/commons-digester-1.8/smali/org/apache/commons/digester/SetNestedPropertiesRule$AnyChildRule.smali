.class Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;
.super Lorg/apache/commons/digester/Rule;
.source "SetNestedPropertiesRule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/SetNestedPropertiesRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AnyChildRule"
.end annotation


# instance fields
.field private currChildElementName:Ljava/lang/String;

.field private currChildNamespaceURI:Ljava/lang/String;

.field private final this$0:Lorg/apache/commons/digester/SetNestedPropertiesRule;


# direct methods
.method private constructor <init>(Lorg/apache/commons/digester/SetNestedPropertiesRule;)V
    .registers 3
    .param p1, "this$0"    # Lorg/apache/commons/digester/SetNestedPropertiesRule;

    .prologue
    const/4 v0, 0x0

    .line 383
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->this$0:Lorg/apache/commons/digester/SetNestedPropertiesRule;

    .line 384
    iput-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->currChildNamespaceURI:Ljava/lang/String;

    .line 385
    iput-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->currChildElementName:Ljava/lang/String;

    .line 383
    return-void
.end method

.method constructor <init>(Lorg/apache/commons/digester/SetNestedPropertiesRule;Lorg/apache/commons/digester/SetNestedPropertiesRule$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/apache/commons/digester/SetNestedPropertiesRule;
    .param p2, "x1"    # Lorg/apache/commons/digester/SetNestedPropertiesRule$1;

    .prologue
    .line 383
    invoke-direct {p0, p1}, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;-><init>(Lorg/apache/commons/digester/SetNestedPropertiesRule;)V

    return-void
.end method


# virtual methods
.method public begin(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 4
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 390
    iput-object p1, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->currChildNamespaceURI:Ljava/lang/String;

    .line 391
    iput-object p2, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->currChildElementName:Ljava/lang/String;

    .line 392
    return-void
.end method

.method public body(Ljava/lang/String;)V
    .registers 10
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 395
    iget-object v3, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->currChildElementName:Ljava/lang/String;

    .line 396
    .local v3, "propName":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->this$0:Lorg/apache/commons/digester/SetNestedPropertiesRule;

    invoke-static {v5}, Lorg/apache/commons/digester/SetNestedPropertiesRule;->access$200(Lorg/apache/commons/digester/SetNestedPropertiesRule;)Ljava/util/HashMap;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->currChildElementName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_21

    .line 398
    iget-object v5, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->this$0:Lorg/apache/commons/digester/SetNestedPropertiesRule;

    invoke-static {v5}, Lorg/apache/commons/digester/SetNestedPropertiesRule;->access$200(Lorg/apache/commons/digester/SetNestedPropertiesRule;)Ljava/util/HashMap;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->currChildElementName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "propName":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 399
    .restart local v3    # "propName":Ljava/lang/String;
    if-nez v3, :cond_21

    .line 459
    :goto_20
    return-void

    .line 405
    :cond_21
    iget-object v5, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->this$0:Lorg/apache/commons/digester/SetNestedPropertiesRule;

    invoke-static {v5}, Lorg/apache/commons/digester/SetNestedPropertiesRule;->access$100(Lorg/apache/commons/digester/SetNestedPropertiesRule;)Lorg/apache/commons/logging/Log;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    .line 407
    .local v0, "debug":Z
    if-eqz v0, :cond_67

    .line 408
    iget-object v5, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->this$0:Lorg/apache/commons/digester/SetNestedPropertiesRule;

    invoke-static {v5}, Lorg/apache/commons/digester/SetNestedPropertiesRule;->access$100(Lorg/apache/commons/digester/SetNestedPropertiesRule;)Lorg/apache/commons/logging/Log;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "[SetNestedPropertiesRule]{"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v7, v7, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "} Setting property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' to \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 414
    :cond_67
    iget-object v5, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v5}, Lorg/apache/commons/digester/Digester;->peek()Ljava/lang/Object;

    move-result-object v4

    .line 415
    .local v4, "top":Ljava/lang/Object;
    if-eqz v0, :cond_a9

    .line 416
    if-eqz v4, :cond_e7

    .line 417
    iget-object v5, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->this$0:Lorg/apache/commons/digester/SetNestedPropertiesRule;

    invoke-static {v5}, Lorg/apache/commons/digester/SetNestedPropertiesRule;->access$100(Lorg/apache/commons/digester/SetNestedPropertiesRule;)Lorg/apache/commons/logging/Log;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "[SetNestedPropertiesRule]{"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v7, v7, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "} Set "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " properties"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 426
    :cond_a9
    :goto_a9
    iget-object v5, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->this$0:Lorg/apache/commons/digester/SetNestedPropertiesRule;

    invoke-static {v5}, Lorg/apache/commons/digester/SetNestedPropertiesRule;->access$300(Lorg/apache/commons/digester/SetNestedPropertiesRule;)Z

    move-result v5

    if-eqz v5, :cond_b5

    .line 427
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 430
    :cond_b5
    iget-object v5, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->this$0:Lorg/apache/commons/digester/SetNestedPropertiesRule;

    invoke-static {v5}, Lorg/apache/commons/digester/SetNestedPropertiesRule;->access$400(Lorg/apache/commons/digester/SetNestedPropertiesRule;)Z

    move-result v5

    if-nez v5, :cond_12d

    .line 433
    instance-of v5, v4, Lorg/apache/commons/beanutils/DynaBean;

    if-eqz v5, :cond_10e

    move-object v5, v4

    .line 434
    check-cast v5, Lorg/apache/commons/beanutils/DynaBean;

    invoke-interface {v5}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v5

    invoke-interface {v5, v3}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v1

    .line 436
    .local v1, "desc":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v1, :cond_12d

    .line 437
    new-instance v5, Ljava/lang/NoSuchMethodException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Bean has no property named "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 421
    .end local v1    # "desc":Lorg/apache/commons/beanutils/DynaProperty;
    :cond_e7
    iget-object v5, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->this$0:Lorg/apache/commons/digester/SetNestedPropertiesRule;

    invoke-static {v5}, Lorg/apache/commons/digester/SetNestedPropertiesRule;->access$100(Lorg/apache/commons/digester/SetNestedPropertiesRule;)Lorg/apache/commons/logging/Log;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "[SetPropertiesRule]{"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->digester:Lorg/apache/commons/digester/Digester;

    iget-object v7, v7, Lorg/apache/commons/digester/Digester;->match:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "} Set NULL properties"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_a9

    .line 441
    :cond_10e
    invoke-static {v4, v3}, Lorg/apache/commons/beanutils/PropertyUtils;->getPropertyDescriptor(Ljava/lang/Object;Ljava/lang/String;)Ljava/beans/PropertyDescriptor;

    move-result-object v1

    .line 443
    .local v1, "desc":Ljava/beans/PropertyDescriptor;
    if-nez v1, :cond_12d

    .line 444
    new-instance v5, Ljava/lang/NoSuchMethodException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Bean has no property named "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 452
    .end local v1    # "desc":Ljava/beans/PropertyDescriptor;
    :cond_12d
    :try_start_12d
    invoke-static {v4, v3, p1}, Lorg/apache/commons/beanutils/BeanUtils;->setProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_130
    .catch Ljava/lang/NullPointerException; {:try_start_12d .. :try_end_130} :catch_132

    goto/16 :goto_20

    .line 455
    :catch_132
    move-exception v2

    .local v2, "e":Ljava/lang/NullPointerException;
    iget-object v5, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->this$0:Lorg/apache/commons/digester/SetNestedPropertiesRule;

    invoke-static {v5}, Lorg/apache/commons/digester/SetNestedPropertiesRule;->access$100(Lorg/apache/commons/digester/SetNestedPropertiesRule;)Lorg/apache/commons/logging/Log;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "NullPointerException: top="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ",propName="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ",value="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "!"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    .line 457
    throw v2
.end method

.method public end(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 462
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/SetNestedPropertiesRule$AnyChildRule;->currChildElementName:Ljava/lang/String;

    .line 463
    return-void
.end method
