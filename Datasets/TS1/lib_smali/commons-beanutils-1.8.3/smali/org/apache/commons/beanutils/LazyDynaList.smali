.class public Lorg/apache/commons/beanutils/LazyDynaList;
.super Ljava/util/ArrayList;
.source "LazyDynaList.java"


# static fields
.field static class$java$util$Map:Ljava/lang/Class;

.field static class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

.field static class$org$apache$commons$beanutils$LazyDynaMap:Ljava/lang/Class;

.field static class$org$apache$commons$beanutils$WrapDynaBean:Ljava/lang/Class;


# instance fields
.field private elementDynaBeanType:Ljava/lang/Class;

.field private elementDynaClass:Lorg/apache/commons/beanutils/DynaClass;

.field private elementType:Ljava/lang/Class;

.field private transient wrapDynaClass:Lorg/apache/commons/beanutils/WrapDynaClass;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 197
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 198
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "capacity"    # I

    .prologue
    .line 207
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 209
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .param p1, "elementType"    # Ljava/lang/Class;

    .prologue
    .line 229
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 230
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaList;->setElementType(Ljava/lang/Class;)V

    .line 231
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;)V
    .registers 3
    .param p1, "collection"    # Ljava/util/Collection;

    .prologue
    .line 240
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 241
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaList;->addAll(Ljava/util/Collection;)Z

    .line 242
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/beanutils/DynaClass;)V
    .registers 2
    .param p1, "elementDynaClass"    # Lorg/apache/commons/beanutils/DynaClass;

    .prologue
    .line 218
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 219
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaList;->setElementDynaClass(Lorg/apache/commons/beanutils/DynaClass;)V

    .line 220
    return-void
.end method

