.class public abstract Lorg/apache/commons/beanutils/converters/AbstractConverter;
.super Ljava/lang/Object;
.source "AbstractConverter.java"

# interfaces
.implements Lorg/apache/commons/beanutils/Converter;


# static fields
.field private static final DEFAULT_CONFIG_MSG:Ljava/lang/String; = "(N.B. Converters can be configured to use default values to avoid throwing exceptions)"

.field private static final PACKAGE:Ljava/lang/String; = "org.apache.commons.beanutils.converters."

.field static class$java$lang$Boolean:Ljava/lang/Class;

.field static class$java$lang$Byte:Ljava/lang/Class;

.field static class$java$lang$Character:Ljava/lang/Class;

.field static class$java$lang$Double:Ljava/lang/Class;

.field static class$java$lang$Float:Ljava/lang/Class;

.field static class$java$lang$Integer:Ljava/lang/Class;

.field static class$java$lang$Long:Ljava/lang/Class;

.field static class$java$lang$Short:Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;


# instance fields
.field private defaultValue:Ljava/lang/Object;

.field private transient log:Lorg/apache/commons/logging/Log;

.field private useDefault:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->useDefault:Z

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->defaultValue:Ljava/lang/Object;

    .line 83
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->useDefault:Z

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->defaultValue:Ljava/lang/Object;

    .line 94
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->setDefaultValue(Ljava/lang/Object;)V

    .line 95
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 143
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
.method public convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 123
    if-nez p2, :cond_5e

    const/4 v1, 0x0

    .line 124
    .local v1, "sourceType":Ljava/lang/Class;
    :goto_3
    if-nez p1, :cond_9

    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->getDefaultType()Ljava/lang/Class;

    move-result-object p1

    .end local p1    # "type":Ljava/lang/Class;
    :cond_9
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->primitive(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v3

    .line 126
    .local v3, "targetType":Ljava/lang/Class;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_53

    .line 127
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v5

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Converting"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    if-nez p2, :cond_63

    const-string v4, ""

    :goto_2a
    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v6, " value \'"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v6, "\' to type \'"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, v3}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v6, "\'"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v5, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 132
    :cond_53
    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->convertArray(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 135
    if-nez p2, :cond_81

    .line 136
    invoke-virtual {p0, v3}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->handleMissing(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    .line 164
    .end local p2    # "value":Ljava/lang/Object;
    :cond_5d
    :goto_5d
    return-object p2

    .line 123
    .end local v1    # "sourceType":Ljava/lang/Class;
    .end local v3    # "targetType":Ljava/lang/Class;
    .restart local p1    # "type":Ljava/lang/Class;
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_5e
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_3

    .line 127
    .end local p1    # "type":Ljava/lang/Class;
    .restart local v1    # "sourceType":Ljava/lang/Class;
    .restart local v3    # "targetType":Ljava/lang/Class;
    :cond_63
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, " \'"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v7, "\'"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2a

    .line 139
    :cond_81
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 143
    :try_start_85
    sget-object v4, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$String:Ljava/lang/Class;

    if-nez v4, :cond_9c

    const-string v4, "java.lang.String"

    invoke-static {v4}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$String:Ljava/lang/Class;

    :goto_91
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9f

    .line 144
    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->convertToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    goto :goto_5d

    .line 143
    :cond_9c
    sget-object v4, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_91

    .line 147
    :cond_9f
    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d4

    .line 148
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_5d

    .line 149
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "    No conversion required, value is already a "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, v3}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_cd
    .catch Ljava/lang/Throwable; {:try_start_85 .. :try_end_cd} :catch_ce

    goto :goto_5d

    .line 163
    :catch_ce
    move-exception v2

    .line 164
    .local v2, "t":Ljava/lang/Throwable;
    invoke-virtual {p0, v3, p2, v2}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->handleError(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p2

    goto :goto_5d

    .line 156
    .end local v2    # "t":Ljava/lang/Throwable;
    :cond_d4
    :try_start_d4
    invoke-virtual {p0, v3, p2}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->convertToType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 157
    .local v0, "result":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_110

    .line 158
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "    Converted to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, v3}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " value \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_110
    .catch Ljava/lang/Throwable; {:try_start_d4 .. :try_end_110} :catch_ce

    :cond_110
    move-object p2, v0

    .line 161
    goto/16 :goto_5d
.end method

.method protected convertArray(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 210
    if-nez p1, :cond_5

    move-object p1, v1

    .line 228
    .end local p1    # "value":Ljava/lang/Object;
    :cond_4
    :goto_4
    return-object p1

    .line 213
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 214
    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v2

    if-lez v2, :cond_1b

    .line 215
    const/4 v1, 0x0

    invoke-static {p1, v1}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p1

    goto :goto_4

    :cond_1b
    move-object p1, v1

    .line 217
    goto :goto_4

    .line 220
    :cond_1d
    instance-of v2, p1, Ljava/util/Collection;

    if-eqz v2, :cond_4

    move-object v0, p1

    .line 221
    check-cast v0, Ljava/util/Collection;

    .line 222
    .local v0, "collection":Ljava/util/Collection;
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v2

    if-lez v2, :cond_33

    .line 223
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    goto :goto_4

    :cond_33
    move-object p1, v1

    .line 225
    goto :goto_4
.end method

.method protected convertToString(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 182
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected abstract convertToType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation
.end method

.method protected getDefault(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p1, "type"    # Ljava/lang/Class;

    .prologue
    .line 360
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$String:Ljava/lang/Class;

    if-nez v0, :cond_14

    const-string v0, "java.lang.String"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$String:Ljava/lang/Class;

    :goto_c
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 361
    const/4 v0, 0x0

    .line 363
    :goto_13
    return-object v0

    .line 360
    :cond_14
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_c

    .line 363
    :cond_17
    iget-object v0, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->defaultValue:Ljava/lang/Object;

    goto :goto_13
.end method

.method protected abstract getDefaultType()Ljava/lang/Class;
.end method

.method protected handleError(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Throwable;)Ljava/lang/Object;
    .registers 9
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 245
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 246
    instance-of v2, p3, Lorg/apache/commons/beanutils/ConversionException;

    if-eqz v2, :cond_35

    .line 247
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "    Conversion threw ConversionException: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 253
    :cond_2c
    :goto_2c
    iget-boolean v2, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->useDefault:Z

    if-eqz v2, :cond_50

    .line 254
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->handleMissing(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 249
    :cond_35
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "    Conversion threw "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_2c

    .line 257
    :cond_50
    const/4 v0, 0x0

    .line 258
    .local v0, "cex":Lorg/apache/commons/beanutils/ConversionException;
    instance-of v2, p3, Lorg/apache/commons/beanutils/ConversionException;

    if-eqz v2, :cond_8a

    move-object v0, p3

    .line 259
    check-cast v0, Lorg/apache/commons/beanutils/ConversionException;

    .line 260
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_89

    .line 261
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "    Re-throwing ConversionException: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/ConversionException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 262
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    const-string v3, "    (N.B. Converters can be configured to use default values to avoid throwing exceptions)"

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 275
    :cond_89
    :goto_89
    throw v0

    .line 265
    :cond_8a
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Error converting from \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' to \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 267
    .local v1, "msg":Ljava/lang/String;
    new-instance v0, Lorg/apache/commons/beanutils/ConversionException;

    .end local v0    # "cex":Lorg/apache/commons/beanutils/ConversionException;
    invoke-direct {v0, v1, p3}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 268
    .restart local v0    # "cex":Lorg/apache/commons/beanutils/ConversionException;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_f3

    .line 269
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "    Throwing ConversionException: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 270
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v2

    const-string v3, "    (N.B. Converters can be configured to use default values to avoid throwing exceptions)"

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 272
    :cond_f3
    invoke-static {v0, p3}, Lorg/apache/commons/beanutils/BeanUtils;->initCause(Ljava/lang/Throwable;Ljava/lang/Throwable;)Z

    goto :goto_89
.end method

.method protected handleMissing(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 9
    .param p1, "type"    # Ljava/lang/Class;

    .prologue
    .line 292
    iget-boolean v3, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->useDefault:Z

    if-nez v3, :cond_16

    sget-object v3, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$String:Ljava/lang/Class;

    if-nez v3, :cond_6b

    const-string v3, "java.lang.String"

    invoke-static {v3}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$String:Ljava/lang/Class;

    :goto_10
    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b4

    .line 293
    :cond_16
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->getDefault(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    .line 294
    .local v2, "value":Ljava/lang/Object;
    iget-boolean v3, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->useDefault:Z

    if-eqz v3, :cond_30

    if-eqz v2, :cond_30

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_30

    .line 296
    :try_start_2a
    iget-object v3, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->defaultValue:Ljava/lang/Object;

    invoke-virtual {p0, p1, v3}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->convertToType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2f
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_2f} :catch_6e

    move-result-object v2

    .line 302
    :cond_30
    :goto_30
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_6a

    .line 303
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v4

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "    Using default "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    if-nez v2, :cond_98

    const-string v3, ""

    :goto_4d
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, "value \'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v5, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->defaultValue:Ljava/lang/Object;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, "\'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 307
    :cond_6a
    return-object v2

    .line 292
    .end local v2    # "value":Ljava/lang/Object;
    :cond_6b
    sget-object v3, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_10

    .line 297
    .restart local v2    # "value":Ljava/lang/Object;
    :catch_6e
    move-exception v1

    .line 298
    .local v1, "t":Ljava/lang/Throwable;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "    Default conversion to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "failed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    goto :goto_30

    .line 303
    .end local v1    # "t":Ljava/lang/Throwable;
    :cond_98
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v6, " "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_4d

    .line 310
    .end local v2    # "value":Ljava/lang/Object;
    :cond_b4
    new-instance v0, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "No value specified for \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    .line 312
    .local v0, "cex":Lorg/apache/commons/beanutils/ConversionException;
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_107

    .line 313
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "    Throwing ConversionException: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/ConversionException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 314
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v3

    const-string v4, "    (N.B. Converters can be configured to use default values to avoid throwing exceptions)"

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 316
    :cond_107
    throw v0
.end method

.method public isUseDefault()Z
    .registers 2

    .prologue
    .line 108
    iget-boolean v0, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->useDefault:Z

    return v0
.end method

.method log()Lorg/apache/commons/logging/Log;
    .registers 2

    .prologue
    .line 389
    iget-object v0, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log:Lorg/apache/commons/logging/Log;

    if-nez v0, :cond_e

    .line 390
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log:Lorg/apache/commons/logging/Log;

    .line 392
    :cond_e
    iget-object v0, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log:Lorg/apache/commons/logging/Log;

    return-object v0
.end method

.method primitive(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 3
    .param p1, "type"    # Ljava/lang/Class;

    .prologue
    .line 401
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-nez v0, :cond_a

    :cond_8
    move-object v0, p1

    .line 422
    :goto_9
    return-object v0

    .line 405
    :cond_a
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_1e

    .line 406
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v0, :cond_1b

    const-string v0, "java.lang.Integer"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_9

    :cond_1b
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_9

    .line 407
    :cond_1e
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_32

    .line 408
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v0, :cond_2f

    const-string v0, "java.lang.Double"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Double:Ljava/lang/Class;

    goto :goto_9

    :cond_2f
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Double:Ljava/lang/Class;

    goto :goto_9

    .line 409
    :cond_32
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_46

    .line 410
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v0, :cond_43

    const-string v0, "java.lang.Long"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_9

    :cond_43
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_9

    .line 411
    :cond_46
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_5a

    .line 412
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v0, :cond_57

    const-string v0, "java.lang.Boolean"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Boolean:Ljava/lang/Class;

    goto :goto_9

    :cond_57
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Boolean:Ljava/lang/Class;

    goto :goto_9

    .line 413
    :cond_5a
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_6e

    .line 414
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v0, :cond_6b

    const-string v0, "java.lang.Float"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_9

    :cond_6b
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_9

    .line 415
    :cond_6e
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_82

    .line 416
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v0, :cond_7f

    const-string v0, "java.lang.Short"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_9

    :cond_7f
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_9

    .line 417
    :cond_82
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_98

    .line 418
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v0, :cond_94

    const-string v0, "java.lang.Byte"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Byte:Ljava/lang/Class;

    goto/16 :goto_9

    :cond_94
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Byte:Ljava/lang/Class;

    goto/16 :goto_9

    .line 419
    :cond_98
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_ae

    .line 420
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v0, :cond_aa

    const-string v0, "java.lang.Character"

    invoke-static {v0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Character:Ljava/lang/Class;

    goto/16 :goto_9

    :cond_aa
    sget-object v0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->class$java$lang$Character:Ljava/lang/Class;

    goto/16 :goto_9

    :cond_ae
    move-object v0, p1

    .line 422
    goto/16 :goto_9
.end method

.method protected setDefaultValue(Ljava/lang/Object;)V
    .registers 5
    .param p1, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 334
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->useDefault:Z

    .line 335
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_27

    .line 336
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->log()Lorg/apache/commons/logging/Log;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Setting default value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 338
    :cond_27
    if-nez p1, :cond_30

    .line 339
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->defaultValue:Ljava/lang/Object;

    .line 343
    :goto_2c
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->useDefault:Z

    .line 344
    return-void

    .line 341
    :cond_30
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->getDefaultType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->convert(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->defaultValue:Ljava/lang/Object;

    goto :goto_2c
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 373
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/converters/AbstractConverter;->toString(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "[UseDefault="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-boolean v1, p0, Lorg/apache/commons/beanutils/converters/AbstractConverter;->useDefault:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method toString(Ljava/lang/Class;)Ljava/lang/String;
    .registers 8
    .param p1, "type"    # Ljava/lang/Class;

    .prologue
    .line 432
    const/4 v3, 0x0

    .line 433
    .local v3, "typeName":Ljava/lang/String;
    if-nez p1, :cond_28

    .line 434
    const-string v3, "null"

    .line 449
    :cond_5
    :goto_5
    const-string v4, "java.lang."

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1d

    const-string v4, "java.util."

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1d

    const-string v4, "java.math."

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_62

    .line 452
    :cond_1d
    const-string v4, "java.lang."

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 456
    :cond_27
    :goto_27
    return-object v3

    .line 435
    :cond_28
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_5d

    .line 436
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    .line 437
    .local v1, "elementType":Ljava/lang/Class;
    const/4 v0, 0x1

    .line 438
    .local v0, "count":I
    :goto_33
    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_40

    .line 439
    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    .line 440
    add-int/lit8 v0, v0, 0x1

    goto :goto_33

    .line 442
    :cond_40
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    .line 443
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_45
    if-ge v2, v0, :cond_5

    .line 444
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "[]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 443
    add-int/lit8 v2, v2, 0x1

    goto :goto_45

    .line 447
    .end local v0    # "count":I
    .end local v1    # "elementType":Ljava/lang/Class;
    .end local v2    # "i":I
    :cond_5d
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    goto :goto_5

    .line 453
    :cond_62
    const-string v4, "org.apache.commons.beanutils.converters."

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_27

    .line 454
    const-string v4, "org.apache.commons.beanutils.converters."

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_27
.end method
