.class public Lorg/apache/commons/beanutils/ConvertUtils;
.super Ljava/lang/Object;
.source "ConvertUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convert(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "targetType"    # Ljava/lang/Class;

    .prologue
    .line 276
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static convert(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p0, "value"    # Ljava/lang/String;
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 241
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static convert([Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p0, "values"    # [Ljava/lang/String;
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 260
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert([Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static convert(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 222
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static deregister()V
    .registers 1

    .prologue
    .line 290
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->deregister()V

    .line 292
    return-void
.end method

.method public static deregister(Ljava/lang/Class;)V
    .registers 2
    .param p0, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 306
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->deregister(Ljava/lang/Class;)V

    .line 308
    return-void
.end method

.method public static getDefaultBoolean()Z
    .registers 1

    .prologue
    .line 47
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getDefaultBoolean()Z

    move-result v0

    return v0
.end method

.method public static getDefaultByte()B
    .registers 1

    .prologue
    .line 68
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getDefaultByte()B

    move-result v0

    return v0
.end method

.method public static getDefaultCharacter()C
    .registers 1

    .prologue
    .line 89
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getDefaultCharacter()C

    move-result v0

    return v0
.end method

.method public static getDefaultDouble()D
    .registers 2

    .prologue
    .line 110
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getDefaultDouble()D

    move-result-wide v0

    return-wide v0
.end method

.method public static getDefaultFloat()F
    .registers 1

    .prologue
    .line 131
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getDefaultFloat()F

    move-result v0

    return v0
.end method

.method public static getDefaultInteger()I
    .registers 1

    .prologue
    .line 152
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getDefaultInteger()I

    move-result v0

    return v0
.end method

.method public static getDefaultLong()J
    .registers 2

    .prologue
    .line 173
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getDefaultLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getDefaultShort()S
    .registers 1

    .prologue
    .line 194
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getDefaultShort()S

    move-result v0

    return v0
.end method

.method public static lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;
    .registers 2
    .param p0, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 324
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v0

    return-object v0
.end method

.method public static lookup(Ljava/lang/Class;Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;
    .registers 3
    .param p0, "sourceType"    # Ljava/lang/Class;
    .param p1, "targetType"    # Ljava/lang/Class;

    .prologue
    .line 339
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->lookup(Ljava/lang/Class;Ljava/lang/Class;)Lorg/apache/commons/beanutils/Converter;

    move-result-object v0

    return-object v0
.end method

.method public static register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V
    .registers 3
    .param p0, "converter"    # Lorg/apache/commons/beanutils/Converter;
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 356
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->register(Lorg/apache/commons/beanutils/Converter;Ljava/lang/Class;)V

    .line 358
    return-void
.end method

.method public static setDefaultBoolean(Z)V
    .registers 2
    .param p0, "newDefaultBoolean"    # Z

    .prologue
    .line 57
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->setDefaultBoolean(Z)V

    .line 58
    return-void
.end method

.method public static setDefaultByte(B)V
    .registers 2
    .param p0, "newDefaultByte"    # B

    .prologue
    .line 78
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->setDefaultByte(B)V

    .line 79
    return-void
.end method

.method public static setDefaultCharacter(C)V
    .registers 2
    .param p0, "newDefaultCharacter"    # C

    .prologue
    .line 99
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->setDefaultCharacter(C)V

    .line 100
    return-void
.end method

.method public static setDefaultDouble(D)V
    .registers 3
    .param p0, "newDefaultDouble"    # D

    .prologue
    .line 120
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->setDefaultDouble(D)V

    .line 121
    return-void
.end method

.method public static setDefaultFloat(F)V
    .registers 2
    .param p0, "newDefaultFloat"    # F

    .prologue
    .line 141
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->setDefaultFloat(F)V

    .line 142
    return-void
.end method

.method public static setDefaultInteger(I)V
    .registers 2
    .param p0, "newDefaultInteger"    # I

    .prologue
    .line 162
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->setDefaultInteger(I)V

    .line 163
    return-void
.end method

.method public static setDefaultLong(J)V
    .registers 3
    .param p0, "newDefaultLong"    # J

    .prologue
    .line 183
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->setDefaultLong(J)V

    .line 184
    return-void
.end method

.method public static setDefaultShort(S)V
    .registers 2
    .param p0, "newDefaultShort"    # S

    .prologue
    .line 204
    invoke-static {}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->getInstance()Lorg/apache/commons/beanutils/ConvertUtilsBean;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/commons/beanutils/ConvertUtilsBean;->setDefaultShort(S)V

    .line 205
    return-void
.end method
