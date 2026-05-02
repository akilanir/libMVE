.class public Lorg/apache/commons/beanutils/LazyDynaBean;
.super Ljava/lang/Object;
.source "LazyDynaBean.java"

# interfaces
.implements Lorg/apache/commons/beanutils/DynaBean;
.implements Ljava/io/Serializable;


# static fields
.field protected static final BigDecimal_ZERO:Ljava/math/BigDecimal;

.field protected static final BigInteger_ZERO:Ljava/math/BigInteger;

.field protected static final Byte_ZERO:Ljava/lang/Byte;

.field protected static final Character_SPACE:Ljava/lang/Character;

.field protected static final Double_ZERO:Ljava/lang/Double;

.field protected static final Float_ZERO:Ljava/lang/Float;

.field protected static final Integer_ZERO:Ljava/lang/Integer;

.field protected static final Long_ZERO:Ljava/lang/Long;

.field protected static final Short_ZERO:Ljava/lang/Short;

.field static class$java$lang$Boolean:Ljava/lang/Class;

.field static class$java$lang$Byte:Ljava/lang/Class;

.field static class$java$lang$Character:Ljava/lang/Class;

.field static class$java$lang$Double:Ljava/lang/Class;

.field static class$java$lang$Float:Ljava/lang/Class;

.field static class$java$lang$Integer:Ljava/lang/Class;

.field static class$java$lang$Long:Ljava/lang/Class;

.field static class$java$lang$Number:Ljava/lang/Class;

.field static class$java$lang$Object:Ljava/lang/Class;

.field static class$java$lang$Short:Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;

.field static class$java$util$Date:Ljava/lang/Class;

.field static class$java$util$List:Ljava/lang/Class;

.field static class$java$util$Map:Ljava/lang/Class;

.field static class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

.field static class$org$apache$commons$beanutils$LazyDynaBean:Ljava/lang/Class;


# instance fields
.field protected dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

.field private transient logger:Lorg/apache/commons/logging/Log;

.field private transient mapDecorator:Ljava/util/Map;

