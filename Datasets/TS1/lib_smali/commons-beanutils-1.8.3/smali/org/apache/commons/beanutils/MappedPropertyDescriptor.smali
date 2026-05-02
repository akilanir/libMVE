.class public Lorg/apache/commons/beanutils/MappedPropertyDescriptor;
.super Ljava/beans/PropertyDescriptor;
.source "MappedPropertyDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;
    }
.end annotation


# static fields
.field private static final STRING_CLASS_PARAMETER:[Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;

.field static class$org$apache$commons$beanutils$MappedPropertyDescriptor:Ljava/lang/Class;


# instance fields
.field private mappedPropertyTypeRef:Ljava/lang/ref/Reference;

.field private mappedReadMethodRef:Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

.field private mappedWriteMethodRef:Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 70
    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    const/4 v2, 0x0

    sget-object v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$java$lang$String:Ljava/lang/Class;

    if-nez v0, :cond_15

    const-string v0, "java.lang.String"

    invoke-static {v0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$java$lang$String:Ljava/lang/Class;

    :goto_10
    aput-object v0, v1, v2

    sput-object v1, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->STRING_CLASS_PARAMETER:[Ljava/lang/Class;

    return-void

    :cond_15
    sget-object v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_10
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;)V
    .registers 11
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "beanClass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x2

    .line 93
    invoke-direct {p0, p1, v5, v5}, Ljava/beans/PropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    .line 95
    if-eqz p1, :cond_d

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_38

    .line 96
    :cond_d
    new-instance v5, Ljava/beans/IntrospectionException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "bad property name: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " on class: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 100
    :cond_38
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->setName(Ljava/lang/String;)V

    .line 101
    invoke-static {p1}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->capitalizePropertyName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 104
    .local v0, "base":Ljava/lang/String;
    const/4 v2, 0x0

    .line 105
    .local v2, "mappedReadMethod":Ljava/lang/reflect/Method;
    const/4 v3, 0x0

    .line 108
    .local v3, "mappedWriteMethod":Ljava/lang/reflect/Method;
    :try_start_41
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "get"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->STRING_CLASS_PARAMETER:[Ljava/lang/Class;

    invoke-static {p2, v5, v6}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_59
    .catch Ljava/beans/IntrospectionException; {:try_start_41 .. :try_end_59} :catch_ce

    move-result-object v2

    .line 114
    :goto_5a
    const/4 v5, 0x2

    :try_start_5b
    new-array v4, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    sget-object v5, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$java$lang$String:Ljava/lang/Class;

    if-nez v5, :cond_ea

    const-string v5, "java.lang.String"

    invoke-static {v5}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    sput-object v5, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$java$lang$String:Ljava/lang/Class;

    :goto_6a
    aput-object v5, v4, v6

    const/4 v5, 0x1

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v6

    aput-object v6, v4, v5

    .line 115
    .local v4, "params":[Ljava/lang/Class;
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "set"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p2, v5, v4}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_89
    .catch Ljava/beans/IntrospectionException; {:try_start_5b .. :try_end_89} :catch_100

    move-result-object v3

    .line 123
    .end local v4    # "params":[Ljava/lang/Class;
    :goto_8a
    if-nez v2, :cond_a3

    .line 124
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "set"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p2, v5, v7}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMethod(Ljava/lang/Class;Ljava/lang/String;I)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 127
    :cond_a3
    if-nez v2, :cond_ee

    if-nez v3, :cond_ee

    .line 128
    new-instance v5, Ljava/beans/IntrospectionException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' not found on "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 110
    :catch_ce
    move-exception v1

    .line 111
    .local v1, "e":Ljava/beans/IntrospectionException;
    :try_start_cf
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "is"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->STRING_CLASS_PARAMETER:[Ljava/lang/Class;

    invoke-static {p2, v5, v6}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    goto/16 :goto_5a

    .line 114
    .end local v1    # "e":Ljava/beans/IntrospectionException;
    :cond_ea
    sget-object v5, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$java$lang$String:Ljava/lang/Class;
    :try_end_ec
    .catch Ljava/beans/IntrospectionException; {:try_start_cf .. :try_end_ec} :catch_100

    goto/16 :goto_6a

    .line 132
    :cond_ee
    new-instance v5, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    invoke-direct {v5, v2}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;-><init>(Ljava/lang/reflect/Method;)V

    iput-object v5, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->mappedReadMethodRef:Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    .line 133
    new-instance v5, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    invoke-direct {v5, v3}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;-><init>(Ljava/lang/reflect/Method;)V

    iput-object v5, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->mappedWriteMethodRef:Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    .line 135
    invoke-direct {p0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->findMappedPropertyType()V

    .line 136
    return-void

    .line 116
    :catch_100
    move-exception v5

    goto :goto_8a
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "beanClass"    # Ljava/lang/Class;
    .param p3, "mappedGetterName"    # Ljava/lang/String;
    .param p4, "mappedSetterName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x2

    .line 160
    invoke-direct {p0, p1, v3, v3}, Ljava/beans/PropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    .line 162
    if-eqz p1, :cond_d

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_26

    .line 163
    :cond_d
    new-instance v3, Ljava/beans/IntrospectionException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "bad property name: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 166
    :cond_26
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->setName(Ljava/lang/String;)V

    .line 169
    const/4 v0, 0x0

    .line 170
    .local v0, "mappedReadMethod":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .line 171
    .local v1, "mappedWriteMethod":Ljava/lang/reflect/Method;
    sget-object v3, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->STRING_CLASS_PARAMETER:[Ljava/lang/Class;

    invoke-static {p2, p3, v3}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 174
    if-eqz v0, :cond_64

    .line 175
    new-array v2, v4, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v3, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$java$lang$String:Ljava/lang/Class;

    if-nez v3, :cond_61

    const-string v3, "java.lang.String"

    invoke-static {v3}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$java$lang$String:Ljava/lang/Class;

    :goto_42
    aput-object v3, v2, v4

    const/4 v3, 0x1

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    aput-object v4, v2, v3

    .line 176
    .local v2, "params":[Ljava/lang/Class;
    invoke-static {p2, p4, v2}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 182
    .end local v2    # "params":[Ljava/lang/Class;
    :goto_4f
    new-instance v3, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    invoke-direct {v3, v0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;-><init>(Ljava/lang/reflect/Method;)V

    iput-object v3, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->mappedReadMethodRef:Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    .line 183
    new-instance v3, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    invoke-direct {v3, v1}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;-><init>(Ljava/lang/reflect/Method;)V

    iput-object v3, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->mappedWriteMethodRef:Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    .line 185
    invoke-direct {p0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->findMappedPropertyType()V

    .line 186
    return-void

    .line 175
    :cond_61
    sget-object v3, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_42

    .line 179
    :cond_64
    invoke-static {p2, p4, v4}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMethod(Ljava/lang/Class;Ljava/lang/String;I)Ljava/lang/reflect/Method;

    move-result-object v1

    goto :goto_4f
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V
    .registers 7
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "mappedGetter"    # Ljava/lang/reflect/Method;
    .param p3, "mappedSetter"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 206
    invoke-direct {p0, p1, p2, p3}, Ljava/beans/PropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    .line 208
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_24

    .line 209
    :cond_b
    new-instance v0, Ljava/beans/IntrospectionException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "bad property name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 213
    :cond_24
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->setName(Ljava/lang/String;)V

    .line 214
    new-instance v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    invoke-direct {v0, p2}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;-><init>(Ljava/lang/reflect/Method;)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->mappedReadMethodRef:Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    .line 215
    new-instance v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    invoke-direct {v0, p3}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;-><init>(Ljava/lang/reflect/Method;)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->mappedWriteMethodRef:Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    .line 216
    invoke-direct {p0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->findMappedPropertyType()V

    .line 217
    return-void
.end method

.method static access$100()[Ljava/lang/Class;
    .registers 1

    .prologue
    .line 49
    sget-object v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->STRING_CLASS_PARAMETER:[Ljava/lang/Class;

    return-object v0
.end method

.method private static capitalizePropertyName(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 331
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_8

    .line 337
    .end local p0    # "s":Ljava/lang/String;
    :goto_7
    return-object p0

    .line 335
    .restart local p0    # "s":Ljava/lang/String;
    :cond_8
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 336
    .local v0, "chars":[C
    aget-char v1, v0, v2

    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    aput-char v1, v0, v2

    .line 337
    new-instance p0, Ljava/lang/String;

    .end local p0    # "s":Ljava/lang/String;
    invoke-direct {p0, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_7
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 70
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

.method private findMappedPropertyType()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 289
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMappedReadMethod()Ljava/lang/reflect/Method;

    move-result-object v2

    .line 290
    .local v2, "mappedReadMethod":Ljava/lang/reflect/Method;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->getMappedWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v3

    .line 291
    .local v3, "mappedWriteMethod":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .line 292
    .local v1, "mappedPropertyType":Ljava/lang/Class;
    if-eqz v2, :cond_48

    .line 293
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v5

    array-length v5, v5

    if-eq v5, v6, :cond_1d

    .line 294
    new-instance v5, Ljava/beans/IntrospectionException;

    const-string v6, "bad mapped read method arg count"

    invoke-direct {v5, v6}, Ljava/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_1b
    .catch Ljava/beans/IntrospectionException; {:try_start_1 .. :try_end_1b} :catch_1b

    .line 319
    .end local v1    # "mappedPropertyType":Ljava/lang/Class;
    .end local v2    # "mappedReadMethod":Ljava/lang/reflect/Method;
    .end local v3    # "mappedWriteMethod":Ljava/lang/reflect/Method;
    :catch_1b
    move-exception v0

    .line 320
    .local v0, "ex":Ljava/beans/IntrospectionException;
    throw v0

    .line 297
    .end local v0    # "ex":Ljava/beans/IntrospectionException;
    .restart local v1    # "mappedPropertyType":Ljava/lang/Class;
    .restart local v2    # "mappedReadMethod":Ljava/lang/reflect/Method;
    .restart local v3    # "mappedWriteMethod":Ljava/lang/reflect/Method;
    :cond_1d
    :try_start_1d
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    .line 298
    sget-object v5, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v1, v5, :cond_48

    .line 299
    new-instance v5, Ljava/beans/IntrospectionException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "mapped read method "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " returns void"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 305
    :cond_48
    if-eqz v3, :cond_6c

    .line 306
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    .line 307
    .local v4, "params":[Ljava/lang/Class;
    array-length v5, v4

    const/4 v6, 0x2

    if-eq v5, v6, :cond_5a

    .line 308
    new-instance v5, Ljava/beans/IntrospectionException;

    const-string v6, "bad mapped write method arg count"

    invoke-direct {v5, v6}, Ljava/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 311
    :cond_5a
    if-eqz v1, :cond_69

    const/4 v5, 0x1

    aget-object v5, v4, v5

    if-eq v1, v5, :cond_69

    .line 313
    new-instance v5, Ljava/beans/IntrospectionException;

    const-string v6, "type mismatch between mapped read and write methods"

    invoke-direct {v5, v6}, Ljava/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 316
    :cond_69
    const/4 v5, 0x1

    aget-object v1, v4, v5

    .line 318
    .end local v4    # "params":[Ljava/lang/Class;
    :cond_6c
    new-instance v5, Ljava/lang/ref/SoftReference;

    invoke-direct {v5, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v5, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->mappedPropertyTypeRef:Ljava/lang/ref/Reference;
    :try_end_73
    .catch Ljava/beans/IntrospectionException; {:try_start_1d .. :try_end_73} :catch_1b

    .line 322
    return-void
.end method

.method private static getMethod(Ljava/lang/Class;Ljava/lang/String;I)Ljava/lang/reflect/Method;
    .registers 7
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 386
    if-nez p1, :cond_4

    .line 387
    const/4 v0, 0x0

    .line 392
    :cond_3
    return-object v0

    .line 390
    :cond_4
    invoke-static {p0, p1, p2}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->internalGetMethod(Ljava/lang/Class;Ljava/lang/String;I)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 391
    .local v0, "method":Ljava/lang/reflect/Method;
    if-nez v0, :cond_3

    .line 396
    new-instance v1, Ljava/beans/IntrospectionException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No method \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\" with "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " parameter(s)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 8
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 405
    if-nez p1, :cond_4

    .line 406
    const/4 v0, 0x0

    .line 411
    :cond_3
    return-object v0

    .line 409
    :cond_4
    invoke-static {p0, p1, p2}, Lorg/apache/commons/beanutils/MethodUtils;->getMatchingAccessibleMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 410
    .local v0, "method":Ljava/lang/reflect/Method;
    if-nez v0, :cond_3

    .line 414
    if-nez p2, :cond_36

    const/4 v1, 0x0

    .line 417
    .local v1, "parameterCount":I
    :goto_d
    new-instance v2, Ljava/beans/IntrospectionException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "No method \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\" with "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " parameter(s) of matching types."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 414
    .end local v1    # "parameterCount":I
    :cond_36
    array-length v1, p2

    goto :goto_d
.end method

.method private static internalGetMethod(Ljava/lang/Class;Ljava/lang/String;I)Ljava/lang/reflect/Method;
    .registers 10
    .param p0, "initial"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parameterCount"    # I

    .prologue
    .line 347
    move-object v0, p0

    .local v0, "clazz":Ljava/lang/Class;
    :goto_1
    if-eqz v0, :cond_39

    .line 348
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v4

    .line 349
    .local v4, "methods":[Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    array-length v6, v4

    if-ge v1, v6, :cond_34

    .line 350
    aget-object v3, v4, v1

    .line 351
    .local v3, "method":Ljava/lang/reflect/Method;
    if-nez v3, :cond_12

    .line 349
    :cond_f
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 355
    :cond_12
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v5

    .line 356
    .local v5, "mods":I
    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v6

    if-eqz v6, :cond_f

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v6

    if-nez v6, :cond_f

    .line 360
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_f

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v6

    array-length v6, v6

    if-ne v6, p2, :cond_f

    .line 378
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "methods":[Ljava/lang/reflect/Method;
    .end local v5    # "mods":I
    :cond_33
    :goto_33
    return-object v3

    .line 347
    .restart local v4    # "methods":[Ljava/lang/reflect/Method;
    :cond_34
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_1

    .line 370
    .end local v1    # "i":I
    .end local v4    # "methods":[Ljava/lang/reflect/Method;
    :cond_39
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v2

    .line 371
    .local v2, "interfaces":[Ljava/lang/Class;
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_3e
    array-length v6, v2

    if-ge v1, v6, :cond_4c

    .line 372
    aget-object v6, v2, v1

    invoke-static {v6, p1, p2}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->internalGetMethod(Ljava/lang/Class;Ljava/lang/String;I)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 373
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    if-nez v3, :cond_33

    .line 371
    add-int/lit8 v1, v1, 0x1

    goto :goto_3e

    .line 378
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_4c
    const/4 v3, 0x0

    goto :goto_33
.end method


# virtual methods
.method public getMappedPropertyType()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 232
    iget-object v0, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->mappedPropertyTypeRef:Ljava/lang/ref/Reference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    return-object v0
.end method

.method public getMappedReadMethod()Ljava/lang/reflect/Method;
    .registers 2

    .prologue
    .line 242
    iget-object v0, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->mappedReadMethodRef:Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    invoke-static {v0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->access$000(Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;)Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method

.method public getMappedWriteMethod()Ljava/lang/reflect/Method;
    .registers 2

    .prologue
    .line 265
    iget-object v0, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->mappedWriteMethodRef:Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    invoke-static {v0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;->access$000(Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;)Ljava/lang/reflect/Method;

    move-result-object v0

    return-object v0
.end method

.method public setMappedReadMethod(Ljava/lang/reflect/Method;)V
    .registers 3
    .param p1, "mappedGetter"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 254
    new-instance v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    invoke-direct {v0, p1}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;-><init>(Ljava/lang/reflect/Method;)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->mappedReadMethodRef:Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    .line 255
    invoke-direct {p0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->findMappedPropertyType()V

    .line 256
    return-void
.end method

.method public setMappedWriteMethod(Ljava/lang/reflect/Method;)V
    .registers 3
    .param p1, "mappedSetter"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 277
    new-instance v0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    invoke-direct {v0, p1}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;-><init>(Ljava/lang/reflect/Method;)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->mappedWriteMethodRef:Lorg/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference;

    .line 278
    invoke-direct {p0}, Lorg/apache/commons/beanutils/MappedPropertyDescriptor;->findMappedPropertyType()V

    .line 279
    return-void
.end method
