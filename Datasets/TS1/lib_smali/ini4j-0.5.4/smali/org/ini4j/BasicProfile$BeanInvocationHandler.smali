.class final Lorg/ini4j/BasicProfile$BeanInvocationHandler;
.super Lorg/ini4j/spi/AbstractBeanInvocationHandler;
.source "BasicProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ini4j/BasicProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "BeanInvocationHandler"
.end annotation


# instance fields
.field private final _prefix:Ljava/lang/String;

.field final synthetic this$0:Lorg/ini4j/BasicProfile;


# direct methods
.method private constructor <init>(Lorg/ini4j/BasicProfile;Ljava/lang/String;)V
    .registers 3
    .param p2, "prefix"    # Ljava/lang/String;

    .prologue
    .line 277
    iput-object p1, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-direct {p0}, Lorg/ini4j/spi/AbstractBeanInvocationHandler;-><init>()V

    .line 278
    iput-object p2, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->_prefix:Ljava/lang/String;

    .line 279
    return-void
.end method

.method synthetic constructor <init>(Lorg/ini4j/BasicProfile;Ljava/lang/String;Lorg/ini4j/BasicProfile$1;)V
    .registers 4
    .param p1, "x0"    # Lorg/ini4j/BasicProfile;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # Lorg/ini4j/BasicProfile$1;

    .prologue
    .line 272
    invoke-direct {p0, p1, p2}, Lorg/ini4j/BasicProfile$BeanInvocationHandler;-><init>(Lorg/ini4j/BasicProfile;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected getPropertySpi(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 8
    .param p1, "property"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 283
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->transform(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 284
    .local v1, "key":Ljava/lang/String;
    const/4 v2, 0x0

    .line 286
    .local v2, "o":Ljava/lang/Object;
    iget-object v3, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v3, v1}, Lorg/ini4j/BasicProfile;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4c

    .line 288
    invoke-virtual {p2}, Ljava/lang/Class;->isArray()Z

    move-result v3

    if-eqz v3, :cond_40

    .line 290
    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    iget-object v4, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v4, v1}, Lorg/ini4j/BasicProfile;->length(Ljava/lang/Object;)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v2

    .line 291
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_22
    iget-object v3, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v3, v1}, Lorg/ini4j/BasicProfile;->length(Ljava/lang/Object;)I

    move-result v3

    if-ge v0, v3, :cond_4c

    .line 293
    iget-object v3, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v3, v1, v0}, Lorg/ini4j/BasicProfile;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/ini4j/Profile$Section;

    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/ini4j/Profile$Section;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v0, v3}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 291
    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    .line 298
    .end local v0    # "i":I
    :cond_40
    iget-object v3, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v3, v1}, Lorg/ini4j/BasicProfile;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/ini4j/Profile$Section;

    invoke-interface {v3, p2}, Lorg/ini4j/Profile$Section;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    .line 302
    .end local v2    # "o":Ljava/lang/Object;
    :cond_4c
    return-object v2
.end method

.method protected hasPropertySpi(Ljava/lang/String;)Z
    .registers 4
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 332
    iget-object v0, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {p0, p1}, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->transform(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/ini4j/BasicProfile;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected setPropertySpi(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V
    .registers 8
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 307
    .local p3, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->transform(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 309
    .local v1, "key":Ljava/lang/String;
    iget-object v3, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v3, v1}, Lorg/ini4j/BasicProfile;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    if-eqz p2, :cond_31

    .line 312
    invoke-virtual {p3}, Ljava/lang/Class;->isArray()Z

    move-result v3

    if-eqz v3, :cond_28

    .line 314
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_12
    invoke-static {p2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v3

    if-ge v0, v3, :cond_31

    .line 316
    iget-object v3, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v3, v1}, Lorg/ini4j/BasicProfile;->add(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    move-result-object v2

    .line 318
    .local v2, "sec":Lorg/ini4j/Profile$Section;
    invoke-static {p2, v0}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/ini4j/Profile$Section;->from(Ljava/lang/Object;)V

    .line 314
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 323
    .end local v0    # "i":I
    .end local v2    # "sec":Lorg/ini4j/Profile$Section;
    :cond_28
    iget-object v3, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v3, v1}, Lorg/ini4j/BasicProfile;->add(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    move-result-object v2

    .line 325
    .restart local v2    # "sec":Lorg/ini4j/Profile$Section;
    invoke-interface {v2, p2}, Lorg/ini4j/Profile$Section;->from(Ljava/lang/Object;)V

    .line 328
    .end local v2    # "sec":Lorg/ini4j/Profile$Section;
    :cond_31
    return-void
.end method

.method transform(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 337
    iget-object v2, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->_prefix:Ljava/lang/String;

    if-nez v2, :cond_2b

    move-object v1, p1

    .line 339
    .local v1, "ret":Ljava/lang/String;
    :goto_5
    iget-object v2, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->this$0:Lorg/ini4j/BasicProfile;

    invoke-virtual {v2}, Lorg/ini4j/BasicProfile;->isPropertyFirstUpper()Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 341
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 343
    .local v0, "buff":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 344
    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 348
    .end local v0    # "buff":Ljava/lang/StringBuilder;
    :cond_2a
    return-object v1

    .line 337
    .end local v1    # "ret":Ljava/lang/String;
    :cond_2b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/ini4j/BasicProfile$BeanInvocationHandler;->_prefix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_5
.end method
