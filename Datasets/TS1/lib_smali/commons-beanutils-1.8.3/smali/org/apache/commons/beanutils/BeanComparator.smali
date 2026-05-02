.class public Lorg/apache/commons/beanutils/BeanComparator;
.super Ljava/lang/Object;
.source "BeanComparator.java"

# interfaces
.implements Ljava/util/Comparator;
.implements Ljava/io/Serializable;


# instance fields
.field private comparator:Ljava/util/Comparator;

.field private property:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/beanutils/BeanComparator;-><init>(Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 81
    invoke-static {}, Lorg/apache/commons/collections/comparators/ComparableComparator;->getInstance()Lorg/apache/commons/collections/comparators/ComparableComparator;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/beanutils/BeanComparator;-><init>(Ljava/lang/String;Ljava/util/Comparator;)V

    .line 82
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Comparator;)V
    .registers 4
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "comparator"    # Ljava/util/Comparator;

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/BeanComparator;->setProperty(Ljava/lang/String;)V

    .line 102
    if-eqz p2, :cond_b

    .line 103
    iput-object p2, p0, Lorg/apache/commons/beanutils/BeanComparator;->comparator:Ljava/util/Comparator;

    .line 107
    :goto_a
    return-void

    .line 105
    :cond_b
    invoke-static {}, Lorg/apache/commons/collections/comparators/ComparableComparator;->getInstance()Lorg/apache/commons/collections/comparators/ComparableComparator;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/BeanComparator;->comparator:Ljava/util/Comparator;

    goto :goto_a
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 11
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 151
    iget-object v5, p0, Lorg/apache/commons/beanutils/BeanComparator;->property:Ljava/lang/String;

    if-nez v5, :cond_b

    .line 153
    iget-object v5, p0, Lorg/apache/commons/beanutils/BeanComparator;->comparator:Ljava/util/Comparator;

    invoke-interface {v5, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v5

    .line 159
    :goto_a
    return v5

    .line 157
    :cond_b
    :try_start_b
    iget-object v5, p0, Lorg/apache/commons/beanutils/BeanComparator;->property:Ljava/lang/String;

    invoke-static {p1, v5}, Lorg/apache/commons/beanutils/PropertyUtils;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 158
    .local v3, "value1":Ljava/lang/Object;
    iget-object v5, p0, Lorg/apache/commons/beanutils/BeanComparator;->property:Ljava/lang/String;

    invoke-static {p2, v5}, Lorg/apache/commons/beanutils/PropertyUtils;->getProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 159
    .local v4, "value2":Ljava/lang/Object;
    iget-object v5, p0, Lorg/apache/commons/beanutils/BeanComparator;->comparator:Ljava/util/Comparator;

    invoke-interface {v5, v3, v4}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I
    :try_end_1c
    .catch Ljava/lang/IllegalAccessException; {:try_start_b .. :try_end_1c} :catch_1e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_b .. :try_end_1c} :catch_3c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_b .. :try_end_1c} :catch_5a

    move-result v5

    goto :goto_a

    .line 161
    .end local v3    # "value1":Ljava/lang/Object;
    .end local v4    # "value2":Ljava/lang/Object;
    :catch_1e
    move-exception v0

    .line 162
    .local v0, "iae":Ljava/lang/IllegalAccessException;
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "IllegalAccessException: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 164
    .end local v0    # "iae":Ljava/lang/IllegalAccessException;
    :catch_3c
    move-exception v1

    .line 165
    .local v1, "ite":Ljava/lang/reflect/InvocationTargetException;
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "InvocationTargetException: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 167
    .end local v1    # "ite":Ljava/lang/reflect/InvocationTargetException;
    :catch_5a
    move-exception v2

    .line 168
    .local v2, "nsme":Ljava/lang/NoSuchMethodException;
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "NoSuchMethodException: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/NoSuchMethodException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 180
    if-ne p0, p1, :cond_5

    .line 203
    :cond_4
    :goto_4
    return v1

    .line 183
    :cond_5
    instance-of v3, p1, Lorg/apache/commons/beanutils/BeanComparator;

    if-nez v3, :cond_b

    move v1, v2

    .line 184
    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 187
    check-cast v0, Lorg/apache/commons/beanutils/BeanComparator;

    .line 189
    .local v0, "beanComparator":Lorg/apache/commons/beanutils/BeanComparator;
    iget-object v3, p0, Lorg/apache/commons/beanutils/BeanComparator;->comparator:Ljava/util/Comparator;

    iget-object v4, v0, Lorg/apache/commons/beanutils/BeanComparator;->comparator:Ljava/util/Comparator;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1a

    move v1, v2

    .line 190
    goto :goto_4

    .line 192
    :cond_1a
    iget-object v3, p0, Lorg/apache/commons/beanutils/BeanComparator;->property:Ljava/lang/String;

    if-eqz v3, :cond_2a

    .line 194
    iget-object v3, p0, Lorg/apache/commons/beanutils/BeanComparator;->property:Ljava/lang/String;

    iget-object v4, v0, Lorg/apache/commons/beanutils/BeanComparator;->property:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 195
    goto :goto_4

    .line 200
    :cond_2a
    iget-object v3, v0, Lorg/apache/commons/beanutils/BeanComparator;->property:Ljava/lang/String;

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public getComparator()Ljava/util/Comparator;
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanComparator;->comparator:Ljava/util/Comparator;

    return-object v0
.end method

.method public getProperty()Ljava/lang/String;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/apache/commons/beanutils/BeanComparator;->property:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 212
    iget-object v1, p0, Lorg/apache/commons/beanutils/BeanComparator;->comparator:Ljava/util/Comparator;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 213
    .local v0, "result":I
    return v0
.end method

.method public setProperty(Ljava/lang/String;)V
    .registers 2
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 116
    iput-object p1, p0, Lorg/apache/commons/beanutils/BeanComparator;->property:Ljava/lang/String;

    .line 117
    return-void
.end method