.field protected values:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 122
    new-instance v0, Ljava/math/BigInteger;

    const-string v1, "0"

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->BigInteger_ZERO:Ljava/math/BigInteger;

    .line 124
    new-instance v0, Ljava/math/BigDecimal;

    const-string v1, "0"

    invoke-direct {v0, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->BigDecimal_ZERO:Ljava/math/BigDecimal;

    .line 126
    new-instance v0, Ljava/lang/Character;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/Character;-><init>(C)V

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->Character_SPACE:Ljava/lang/Character;

    .line 128
    new-instance v0, Ljava/lang/Byte;

    invoke-direct {v0, v2}, Ljava/lang/Byte;-><init>(B)V

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->Byte_ZERO:Ljava/lang/Byte;

    .line 130
    new-instance v0, Ljava/lang/Short;

    invoke-direct {v0, v2}, Ljava/lang/Short;-><init>(S)V

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->Short_ZERO:Ljava/lang/Short;

    .line 132
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, v2}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->Integer_ZERO:Ljava/lang/Integer;

    .line 134
    new-instance v0, Ljava/lang/Long;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->Long_ZERO:Ljava/lang/Long;

    .line 136
    new-instance v0, Ljava/lang/Float;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->Float_ZERO:Ljava/lang/Float;

    .line 138
    new-instance v0, Ljava/lang/Double;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->Double_ZERO:Ljava/lang/Double;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 162
    new-instance v0, Lorg/apache/commons/beanutils/LazyDynaClass;

    invoke-direct {v0}, Lorg/apache/commons/beanutils/LazyDynaClass;-><init>()V

    invoke-direct {p0, v0}, Lorg/apache/commons/beanutils/LazyDynaBean;-><init>(Lorg/apache/commons/beanutils/DynaClass;)V

    .line 163
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 171
    new-instance v0, Lorg/apache/commons/beanutils/LazyDynaClass;

    invoke-direct {v0, p1}, Lorg/apache/commons/beanutils/LazyDynaClass;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/apache/commons/beanutils/LazyDynaBean;-><init>(Lorg/apache/commons/beanutils/DynaClass;)V

    .line 172
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/beanutils/DynaClass;)V
    .registers 5
    .param p1, "dynaClass"    # Lorg/apache/commons/beanutils/DynaClass;

    .prologue
    .line 181
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$org$apache$commons$beanutils$LazyDynaBean:Ljava/lang/Class;

    if-nez v0, :cond_24

    const-string v0, "org.apache.commons.beanutils.LazyDynaBean"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$org$apache$commons$beanutils$LazyDynaBean:Ljava/lang/Class;

    :goto_f
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->logger:Lorg/apache/commons/logging/Log;

    .line 183
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaBean;->newMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->values:Ljava/util/Map;

    .line 185
    instance-of v0, p1, Lorg/apache/commons/beanutils/MutableDynaClass;

    if-eqz v0, :cond_27

    .line 186
    check-cast p1, Lorg/apache/commons/beanutils/MutableDynaClass;

    .end local p1    # "dynaClass":Lorg/apache/commons/beanutils/DynaClass;
    iput-object p1, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    .line 191
    :goto_23
    return-void

    .line 119
    .restart local p1    # "dynaClass":Lorg/apache/commons/beanutils/DynaClass;
    :cond_24
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$org$apache$commons$beanutils$LazyDynaBean:Ljava/lang/Class;

    goto :goto_f

    .line 188
    :cond_27
    new-instance v0, Lorg/apache/commons/beanutils/LazyDynaClass;

    invoke-interface {p1}, Lorg/apache/commons/beanutils/DynaClass;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/beanutils/LazyDynaClass;-><init>(Ljava/lang/String;[Lorg/apache/commons/beanutils/DynaProperty;)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    goto :goto_23
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 119
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

.method private logger()Lorg/apache/commons/logging/Log;
    .registers 2

    .prologue
    .line 926
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->logger:Lorg/apache/commons/logging/Log;

    if-nez v0, :cond_16

    .line 927
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$org$apache$commons$beanutils$LazyDynaBean:Ljava/lang/Class;

    if-nez v0, :cond_19

    const-string v0, "org.apache.commons.beanutils.LazyDynaBean"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$org$apache$commons$beanutils$LazyDynaBean:Ljava/lang/Class;

    :goto_10
    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->logger:Lorg/apache/commons/logging/Log;

    .line 929
    :cond_16
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->logger:Lorg/apache/commons/logging/Log;

    return-object v0

    .line 927
    :cond_19
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$org$apache$commons$beanutils$LazyDynaBean:Ljava/lang/Class;

    goto :goto_10
.end method


# virtual methods
.method public contains(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 262
    if-nez p1, :cond_b

    .line 263
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "No property name specified"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 266
    :cond_b
    iget-object v2, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->values:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 267
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_14

    .line 275
    .end local v0    # "value":Ljava/lang/Object;
    :cond_13
    :goto_13
    return v1

    .line 271
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_14
    instance-of v2, v0, Ljava/util/Map;

    if-eqz v2, :cond_13

    .line 272
    check-cast v0, Ljava/util/Map;

    .end local v0    # "value":Ljava/lang/Object;
    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_13
.end method

.method protected createDynaBeanProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/Class;

    .prologue
    .line 756
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 763
    :goto_4
    return-object v1

    .line 758
    :catch_5
    move-exception v0

    .line 759
    .local v0, "ex":Ljava/lang/Exception;
    invoke-direct {p0}, Lorg/apache/commons/beanutils/LazyDynaBean;->logger()Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v1

    if-eqz v1, :cond_42

    .line 760
    invoke-direct {p0}, Lorg/apache/commons/beanutils/LazyDynaBean;->logger()Lorg/apache/commons/logging/Log;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Error instantiating DynaBean property of type \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 763
    :cond_42
    const/4 v1, 0x0

    goto :goto_4
.end method

.method protected createIndexedProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/Class;

    .prologue
    .line 677
    const/4 v1, 0x0

    .line 679
    .local v1, "indexedProperty":Ljava/lang/Object;
    if-nez p2, :cond_8

    .line 681
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->defaultIndexedProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 706
    :goto_7
    return-object v1

    .line 683
    :cond_8
    invoke-virtual {p2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_18

    .line 685
    invoke-virtual {p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_7

    .line 687
    :cond_18
    sget-object v2, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$List:Ljava/lang/Class;

    if-nez v2, :cond_35

    const-string v2, "java.util.List"

    invoke-static {v2}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$List:Ljava/lang/Class;

    :goto_24
    invoke-virtual {v2, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_6f

    .line 688
    invoke-virtual {p2}, Ljava/lang/Class;->isInterface()Z

    move-result v2

    if-eqz v2, :cond_38

    .line 689
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->defaultIndexedProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_7

    .line 687
    :cond_35
    sget-object v2, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$List:Ljava/lang/Class;

    goto :goto_24

    .line 692
    :cond_38
    :try_start_38
    invoke-virtual {p2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_3b} :catch_3d

    move-result-object v1

    goto :goto_7

    .line 694
    :catch_3d
    move-exception v0

    .line 695
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Error instantiating indexed property of type \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' for \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 702
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_6f
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Non-indexed property of type \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' for \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected createMappedProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/Class;

    .prologue
    .line 719
    const/4 v1, 0x0

    .line 721
    .local v1, "mappedProperty":Ljava/lang/Object;
    if-nez p2, :cond_8

    .line 723
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->defaultMappedProperty(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    .line 744
    .end local v1    # "mappedProperty":Ljava/lang/Object;
    :goto_7
    return-object v1

    .line 725
    .restart local v1    # "mappedProperty":Ljava/lang/Object;
    :cond_8
    invoke-virtual {p2}, Ljava/lang/Class;->isInterface()Z

    move-result v2

    if-eqz v2, :cond_13

    .line 727
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->defaultMappedProperty(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    .local v1, "mappedProperty":Ljava/util/Map;
    goto :goto_7

    .line 729
    .local v1, "mappedProperty":Ljava/lang/Object;
    :cond_13
    sget-object v2, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$Map:Ljava/lang/Class;

    if-nez v2, :cond_2a

    const-string v2, "java.util.Map"

    invoke-static {v2}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$Map:Ljava/lang/Class;

    :goto_1f
    invoke-virtual {v2, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_5f

    .line 731
    :try_start_25
    invoke-virtual {p2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_28} :catch_2d

    move-result-object v1

    goto :goto_7

    .line 729
    :cond_2a
    sget-object v2, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$Map:Ljava/lang/Class;

    goto :goto_1f

    .line 733
    :catch_2d
    move-exception v0

    .line 734
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Error instantiating mapped property of type \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' for \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 740
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_5f
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Non-mapped property of type \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' for \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected createNumberProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/Class;

    .prologue
    .line 805
    const/4 v0, 0x0

    return-object v0
.end method

.method protected createOtherProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/Class;

    .prologue
    const/4 v2, 0x0

    .line 817
    sget-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v1, :cond_4d

    const-string v1, "java.lang.Object"

    invoke-static {v1}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Object:Ljava/lang/Class;

    :goto_d
    if-eq p2, v1, :cond_4b

    sget-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_50

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$String:Ljava/lang/Class;

    :goto_1b
    if-eq p2, v1, :cond_4b

    sget-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v1, :cond_53

    const-string v1, "java.lang.Boolean"

    invoke-static {v1}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_29
    if-eq p2, v1, :cond_4b

    sget-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v1, :cond_56

    const-string v1, "java.lang.Character"

    invoke-static {v1}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Character:Ljava/lang/Class;

    :goto_37
    if-eq p2, v1, :cond_4b

    sget-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$Date:Ljava/lang/Class;

    if-nez v1, :cond_59

    const-string v1, "java.util.Date"

    invoke-static {v1}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$Date:Ljava/lang/Class;

    :goto_45
    invoke-virtual {v1, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_5c

    :cond_4b
    move-object v1, v2

    .line 834
    :goto_4c
    return-object v1

    .line 817
    :cond_4d
    sget-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_d

    :cond_50
    sget-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_1b

    :cond_53
    sget-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Boolean:Ljava/lang/Class;

    goto :goto_29

    :cond_56
    sget-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Character:Ljava/lang/Class;

    goto :goto_37

    :cond_59
    sget-object v1, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$Date:Ljava/lang/Class;

    goto :goto_45

    .line 828
    :cond_5c
    :try_start_5c
    invoke-virtual {p2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
    :try_end_5f
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_5f} :catch_61

    move-result-object v1

    goto :goto_4c

    .line 830
    :catch_61
    move-exception v0

    .line 831
    .local v0, "ex":Ljava/lang/Exception;
    invoke-direct {p0}, Lorg/apache/commons/beanutils/LazyDynaBean;->logger()Lorg/apache/commons/logging/Log;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v1

    if-eqz v1, :cond_9e

    .line 832
    invoke-direct {p0}, Lorg/apache/commons/beanutils/LazyDynaBean;->logger()Lorg/apache/commons/logging/Log;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Error instantiating property of type \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' for \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    :cond_9e
    move-object v1, v2

    .line 834
    goto :goto_4c
.end method

.method protected createPrimitiveProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/Class;

    .prologue
    .line 775
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_7

    .line 776
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 792
    :goto_6
    return-object v0

    .line 777
    :cond_7
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_e

    .line 778
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->Integer_ZERO:Ljava/lang/Integer;

    goto :goto_6

    .line 779
    :cond_e
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_15

    .line 780
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->Long_ZERO:Ljava/lang/Long;

    goto :goto_6

    .line 781
    :cond_15
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_1c

    .line 782
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->Double_ZERO:Ljava/lang/Double;

    goto :goto_6

    .line 783
    :cond_1c
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_23

    .line 784
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->Float_ZERO:Ljava/lang/Float;

    goto :goto_6

    .line 785
    :cond_23
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_2a

    .line 786
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->Byte_ZERO:Ljava/lang/Byte;

    goto :goto_6

    .line 787
    :cond_2a
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_31

    .line 788
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->Short_ZERO:Ljava/lang/Short;

    goto :goto_6

    .line 789
    :cond_31
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p2, v0, :cond_38

    .line 790
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->Character_SPACE:Ljava/lang/Character;

    goto :goto_6

    .line 792
    :cond_38
    const/4 v0, 0x0

    goto :goto_6
.end method

.method protected createProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/Class;

    .prologue
    .line 639
    if-nez p2, :cond_4

    .line 640
    const/4 v0, 0x0

    .line 664
    :goto_3
    return-object v0

    .line 644
    :cond_4
    invoke-virtual {p2}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-nez v0, :cond_1c

    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$List:Ljava/lang/Class;

    if-nez v0, :cond_21

    const-string v0, "java.util.List"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$List:Ljava/lang/Class;

    :goto_16
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 645
    :cond_1c
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/LazyDynaBean;->createIndexedProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_3

    .line 644
    :cond_21
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$List:Ljava/lang/Class;

    goto :goto_16

    .line 648
    :cond_24
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$Map:Ljava/lang/Class;

    if-nez v0, :cond_3b

    const-string v0, "java.util.Map"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$Map:Ljava/lang/Class;

    :goto_30
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3e

    .line 649
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/LazyDynaBean;->createMappedProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_3

    .line 648
    :cond_3b
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$util$Map:Ljava/lang/Class;

    goto :goto_30

    .line 652
    :cond_3e
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    if-nez v0, :cond_55

    const-string v0, "org.apache.commons.beanutils.DynaBean"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    :goto_4a
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_58

    .line 653
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/LazyDynaBean;->createDynaBeanProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_3

    .line 652
    :cond_55
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    goto :goto_4a

    .line 656
    :cond_58
    invoke-virtual {p2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_63

    .line 657
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/LazyDynaBean;->createPrimitiveProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_3

    .line 660
    :cond_63
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Number:Ljava/lang/Class;

    if-nez v0, :cond_7a

    const-string v0, "java.lang.Number"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Number:Ljava/lang/Class;

    :goto_6f
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_7d

    .line 661
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/LazyDynaBean;->createNumberProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_3

    .line 660
    :cond_7a
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Number:Ljava/lang/Class;

    goto :goto_6f

    .line 664
    :cond_7d
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/LazyDynaBean;->createOtherProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_3
.end method

.method protected defaultIndexedProperty(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 849
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method protected defaultMappedProperty(Ljava/lang/String;)Ljava/util/Map;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 863
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    return-object v0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 291
    if-nez p1, :cond_a

    .line 292
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "No property name specified"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 296
    :cond_a
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->values:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 297
    .local v0, "value":Ljava/lang/Object;
    if-eqz v0, :cond_14

    move-object v1, v0

    .line 313
    :goto_13
    return-object v1

    .line 302
    :cond_14
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->isDynaProperty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1c

    .line 303
    const/4 v1, 0x0

    goto :goto_13

    .line 307
    :cond_1c
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    invoke-interface {v1, p1}, Lorg/apache/commons/beanutils/MutableDynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/beanutils/LazyDynaBean;->createProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 309
    if-eqz v0, :cond_2f

    .line 310
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->set(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2f
    move-object v1, v0

    .line 313
    goto :goto_13
.end method

.method public get(Ljava/lang/String;I)Ljava/lang/Object;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I

    .prologue
    .line 335
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->isDynaProperty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_d

    .line 336
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->defaultIndexedProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/beanutils/LazyDynaBean;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 340
    :cond_d
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 343
    .local v0, "indexedProperty":Ljava/lang/Object;
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    invoke-interface {v1, p1}, Lorg/apache/commons/beanutils/MutableDynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/beanutils/DynaProperty;->isIndexed()Z

    move-result v1

    if-nez v1, :cond_54

    .line 344
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Non-indexed property for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "]\' "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    invoke-interface {v3, p1}, Lorg/apache/commons/beanutils/MutableDynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 350
    :cond_54
    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/LazyDynaBean;->growIndexedProperty(Ljava/lang/String;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    .line 353
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_67

    .line 354
    invoke-static {v0, p2}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 356
    .end local v0    # "indexedProperty":Ljava/lang/Object;
    :goto_66
    return-object v1

    .line 355
    .restart local v0    # "indexedProperty":Ljava/lang/Object;
    :cond_67
    instance-of v1, v0, Ljava/util/List;

    if-eqz v1, :cond_72

    .line 356
    check-cast v0, Ljava/util/List;

    .end local v0    # "indexedProperty":Ljava/lang/Object;
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_66

    .line 358
    .restart local v0    # "indexedProperty":Ljava/lang/Object;
    :cond_72
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Non-indexed property for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "]\' "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 381
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->isDynaProperty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_d

    .line 382
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->defaultMappedProperty(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/beanutils/LazyDynaBean;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 386
    :cond_d
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 389
    .local v0, "mappedProperty":Ljava/lang/Object;
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    invoke-interface {v1, p1}, Lorg/apache/commons/beanutils/MutableDynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/beanutils/DynaProperty;->isMapped()Z

    move-result v1

    if-nez v1, :cond_58

    .line 390
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Non-mapped property for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ")\' "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    invoke-interface {v3, p1}, Lorg/apache/commons/beanutils/MutableDynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 396
    :cond_58
    instance-of v1, v0, Ljava/util/Map;

    if-eqz v1, :cond_63

    .line 397
    check-cast v0, Ljava/util/Map;

    .end local v0    # "mappedProperty":Ljava/lang/Object;
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 399
    .restart local v0    # "mappedProperty":Ljava/lang/Object;
    :cond_63
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Non-mapped property for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ")\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getDynaClass()Lorg/apache/commons/beanutils/DynaClass;
    .registers 2

    .prologue
    .line 414
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    return-object v0
.end method

.method public getMap()Ljava/util/Map;
    .registers 2

    .prologue
    .line 207
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->mapDecorator:Ljava/util/Map;

    if-nez v0, :cond_b

    .line 208
    new-instance v0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;

    invoke-direct {v0, p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;-><init>(Lorg/apache/commons/beanutils/DynaBean;)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->mapDecorator:Ljava/util/Map;

    .line 210
    :cond_b
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->mapDecorator:Ljava/util/Map;

    return-object v0
.end method

.method protected growIndexedProperty(Ljava/lang/String;Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 15
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "indexedProperty"    # Ljava/lang/Object;
    .param p3, "index"    # I

    .prologue
    const/4 v10, 0x0

    .line 597
    instance-of v8, p2, Ljava/util/List;

    if-eqz v8, :cond_46

    move-object v4, p2

    .line 599
    check-cast v4, Ljava/util/List;

    .line 600
    .local v4, "list":Ljava/util/List;
    :goto_8
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    if-lt p3, v8, :cond_46

    .line 601
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/LazyDynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v8

    invoke-interface {v8, p1}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/commons/beanutils/DynaProperty;->getContentType()Ljava/lang/Class;

    move-result-object v1

    .line 602
    .local v1, "contentType":Ljava/lang/Class;
    const/4 v7, 0x0

    .line 603
    .local v7, "value":Ljava/lang/Object;
    if-eqz v1, :cond_42

    .line 604
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v1}, Lorg/apache/commons/beanutils/LazyDynaBean;->createProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    .line 606
    .end local v7    # "value":Ljava/lang/Object;
    :cond_42
    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 612
    .end local v1    # "contentType":Ljava/lang/Class;
    .end local v4    # "list":Ljava/util/List;
    :cond_46
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->isArray()Z

    move-result v8

    if-eqz v8, :cond_99

    .line 614
    invoke-static {p2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v3

    .line 615
    .local v3, "length":I
    if-lt p3, v3, :cond_99

    .line 616
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    .line 617
    .local v0, "componentType":Ljava/lang/Class;
    add-int/lit8 v8, p3, 0x1

    invoke-static {v0, v8}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v5

    .line 618
    .local v5, "newArray":Ljava/lang/Object;
    invoke-static {p2, v10, v5, v10, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 619
    move-object p2, v5

    .line 620
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/beanutils/LazyDynaBean;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 621
    invoke-static {p2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v6

    .line 622
    .local v6, "newLength":I
    move v2, v3

    .local v2, "i":I
    :goto_70
    if-ge v2, v6, :cond_99

    .line 623
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->createProperty(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {p2, v2, v8}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 622
    add-int/lit8 v2, v2, 0x1

    goto :goto_70

    .line 628
    .end local v0    # "componentType":Ljava/lang/Class;
    .end local v2    # "i":I
    .end local v3    # "length":I
    .end local v5    # "newArray":Ljava/lang/Object;
    .end local v6    # "newLength":I
    :cond_99
    return-object p2
.end method

.method protected isAssignable(Ljava/lang/Class;Ljava/lang/Class;)Z
    .registers 4
    .param p1, "dest"    # Ljava/lang/Class;
    .param p2, "source"    # Ljava/lang/Class;

    .prologue
    .line 898
    invoke-virtual {p1, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_96

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_18

    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v0, :cond_98

    const-string v0, "java.lang.Boolean"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_16
    if-eq p2, v0, :cond_96

    :cond_18
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_2a

    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v0, :cond_9c

    const-string v0, "java.lang.Byte"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_28
    if-eq p2, v0, :cond_96

    :cond_2a
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_3c

    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v0, :cond_9f

    const-string v0, "java.lang.Character"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Character:Ljava/lang/Class;

    :goto_3a
    if-eq p2, v0, :cond_96

    :cond_3c
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_4e

    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v0, :cond_a2

    const-string v0, "java.lang.Double"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Double:Ljava/lang/Class;

    :goto_4c
    if-eq p2, v0, :cond_96

    :cond_4e
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_60

    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v0, :cond_a5

    const-string v0, "java.lang.Float"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Float:Ljava/lang/Class;

    :goto_5e
    if-eq p2, v0, :cond_96

    :cond_60
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_72

    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v0, :cond_a8

    const-string v0, "java.lang.Integer"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_70
    if-eq p2, v0, :cond_96

    :cond_72
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_84

    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v0, :cond_ab

    const-string v0, "java.lang.Long"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Long:Ljava/lang/Class;

    :goto_82
    if-eq p2, v0, :cond_96

    :cond_84
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_b1

    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v0, :cond_ae

    const-string v0, "java.lang.Short"

    invoke-static {v0}, Lorg/apache/commons/beanutils/LazyDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Short:Ljava/lang/Class;

    :goto_94
    if-ne p2, v0, :cond_b1

    .line 907
    :cond_96
    const/4 v0, 0x1

    .line 909
    :goto_97
    return v0

    .line 898
    :cond_98
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Boolean:Ljava/lang/Class;

    goto/16 :goto_16

    :cond_9c
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_28

    :cond_9f
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Character:Ljava/lang/Class;

    goto :goto_3a

    :cond_a2
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Double:Ljava/lang/Class;

    goto :goto_4c

    :cond_a5
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_5e

    :cond_a8
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_70

    :cond_ab
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_82

    :cond_ae
    sget-object v0, Lorg/apache/commons/beanutils/LazyDynaBean;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_94

    .line 909
    :cond_b1
    const/4 v0, 0x0

    goto :goto_97
.end method

.method protected isDynaProperty(Ljava/lang/String;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 874
    if-nez p1, :cond_a

    .line 875
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No property name specified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 879
    :cond_a
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    instance-of v0, v0, Lorg/apache/commons/beanutils/LazyDynaClass;

    if-eqz v0, :cond_19

    .line 880
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    check-cast v0, Lorg/apache/commons/beanutils/LazyDynaClass;

    invoke-virtual {v0, p1}, Lorg/apache/commons/beanutils/LazyDynaClass;->isDynaProperty(Ljava/lang/String;)Z

    move-result v0

    .line 884
    :goto_18
    return v0

    :cond_19
    iget-object v0, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    invoke-interface {v0, p1}, Lorg/apache/commons/beanutils/MutableDynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    if-nez v0, :cond_23

    const/4 v0, 0x0

    goto :goto_18

    :cond_23
    const/4 v0, 0x1

    goto :goto_18
.end method

.method protected newMap()Ljava/util/Map;
    .registers 2

    .prologue
    .line 919
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    return-object v0
.end method

.method public remove(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 430
    if-nez p1, :cond_a

    .line 431
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "No property name specified"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 434
    :cond_a
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->values:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 435
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_13

    .line 447
    .end local v0    # "value":Ljava/lang/Object;
    :goto_12
    return-void

    .line 439
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_13
    instance-of v1, v0, Ljava/util/Map;

    if-eqz v1, :cond_1d

    .line 440
    check-cast v0, Ljava/util/Map;

    .end local v0    # "value":Ljava/lang/Object;
    invoke-interface {v0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12

    .line 442
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_1d
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Non-mapped property for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ")\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public set(Ljava/lang/String;ILjava/lang/Object;)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 518
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->isDynaProperty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_d

    .line 519
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->defaultIndexedProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/beanutils/LazyDynaBean;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 523
    :cond_d
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 526
    .local v0, "indexedProperty":Ljava/lang/Object;
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    invoke-interface {v1, p1}, Lorg/apache/commons/beanutils/MutableDynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/beanutils/DynaProperty;->isIndexed()Z

    move-result v1

    if-nez v1, :cond_58

    .line 527
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Non-indexed property for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "]\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    invoke-interface {v3, p1}, Lorg/apache/commons/beanutils/MutableDynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 533
    :cond_58
    invoke-virtual {p0, p1, v0, p2}, Lorg/apache/commons/beanutils/LazyDynaBean;->growIndexedProperty(Ljava/lang/String;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    .line 536
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_6a

    .line 537
    invoke-static {v0, p2, p3}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 546
    .end local v0    # "indexedProperty":Ljava/lang/Object;
    :goto_69
    return-void

    .line 538
    .restart local v0    # "indexedProperty":Ljava/lang/Object;
    :cond_6a
    instance-of v1, v0, Ljava/util/List;

    if-eqz v1, :cond_74

    .line 539
    check-cast v0, Ljava/util/List;

    .end local v0    # "indexedProperty":Ljava/lang/Object;
    invoke-interface {v0, p2, p3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_69

    .line 541
    .restart local v0    # "indexedProperty":Ljava/lang/Object;
    :cond_74
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Non-indexed property for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "]\' "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 465
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->isDynaProperty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_34

    .line 467
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    invoke-interface {v1}, Lorg/apache/commons/beanutils/MutableDynaClass;->isRestricted()Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 468
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Invalid property name \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' (DynaClass is restricted)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 471
    :cond_2d
    if-nez p2, :cond_65

    .line 472
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    invoke-interface {v1, p1}, Lorg/apache/commons/beanutils/MutableDynaClass;->add(Ljava/lang/String;)V

    .line 479
    :cond_34
    :goto_34
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    invoke-interface {v1, p1}, Lorg/apache/commons/beanutils/MutableDynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    .line 481
    .local v0, "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez p2, :cond_6f

    .line 482
    invoke-virtual {v0}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_c0

    .line 483
    new-instance v1, Ljava/lang/NullPointerException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Primitive value for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 474
    .end local v0    # "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    :cond_65
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Lorg/apache/commons/beanutils/MutableDynaClass;->add(Ljava/lang/String;Ljava/lang/Class;)V

    goto :goto_34

    .line 486
    .restart local v0    # "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    :cond_6f
    invoke-virtual {v0}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/beanutils/LazyDynaBean;->isAssignable(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_c0

    .line 487
    new-instance v1, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Cannot assign value of type \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' to property \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' of type \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 495
    :cond_c0
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->values:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 497
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 565
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->isDynaProperty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_d

    .line 566
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->defaultMappedProperty(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/beanutils/LazyDynaBean;->set(Ljava/lang/String;Ljava/lang/Object;)V

    .line 570
    :cond_d
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/LazyDynaBean;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 573
    .local v0, "mappedProperty":Ljava/lang/Object;
    iget-object v1, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    invoke-interface {v1, p1}, Lorg/apache/commons/beanutils/MutableDynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/beanutils/DynaProperty;->isMapped()Z

    move-result v1

    if-nez v1, :cond_58

    .line 574
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Non-mapped property for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ")\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->dynaClass:Lorg/apache/commons/beanutils/MutableDynaClass;

    invoke-interface {v3, p1}, Lorg/apache/commons/beanutils/MutableDynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 580
    :cond_58
    check-cast v0, Ljava/util/Map;

    .end local v0    # "mappedProperty":Ljava/lang/Object;
    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 582
    return-void
.end method

.method public size(Ljava/lang/String;)I
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 222
    if-nez p1, :cond_b

    .line 223
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "No property name specified"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 226
    :cond_b
    iget-object v2, p0, Lorg/apache/commons/beanutils/LazyDynaBean;->values:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 227
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_14

    .line 243
    .end local v0    # "value":Ljava/lang/Object;
    :cond_13
    :goto_13
    return v1

    .line 231
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_14
    instance-of v2, v0, Ljava/util/Map;

    if-eqz v2, :cond_1f

    .line 232
    check-cast v0, Ljava/util/Map;

    .end local v0    # "value":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    goto :goto_13

    .line 235
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_1f
    instance-of v2, v0, Ljava/util/List;

    if-eqz v2, :cond_2a

    .line 236
    check-cast v0, Ljava/util/List;

    .end local v0    # "value":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    goto :goto_13

    .line 239
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_2a
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_13

    .line 240
    invoke-static {v0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    goto :goto_13
.end method