.method public constructor <init>([Ljava/lang/Object;)V
    .registers 4
    .param p1, "array"    # [Ljava/lang/Object;

    .prologue
    .line 251
    array-length v1, p1

    invoke-direct {p0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 252
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    array-length v1, p1

    if-ge v0, v1, :cond_10

    .line 253
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/LazyDynaList;->add(Ljava/lang/Object;)Z

    .line 252
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 255
    :cond_10
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 417
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

.method private getDynaClass()Lorg/apache/commons/beanutils/DynaClass;
    .registers 2

    .prologue
    .line 691
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementDynaClass:Lorg/apache/commons/beanutils/DynaClass;

    if-nez v0, :cond_7

    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaList;->wrapDynaClass:Lorg/apache/commons/beanutils/WrapDynaClass;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementDynaClass:Lorg/apache/commons/beanutils/DynaClass;

    goto :goto_6
.end method

.method private growList(I)V
    .registers 5
    .param p1, "requiredSize"    # I

    .prologue
    .line 597
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v2

    if-ge p1, v2, :cond_7

    .line 608
    :cond_6
    return-void

    .line 601
    :cond_7
    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0, v2}, Lorg/apache/commons/beanutils/LazyDynaList;->ensureCapacity(I)V

    .line 603
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v1

    .local v1, "i":I
    :goto_10
    if-ge v1, p1, :cond_6

    .line 604
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lorg/apache/commons/beanutils/LazyDynaList;->transform(Ljava/lang/Object;)Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v0

    .line 605
    .local v0, "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    invoke-super {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 603
    add-int/lit8 v1, v1, 0x1

    goto :goto_10
.end method

.method private transform(Ljava/lang/Object;)Lorg/apache/commons/beanutils/DynaBean;
    .registers 9
    .param p1, "element"    # Ljava/lang/Object;

    .prologue
    .line 624
    const/4 v0, 0x0

    .line 625
    .local v0, "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    const/4 v2, 0x0

    .line 626
    .local v2, "newDynaBeanType":Ljava/lang/Class;
    const/4 v3, 0x0

    .line 629
    .local v3, "newElementType":Ljava/lang/Class;
    if-nez p1, :cond_aa

    .line 633
    iget-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    if-nez v4, :cond_11

    .line 634
    new-instance v4, Lorg/apache/commons/beanutils/LazyDynaClass;

    invoke-direct {v4}, Lorg/apache/commons/beanutils/LazyDynaClass;-><init>()V

    invoke-virtual {p0, v4}, Lorg/apache/commons/beanutils/LazyDynaList;->setElementDynaClass(Lorg/apache/commons/beanutils/DynaClass;)V

    .line 638
    :cond_11
    invoke-direct {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v4

    if-nez v4, :cond_1c

    .line 639
    iget-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    invoke-virtual {p0, v4}, Lorg/apache/commons/beanutils/LazyDynaList;->setElementType(Ljava/lang/Class;)V

    .line 644
    :cond_1c
    :try_start_1c
    invoke-direct {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/commons/beanutils/DynaClass;->newInstance()Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v0

    .line 645
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_27} :catch_7a

    move-result-object v2

    .line 669
    .end local p1    # "element":Ljava/lang/Object;
    :goto_28
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 670
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$WrapDynaBean:Ljava/lang/Class;

    if-nez v4, :cond_f7

    const-string v4, "org.apache.commons.beanutils.WrapDynaBean"

    invoke-static {v4}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$WrapDynaBean:Ljava/lang/Class;

    :goto_38
    invoke-virtual {v4, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_fb

    move-object v4, v0

    .line 671
    check-cast v4, Lorg/apache/commons/beanutils/WrapDynaBean;

    invoke-virtual {v4}, Lorg/apache/commons/beanutils/WrapDynaBean;->getInstance()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 678
    :cond_49
    :goto_49
    iget-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    if-eqz v4, :cond_11d

    iget-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_11d

    .line 679
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Element Type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " doesn\'t match other elements "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 646
    .restart local p1    # "element":Ljava/lang/Object;
    :catch_7a
    move-exception v1

    .line 647
    .local v1, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Error creating DynaBean: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-direct {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 655
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_aa
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 656
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$java$util$Map:Ljava/lang/Class;

    if-nez v4, :cond_d1

    const-string v4, "java.util.Map"

    invoke-static {v4}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$java$util$Map:Ljava/lang/Class;

    :goto_ba
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_d4

    .line 657
    new-instance v0, Lorg/apache/commons/beanutils/LazyDynaMap;

    .end local v0    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    check-cast p1, Ljava/util/Map;

    .end local p1    # "element":Ljava/lang/Object;
    invoke-direct {v0, p1}, Lorg/apache/commons/beanutils/LazyDynaMap;-><init>(Ljava/util/Map;)V

    .line 664
    .restart local v0    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    :goto_cb
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    goto/16 :goto_28

    .line 656
    .restart local p1    # "element":Ljava/lang/Object;
    :cond_d1
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$java$util$Map:Ljava/lang/Class;

    goto :goto_ba

    .line 658
    :cond_d4
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    if-nez v4, :cond_ee

    const-string v4, "org.apache.commons.beanutils.DynaBean"

    invoke-static {v4}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    :goto_e0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_f1

    move-object v0, p1

    .line 659
    check-cast v0, Lorg/apache/commons/beanutils/DynaBean;

    goto :goto_cb

    .line 658
    :cond_ee
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    goto :goto_e0

    .line 661
    :cond_f1
    new-instance v0, Lorg/apache/commons/beanutils/WrapDynaBean;

    .end local v0    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    invoke-direct {v0, p1}, Lorg/apache/commons/beanutils/WrapDynaBean;-><init>(Ljava/lang/Object;)V

    .restart local v0    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    goto :goto_cb

    .line 670
    .end local p1    # "element":Ljava/lang/Object;
    :cond_f7
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$WrapDynaBean:Ljava/lang/Class;

    goto/16 :goto_38

    .line 672
    :cond_fb
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$LazyDynaMap:Ljava/lang/Class;

    if-nez v4, :cond_11a

    const-string v4, "org.apache.commons.beanutils.LazyDynaMap"

    invoke-static {v4}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$LazyDynaMap:Ljava/lang/Class;

    :goto_107
    invoke-virtual {v4, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_49

    move-object v4, v0

    .line 673
    check-cast v4, Lorg/apache/commons/beanutils/LazyDynaMap;

    invoke-virtual {v4}, Lorg/apache/commons/beanutils/LazyDynaMap;->getMap()Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    goto/16 :goto_49

    .line 672
    :cond_11a
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$LazyDynaMap:Ljava/lang/Class;

    goto :goto_107

    .line 683
    :cond_11d
    return-object v0
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 272
    invoke-direct {p0, p2}, Lorg/apache/commons/beanutils/LazyDynaList;->transform(Ljava/lang/Object;)Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v0

    .line 274
    .local v0, "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaList;->growList(I)V

    .line 276
    invoke-super {p0, p1, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 278
    return-void
.end method

.method public add(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "element"    # Ljava/lang/Object;

    .prologue
    .line 288
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaList;->transform(Ljava/lang/Object;)Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v0

    .line 290
    .local v0, "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    invoke-super {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public addAll(ILjava/util/Collection;)Z
    .registers 7
    .param p1, "index"    # I
    .param p2, "collection"    # Ljava/util/Collection;

    .prologue
    .line 331
    if-eqz p2, :cond_8

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v2

    if-nez v2, :cond_a

    .line 332
    :cond_8
    const/4 v2, 0x0

    .line 351
    :goto_9
    return v2

    .line 335
    :cond_a
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v2

    if-le p1, v2, :cond_42

    move v2, p1

    :goto_11
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {p0, v2}, Lorg/apache/commons/beanutils/LazyDynaList;->ensureCapacity(I)V

    .line 340
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v2

    if-nez v2, :cond_2a

    .line 341
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/commons/beanutils/LazyDynaList;->transform(Ljava/lang/Object;)Lorg/apache/commons/beanutils/DynaBean;

    .line 344
    :cond_2a
    invoke-direct {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaList;->growList(I)V

    .line 346
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 347
    .local v1, "iterator":Ljava/util/Iterator;
    :goto_31
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_47

    .line 348
    add-int/lit8 v0, p1, 0x1

    .end local p1    # "index":I
    .local v0, "index":I
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/beanutils/LazyDynaList;->add(ILjava/lang/Object;)V

    move p1, v0

    .end local v0    # "index":I
    .restart local p1    # "index":I
    goto :goto_31

    .line 335
    .end local v1    # "iterator":Ljava/util/Iterator;
    :cond_42
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v2

    goto :goto_11

    .line 351
    .restart local v1    # "iterator":Ljava/util/Iterator;
    :cond_47
    const/4 v2, 0x1

    goto :goto_9
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 5
    .param p1, "collection"    # Ljava/util/Collection;

    .prologue
    .line 302
    if-eqz p1, :cond_8

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    if-nez v1, :cond_a

    .line 303
    :cond_8
    const/4 v1, 0x0

    .line 313
    :goto_9
    return v1

    .line 306
    :cond_a
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v1

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/LazyDynaList;->ensureCapacity(I)V

    .line 308
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 309
    .local v0, "iterator":Ljava/util/Iterator;
    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_28

    .line 310
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/LazyDynaList;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    .line 313
    :cond_28
    const/4 v1, 0x1

    goto :goto_9
.end method

.method public get(I)Ljava/lang/Object;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 367
    add-int/lit8 v0, p1, 0x1

    invoke-direct {p0, v0}, Lorg/apache/commons/beanutils/LazyDynaList;->growList(I)V

    .line 369
    invoke-super {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 386
    invoke-direct {p0, p2}, Lorg/apache/commons/beanutils/LazyDynaList;->transform(Ljava/lang/Object;)Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v0

    .line 388
    .local v0, "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    add-int/lit8 v1, p1, 0x1

    invoke-direct {p0, v1}, Lorg/apache/commons/beanutils/LazyDynaList;->growList(I)V

    .line 390
    invoke-super {p0, p1, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public setElementDynaClass(Lorg/apache/commons/beanutils/DynaClass;)V
    .registers 8
    .param p1, "elementDynaClass"    # Lorg/apache/commons/beanutils/DynaClass;

    .prologue
    .line 555
    if-nez p1, :cond_a

    .line 556
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Element DynaClass is missing"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 559
    :cond_a
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v3

    if-lez v3, :cond_18

    .line 560
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Element DynaClass cannot be reset"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 565
    :cond_18
    :try_start_18
    invoke-interface {p1}, Lorg/apache/commons/beanutils/DynaClass;->newInstance()Lorg/apache/commons/beanutils/DynaBean;

    move-result-object v1

    .line 566
    .local v1, "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementDynaBeanType:Ljava/lang/Class;

    .line 567
    sget-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$WrapDynaBean:Ljava/lang/Class;

    if-nez v3, :cond_49

    const-string v3, "org.apache.commons.beanutils.WrapDynaBean"

    invoke-static {v3}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$WrapDynaBean:Ljava/lang/Class;

    :goto_2e
    iget-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementDynaBeanType:Ljava/lang/Class;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_4c

    .line 568
    check-cast v1, Lorg/apache/commons/beanutils/WrapDynaBean;

    .end local v1    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    invoke-virtual {v1}, Lorg/apache/commons/beanutils/WrapDynaBean;->getInstance()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    .line 569
    move-object v0, p1

    check-cast v0, Lorg/apache/commons/beanutils/WrapDynaClass;

    move-object v3, v0

    iput-object v3, p0, Lorg/apache/commons/beanutils/LazyDynaList;->wrapDynaClass:Lorg/apache/commons/beanutils/WrapDynaClass;

    .line 583
    :goto_48
    return-void

    .line 567
    .restart local v1    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    :cond_49
    sget-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$WrapDynaBean:Ljava/lang/Class;

    goto :goto_2e

    .line 570
    :cond_4c
    sget-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$LazyDynaMap:Ljava/lang/Class;

    if-nez v3, :cond_9b

    const-string v3, "org.apache.commons.beanutils.LazyDynaMap"

    invoke-static {v3}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$LazyDynaMap:Ljava/lang/Class;

    :goto_58
    iget-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementDynaBeanType:Ljava/lang/Class;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_9e

    .line 571
    check-cast v1, Lorg/apache/commons/beanutils/LazyDynaMap;

    .end local v1    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    invoke-virtual {v1}, Lorg/apache/commons/beanutils/LazyDynaMap;->getMap()Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    .line 572
    iput-object p1, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementDynaClass:Lorg/apache/commons/beanutils/DynaClass;
    :try_end_6e
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_6e} :catch_6f

    goto :goto_48

    .line 577
    :catch_6f
    move-exception v2

    .line 578
    .local v2, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Error creating DynaBean from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " - "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 570
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v1    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    :cond_9b
    :try_start_9b
    sget-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$LazyDynaMap:Ljava/lang/Class;

    goto :goto_58

    .line 574
    :cond_9e
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    .line 575
    iput-object p1, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementDynaClass:Lorg/apache/commons/beanutils/DynaClass;
    :try_end_a6
    .catch Ljava/lang/Exception; {:try_start_9b .. :try_end_a6} :catch_6f

    goto :goto_48
.end method

.method public setElementType(Ljava/lang/Class;)V
    .registers 9
    .param p1, "elementType"    # Ljava/lang/Class;

    .prologue
    .line 502
    if-nez p1, :cond_a

    .line 503
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Element Type is missing"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 506
    :cond_a
    iget-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    if-eqz v4, :cond_27

    iget-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    invoke-virtual {v4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_27

    const/4 v0, 0x1

    .line 507
    .local v0, "changeType":Z
    :goto_17
    if-eqz v0, :cond_29

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v4

    if-lez v4, :cond_29

    .line 508
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Element Type cannot be reset"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 506
    .end local v0    # "changeType":Z
    :cond_27
    const/4 v0, 0x0

    goto :goto_17

    .line 511
    .restart local v0    # "changeType":Z
    :cond_29
    iput-object p1, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    .line 514
    const/4 v3, 0x0

    .line 516
    .local v3, "object":Ljava/lang/Object;
    :try_start_2c
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_2f} :catch_77

    move-result-object v3

    .line 523
    const/4 v1, 0x0

    .line 524
    .local v1, "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$java$util$Map:Ljava/lang/Class;

    if-nez v4, :cond_9f

    const-string v4, "java.util.Map"

    invoke-static {v4}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$java$util$Map:Ljava/lang/Class;

    :goto_3d
    invoke-virtual {v4, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_a2

    .line 525
    new-instance v1, Lorg/apache/commons/beanutils/LazyDynaMap;

    .end local v1    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    check-cast v3, Ljava/util/Map;

    .end local v3    # "object":Ljava/lang/Object;
    invoke-direct {v1, v3}, Lorg/apache/commons/beanutils/LazyDynaMap;-><init>(Ljava/util/Map;)V

    .line 526
    .restart local v1    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    invoke-interface {v1}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementDynaClass:Lorg/apache/commons/beanutils/DynaClass;

    .line 535
    :goto_50
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementDynaBeanType:Ljava/lang/Class;

    .line 538
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$WrapDynaBean:Ljava/lang/Class;

    if-nez v4, :cond_cf

    const-string v4, "org.apache.commons.beanutils.WrapDynaBean"

    invoke-static {v4}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$WrapDynaBean:Ljava/lang/Class;

    :goto_62
    iget-object v5, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementDynaBeanType:Ljava/lang/Class;

    invoke-virtual {v4, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_d2

    .line 539
    check-cast v1, Lorg/apache/commons/beanutils/WrapDynaBean;

    .end local v1    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    invoke-virtual {v1}, Lorg/apache/commons/beanutils/WrapDynaBean;->getInstance()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    .line 544
    :cond_76
    :goto_76
    return-void

    .line 517
    .restart local v3    # "object":Ljava/lang/Object;
    :catch_77
    move-exception v2

    .line 518
    .local v2, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Error creating type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 524
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v1    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    :cond_9f
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$java$util$Map:Ljava/lang/Class;

    goto :goto_3d

    .line 527
    :cond_a2
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    if-nez v4, :cond_be

    const-string v4, "org.apache.commons.beanutils.DynaBean"

    invoke-static {v4}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    :goto_ae
    invoke-virtual {v4, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_c1

    move-object v1, v3

    .line 528
    check-cast v1, Lorg/apache/commons/beanutils/DynaBean;

    .line 529
    invoke-interface {v1}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementDynaClass:Lorg/apache/commons/beanutils/DynaClass;

    goto :goto_50

    .line 527
    :cond_be
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    goto :goto_ae

    .line 531
    :cond_c1
    new-instance v1, Lorg/apache/commons/beanutils/WrapDynaBean;

    .end local v1    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    invoke-direct {v1, v3}, Lorg/apache/commons/beanutils/WrapDynaBean;-><init>(Ljava/lang/Object;)V

    .line 532
    .restart local v1    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    invoke-interface {v1}, Lorg/apache/commons/beanutils/DynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v4

    check-cast v4, Lorg/apache/commons/beanutils/WrapDynaClass;

    iput-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->wrapDynaClass:Lorg/apache/commons/beanutils/WrapDynaClass;

    goto :goto_50

    .line 538
    .end local v3    # "object":Ljava/lang/Object;
    :cond_cf
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$WrapDynaBean:Ljava/lang/Class;

    goto :goto_62

    .line 540
    :cond_d2
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$LazyDynaMap:Ljava/lang/Class;

    if-nez v4, :cond_f3

    const-string v4, "org.apache.commons.beanutils.LazyDynaMap"

    invoke-static {v4}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$LazyDynaMap:Ljava/lang/Class;

    :goto_de
    iget-object v5, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementDynaBeanType:Ljava/lang/Class;

    invoke-virtual {v4, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_76

    .line 541
    check-cast v1, Lorg/apache/commons/beanutils/LazyDynaMap;

    .end local v1    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    invoke-virtual {v1}, Lorg/apache/commons/beanutils/LazyDynaMap;->getMap()Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    goto :goto_76

    .line 540
    .restart local v1    # "dynaBean":Lorg/apache/commons/beanutils/DynaBean;
    :cond_f3
    sget-object v4, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$LazyDynaMap:Ljava/lang/Class;

    goto :goto_de
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 5

    .prologue
    .line 411
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v2

    if-nez v2, :cond_e

    iget-object v2, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    if-nez v2, :cond_e

    .line 412
    const/4 v2, 0x0

    new-array v0, v2, [Lorg/apache/commons/beanutils/LazyDynaBean;

    .line 425
    :cond_d
    return-object v0

    .line 415
    :cond_e
    iget-object v2, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Object;

    move-object v0, v2

    check-cast v0, [Ljava/lang/Object;

    .line 416
    .local v0, "array":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1e
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v2

    if-ge v1, v2, :cond_d

    .line 417
    sget-object v2, Lorg/apache/commons/beanutils/LazyDynaList;->class$java$util$Map:Ljava/lang/Class;

    if-nez v2, :cond_47

    const-string v2, "java.util.Map"

    invoke-static {v2}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/beanutils/LazyDynaList;->class$java$util$Map:Ljava/lang/Class;

    :goto_30
    iget-object v3, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_4a

    .line 418
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/LazyDynaList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/beanutils/LazyDynaMap;

    invoke-virtual {v2}, Lorg/apache/commons/beanutils/LazyDynaMap;->getMap()Ljava/util/Map;

    move-result-object v2

    aput-object v2, v0, v1

    .line 416
    :goto_44
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    .line 417
    :cond_47
    sget-object v2, Lorg/apache/commons/beanutils/LazyDynaList;->class$java$util$Map:Ljava/lang/Class;

    goto :goto_30

    .line 419
    :cond_4a
    sget-object v2, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    if-nez v2, :cond_65

    const-string v2, "org.apache.commons.beanutils.DynaBean"

    invoke-static {v2}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    :goto_56
    iget-object v3, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_68

    .line 420
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/LazyDynaList;->get(I)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v0, v1

    goto :goto_44

    .line 419
    :cond_65
    sget-object v2, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    goto :goto_56

    .line 422
    :cond_68
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/LazyDynaList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/beanutils/WrapDynaBean;

    invoke-virtual {v2}, Lorg/apache/commons/beanutils/WrapDynaBean;->getInstance()Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v0, v1

    goto :goto_44
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 8
    .param p1, "model"    # [Ljava/lang/Object;

    .prologue
    .line 438
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    .line 439
    .local v1, "arrayType":Ljava/lang/Class;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, [Ljava/lang/Object;

    .line 441
    .local v0, "array":[Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v3

    if-nez v3, :cond_23

    iget-object v3, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    if-nez v3, :cond_23

    .line 442
    const/4 v3, 0x0

    new-array v0, v3, [Lorg/apache/commons/beanutils/LazyDynaBean;

    .line 462
    .end local v0    # "array":[Ljava/lang/Object;
    :cond_22
    return-object v0

    .line 445
    .restart local v0    # "array":[Ljava/lang/Object;
    :cond_23
    sget-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    if-nez v3, :cond_45

    const-string v3, "org.apache.commons.beanutils.DynaBean"

    invoke-static {v3}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    :goto_2f
    invoke-virtual {v3, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_48

    .line 446
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_36
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v3

    if-ge v2, v3, :cond_22

    .line 447
    invoke-virtual {p0, v2}, Lorg/apache/commons/beanutils/LazyDynaList;->get(I)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v0, v2

    .line 446
    add-int/lit8 v2, v2, 0x1

    goto :goto_36

    .line 445
    .end local v2    # "i":I
    :cond_45
    sget-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    goto :goto_2f

    .line 452
    :cond_48
    iget-object v3, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    invoke-virtual {v1, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_a8

    .line 453
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_51
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v3

    if-ge v2, v3, :cond_22

    .line 454
    sget-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$java$util$Map:Ljava/lang/Class;

    if-nez v3, :cond_7a

    const-string v3, "java.util.Map"

    invoke-static {v3}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$java$util$Map:Ljava/lang/Class;

    :goto_63
    iget-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_7d

    .line 455
    invoke-virtual {p0, v2}, Lorg/apache/commons/beanutils/LazyDynaList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/beanutils/LazyDynaMap;

    invoke-virtual {v3}, Lorg/apache/commons/beanutils/LazyDynaMap;->getMap()Ljava/util/Map;

    move-result-object v3

    aput-object v3, v0, v2

    .line 453
    :goto_77
    add-int/lit8 v2, v2, 0x1

    goto :goto_51

    .line 454
    :cond_7a
    sget-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$java$util$Map:Ljava/lang/Class;

    goto :goto_63

    .line 456
    :cond_7d
    sget-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    if-nez v3, :cond_98

    const-string v3, "org.apache.commons.beanutils.DynaBean"

    invoke-static {v3}, Lorg/apache/commons/beanutils/LazyDynaList;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    :goto_89
    iget-object v4, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    invoke-virtual {v3, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_9b

    .line 457
    invoke-virtual {p0, v2}, Lorg/apache/commons/beanutils/LazyDynaList;->get(I)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v0, v2

    goto :goto_77

    .line 456
    :cond_98
    sget-object v3, Lorg/apache/commons/beanutils/LazyDynaList;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    goto :goto_89

    .line 459
    :cond_9b
    invoke-virtual {p0, v2}, Lorg/apache/commons/beanutils/LazyDynaList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/beanutils/WrapDynaBean;

    invoke-virtual {v3}, Lorg/apache/commons/beanutils/WrapDynaBean;->getInstance()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v0, v2

    goto :goto_77

    .line 465
    .end local v2    # "i":I
    :cond_a8
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Invalid array type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " - not compatible with \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementType:Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public toDynaBeanArray()[Lorg/apache/commons/beanutils/DynaBean;
    .registers 5

    .prologue
    .line 481
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v2

    if-nez v2, :cond_e

    iget-object v2, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementDynaBeanType:Ljava/lang/Class;

    if-nez v2, :cond_e

    .line 482
    const/4 v2, 0x0

    new-array v0, v2, [Lorg/apache/commons/beanutils/LazyDynaBean;

    .line 489
    :cond_d
    return-object v0

    .line 485
    :cond_e
    iget-object v2, p0, Lorg/apache/commons/beanutils/LazyDynaList;->elementDynaBeanType:Ljava/lang/Class;

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lorg/apache/commons/beanutils/DynaBean;

    move-object v0, v2

    check-cast v0, [Lorg/apache/commons/beanutils/DynaBean;

    .line 486
    .local v0, "array":[Lorg/apache/commons/beanutils/DynaBean;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1e
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaList;->size()I

    move-result v2

    if-ge v1, v2, :cond_d

    .line 487
    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/LazyDynaList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/beanutils/DynaBean;

    aput-object v2, v0, v1

    .line 486
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e
.end method
